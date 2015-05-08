<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="zh-CN" xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <title>导航</title>
    <link href="/admin/css1/login.css" rel="stylesheet" type="text/css" />
    <script src="/admin/js1/menu.js" type="text/javascript" language="javascript"></script> 
</head>
<body>

<div id="m_nav">
   <div class="mn_tit"><div><h3><span>导航菜单</span></h3></div></div>
   <ul>
			<li>
			<a class="menu_0" onclick="ShowMenu('m1','mc_1')" id="m1">业务管理</a>		
				<dl class="sub_menu" id="mc_1">
					   <dd><a href="/channel" target="main">渠道商管理</a></dd>
					   <c:if test="${userInDb.get('role') eq 3 }">
	                   		<dd><a href="/game" target="main">游戏管理</a></dd>
	                   </c:if>
				</dl>
			</li>
		  
			<li>
			<a class="menu_0" onclick="ShowMenu('m2','mc_2')" id="m2">账单统计</a>		
			  <dl class="sub_menu" id="mc_2" style="display:none;">
				   <dd><a href="/bill" target="main">按天统计</a></dd>
			</dl>
			</li>
		  
			<li>
			<a class="menu_0" onclick="ShowMenu('m3','mc_3')" id="m3">游戏报表</a>		
			  <dl class="sub_menu" id="mc_3" style="display:none;">
			  	<dd><a href="/gamelist" target="main">报表查询</a></dd>
			  	<c:forEach items="${appList }" var="app">
				  <dd><a href="/gamelist?op=${app.get('appId') }" target="main">${app.get('name') }</a></dd>
			  	</c:forEach>
			</dl>
			</li>
		  
			<li>
			<a class="menu_0" onclick="ShowMenu('m4','mc_4')" id="m4">渠道后台</a>		
			  <dl class="sub_menu" id="mc_4" style="display:none;">
				   <dd><a href="/gamelist" target="main">按天统计</a></dd>
				   <dd><a href="/gamelist/monthly" target="main">按月统计</a></dd>
			</dl>
			</li>
		  
			<li>
			<a class="menu_0" onclick="ShowMenu('m5','mc_5')" id="m5">自我账户管理</a>		
			  <dl class="sub_menu" id="mc_5" style="display:none;">
				   <dd><a href="/admin/modifypwd.jsp" target="main">修改密码</a></dd>
				   <dd><a href="/admin/loginoff.jsp" target="main">安全退出</a></dd>
			</dl>
			</li>
   </ul>
</div>
</body>
</html>
