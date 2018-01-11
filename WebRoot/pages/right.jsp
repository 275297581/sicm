 
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <link  rel="stylesheet" type="text/css" href="/css/notice.css" />
 <script type="text/javascript" src="/js/jquery.js"></script>
 <script type="text/javascript" src="/js/pager.js"></script>
 <!--<script type="text/javascript" src="/js/bui.js"></script>-->
 <script type="text/javascript"> 
	$(document).ready(function () { 
	 	shownotices(1); 
	}); 
	function shownotices(index){
		/* $.blockUI();*/
		var url="/showAllNotice";
		var param ={index:index,Rand:Math.random()};
		$.getJSON(url,param,function(data){
		 	/* $.unblockUI();*/
		 	if(index ==1){
				//显示分页导航  
				var pager =spager(data.count);
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
		swnidow(1000,700,'/public/noticeshow.jsp?val='+nid);
	}
</script>
</head>
<body > 
	<!-- <table width="100%" border="0" bgcolor="#353c44" align="center"
		cellpadding="0" cellspacing="0">
		<tr>
			<td height="24" width="35"><span class="ml10"><img
					src="/pages/images/tb.gif" width="14" height="14" />
			</span>
			</td>
			<td><span class="tf">公告通知</span></td>
		</tr>
	</table> 
	<table class="mt20 md20 ml30 mr10 wp90 f13" id="tab">
		 
	</table>
	<div id="pager"></div>  -->
</body> 
</html>

 
