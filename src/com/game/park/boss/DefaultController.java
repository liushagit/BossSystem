/**
 * 
 */
package com.game.park.boss;

import com.jfinal.core.Controller;

/**
 * 默认
 * 
 * @author queshaojie
 * 
 *         2014
 */
public class DefaultController extends Controller {
	/**
	 * 默认首页
	 */
	public void index() {
		render("/login/login.jsp");
	}
}
