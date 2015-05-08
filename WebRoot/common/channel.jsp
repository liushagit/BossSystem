<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="zh-CN" xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">


<head>
    <title>管理后台</title>
    <link href="/admin/css/login.css" rel="stylesheet" type="text/css" />
</head>



  <frameset rows="70,*" frameborder="no" border="0" framespacing="0" > 
     <frame src="/login/top.jsp"  border="0"   name="top" scrolling="no" >
     <frameset cols="160,*">
    	 <frame name="nav" src="/admin/text_channel.jsp" scrolling="auto"  border="0" frameborder="no" target="_self" >
         <frame name="main" src="main.htm" scrolling="yes" frameborder="no" style="overflow-x:hidden;">
     </frameset>
  </frameset>  


<body>








<div id="m_nav">
   <div class="mn_tit"><div><h3><span>导航菜单</span></h3></div></div>
   <ul>
   
	         
		  
			<li>
			<a class="menu_0" onclick="ShowMenu('m1','mc_1')" id="m1">系统管理</a>		
			  
			  <dl class="sub_menu" id="mc_1" >
			  
			  
			   
				     
				   <dd><a href="/admin/user.do?op=users" target="main">用户管理</a></dd>
				   
			   
				     
				   <dd><a href="/admin/group.do?op=groups" target="main">用户组</a></dd>
				   
			   
				     
				   <dd><a href="/admin/func.do?op=funcs" target="main">模块管理</a></dd>
				   
			   
				     
				   <dd><a href="/admin/opnote.do?op=notes" target="main">日志管理</a></dd>
				   
			   
			</dl>
			</li>
		 		    
		      
		  
			<li>
			<a class="menu_0" onclick="ShowMenu('m2','mc_2')" id="m2">业务管理</a>		
			  
			  
			  <dl class="sub_menu" id="mc_2" style="display:none;">
			  
			   
				     
				   <dd><a href="/admin/spinfo.do?op=spinfolist" target="main">SP信息管理</a></dd>
				   
			   
				     
				   <dd><a href="/admin/spinfo.do?op=spbizlist" target="main">SP业务管理</a></dd>
				   
			   
			</dl>
			</li>
		 		    
		      
		  
			<li>
			<a class="menu_0" onclick="ShowMenu('m3','mc_3')" id="m3">合作方管理</a>		
			  
			  
			  <dl class="sub_menu" id="mc_3" style="display:none;">
			  
			   
				     
				   <dd><a href="/admin/wapurl.do?op=wapurls" target="main">wap地址管理</a></dd>
				   
			   
				     
				   <dd><a href="/admin/co/addfee.jsp" target="main">计费管理</a></dd>
				   
			   
				     
				   <dd><a href="/admin/sp.do?op=sps" target="main">SP管理</a></dd>
				   
			   
			</dl>
			</li>
		 		    
		      
		  
			<li>
			<a class="menu_0" onclick="ShowMenu('m4','mc_4')" id="m4">计费管理</a>		
			  
			  
			  <dl class="sub_menu" id="mc_4" style="display:none;">
			  
			   
				     
				   <dd><a href="/admin/cofee.do?op=admindayfee" target="main">按天统计</a></dd>
				   
			   
				     
				   <dd><a href="/admin/cofee.do?op=adminmonthfee" target="main">按月统计</a></dd>
				   
			   
			</dl>
			</li>
		 		    
		      
		  
			<li>
			<a class="menu_0" onclick="ShowMenu('m5','mc_5')" id="m5">信息管理</a>		
			  
			  
			  <dl class="sub_menu" id="mc_5" style="display:none;">
			  
			   
				     
				   <dd><a href="/admin/sys/querymo.jsp" target="main">上行查询</a></dd>
				   
			   
				     
				   <dd><a href="/admin/sys/queryfee.jsp" target="main">收入查询</a></dd>
				   
			   
			</dl>
			</li>
		 		    
		      
		  
			<li>
			<a class="menu_0" onclick="ShowMenu('m6','mc_6')" id="m6">合作方后台</a>		
			  
			  
			  <dl class="sub_menu" id="mc_6" style="display:none;">
			  
			   
				     
				   <dd><a href="/admin/co/queryfee.jsp" target="main">按天统计</a></dd>
				   
			   
				     
				   <dd><a href="/admin/co/querymonthfee.jsp" target="main">按月统计</a></dd>
				   
			   
			</dl>
			</li>
		 		    
		      
		  
			<li>
			<a class="menu_0" onclick="ShowMenu('m7','mc_7')" id="m7">CP合作后台</a>		
			  
			  
			  <dl class="sub_menu" id="mc_7" style="display:none;">
			  
			   
				     
				   <dd><a href="/admin/cp/querymo.jsp" target="main">上行查询</a></dd>
				   
			   
				     
				   <dd><a href="/admin/cp/queryfee.jsp" target="main">收入查询</a></dd>
				   
			   
			</dl>
			</li>
		 		    
		      
		  
			<li>
			<a class="menu_0" onclick="ShowMenu('m8','mc_8')" id="m8">自我账户管理</a>		
			  
			  
			  <dl class="sub_menu" id="mc_8" style="display:none;">
			  
			   
				     
				   <dd><a href="/admin/modifypwd.jsp" target="main">修改密码</a></dd>
				   
			   
				     
				   <dd><a href="/admin/loginoff.jsp" target="main">安全退出</a></dd>
				   
			   
			</dl>
			</li>
		 		    
		   
    
	
   </ul>
</div>
	
	
	
<noframes></noframes>
	
	
	
	
	
	
	
	
</body>

</html>
