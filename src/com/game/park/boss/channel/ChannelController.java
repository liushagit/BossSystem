package com.game.park.boss.channel;

import java.util.List;

import com.game.park.boss.login.Login;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;


@Before(ChannelInterceptor.class)
public class ChannelController extends Controller {
		public void index() {
			String index="";
			if(this.getPara() != null){
			index = this.getPara();
			}
			String query = getPara("query");
	        Page<Channel> channelPage = Channel.dao.paginate((index.equals("index")?getParaToInt("index", 1):getParaToInt(0, 1)),
	                29, "select t.id , t.name , t.memo , t.create_time , t.update_time" , "from t_channel_info t " + (query!=""&&query!=null?"where t.name like'%"+query+"%' or t.memo like'%"+query+"%'":"") + " order by id desc");
	        List<Channel> channelList = channelPage.getList();
	        int begin = 0;
	        int end = 0;
	        if (channelPage.getPageNumber() - 4 < 1) {
	            begin = 1;
	        } else {
	            begin = channelPage.getPageNumber() - 4;
	        }
	        if (channelPage.getTotalPage() < channelPage.getPageNumber() + 4) {
	            end = channelPage.getTotalPage();
	        } else {
	            end = channelPage.getPageNumber() + 4;
	        }
	        setAttr("query", query);
	        setAttr("begin", begin);
	        setAttr("end", end);
	        setAttr("pages", channelPage);
	        setAttr("channelList", channelList);
	        renderJsp("channel.jsp");
			
		}

		public void add() {
		}
		
		@Before(ChannelValidator.class)
		public void save() {
			getModel(Channel.class).save();

			String name = getPara("channel.name");
			String password = getPara("login.password");
			Channel channel = Channel.dao.findFirst("select * from t_channel_info where name=?", name);
			
			Login user = new Login().set("name", name).set("password", password).set("role", 1).set("channel_id", channel.get("id"));
			user.save();
			redirect("/channel");
		}
		Login login = null;
		public void edit() {
			Channel channel = Channel.dao.findById(getParaToInt());
			String name = channel.get("name");
			login = Login.dao.findFirst("select * from t_user where name=?",name);
			setAttr("channel", channel);
			setAttr("login", login);
		}
		
		@Before(ChannelValidator.class)
		public void update() {
			getModel(Channel.class).update();
			String password = getPara("login.password");
			String name = getPara("channel.name");
			Login user = Login.dao.findFirst("select * from t_user t where t.name=?", name);
			user.set("password", password);
			user.update();
			redirect("/channel");
		}
		Channel channel = null;
		public void delete() {
			channel = Channel.dao.findFirst("select * from t_channel_info where id=?",getParaToInt());
			String name = channel.get("name");
			login = Login.dao.findFirst("select * from t_user where name=?",name);
			Channel.dao.deleteById(getParaToInt());
			if(login==null)
				return;
			Long id = login.getLong("id");
			Login.dao.deleteById(id);
			redirect("/channel");
		}
	

}

