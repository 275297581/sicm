 
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
	<title>公告详细信息</title>
<%
  		String id =request.getParameter("val");
  	 %>
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
<script language="javascript" type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/pages/ggtz/plugins/jwplayer/jwplayer.js"></script>
 <script language="javascript" type="text/javascript"> 
	$(document).ready(function () { 
	
	 	getnotice();
	}); 
	function getnotice(){
	
		var param={nid:<%=id %>,Rand:Math.random()};
		var url="/pub_showDetilNotice"; 
		$.getJSON(url,param,function(data){ 
		
			var n = data.notice;
			 $('#title').html(n.title);
			 $('#time').html(n.ptime);
			 $('#dep').html(n.bm);
			 $('#content').html(n.content);
			 
			//alert(document.getElementById('player').getAttribute('autostart')+"内容："+n.content);
		    //alert("ok");
		    jwplayer("player").setup({
        	file: document.getElementById("player").getAttribute("src"),
        	image: document.getElementById("player").getAttribute("src"),
   			autostart: document.getElementById("player").getAttribute("autostart")
    		});
		
		}); 
		//alert(document.getElementById('player')+"内容："+n.content);
	}
</script>
</head>
<body class="ccont"> 
	 <div align="center" class="mt20">
	 	 <div id="title" style="font-size: 20;font-weight: bold;"></div> 
	 	<div style="font-size: 12;" class="mt10"> 发布时间：<span id="time"></span> &nbsp;&nbsp; 发布部门：<span id="dep"></span></div>
	 </div>
	  <table class=" wp90 mt10" align="center">
	  <tr>
	  <td> 
	  	<div  id="content" style="background-color: white;">
	  	</div>
	 </td></tr>
	 </table>
</body> 
</html>

 
