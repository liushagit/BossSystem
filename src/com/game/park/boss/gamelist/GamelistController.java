package com.game.park.boss.gamelist;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.game.park.boss.channel.Channel;
import com.game.park.boss.channel.UserChannel;
import com.game.park.boss.game.Game;
import com.game.park.boss.login.Login;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;


@Before(GamelistInterceptor.class)
public class GamelistController extends Controller {
	/** 显示行数*/
	public static final int PAGE_SIZE = 27;
	
	public List<Gamelist> dataList = null;
	Login userInDb = null;
	
	String startDate;
	String endDate;
	String defaultStart;
	String defaultEnd;
	String op;
	
	String loginUser;
	/** 下来可选渠道号列表*/
	List<Channel> channelList;
	/** 选中的渠道号*/
	String channeled;
	String clquery;
	String appId;
	List<UserChannel> userChannel = null;
	boolean b = false;
	String rechannelname;
	List<Game> apps;
	/** 游戏数据列表*/
	//List<Gamelist> gameList;
	//Long userid;
		
	public void index() {
		defaultStart = getBeginDate();
		defaultEnd = getEndDate();
		
		startDate = getPara("startDate");
		endDate = getPara("endDate");
		
		startDate = startDate!=null?startDate:defaultStart;
		endDate = endDate!=null?endDate:defaultEnd;
		
		appId = getPara("appId");
		channeled = getPara("channel");
		clquery = getPara("clquery");
		op = getPara("op");
		loginUser = getSessionAttr("user");
		apps = Game.dao.find("select * from t_app_info");
		
		if (appId==null && op!=null) {
			appId = op;
		}
		
		userInDb = Login.dao.findFirst("select * from t_user where name=?", loginUser);
		if (userInDb.getInt("role") == 3) {
			// 超级管理员
			getAllChannel();
		} else {
			getUserChannel();
		}
		
		String index="";
		if(this.getPara() != null){
			index = this.getPara();
		}
		
		int pageIndex = index.equals("index")?getParaToInt("index", 1):getParaToInt(0, 1);
		Page<Gamelist> gamelistPage = null;
		
		String queryStr = generateSQL(channelList);
		gamelistPage = Gamelist.dao.paginate(pageIndex, PAGE_SIZE, 
				"select v.day,v.appName , v.channelName , v.channelId , v.server , v.initCount ,v.payCount ,v.totalFee ,v.arpu , v.perFee", 
				queryStr);
		final List<Gamelist> gamelistList = gamelistPage.getList();
		
        //分页号码的开始序号和结束序号
        int begin = 0;
        int end = 0;
        //最多显示当当前页面的前后4个页码
        if (gamelistPage.getPageNumber() - 4 < 1) {
            begin = 1;
        } else {
            begin = gamelistPage.getPageNumber() - 4;
        }
        if (gamelistPage.getTotalPage() < gamelistPage.getPageNumber() + 4) {
            end = gamelistPage.getTotalPage();
        } else {
            end = gamelistPage.getPageNumber() + 4;
        }
		setAttr("role", userInDb.get("role"));
        //把四个变量做传入页面
        setAttr("begin", begin);
        setAttr("end", end);
        setAttr("appId", appId);
        setAttr("channeled", channeled);
        setAttr("op", op);
        setAttr("pages", gamelistPage);
        setAttr("defaultStart", (startDate!=null?startDate:defaultStart));
        setAttr("defaultEnd", (endDate!=null?endDate:defaultEnd));
        setAttr("gamelistList", gamelistList);
        // 对渠道列表排序
        Collections.sort(channelList, new NameSort());
        setAttr("channelList", channelList);
        setAttr("b", b);
        setAttr("apps", apps);
		renderJsp("gamelist.jsp");
	}
		
	public static final String[] headers = new String[]{"日期","游戏","渠道商ID","渠道商名称","激活用户","付费用户","总计费金额(单位:元)","人均计费(单位:元)","付费转化率"};
    
	/** 导出excel表格*/
	public void exportExcel() {
		startDate = getPara("startDate");
		endDate = getPara("endDate");
		appId = getPara("appId");
		channeled = getPara("channel");
		
		startDate = startDate!=null?startDate:defaultStart;
		endDate = endDate!=null?endDate:defaultEnd;
		
		List<Channel> channelList = getSessionAttr("channelList");
    	String queryStr = generateSQL(channelList);
    	StringBuilder sql = new StringBuilder();
    	sql.append("select v.day,v.appName , v.channelName , v.channelId , v.server , v.initCount ,v.payCount ,v.totalFee ,v.arpu , v.perFee ").append(queryStr);
    	dataList = Gamelist.dao.find(sql.toString());
    	
        List<Object> data = Lists.newArrayList();
    	data = Lists.newArrayList();
        for (int i = 0; i < dataList.size(); i++) {
        	Map<String, Object> map = getMap(i);
            data.add(map);
        }
        render(PoiRender.me(data).fileName("daily_report.xls").headers(headers).headerRow(1));
    }
	
	public void exportExcel1(){
		startDate = getPara("startDate");
		endDate = getPara("endDate");
		appId = getPara("appId");
		channeled = getPara("channel");
		clquery = getPara("clquery");
		
		startDate = startDate!=null?startDate:defaultStart;
		endDate = endDate!=null?endDate:defaultEnd;
		
		String sqlCon = getMonthlySqlCon();
		
		String sql = getMonthlySqlPro();	
		dataList = Gamelist.dao.find(sql+sqlCon);
		
		List<Object> data = Lists.newArrayList();
    	data = Lists.newArrayList();
        for (int i = 0; i < dataList.size(); i++) {
        	Map<String, Object> map = getMap(i);
            data.add(map);
        }
        render(PoiRender.me(data).fileName("daily_report.xls").headers(headers).headerRow(1));
	}

	private String generateSQL(List<Channel> channelList) {
		StringBuilder queryStr = new StringBuilder();
		queryStr.append("from (select u.day as day,u.app_name as appName,u.channel_name as channelName,u.channel_id as channelId ,u.server as server,u.init_count as initCount,")
			.append("u.pay_count as payCount ,u.total_fee as totalFee, u.arpu, u.per_fee as perFee from t_channel_report_daily u where ")
			.append("u.day >='"+startDate+"' and u.day <='"+endDate+"' ");
		if (appId!=null && appId!="") {
			queryStr.append(" and u.app_id='" + appId + "' ");
		}
		if (clquery!=null && clquery!=""){
			queryStr.append(" and u.channel_name like '%" + clquery + "%' ");
		} else if (channeled!=null && channeled!=""){
			queryStr.append(" and u.channel_name='" + channeled + "' ");
		} else {
			StringBuilder rang = new StringBuilder();
			for (int i=0; i<channelList.size(); i++) {
				Channel temp = channelList.get(i);
				if (i < channelList.size()-1) {
					rang.append(temp.getLong("id")).append(",");
				} else {
					rang.append(temp.getLong("id"));
				}
			}
			
			queryStr.append(" and u.channel_id in ("+rang.toString()+")");
		}
		queryStr.append(" order by u.app_id, u.day desc, u.init_count desc)v");
		return queryStr.toString();
	}


    private Map<String, Object> getMap(int i) {
        Map<String, Object> map = Maps.newLinkedHashMap();
        map.put("day", dataList.get(i).get("day"));
        map.put("appName", dataList.get(i).get("appName"));
        map.put("channelId", dataList.get(i).get("channelId"));
        map.put("channelName", dataList.get(i).get("channelName"));
        map.put("initCount", dataList.get(i).get("initCount"));
        map.put("payCount", dataList.get(i).get("payCount"));
        map.put("totalFee", dataList.get(i).get("totalFee"));
        map.put("arpu", dataList.get(i).get("arpu"));
        map.put("perFee", dataList.get(i).get("perFee"));
        return map;
    }
		
		
	public String getBeginDate() {
		Calendar calendar = new GregorianCalendar(); 
		java.text.SimpleDateFormat sd = new java.text.SimpleDateFormat(
				"yyyy-MM-dd");
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		return sd.format(calendar.getTime());
	}

	public String getEndDate() {
		Calendar calendar = new GregorianCalendar(); 
		java.text.SimpleDateFormat sd = new java.text.SimpleDateFormat(
				"yyyy-MM-dd");
		calendar.add(Calendar.MONTH, 1);  
        calendar.set(Calendar.DAY_OF_MONTH, 0);
		return sd.format(calendar.getTime());
	}
	
	// 获取所有渠道号
	private void getAllChannel() {
		channelList = Channel.dao.find("select * from t_channel_info order by name");
		
		setSessionAttr("channelList", channelList);
	}
	
	// 获取玩家关联渠道号
	private void getUserChannel() {
		List<UserChannel> userChannels = UserChannel.dao.find("select * from t_user_channel where user_id=?", userInDb.getLong("id"));
		List<Integer> channelIds = new ArrayList<Integer>();
		channelIds.add(userInDb.getInt("channel_id"));
		for (UserChannel uc : userChannels) {
			channelIds.add(uc.getInt("channel_id"));
		}
		
		Map<Integer, Channel> channelMap = new HashMap<Integer, Channel>();
		for(Integer channelId : channelIds) {
			Channel  channel = Channel.dao.findById(channelId);
			if (channel != null && channelMap.get(channelId) == null) {
				channelMap.put(channelId, channel);
			}
		}
		
		// 获取用户名下所有渠道列表
		channelList = new ArrayList<Channel>();
		for (Entry<Integer, Channel>entry : channelMap.entrySet()) {
			channelList.add(entry.getValue());
		}
		setSessionAttr("channelList", channelList);
	}
	
	//按月统计
	public void monthly(){
		
		String sql = "";
		String sqlCon = "";
		startDate = getPara("startDate");
		endDate = getPara("endDate");
		channeled = getPara("channel");
		clquery = getPara("clquery");
		appId = getPara("appId");
		apps = Game.dao.find("select * from t_app_info");
		
		sqlCon = getMonthlySqlCon();
		
		sql = getMonthlySqlPro();
		
		loginUser = getSessionAttr("user");
		
		userInDb = Login.dao.findFirst("select * from t_user where name=?", loginUser);
		if (userInDb.getInt("role") == 3) {
			// 超级管理员
			getAllChannel();
		} else {
			getUserChannel();
		}
		
		String index="";
		if(this.getPara() != null){
			index = this.getPara();
		}
		
		int pageIndex = index.equals("index")?getParaToInt("index", 1):getParaToInt(0, 1);
		Page<Gamelist> gamelistPage = null;
		
		gamelistPage = Gamelist.dao.paginate(pageIndex, PAGE_SIZE,sql,sqlCon);
		final List<Gamelist> gamelistList = gamelistPage.getList();
		
		//分页号码的开始序号和结束序号
        int begin = 0;
        int end = 0;
        //最多显示当当前页面的前后4个页码
        if (gamelistPage.getPageNumber() - 4 < 1) {
            begin = 1;
        } else {
            begin = gamelistPage.getPageNumber() - 4;
        }
        if (gamelistPage.getTotalPage() < gamelistPage.getPageNumber() + 4) {
            end = gamelistPage.getTotalPage();
        } else {
            end = gamelistPage.getPageNumber() + 4;
        }
		setAttr("role", userInDb.get("role"));
		//把四个变量做传入页面
        setAttr("begin", begin);
        setAttr("end", end);
        setAttr("appId", appId);
        setAttr("channelList", channelList);
        setAttr("channeled", channeled);
        setAttr("op", op);
        setAttr("pages", gamelistPage);
        setAttr("defaultStart", (startDate!=null?startDate:defaultStart));
        setAttr("defaultEnd", (endDate!=null?endDate:defaultEnd));
        setAttr("gamelistList", gamelistList);
        setAttr("channelList", channelList);
        setAttr("b", b);
        setAttr("apps", apps);
		renderJsp("gameMonthly.jsp");
	}
	
	private String getMonthlySqlPro(){
		String sql = "";
		
		sql = "select '"+startDate+"---"+endDate+"' day,app_name appName,channel_id channelId,channel_name channelName,sum(init_count) initCount,"
				+ "sum(pay_count) payCount,sum(total_fee) totalFee,round(sum(total_fee)/sum(init_count),2) arpu,round(sum(pay_count)/sum(init_count),2) perFee ";
		
		return sql;
	}
	
	private String getMonthlySqlCon(){
		StringBuilder sqlCon = new StringBuilder();
		
		if(startDate != null && !"".equals(startDate)){
			sqlCon.append(" from t_channel_report_daily where day>='").append(startDate).append("' and day<='").append(endDate)
				.append("' ");
			if (clquery!=null && clquery!=""){
				sqlCon.append(" and channel_name like '%" + clquery + "%' ");
			} else if(channeled != null && !"".equals(channeled)){
				sqlCon.append(" and channel_name='").append(channeled).append("' ");
			}
			if(appId != null && !"".equals(appId)){
				sqlCon.append(" and app_id='").append(appId).append("' ");
			}
			sqlCon.append(" group by channel_name order by initCount desc");
		} else {
			startDate = getBeginDate();
			endDate = getEndDate();
			sqlCon.append(" from t_channel_report_daily where day>='").append(startDate).append("' and day<='").append(endDate)
			.append("' group by channel_name order by initCount desc ");
		}
		
		return sqlCon.toString();
	}
		
		
}

