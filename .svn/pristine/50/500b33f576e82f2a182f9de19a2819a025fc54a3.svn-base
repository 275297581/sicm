  
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
		var k=1;
		function showjl(index){
			/* $.blockUI();*/  
			 var url ="/queryjl";
			 var Rand = Math.random();  
			 var param={index:index,Rand:Rand};
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
								"<td class='tab3'><input name='checkbox' class='oneCheck' type='checkbox' value='"+jl[i].zsid+"'></td>"+
								"<td class='tab3'>"+jl[i].xymc+"</td> "+
								"<td class='tab3'>"+jl[i].zymc+"</td> "+
								"<td class='tab3'>"+jl[i].zsmc+"</td> "+
								"<td class='tab3'>"+jl[i].fzjg+"</td>"+
								"<td class='tab3'>"+jl[i].zsdj+"</td> "+
								"<td class='tab3'>"+jl[i].zsfl+"</td> "+
								"<td class='tab3'>"+jl[i].jlbz+"</td> "+
								"<td class='tab3'>"+jl[i].xf+"</td> "+
								"<td class='tab3'><input type='image' src='/icon/modify.gif'  onmousedown='modifyjl("+jl[i].zsid+")' title='修改奖励'></td>"+
								"</tr>"; 
					}
			  		$("#trs").html(htmls); 
				stab(); 
			 }); 
		}
	function pagerselect(index){
		showjl(index); 
	}
	function modifyjl(id){
		swnidow(300,180,"/pages/jltj/modifyjl.jsp?id="+id); 
		showjl(1); 
	}
	
	function dosave(){
		var value = swnidow(1200,600,"/pages/jltj/savezyzs.jsp"); 
		if(value=="refresh"){
			window.location.reload();
		}
	}
	function doupdate(){
		var arry = [];
		$("input:checkbox:checked").each(function(){
			arry.push($(this).val());
		});
		if(arry.length>1){
			alert("只能选中一个修改！");
		}else if(arry.length==1){
			var id = $("input:checkbox:checked").attr('value');
			var value = swnidow(1200,600,'/pages/jltj/updatezyzs.jsp?id='+id);
			if(value == "refresh"){
				window.location.reload();
			}
			
		}else if(arry.length<1){
			alert("您没有选中项！");
		}
	}
	
	function deleteZsAll(){
		var checks = $('.oneCheck');
		var ids="";
		for(var i=0;i<checks.length;i++){ 
			if(checks[i].checked)
				ids +=checks[i].value+",";
		}
		if(ids==""){
			alert("您未选中任何记录！");
		}else{
			if(confirm("您确定要删除所选学生信息吗？")){
				deleteZs(ids.substring(0,ids.length-1));
			}
		} 
	}
	
	function deleteZs(zsids){
		var url ="/deletezyzs?zsids="+zsids;
		$.getJSON(url,{Rand:Math.random()},function(data){
		 	 	window.location.reload();
		 	 	alert(data.msg);
	 	 });
	}
	
	function checkAll(){
		 if ($("#quanxuan").attr("checked")) {  
		        $(":checkbox").attr("checked", true);  
		    } else {  
		        $(":checkbox").attr("checked", false);
		    }
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
			<td><span class="tf">奖励维护</span></td>
		</tr>
	</table>  
	<div style="text-align: right;">
		<input type="button" style="color: blue;font-weight: bold;display: none;" value="查询" title="查询证书信息" onmousedown="showStu(1);" class="w60">
 		<input type="button" style="color: blue;font-weight: bold;" value="新增" title="录入证书信息" onmousedown="dosave();" class="w60">
		<input type="button" style="color: blue;font-weight: bold;" value="修改" title="修改证书信息" onmousedown="doupdate();" class="w60">
		<input type="button" style="color: blue;font-weight: bold;" value="删除" title="删除证书信息" onmousedown="deleteZsAll();" class="w60">
	</div>
	<!-- 内容 --> 
	<div  class="wp100"> 
	 	 <table class="f13 tab wp100" id="tab" align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr> 
			<th class="tab2 w70">全选：<input id='quanxuan'  type='checkbox'  onclick="checkAll();" value="全选"></th>
			<th class="tab2">学院名称</th> 
			<th class="tab2">专业名称</th> 
			<th class="tab2">证书名称</th> 
			<th class="tab2">发证机构</th>
			<th class="tab2">证书等级</th>
			<th class="tab2">奖励证书分类</th> 
			<th class="tab2">奖励金额(元)</th> 
			<th class="tab2">获奖学分</th> 
			<th class="tab2">奖励标准修改</th>
			</tr> 
			<tbody id="trs">
			
			</tbody>
			</table> 
			<div id="pager"></div> 
	</div>
	
</body> 
</html>

 
 