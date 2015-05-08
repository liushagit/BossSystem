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
<script type="text/javascript" src="/admin/js/transport.js"></script>
<script type="text/javascript" src="/admin/js/common.js"></script>
</head>
<body>
	<div class="manage_container">
		<div class="manage_head">
<!-- 
			<div id="nav">
				<ul>
					<li><a href="/"><b>首页</b></a></li>
					<li><a href="/game"><b>游戏管理</b></a></li>
				</ul>
			</div>
 -->
		</div>
		<div class="main">
<form action="/channel/index" method="post">
<h1>渠道管理&nbsp;&nbsp;
<a href="/channel/add">增加渠道</a>
&nbsp;&nbsp;&nbsp;&nbsp;搜索
<input type="text" name="query" value="${query }" />
<input type="submit" name="submit" value="查询" class="button" />
</h1>
</form>
<div class="list-div">
	<table class="list">
		<tbody>
			<tr>
				<th width="4%">id</th>
				<th width="12%">渠道商ID</th>
				<th width="12%">渠道商名称</th>
				<th width="12%">创建日期</th>
				<th width="12%">更新日期</th>
				<th width="12%">操作</th>
			</tr>
			<c:forEach items="${channelList}" var="channel">
			<tr>
				<td style="text-align:left;"><c:out value="${channel.id}" default=""/></td>
				<td style="text-align:left;">${channel.name}</td>
				<td style="text-align:left;">${channel.memo}</td>
				<td style="text-align:left;">${channel.create_time}</td>
				<td style="text-align:left;">${channel.update_time}</td>
				<td style="text-align:left;">
					&nbsp;&nbsp;<a href="/channel/delete/${channel.id}">删除</a>
					&nbsp;&nbsp;<a href="/channel/edit/${channel.id}">修改</a>
				</td>
			</tr>
			</c:forEach>
			
			
			
			
	<c:if test="${empty channelList}">
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
                            href="/channel?query=${query}">首页</a>
                            <c:if test="${pages.pageNumber ne 1 }">
                            <a href="/channel/${pages.pageNumber - 1 }?query=${query}">上一页</a>
                            </c:if>
                            <c:forEach begin="${begin }"
                                end="${end }" step="1" var="i">
                                <c:if test="${pages.pageNumber eq i }">
                                    <a><font color="red">${i }</font></a>
                                </c:if>
                                <c:if test="${pages.pageNumber ne i }">
                                    <a href="/channel/${i }?query=${query}">${i }</a>
                                </c:if>
                            </c:forEach>
                            <c:if test="${pages.pageNumber ne pages.totalPage }">
 							<a href="/channel/${pages.pageNumber +1}?query=${query}">下一页</a>
                            </c:if>
                             <a href="/channel/${pages.totalPage }?query=${query}">尾页</a>
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
</body>
</html>