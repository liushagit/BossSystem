<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<fieldset class="solid">
	<legend>创建game</legend>
	<input type="hidden" name="game.id" value="${game.id}" />
	<div>
		<label>appid</label>
		<input type="text" name="game.app_id" value="${game.app_id}" />${app_idMsg}
	</div>
	
	<%-- <div>
		<label>渠道号</label>
		<input type="text" name="game.channel_id" value="${game.channel_id}" />${channel_idMsg}
	</div> --%>
	
	
	<div>
		<label>游戏名称</label>
		<input type="text" name="game.name" value="${game.name}" />${nameMsg}
	</div>
	
	<div>
		<label>游戏描述</label>
		<input type="text" name="game.memo" value="${game.memo}" />${memoMsg}
	</div>
	
	<div>
		<label>游戏版本</label>
		<input type="text" name="game.version" value="${game.version}" />${versionMsg}
	</div>
	
	<div>
		<label>游戏状态</label>
		<select class="boss_color_red" name="game.is_open">
			<option value="1" <c:if test="${game.is_open eq 1}">selected</c:if> >上线</option>
			<option value="0" <c:if test="${game.is_open eq 0}">selected</c:if> >下线</option>
		</select>
		（修改该选项后需要刷新导航栏在游戏报表菜单栏才能生效）
	</div>
	
	<div>
		<label>&nbsp;</label>
		<input value="提交" type="submit">
	</div>
</fieldset>