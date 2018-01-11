<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 <script type="text/javascript" src="/js/pager.js"></script>
 <script type="text/javascript" src="/js/jquery.js"></script> 
    <script type="text/javascript">
	$(document).ready(function(){
		queryKd(1);
     });
     
     function queryKd(index){
    	var url ="";
     	var kdm = $('#kdm').val();
     	var param;
     	if(kdm!=""){
     		url="/showJdKd";
     		param = {kdm:kdm,index:index,Rand:Math.random()};
     	}else{
		 	url="/showJdKd";
		 	param = {index:index,Rand:Math.random()};
		}
		$.getJSON(url,param,function(data){
		 	if(index ==1){
				//显示分页导航  
				var pager =spager(data.count);
				pager.onclick = function(index){
					 pagerselect(index);
				};
			} 	
			var kdxxs = data.kdxxs; 
			var htmls="";
			for(var i = 0 ; i < kdxxs.length;i++){
				htmls +="<tr>"+
				"<td class='tab3'>"+(i+1)+"</td>"+
				"<td class='tab3'>"+kdxxs[i].kdm+"</td>"+
				"<td class='tab3'>"+kdxxs[i].fzjg+"</td>"+ 
				"<td class='tab3'>"+kdxxs[i].jlsj+"</td>"+ 
				"<td class='tab3'>"+(kdxxs[i].sqxm==null ? "" :kdxxs[i].sqxm)+"</td>"+ 
				"<td class='tab3'>"+(kdxxs[i].sqsx==null ? "" :kdxxs[i].sqsx)+"</td>"+ 
				"<td class='tab3'>"+(kdxxs[i].sqsj==null ? "" :kdxxs[i].sqsj)+"</td>"+ 
				"<td class='tab3'>"+kdxxs[i].zt+"</td>"+ 
				"<td class='tab3'><input type='image' src='/icon/detial.png'  title='"+kdxxs[i].bz+"'></td>"+ 
				"<td class='tab3'><input type='image' src='/icon/delete.gif'  title='删除' onmousedown='removejdkd("+kdxxs[i].jdkdid+")'>"+
				"&nbsp;&nbsp;<input type='image' src='/icon/modify.gif'  title='修改' onmousedown='modifyjdkd("+kdxxs[i].jdkdid+")'>"+
				"&nbsp;&nbsp;<input type='image' src='/icon/print.png'  title='打印预览' onmousedown='print("+kdxxs[i].jdkdid+")'></td>"+ 
				"</tr>"; 
			}
		  $('#trs').html(htmls);
		  stab();	
		}); 
	}
	 function pagerselect(index){
		queryKd(index);
	}
	 function modifyjdkd(id){
		var url ="/pages/jdpx/modifyjdkd.jsp?id="+id;
	 	swnidow(350,320,url);
		queryKd(1);
	}
	 function removejdkd(id){
	 	if(!window.confirm("确定要删除该鉴定考点吗？")){
	 		return;
	 	}
	   var url ="/deletejdkd?id="+id;
	 	var param = {id:id,Rand:Math.random()};
		$.getJSON(url,param,function(data){
 			queryKd(1);
			alert(data.mess);	
		}); 
	}
	function print(id){
		var url ="/pages/jdpx/printkd.jsp?id="+id;
	 	swnidow(735,800,url);
	} 
</script>
  </head>
  
  <body> 
	<!-- 头部 -->
	<table width="100%" border="0" bgcolor="#353c44" align="center"
		cellpadding="0" cellspacing="0">
		<tr>
			<td height="24" width="35">
			<span class="ml10"><img src="/pages/images/tb.gif" width="14" height="14" />
			</span>
			</td>
			<td><span class="tf">鉴定机构管理</span></td>
		</tr>
	</table> 
	 <div align="center">
	 	 <table  class="f13 tab wp100"  align="center" bordercolor="#D0D0D0" border="1px" >
	 	 <tr class="h30">
	 	 	 <td class="dt1  w100">鉴定考点名称</td>
	 	 	 <td class="dt2 w200"><input type="text" id="kdm" class="w150"> </td>
 	 		<td class="dt2"><input type="button" style="color: blue;font-weight: bold;" value="查询" title="通过考点名称模糊查询鉴定培训考点" onmousedown="queryKd(1);" class="w60">
	 	 	</td>
	 	 </table>
 	</div>
 	<div  class="wp100"> 
	 	 <table class="f13 tab wp100" id="tab" align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr > 
			<th class="tab2 w50">序号</th>
			<th class="tab2">鉴定考点名称</th>
			<th class="tab2">管理机构</th> 
			<th class="tab2">建立时间</th> 
			<th class="tab2">授权项目</th>
			<th class="tab2">授权事项</th>
			<th class="tab2">授权期限</th>
			<th class="tab2">状态</th>
			<th class="tab2">备注</th>
			<th class="tab2">操作</th>  
			</tr>
			<tbody id="trs">
				
			</tbody>
			</table> 
			<div id="pager"></div> 
	</div> 
</body>
</html>