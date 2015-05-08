<%@ page language="java" pageEncoding="utf-8"%>
<Script >
if(true){
	<%	
	session.invalidate();
	%>
	document.location.href="/";
}else{
	history.go(-1);
}
</Script>

