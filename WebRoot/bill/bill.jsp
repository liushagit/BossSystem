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
<script type="text/javascript" src="/admin/js/date/WdatePicker.js"></script>
</head>
<body>
	<div class="form-div">
		<div class="manage_head">
		</div>
		<div class="main">
<h1>账单统计&nbsp;&nbsp;
</h1>
<tr>
  							<%
								//当前时间
							   java.util.Date now = new java.util.Date();
							   java.util.Date tomorrow =  new java.util.Date(now.getTime()+1000*60*60*24);

							   String sdf1 = "",sdf2 = "";
							   sdf1 = request.getParameter("sdate");
							   sdf2 = request.getParameter("edate");
							   if(sdf1 == null)
							   sdf1 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(now);
							   if(sdf2 == null)
							   sdf2=new java.text.SimpleDateFormat("yyyy-MM-dd").format(tomorrow);
						   %>

<form action="/bill/index" method="post">

    开始日期&nbsp;
    <input class="Wdate" name="sdate" style="width: 100px;height:20px;" value="${tbegin }" type="text" id="d15" onFocus="WdatePicker({isShowClear:false,readOnly:true})"/> 
    结束日期&nbsp;
    <input class="Wdate" name="edate" style="width: 100px;height:20px;" value="${tend }" type="text" id="d15" onFocus="WdatePicker({isShowClear:false,readOnly:true})"/>

	<input type="submit" name="submit" value="查询" class="button" />

</form>

</tr>


<div class="list-div">
	<table class="list">
		<tbody>
			<tr>
				<th width="35%">日期</th>
				<th width="35%">总收入</th>
			</tr>
			<c:forEach items="${billList}" var="bill">
			<tr>
				<td style="text-align:left;">${bill.day}</td>
				<td style="text-align:left;">${bill.fee}</td>
			</tr>
			</c:forEach>
			
			
			
	<c:if test="${empty billList}">
      <tr><td class="no-records" colspan="10">没有找到任何记录</td></tr>
	</c:if>
	
    <TR>
    <TD noWrap align=right colSpan=10>
      <DIV id=turn-page>
      	<table id=paginate border=0 width=90% align=center class=font1 cellPadding=0 cellSpacing=0>
		<tr>
                        <td width="20%">
						共${pages.totalRow }条记录 当前第${pages.pageNumber}页
                        </td>
                        <td width="80%" align=right vAlign="center" noWrap><a
                            href="/bill?sdate=${tbegin }&edate=${tend }">首页</a>
                            <c:if test="${pages.pageNumber ne 1 }">
                            <a href="/bill/${pages.pageNumber - 1 }?sdate=${tbegin }&edate=${tend }">上一页</a>
                            </c:if>
                            <c:forEach begin="${begin }"
                                end="${end }" step="1" var="i">
                                <c:if test="${pages.pageNumber eq i }">
                                    <a><font color="red">${i }</font></a>
                                </c:if>
                                <c:if test="${pages.pageNumber ne i }">
                                    <a href="/bill/${i }?sdate=${tbegin }&edate=${tend }">${i }</a>
                                </c:if>
                            </c:forEach>
                            <c:if test="${pages.pageNumber ne pages.totalPage }">
 							<a href="/bill/${pages.pageNumber +1}?sdate=${tbegin }&edate=${tend }">下一页</a>
                            </c:if>
                             <a href="/bill/${pages.totalPage }?sdate=${tbegin }&edate=${tend }">尾页</a>
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
	
<DIV id=footer>
统计说明：
1.以上统计数据仅供参考，以移动、联通、电信结算数据为准
2.统计数据截止时间为一天前
</DIV>
	
</body>
</html>


























