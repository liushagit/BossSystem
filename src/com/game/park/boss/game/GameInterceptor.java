package com.game.park.boss.game;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;

/**
 * BillInterceptor
 */
public class GameInterceptor implements Interceptor {
	
	@Override
	public void intercept(ActionInvocation ai) {
		System.out.println("Before invoking " + ai.getActionKey());
		ai.invoke();
		System.out.println("After invoking " + ai.getActionKey());
	}
}
