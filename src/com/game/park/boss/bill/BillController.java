package com.game.park.boss.bill;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import com.game.park.boss.login.Login;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;


@Before(BillInterceptor.class)
public class BillController extends Controller {
	
	
	public void index() {
			//setAttr("blogList", Blog.dao.find("select * from blog order by id asc"));
			//setAttr("billList", Bill.dao.find("select w.date 日期 , w.fee 总收入 from (select substring(t.create_time,1,10) as date , round(sum(t.total_fee),2) as fee from t_channel_report_daily t where 1=1 and t.create_time > 20130923 and t.create_time < 20130928 group by substring(t.create_time,1,10) with rollup) w"));
			//setAttr("billList", Bill.dao.find("select t.day , sum(total_fee) fee from t_channel_report_daily t where t.day > '2013-09-01' and t.day < '2013-10-31' group by t.day with rollup"));
			String sd = getPara("sdate");
			String et = getPara("edate");
			String tbegin = getBeginDate();
			String tend = getEndDate();
			String loginUser = getSessionAttr("user");
			Login userInDb = Login.dao.findFirst("select role from t_user where name=?", loginUser);
			//setAttr("billList", Bill.dao.find("select t.day , sum(total_fee) fee from t_channel_report_daily t where t.day > '" + (sd!=null?sd:begin) + "' and t.day < '" + (et!=null?et:end) + "' group by t.day with rollup"));
			//select w.date 日期 , w.fee 总收入 from (select substring(t.create_time,1,10) as date , round(sum(t.total_fee),2) as fee from orangesdk.t_channel_report_daily t where 1=1 and t.create_time > 20130923 and t.create_time < 20130928 group by substring(t.create_time,1,10) with rollup) w
			//render("bill.jsp");
			//String index = getPara("UrlPara");
			String index="";
			if(this.getPara() != null){
			index = this.getPara();
			}
			Page<Bill> billPage = null;
			if(((Integer)userInDb.get("role"))==1){
				billPage = Bill.dao.paginate((index.equals("index")?getParaToInt("index", 1):getParaToInt(0, 1)),
		                29, "select t.day , sum(total_fee) fee " , "from t_channel_report_daily t where t.day >= '" + (sd!=null?sd:tbegin) + "' and t.day <= '" + (et!=null?et:tend) + "' " + "and t.channel_name='" + loginUser + "' group by t.day with rollup");
			}else if(((Integer)userInDb.get("role"))==2 || ((Integer)userInDb.get("role"))==3){
				billPage = Bill.dao.paginate((index.equals("index")?getParaToInt("index", 1):getParaToInt(0, 1)),
		                29, "select t.day , sum(total_fee) fee " , "from t_channel_report_daily t where t.day >= '" + (sd!=null?sd:tbegin) + "' and t.day <= '" + (et!=null?et:tend) + "' group by t.day with rollup");
			}/*else if(((Integer)userInDb.get("role"))==4  && loginUser.matches("^*[0-9]*[a-zA-Z]*")){
				billPage = Bill.dao.paginate((index.equals("index")?getParaToInt("index", 1):getParaToInt(0, 1)),
		                29, "select t.day , sum(total_fee) fee " , "from t_channel_report_daily t where t.day >= '" + (sd!=null?sd:tbegin) + "' and t.day <= '" + (et!=null?et:tend) + "' " + "and t.channel_name like'%" + loginUser + "%' group by t.day with rollup");
			}*/else if (((Integer)userInDb.get("role"))==4 ){//&& loginUser.matches("[\\u4E00-\\u9FA5]+")
				String rechannelname = getSessionAttr("rechannelname");
				billPage = Bill.dao.paginate((index.equals("index")?getParaToInt("index", 1):getParaToInt(0, 1)),
		                29, "select t.day , sum(total_fee) fee " , "from t_channel_report_daily t where t.day >= '" + (sd!=null?sd:tbegin) + "' and t.day <= '" + (et!=null?et:tend) + "' " + "and (t.channel_name = " + rechannelname + ") group by t.day with rollup");
			}
			List<Bill> billList = billPage.getList();
	        //分页号码的开始序号和结束序号
	        int begin = 0;
	        int end = 0;
	        //最多显示当当前页面的前后4个页码
	        if (billPage.getPageNumber() - 4 < 1) {
	            begin = 1;
	        } else {
	           begin = billPage.getPageNumber() - 4;
	        }
	        if (billPage.getTotalPage() < billPage.getPageNumber() + 4) {
	            end = billPage.getTotalPage();
	        } else {
	            end = billPage.getPageNumber() + 4;
	        }
	        //把四个变量做传入页面
	        setAttr("begin", begin);
	        setAttr("end", end);
	        setAttr("pages", billPage);
	        setAttr("tbegin", (sd!=null?sd:tbegin));
	        setAttr("tend", (et!=null?et:tend));
	        setAttr("billList", billList);
	        renderJsp("bill.jsp");

			
			
			
		}
		
		
		public void add() {
		}
		
		@Before(BillValidator.class)
		public void save() {
			getModel(Bill.class).save();
			redirect("/bill");
		}
		
		public void edit() {
			setAttr("bill", Bill.dao.findById(getParaToInt()));
		}
		
		@Before(BillValidator.class)
		public void update() {
			getModel(Bill.class).update();
			redirect("/bill");
		}
		
		public void delete() {
			Bill.dao.deleteById(getParaToInt());
			redirect("/bill");
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
}

