package com.game.park.boss.login;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.game.park.boss.channel.Channel;
import com.game.park.boss.channel.UserChannel;
import com.game.park.boss.game.Game;
import com.google.common.collect.Maps;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

@Before(LoginInterceptor.class)
public class LoginController extends Controller {
	// @Before(LoginValidator.class)
	Login userInDb = null;
	String channelsid;
	Long userid;
	List<UserChannel> userChannel = null;
	String rechannelname;
	List<Channel> channelid;
	

	public void index() {
		String username = getPara("login.username");
		String password = getPara("login.password");
		setSessionAttr("user", username);
		
		List<Game> appList = Game.dao.find("select app_id appId,name from t_app_info where is_open=1");
		setSessionAttr("appList", appList);
		
		String loginUser = getSessionAttr("user");
		userInDb = Login.dao.findFirst("select id, name, role, password from t_user where name=?",username);
		setSessionAttr("userInDb", userInDb);
		if (userInDb == null) {
			setAttr("msg", "账号不存在");
			render("/common/error.jsp");
			return;
		} else {
			// 校验密码
			String realPwd = userInDb.getStr("password");
			if (realPwd != null && !realPwd.equals(password)) {
				setAttr("msg", "密码错误！");
				render("/common/error.jsp");
				return;
			}
		}
		
		if ((Integer) userInDb.get("role") == 2
				|| (Integer) userInDb.get("role") == 3) {
			render("/common/admin.jsp");
		} else if ((Integer) userInDb.get("role") == 1
				|| (Integer) userInDb.get("role") == 4) {

			Login lg = Login.dao.findFirst(
					"select * from t_user t where t.name=?", loginUser);
			if (lg != null) {
				userid = lg.get("id");
			}
			userChannel = UserChannel.dao.find(
					"select * from t_user_channel t where t.user_id=?", userid);
			List data = new ArrayList<Object>();
			for (int i = 0; i < userChannel.size(); i++) {
				int cid = userChannel.get(i).get("channel_id");
				List<Channel> channel = Channel.dao.find(
						"select * from t_channel_info t where t.id = ?", cid);
				for (int j = 0; j < channel.size(); j++) {
					String name = channel.get(j).get("name");
					String str = new String(name);
					Map<String, Object> map = Maps.newLinkedHashMap();
					map.put("name", str);
					data.add(map);
				}
			}
			channelid = data;
			rechannelname = channelid.toString().replaceAll("name=", "");
			rechannelname = rechannelname
					.substring(1, rechannelname.length() - 1)
					.replaceAll("\\}", "'").replaceAll("\\{", "'")
					.replaceAll(", ", " or channel_name=");
			setSessionAttr("rechannelname", rechannelname);
			setSessionAttr("channelid", channelid);
			render("/common/channel.jsp");
		}
	}

	public void add() {
	}

	@Before(LoginValidator.class)
	public void save() {
		getModel(Login.class).save();
		redirect("/login");
	}

	public void edit() {
		setAttr("login", Login.dao.findById(getParaToInt()));
	}

	public void update() {
		String loginUser = getSessionAttr("user");
		String oldpwd = getPara("oldpwd");
		String password = getPara("password");
		String repasswd = getPara("repasswd");
		System.out.println(loginUser + "--" + oldpwd + "--" + password + "--"
				+ repasswd);
		Login userInDb = Login.dao
				.findFirst(
						"select id, name, role, password from t_user where name=? and password=?",
						loginUser, oldpwd);
		if (userInDb != null && password.equals(repasswd)) {
			System.out.println("succ");
			Login user = Login.dao
					.findFirst(
							"select id, name, role, password from t_user where name=? and password=?",
							loginUser, oldpwd);
			user.set("password", password);
			user.update();
		}
	}
	
}
