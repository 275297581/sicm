 
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head> 
 <title>学生技能资格证书管理系统-公告通知</title>
 <link  rel="stylesheet" type="text/css" href="/css/all.css" /> 
 <link rel="stylesheet" href="/css/notice.css" type="text/css"></link>
 <script type="text/javascript" src="/js/jquery.js"></script>
 <script type="text/javascript" src="/js/pager.js"></script> 
 <!--<script type="text/javascript" src="/js/bui.js"></script>--> 
 <script type="text/javascript"> 
	$(document).ready(function () { 
	 	shownotices(1); 
	}); 
	function shownotices(index){
		/* $.blockUI();*/
		var url="/pub_showAllNotice?index="+index;
		$.getJSON(url,{Rand:Math.random()},function(data){ 
		 	 /* $.unblockUI();*/
	 	 	 if(index ==1){
				//显示分页导航  
				var pager =spager(data.count);
				//alert(data.count);
				pager.onclick = function(index){
					 pagerselect(index);
				};
			}
			var ns = data.notices;
			var htmls="";
				for(var i = 0 ; i < ns.length;i++){
					htmls+="<tr>"+   
							"<td class='w30 cd' align='center'>●</td>"+
							"<td> <a href='javascript:showdetial("+ns[i].id+");' >"+ns[i].title+"</a></td>"+
							"<td class='100' align='center'>"+ns[i].ptime+"</td>"+
							"</tr>"; 
				} 
		  		$("#tab").html(htmls); 
		});  
	}
	function pagerselect(index){
		shownotices(index);
	}
	
	function showdetial(nid){
		swnidow(800,500,'/public/noticeshow.jsp?val='+nid);
	}
</script>
</head>
<body class="cw">  
	<table class="mt20 md20 ml30 mr10 wp90 f13" id="tab">  
	</table>
	<div id="pager"></div> 
</body> 
</html>

 
