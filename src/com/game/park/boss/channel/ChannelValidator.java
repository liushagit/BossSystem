package com.game.park.boss.channel;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * channelValidator.
 */
public class ChannelValidator extends Validator {
	
	@Override
	protected void validate(Controller controller) {
		validateRequiredString("channel.name", "nameMsg", "请输入渠道商名称!");
		//validateRequiredString("channel.password", "passwordMsg", "请输入密码!");
		validateRequiredString("channel.memo", "memoMsg", "请输入渠道商描述!");
	}
	
	@Override
	protected void handleError(Controller controller) {
		controller.keepModel(Channel.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/channel/save"))
			controller.render("add.jsp");
		else if (actionKey.equals("/channel/update"))
			controller.render("edit.jsp");
	}
}
