<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="zh-CN" xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<!-- 
<link href="/css/manage.css" media="screen" rel="stylesheet" type="text/css" />
<script src="/js/jquery-1.4.4.min.js" type="text/javascript" ></script>
 -->
 
<link href="/admin/css/general.css" rel="stylesheet" type="text/css" />
<link href="/admin/css/main.css" rel="stylesheet" type="text/css" />

<script src="/js/jquery-1.4.4.min.js" type="text/javascript" ></script>
<script type="text/javascript">
var total_initCount = 0;
var total_payCount = 0;
var total_totalFee = 0;
var total_arpu = 0;
var total_perFee = 0;
$(document).ready(function(){
	$("._initCount").each(function(){
		total_initCount += parseInt($(this).text());
	});
	$("._payCount").each(function(){
		total_payCount += parseInt($(this).text());
	});
	$("._totalFee").each(function(){
		total_totalFee += parseInt($(this).text());
	});
	$("._arpu").each(function(){
		total_arpu += parseInt(parseFloat($(this).text())*100);
	});
	$("._perFee").each(function(){
		total_perFee += parseInt(parseFloat($(this).text())*100);
	});
	$("#total_initCount").text(total_initCount);
	$("#total_payCount").text(total_payCount);
	$("#total_totalFee").text(total_totalFee);
	/* $("#total_arpu").text(total_arpu/100);
	$("#total_perFee").text(total_perFee/100); */
	total_arpu = total_totalFee/total_initCount;
	total_perFee = total_payCount/total_initCount;
	$("#total_arpu").text(total_arpu.toFixed(2));
	$("#total_perFee").text(total_perFee.toFixed(2));
});

function exp2(){
	startDate = $("[name='startDate']").val();
	endDate = $("[name='endDate']").val();
	channel = $("[name='channel']").val();
	clquery = $("[name='clquery']").val();
	appId = $("[name='appId']").val();
	window.location.href="/gamelist/exportExcel1?startDate="+startDate+"&endDate="+endDate+"&appId="+appId+"&clquery="+clquery+"&channel="+channel+"";
}
</script>
<script type="text/javascript" src="/admin/js/date/WdatePicker.js"></script>
</head>
<body>
	<div class="manage_container">
		<div class="manage_head">
		<div class="main">
<h1>游戏报表&nbsp;&nbsp;
</h1>

	<div class="form-div">
	<!-- 
<%
	//当前时间
	java.util.Date now = new java.util.Date();
   	java.util.Date tomorrow =  new java.util.Date(now.getTime()+1000*60*60*24);

   	String sdf1 = "",sdf2 = "";
   	sdf1 = request.getParameter("startDate");
   	sdf2 = request.getParameter("endDate");
 %>
  -->

<form action="/gamelist/monthly" method="post">
    开始日期&nbsp;
    <input class="Wdate" name="startDate" style="width: 100px;height:20px;" value="${defaultStart }" type="text" id="d15" onFocus="WdatePicker({isShowClear:false,readOnly:true})"/> 
    结束日期&nbsp;
    <input class="Wdate" name="endDate" style="width: 100px;height:20px;" value="${defaultEnd }" type="text" id="d15" onFocus="WdatePicker({isShowClear:false,readOnly:true})"/>
    
    <input type="hidden" name="op" value="${op}" />
    <%--  <c:if test="${4 eq role}"> --%>
   渠道商ID
 	<select name="channel">
 	<option value="">-请选择-</option>
 		<c:forEach items="${channelList}" var="channel">
 		<option value="${channel.name }" <c:if test="${channel.name eq channeled}">selected</c:if>>${channel.name }</option>
 		</c:forEach>
    </select>
	<%--  </c:if> --%>
 
<c:if test="${3 eq role}">
 渠道商ID(模糊)
 	<input name="clquery" style="width: 100px;height:20px;" value="" />
	</c:if>
 
 游戏名称
	<select name="appId" value=${appId }>
    <option value="">-请选择-</option>
    <c:forEach items="${apps }" var="app">
 		<option value="${app.app_id }" <c:if test="${app.app_id eq appId}">selected</c:if>>${app.name }</option>
 	</c:forEach>
 	</select>

	<input type="submit" name="submit" value="查询" class="button" />&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" name="exp" value="生成Excel" onclick="exp2()" />
</form>
</div>


<div class="list-div">
	<table class="list">
		<tbody>
			<tr>
				<th width="12%">日期</th>
				<th width="12%">游戏</th>
				<th width="12%">渠道</th>
				<th width="12%">安装用户</th>
				<th width="12%">付费用户</th>
				<th width="12%">总计费金额(单位:元)</th>
				<th width="12%">人均付费(单位:元)</th>
				<th width="12%">付费转化率</th>
			</tr>
			<c:forEach items="${gamelistList}" var="gamelist">
			<tr>
				<td style="text-align:left;">${gamelist.day}</td>
				<td style="text-align:left;">${gamelist.appName}</td>
				<td style="text-align:left;">${gamelist.channelName}</td>
				<td class="_initCount" style="text-align:left;">${gamelist.initCount}</td>
				<td class="_payCount" style="text-align:left;">${gamelist.payCount}</td>
				<td class="_totalFee" style="text-align:left;">${gamelist.totalFee}</td>
				<td class="_arpu" style="text-align:left;">${gamelist.arpu}</td>
				<td class="_perFee" style="text-align:left;">${gamelist.perFee}</td>
			</tr>
			</c:forEach>
			<tr>
				<td align="center" colspan="3">总计</td>
				<td id="total_initCount" align="left" style="color: red;"></td>
				<td id="total_payCount" align="left" style="color: red;"></td>
				<td id="total_totalFee" align="left" style="color: red;"></td>
				<td id="total_arpu" align="left" style="color: red;"></td>
				<td id="total_perFee" align="left" style="color: red;"></td>
			</tr>
	<c:if test="${empty gamelistList}">
      <tr><td class="no-records" colspan="10">没有找到任何记录</td></tr>
	</c:if>
	
    <TR>
    <TD noWrap align=right colSpan=10>
      <DIV id=turn-page>
      	<table id=paginate border=0 width=90% align=center class=font1 cellPadding=0 cellSpacing=0>
		<tr>
                    <!-- 左边用来显示分页的总参数-->
                        <td width="20%">
						共${pages.totalRow }条记录 当前第${pages.pageNumber}页
                        </td>
                            <!-- 首页 -->
                        <td width="80%" align=right vAlign="center" noWrap><a
                            href="/gamelist/monthly?startDate=${defaultStart }&endDate=${defaultEnd }&appId=${appId}&channel=${channeled }">首页</a>
                            <!-- 判断是不是第一页决定是否显示前一页标签 -->
                            <c:if test="${pages.pageNumber ne 1 }">
                            <a href="/gamelist/monthly/${pages.pageNumber - 1 }?startDate=${defaultStart }&endDate=${defaultEnd }&appId=${appId}&channel=${channeled }">上一页</a>
                            </c:if>
                            <!-- 从action中获取分页页码下表的开始和结束下标 -->
                            <c:forEach begin="${begin }"
                                end="${end }" step="1" var="i">
                                <c:if test="${pages.pageNumber eq i }">
                                    <a><font color="red">${i }</font></a>
                                </c:if>
                                <c:if test="${pages.pageNumber ne i }">
                                    <a href="/gamelist/monthly/${i }?startDate=${defaultStart }&endDate=${defaultEnd }&appId=${appId}&channel=${channeled }">${i }</a>
                                </c:if>
                            </c:forEach>
                            <!-- 判断是不是最后一页，决定是否显示后一页下标-->
                            <c:if test="${pages.pageNumber ne pages.totalPage }">
							<!-- 昨天没有测试出来，应该是pageNumber而不是totalPage-->
 							<a href="/gamelist/monthly/${pages.pageNumber +1}?startDate=${defaultStart }&endDate=${defaultEnd }&appId=${appId}&channel=${channeled }">下一页</a>
 							<!-- 
 							(<%=sdf1%>==null?startDate=${defaultStart}:startDate=<%=sdf1%>)&(<%=sdf2%>==null?endDate=${defaultEnd}:endDate=<%=sdf2%>)
 							 -->
                            </c:if>
                            <!-- 显示尾页下标 -->
                             <a href="/gamelist/monthly/${pages.totalPage }?startDate=${defaultStart }&endDate=${defaultEnd }&appId=${appId}&channel=${channeled }">尾页</a>
                    </td>
                    </tr>
		</table>   
      </DIV></TD>    
     </TR>     
			
		</tbody>
	
	</table>
</div>
		</div>
	</div>
	</div>
</body>
</html>