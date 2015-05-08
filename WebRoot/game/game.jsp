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
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/admin/js/transport.js"></script>
<script type="text/javascript" src="/admin/js/common.js"></script>
</head>
<body>
	<div class="manage_container">
		<div class="manage_head">
		</div>
		<div class="main">
<h1>游戏管理&nbsp;&nbsp;
<a href="/game/add">增加游戏</a>
</h1>
<div class="list-div">
	<table class="boss_table">
		<tbody>
			<tr>
				<th width="5%">序号</th>
				<th width="19%">appId</th>
				<th width="19%">游戏名称</th>
				<th width="19%">描述</th>
				<th width="19%">游戏状态（控制游戏报表菜单栏的显示）</th>
				<th width="19%">操作</th>
			</tr>
			<c:forEach items="${gameList}" var="game" varStatus="s">
			<tr>
				<td style="text-align:left;"><c:out value="${s.index + 1}" default=""/></td>
				<td style="text-align:left;">${game.appId}</td>
				<td style="text-align:left;">${game.name}</td>
				<td style="text-align:left;">${game.memo}</td>
				<td style="text-align:left;">
					<select class="boss_color_red" disabled="disabled">
						<option value="1" <c:if test="${game.isOpen eq 1}">selected</c:if>>上线</option>
						<option value="0" <c:if test="${game.isOpen eq 0}">selected</c:if>>下线</option>
					</select>
				</td>
				<td style="text-align:left;">
					&nbsp;&nbsp;<a href="/game/edit/${game.id}">修改</a>
				</td>
			</tr>
			</c:forEach>
			
			
				<c:if test="${empty gameList}">
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
                            href="/game">首页</a>
                            <c:if test="${pages.pageNumber ne 1 }">
                            <a href="/game/${pages.pageNumber - 1 }">上一页</a>
                            </c:if>
                            <c:forEach begin="${begin }"
                                end="${end }" step="1" var="i">
                                <c:if test="${pages.pageNumber eq i }">
                                    <a><font color="red">${i }</font></a>
                                </c:if>
                                <c:if test="${pages.pageNumber ne i }">
                                    <a href="/game/${i }">${i }</a>
                                </c:if>
                            </c:forEach>
                            <c:if test="${pages.pageNumber ne pages.totalPage }">
 							<a href="/game/${pages.pageNumber +1}">下一页</a>
                            </c:if>
                             <a href="/game/${pages.totalPage }">尾页</a>
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