package com.game.park.boss.login;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * BillValidator.
 */
public class LoginValidator extends Validator {
	
	@Override
	protected void validate(Controller controller) {
		validateRequiredString("login.username", "usernameMsg", "请您输入用户名!");
		validateRequiredString("login.password", "passwordMsg", "请您输入密码!");
		validateRequiredString("login.captcha", "captchaMsg", "请您输入验证码!");
	}
	
	@Override
	protected void handleError(Controller controller) {
		controller.keepModel(Login.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/paycode/save"))
			controller.render("add.jsp");
		else if (actionKey.equals("/paycode/update"))
			controller.render("edit.jsp");
	}

	
}
