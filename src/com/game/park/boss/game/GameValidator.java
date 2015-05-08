package com.game.park.boss.game;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * gameValidator.
 */
public class GameValidator extends Validator {
	
	@Override
	protected void validate(Controller controller) {
		validateRequiredString("game.app_id", "app_idMsg", "请输入app_id!");
		validateRequiredString("game.name", "nameMsg", "请输入name!");
		validateRequiredString("game.memo", "memoMsg", "请输入memo!");
		validateRequiredString("game.version", "versionMsg", "请输入version!");
	}
	
	@Override
	protected void handleError(Controller controller) {
		controller.keepModel(Game.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/game/save"))
			controller.render("add.jsp");
		else if (actionKey.equals("/game/update"))
			controller.render("edit.jsp");
	}
}
