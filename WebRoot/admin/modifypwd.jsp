<%@ page language="java" pageEncoding="gbk"%><html:errors /><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>内容</title>
    <link href="css/login.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/js/ajax.js"></script>
	<SCRIPT language=JavaScript>
	function sub(){
		if($("oldpwd").value==""){
			alert("请输入旧密码");
			$("oldpwd").focus();
			return false;
		}
		if($("password").value==""){
			alert("请输入新密码");
			$("password").focus();
			return false;
		}
		if($("repasswd").value==""){
			alert("请再次输入新密码");
			$("repasswd").focus();
			return false;
		}else if($("password").value!=$("repasswd").value){
			alert("两次输入密码不同，请重新输入");
			$("password").focus();
			return false;
		}
	}
	</SCRIPT>
</head>
<body>

<div id="main_box">
    <div class="mer_cont">
        <div class="location">
           <p>当前位置：<a href="#">个人信息</a> > 修改密码</p>
        </div>
<form action="/login/update" method="post" name="userForm" onsubmit="return sub()">    
        <table cellpadding="0" cellspacing="0" class="Table_tb" >
           <tr>
              <th colspan="2"><h2>修改密码</h2></th>
           </tr>
           <tr>
              <td class="td_tit">输入原密码：</td><td><input type="password" name="oldpwd"  size="20" />*</td>
           </tr>
           <tr>
              <td class="td_tit">输入新密码：</td><td><input type=password name=password>* </td>
           </tr>
           <tr>
              <td class="td_tit">输入新密码：</td><td><input type=password name=repasswd>* </td>
           </tr>
           <tr>
              <td class="td_tit">&nbsp;</td><td><input type="submit" value="提 交" class="btn1"/><input type="reset" class="btn2" value="取 消" /></td>
           </tr>
        </table>
 </form>       

    </div>
</div>

</body>
</html>
