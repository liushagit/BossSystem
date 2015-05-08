package com.game.park.boss.gamelist;


import java.util.List;
import java.util.Map;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.auth.AccessTokenBuilder;

public class PoiController extends Controller {
    String[] columns = new String[] { "ACC_NBR", "DEVID", "IMSI" };
    String[] headers = new String[]{"日期","游戏","渠道商ID","渠道商名称","激活用户","付费用户","总计费金额(单位:元)","人均计费(单位:元)","付费转化率"};
    String[] headers2 = new String[] { "电话号码", "设备id", "imsi" };

    public void index(){
        renderText(AccessTokenBuilder.getAccessToken(getRequest()));
    }
    public void columns(List data,String[] headers) {
        //List<Object> data = Lists.newArrayList();
    	data = Lists.newArrayList();
        for (int i = 0; i < data.size(); i++) {
            Map<String, Object> map = getMap(i);
            data.add(map);
        }
        render(PoiRender.me(data).fileName("daily_report.xls").headers(headers).cellWidth(5000).headerRow(2));
    }

    
    public void columns() {
    	System.out.println(this.getRequest().getParameter("act")+"=============================act");
        List<Object> data = Lists.newArrayList();
    	data = Lists.newArrayList();
        for (int i = 0; i < 5; i++) {
            Map<String, Object> map = getMap(i);
            data.add(map);
        }
        render(PoiRender.me(data).fileName("daily_report.xls").headers(headers).cellWidth(5000).headerRow(2));
    }


    public void map() {
        List<Object> data = Lists.newArrayList();
        for (int i = 0; i < 5; i++) {
            Map<String, Object> map = getMap(i);
            data.add(map);
        }
        render(PoiRender.me(data).headers(headers));
    }

    public void record() {
        List<Object> data = Lists.newArrayList();
        for (int i = 0; i < 5; i++) {
            Record record = new Record();
            Map<String, Object> map = getMap(i);
            record.setColumns(map);
            data.add(record);
        }
        render(PoiRender.me(data).headers(headers2));
    }

    private Map<String, Object> getMap(int i) {
        Map<String, Object> map = Maps.newHashMap();
        map.put("ACC_NBR", "ACC_NBR" + i);
        map.put("IMSI", "IMSI" + i);
        map.put("DEVID", "DEVID" + i);
        map.put("LASTTIME", "LASTTIME" + i);
        return map;
    }


}
