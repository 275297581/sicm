<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 <script type="text/javascript" src="/js/pager.js"></script>
 <script type="text/javascript" src="/js/jquery.js"></script> 
 <!--<script type="text/javascript" src="/js/bui.js"></script>--> 
 <script language="javascript" type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		queryKd(1);
     });
     function queryKd(index){
     	/* $.blockUI();*/
		var url="/queryJdKd";
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
				"</tr>"; 
			}
		  $('#trs').html(htmls); 
		  stab();	
		}); 
	}
	 function apply(){
	 	var kdm = $('#k1').val();
	 	if(kdm==""){
	 		alert("考点名称不能为空！");
	 		return;
	 	}
	 	var jg = $('#k2').val();
	 	if(jg==""){
	 		alert("管理机构不能为空！");
	 		return;
	 	}
	 	var xm = $('#k3').val();
	 	var sx = $('#k4').val();
	 	var bz = $('#k5').val();
	 	var qx = $('#k6').val();
	 	var param ={kdm:kdm,jg:jg,bz:bz,xm:xm,sx:sx,qx:qx,Rand:Math.random()};
	 	var url ="/addjdkd";
	 	$.post(url,param,function(data){
 			queryKd(1);
			alert(data.mess);
		});
	 }
	 
	 function pagerselect(index){
		queryKd(index);
	}
	 function removejdkd(id){
	 	if(!window.confirm("确定要删除该鉴定考点吗？")){
	 		return;
	 	}
	   var url ="/deletejdkd";
	 	 var param = {id:id,Rand:Math.random()};
		$.getJSON(url,param,function(data){
 			queryKd(1);
			alert(data.mess);	
		}); 
	}
	function modifyjdkd(id){
		var url ="/pages/jdpx/modifyjdkd.jsp?id="+id;
	 	swnidow(350,320,url);
		queryKd(1);
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
			<td><span class="tf">考点申请</span></td>
		</tr>
	</table> 
	 <div align="center">
	 	 <table  class="f13 tab wp100"  align="center" bordercolor="#D0D0D0" border="1px" >
	 	 	<tr class="h30">
	 	 	 <td class="dt1  w100">鉴定考点名称：</td>
	 	 	 <td class="dt2"><input type="text" id="k1" class="w150"> </td>
	 	 	 <td class="dt1  w100">管理机构：</td>
	 	 	 <td class="dt2"><input type="text" id="k2" class="w150"> </td>
	 	 	 <td class="dt1  w100">授权期限：</td>
	 	 	 <td class="dt2"><input type="text" id="k6" class="w150"  onmousedown="WdatePicker()"> </td>
	 	 	 </tr>
	 	 	<tr class="h30">
	 	 	<td class="dt1">授权项目：</td> 
	 	 	<td class="dt2"><input type="text" id="k3" class="w150"></td>
	 	 	<td class="dt1">授权事项：</td> 
	 	 	<td class="dt2" colspan="3"><textarea rows="2" cols="90" id="k4" style="resize: none;" ></textarea> </td>
	 	 	</tr>
	 	 	<tr class="h30">
	 	 	 <td class="dt1">备注：</td> 
	 	 	<td class="dt2" colspan="5"><textarea rows="2" id="k5" cols="130" style="resize: none;" ></textarea></td> 
	 	 	</tr>
	 	 	<tr>
	 	 	 <td class="dt2" colspan="6">
	 	 		<input type="button" style="color: blue;font-weight: bold;" value="申请" title="申请新的鉴定机构" onmousedown="apply();" class="w60">
	 	 	</td>
	 	 </table>
 	</div>
 	<div  class="wp100"> 
	 	 <table class="f13 tab wp100" id="tab" align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr > 
			<th class="tab2 w50">序号</th>
			<th class="tab2">考点名</th>
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
