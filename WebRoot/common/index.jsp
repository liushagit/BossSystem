<%@ page language="java" pageEncoding="utf-8"%>
<html:errors /><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>管理后台</title>
    <link href="/admin/css/login.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/js/ajax.js"></script>
	<SCRIPT language=JavaScript>
	function sub(){
		if($("username").value==""){
			alert("用户名不能为空");
			$("username").focus();
			return false;
		}
		if($("password").value==""){
			alert("密码不能为空");
			$("password").focus();
			return false;
		}
		if($("captcha").value==""){
			alert("验证码不能为空");
			$("captcha").focus();
			return false;
		}		
	}
	</SCRIPT>
</head>
<body>

<div class="container">
  <div class="content">
  <FORM name=theForm onsubmit="return sub()" action=/login method=post>
     <div class="main">
         <img alt="用户登录" src="admin/images/login_tit.gif" class="l_tit" />
         <div class="form">
            <p><label>账  号：</label><input name=username id="username" type="text"/></p>
            <p><label>密  码：</label><input name=password id="password" type="password"/></p>
            <p><label>验证码：</label><input name=captcha id="captcha" type="text"/>
            <img alt="" src="admin/checkimage.jsp"  height="21" /></p>
            <div class="btn"><input type="submit" value="登 录" /></div>
         </div>
     </div>
  </FORM>
  </div> 
  <div class="copyright">All Right Reserved Copyright ? 2013&nbsp;&nbsp;&nbsp;&nbsp;</div>
</div>

</body>
</html>
