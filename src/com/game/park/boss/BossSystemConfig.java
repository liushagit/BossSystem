/**
 * 
 */
package com.game.park.boss;

import com.game.park.boss.bill.Bill;
import com.game.park.boss.bill.BillController;
import com.game.park.boss.channel.Channel;
import com.game.park.boss.channel.ChannelController;
import com.game.park.boss.channel.UserChannel;
import com.game.park.boss.game.Game;
import com.game.park.boss.game.GameController;
import com.game.park.boss.gamelist.Gamelist;
import com.game.park.boss.gamelist.GamelistController;
import com.game.park.boss.login.Login;
import com.game.park.boss.login.LoginController;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;

/**
 * @author queshaojie
 * 
 *         2014
 */
public class BossSystemConfig extends JFinalConfig {
	/**
	 * 配置常量
	 */
	@Override
	public void configConstant(Constants me) {
		loadPropertyFile("data_source.properties"); // 加载少量必要配置，随后可用getProperty(...)获取值
		me.setDevMode(getPropertyToBoolean("devMode", false));
		me.setViewType(ViewType.JSP);
	}

	/**
	 * 配置路由
	 */
	@Override
	public void configRoute(Routes me) {
		me.add("/", DefaultController.class);
		me.add("/bill", BillController.class); 			// 配置路由 /bill 		BillControler
		me.add("/gamelist", GamelistController.class); 	// 配置路由 /game 		GamelistControler
		me.add("/channel", ChannelController.class); 	// 配置路由 /channel  	ChannelControler
		me.add("/game", GameController.class); 			// 配置路由 /game 		GameControler
		me.add("/login", LoginController.class);
	}

	/**
	 * 配置插件
	 */
	@Override
	public void configPlugin(Plugins me) {
		// 配置C3p0数据库连接池插件
		C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl"), getProperty("user"), getProperty("password").trim());
		me.add(c3p0Plugin);
		
		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		me.add(arp);
		arp.setShowSql(true);
		arp.addMapping("t_channel_report_daily", Bill.class);		// 映射t_channel_report_daily 表到 Bill模型
		arp.addMapping("t_channel_report_daily", Gamelist.class);	// 映射t_channel_report_daily 表到 Bill模型
		arp.addMapping("t_channel_info", Channel.class);			// 映射t_channel_report_daily 表到 Bill模型
		arp.addMapping("t_app_info", Game.class);					// 映射t_app_info 表到 Game模型
		arp.addMapping("t_user", Login.class);
		arp.addMapping("t_user_channel", UserChannel.class);
	}

	/**
	 * 配置全局拦截器
	 */
	@Override
	public void configInterceptor(Interceptors me) {

	}

	/**
	 * 配置处理器
	 */
	@Override
	public void configHandler(Handlers me) {

	}
}
