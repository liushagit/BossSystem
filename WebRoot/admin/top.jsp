<%@ page language="java" pageEncoding="gbk"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><link href="/admin/css/login.css" rel="stylesheet" type="text/css" />
<div id="top">
  <div class="logo"><img src="images/logo2.gif" /></div>
  <div class="t_r">
     <p>��ӭ����<b>${sessionScope.login.user}</b>&nbsp;&nbsp;&nbsp;  <a href="#">����</a> | <a href="/admin/loginoff.jsp" class="c_yellow" target="_parent">�˳�</a></p>
  </div>
  <div class="top_bar">
    <ul>
      
      <li><a href="#" >��ӭ����${sessionScope.user.usrname}</a></li>
      <li><a href="/admin/modifypwd.jsp" target="main">�޸�����</a></li>
      <li><a href="/admin/loginoff.jsp" target="_parent">��ȫ�˳�</a></li>
    </ul>
  </div>
</div>