/**
 * 
 */
package com.game.park.boss;

import com.jfinal.core.JFinal;

/**
 * @author queshaojie
 *
 * 2014
 */
public class Bootstrap {
	/**
	 * 启动类
	 */
	public static void main(String[] args) {
		JFinal.start("WebRoot", 8080, "/", 60);
	}
}
