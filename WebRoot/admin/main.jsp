<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" pageEncoding="gbk"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>管理后台</title>
    <link href="/admin/css/login.css" rel="stylesheet" type="text/css" />
</head>
<c:if test="${empty sessionScope.user}">
	<jsp:forward page="/admin/" />
</c:if>
  <frameset rows="70,*" frameborder="no" border="0" framespacing="0" > 
     <frame src="/admin/top.jsp"  border="0"   name="top" scrolling="no" >
     <frameset cols="160,*">
         <frame name="nav" src="/admin/groupfunc.do?op=menu" scrolling="auto"  border="0" frameborder="no" target="_self" >
         <frame name="main" src="main.htm" scrolling="yes" frameborder="no" style="overflow-x:hidden;">
     </frameset>
  </frameset>  
<body>  
  <noframes></noframes>
</body>
</html>

