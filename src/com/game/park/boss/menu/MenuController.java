package com.game.park.boss.menu;

import java.util.List;

import com.game.park.boss.game.Game;
import com.game.park.boss.login.Login;
import com.jfinal.core.Controller;

public class MenuController extends Controller {
	

	public void index() {
		List<Game> appList;
		String username = getPara("username");
		String password = getPara("password");
		System.out.println(username);
		System.out.println(password);
		
		Login user = Login.dao.findFirst("select id, name, role, password from t_user where name=?",username);
		if (user == null) {
			return;
		} else {
			// 校验密码
			String realPwd = user.getStr("password");
			if (realPwd != null && !realPwd.equals(password)) {
				setAttr("msg", "账号密码验证失败");
				return;
			}
		}
		
		
		appList = Game.dao.find("select app_id appId,name from t_app_info where is_open=1");
		setAttr("userInfo", user);
		setAttr("appList", appList);
		
		render("/common/leftMenu.jsp");
	}

}
