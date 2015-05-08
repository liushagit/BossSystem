package com.game.park.boss.bill;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * BillValidator.
 */
public class BillValidator extends Validator {
	
	@Override
	protected void validate(Controller controller) {
		validateRequiredString("bill.day", "dayMsg", "请输入Bill标题!");
		validateRequiredString("bill.app_name", "app_nameMsg", "请输入游戏名称!");
		validateRequiredString("bill.channel_id", "channel_idMsg", "请输入channel_id内容!");
	}
	
	@Override
	protected void handleError(Controller controller) {
		controller.keepModel(Bill.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/bill/save"))
			controller.render("add.jsp");
		else if (actionKey.equals("/bill/update"))
			controller.render("edit.jsp");
	}
}
