<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<fieldset class="solid">
	<legend>创建channel</legend>
	<input type="hidden" name="channel.id" value="${channel.id}" />
	<div>
		<label>渠道商名称</label>
		<input type="text" name="channel.name" value="${channel.name}" />${nameMsg}
	</div>
	
	
	<div>
		<label>渠道商描述</label>
		<input type="text" name="channel.memo" value="${channel.memo}" />${memoMsg}
	</div>
	
	<div>
		<label>渠道商id</label>
		<input type="text" name="login.cid" value="${login.cid}" />${cidMsg}
	</div>
	
	
	<div>
		<label>登录密码</label>
		<input type="text" name="login.password" value="${login.password}" />${passwordMsg}
	</div>
	
	<label>&nbsp;</label>
	<input value="提交" type="submit">
	</div>
</fieldset>