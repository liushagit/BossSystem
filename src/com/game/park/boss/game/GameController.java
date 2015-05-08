package com.game.park.boss.game;

import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;


@Before(GameInterceptor.class)
public class GameController extends Controller {
		public void index() {
			String sql = "select t.id id, t.app_id appId,  t.name name, t.memo memo,t.is_open isOpen";
			String sqlCon = "from t_app_info t order by id desc";
	        Page<Game> gamePage = Game.dao.paginate(getParaToInt(0, 1), 27, sql , sqlCon);
	        List<Game> gameList = gamePage.getList();
	        //分页号码的开始序号和结束序号
	        int begin = 0;
	        int end = 0;
	        //最多显示当当前页面的前后4个页码
	        if (gamePage.getPageNumber() - 4 < 1) {
	            begin = 1;
	        } else {
	            begin = gamePage.getPageNumber() - 4;
	        }
	        if (gamePage.getTotalPage() < gamePage.getPageNumber() + 4) {
	            end = gamePage.getTotalPage();
	        } else {
	            end = gamePage.getPageNumber() + 4;
	        }
	        //把四个变量做传入页面
	        setAttr("begin", begin);
	        setAttr("end", end);
	        setAttr("pages", gamePage);
	        setAttr("gameList", gameList);
	        renderJsp("game.jsp");

			
			
		}

		public void add() {
		}
		
		@Before(GameValidator.class)
		public void save() {
			getModel(Game.class).save();
			redirect("/game");
		}
		
		public void edit() {
			setAttr("game", Game.dao.findById(getParaToInt()));
		}
		
		@Before(GameValidator.class)
		public void update() {
			getModel(Game.class).update();
			redirect("/game");
		}
		
		public void delete() {
			Game.dao.deleteById(getParaToInt());
			redirect("/game");
		}
	

}

