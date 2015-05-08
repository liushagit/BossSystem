<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<fieldset class="solid">
	<legend>创建Bill</legend>
	<input type="hidden" name="bill.id" value="${bill.id}" />
	<div>
		<label>标题</label>
		<input type="text" name="bill.day" value="${bill.day}" />${dayMsg}
	</div>
	
	<div>
		<label>游戏名称</label>
		<input type="text" name="bill.app_name" value="${bill.app_name}" />${app_nameMsg}
	</div>
	
	
	<div>
		<label>内容</label>
		<textarea name="bill.channel_id" cols="80" rows="10">${bill.channel_id}</textarea>${channel_idMsg}
	</div>
	<div>
		<label>&nbsp;</label>
		<input value="提交" type="submit">
	</div>
</fieldset>