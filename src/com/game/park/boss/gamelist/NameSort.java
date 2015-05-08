/**
 * 
 */
package com.game.park.boss.gamelist;

import java.util.Comparator;

import com.game.park.boss.channel.Channel;

/**
 * @author Administrator
 *
 */
public class NameSort implements Comparator<Channel> {
	@Override
	public int compare(Channel c1, Channel c2) {
		String n1 = c1.getStr("name");
		String n2 = c2.getStr("name");
		return n1.compareToIgnoreCase(n2);
	}
}
