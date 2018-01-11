  
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
 <link  rel="stylesheet" type="text/css" href="/css/all.css" /> 
 <script type="text/javascript" src="/js/pager.js"></script>
 <script type="text/javascript" src="/js/jquery.js"></script> 
 <!--<script type="text/javascript" src="/js/bui.js"></script>--> 
 <script type="text/javascript">  
	$(document).ready(function () { 
	 		 showjl(1);
		}); 
		function showjl(index){
			/* $.blockUI();*/ 
			 var url ="/queryjl";
			 var param = {index:index,Rand:Math.random()};
			 $.getJSON(url,param,function(data){ 
			 	  /* $.unblockUI();*/
		 	   	  if(index ==1){
						//显示分页导航  
						var pager =spager(data.count); 
						pager.onclick = function(index){
							 pagerselect(index);
						};
					}
		 	 	var jl =data.zyzs;
				var htmls="";
				for(var i = 0 ; i < jl.length;i++){
					htmls+="<tr>"+  
						"<td class='tab3'>"+(i+1)+"</td>"+
						"<td class='tab3'>"+jl[i].xymc+"</td> "+
						"<td class='tab3'>"+jl[i].zymc+"</td> "+
						"<td class='tab3'>"+jl[i].zsmc+"</td> "+
						"<td class='tab3'>"+jl[i].fzjg+"</td>"+
						"<td class='tab3'>"+jl[i].zsdj+"</td> "+
						"<td class='tab3'>"+jl[i].zsfl+"</td> "+
						"</tr>"; 
				}
		  		$("#trs").html(htmls); 
			stab(); 
		 }); 
		}
	function pagerselect(index){
		showjl(index); 
	} 
	</script>
</head>
<body> 
	<table width="100%" border="0" bgcolor="#353c44" align="center"
		cellpadding="0" cellspacing="0">
		<tr>
			<td height="24" width="35"><span class="ml10"><img
					src="/pages/images/tb.gif" width="14" height="14" />
			</span>
			</td>
			<td><span class="tf">证书种类</span></td>
		</tr>
	</table>  
	<!-- 内容 --> 
	<div  class="wp100"> 
	 	 <table class="f13 tab wp100" id="tab" align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr> 
			<th class="tab2 w50">序号</th>
			<th class="tab2">学院名称</th>
			<th class="tab2">专业名称</th>
			<th class="tab2">证书名称</th> 
			<th class="tab2">发证机构</th>
			<th class="tab2">证书等级</th>
			<th class="tab2">奖励证书分类</th>
			</tr> 
			<tbody id="trs">
			
			</tbody>
			</table> 
			<div id="pager"></div> 
	</div> 
</body> 
</html> 