<%@ page language="java" pageEncoding="utf-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><link href="/admin/css/login.css" rel="stylesheet" type="text/css" />
<div id="top">
  <div class="logo"><img src="/admin/images/logo2.gif" /></div>
  <div class="t_r">
     <p>欢迎您，<b>${sessionScope.user}</b>&nbsp;&nbsp;&nbsp;  <a href="#">帮助</a> | <a href="/admin/loginoff.jsp" class="c_yellow" target="_parent">退出</a></p>
  </div>
  <div class="top_bar">
    <ul>
      
      <li><a href="#" >欢迎您，${sessionScope.user}</a></li>
      <li><a href="/login/update.jsp" target="main">修改密码</a></li>
      <li><a href="/admin/loginoff.jsp" target="_parent">安全退出</a></li>
    </ul>
  </div>
</div>