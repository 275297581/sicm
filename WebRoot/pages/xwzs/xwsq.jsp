<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 <script type="text/javascript" src="/js/pager.js"></script>
 <script type="text/javascript" src="/js/jquery.js"></script> 
 <!--<script type="text/javascript" src="/js/bui.js"></script>--> 
  <script type="text/javascript">
	$(document).ready(function(){
		var sfz = '${stu.sfzh}';
		if(sfz==""){
			alert("请以学生身份申请证书！");
			$('#but1').attr("disabled","disabled");
		}else {
			$('#x1').val(sfz);
	   		$('#x2').val('${stu.xh}');
	   		$('#x3').val('${stu.xm}');
	   		
	   		$('#x4').val('${stu.zyxx.collage.xymc}');
	   		$('#x5').val('${stu.zyxx.zymc}');
	   		$('#x6').val('${stu.nj}');
	   		
	   		$('#x7').val('${stu.bjmc}'); 
	   		queryzs();
   		}
     });
     function queryzs(){
     	/* $.blockUI();*/ 
     	var param = {Rand:Math.random()};
		var url="/querymyZSsq";
		$.getJSON(url,param,function(data){
			/* $.unblockUI();*/
			var zs = data.zs; 
			var htmls="";
			for(var i = 0 ; i < zs.length;i++){
				htmls +="<tr>"+
				"<td class='tab3'>"+(i+1)+"</td>"+
				"<td class='tab3'>"+zs[i].stu.xm+"</td>"+
				"<td class='tab3'>"+zs[i].sfzh+"</td>"+
				"<td class='tab3'>"+zs[i].stu.zyxx.collage.xymc+"</td>"+ 
				"<td class='tab3'>"+zs[i].stu.zyxx.zymc+"</td>"+ 
				"<td class='tab3'>"+zs[i].stu.bjmc+"</td>"+ 
				"<td class='tab3'>"+zs[i].sqzs+"</td>"+ 
				"<td class='tab3'>"+zs[i].zsbh+"</td>"+ 
				"<td class='tab3'>"+zs[i].zt+"</td>"+
				"<td class='tab3'><input type='image' src='/icon/detial.png'  title='"+zs[i].bz+"'></td>"+
				"<td class='tab3'>"+
				(zs[i].zt!="审核通过"?
				"<input type='image' src='/icon/delete.gif'  title='删除' onmousedown='removezs("+zs[i].xwrdid+")'>"+
				"&nbsp;&nbsp;<input type='image' src='/icon/modify.gif'  title='修改' onmousedown='modifyzs("+zs[i].xwrdid+")'>"
				:"")
				+"</td></tr>"; 
			}
		  $('#trs').html(htmls);
		  stab();	
		});
	}
	 function apply(){
	 	var sfz = $('#x1').val(); 
	 	var sqzs = $('#x8').val();
	 	var zsbh = $('#x10').val();
	 	var jg = $('#x9').val();
	 	if(sqzs==""){
	 		alert("申请证书不能为空！");
	 		return;
	 	}
	 	if(zsbh==""){
	 		alert("证书编号不能为空！");
	 		return;
	 	}
	 	if(jg==""){
	 		alert("证书机构不能为空！");
	 		return;
	 	}
 	    var bz = $('#x10').val();
	 	var url ="/addzsrd"; 
	 	var param = {sfz:sfz,sqzs:sqzs,jg:jg,bz:bz,zsbh:zsbh };
	 	 $.getJSON(url,param,function(data){
	 	 	alert(data.mess);
 			 queryzs();
		});
	 }
	 function removezs(id){
	 	if(!window.confirm("确定要删除该申请吗？")){
	 		return;
	 	}
	   var url ="/deletezs?id="+id;
	 	 $.getJSON(url,{Rand:Math.random()},function(data){
 			queryzs();
		});
	}
	function modifyzs(id){
	    var url ="/pages/xwzs/modifyzs.jsp?id="+id;
	 	swnidow(350,250,url);
		queryzs();
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
			<td><span class="tf">校外证书申请</span></td>
		</tr>
	</table> 
	 <div align="center">
	 	 <table  class="f13 tab wp100"  align="center" bordercolor="#D0D0D0" border="1px" >
	 	 	<tr class="h30">
	 	 	 <td class="dt1 w100">身份证：</td>
	 	 	 <td class="dt2"><input type="text" id="x1" class="w150"   disabled="disabled"> </td>
	 	 	 <td class="dt1 w100">学号：</td>
	 	 	 <td class="dt2"><input type="text" id="x2" class="w150"  disabled="disabled"> </td>
	 	 	 <td class="dt1 w100">姓名：</td>
	 	 	 <td class="dt2"><input type="text" id="x3" class="w150"  disabled="disabled"> </td>
	 	 	 </tr>
	 	 	<tr class="h30">
	 	 	<td class="dt1 w100">学院：</td> 
	 	 	<td class="dt2"><input type="text" id="x4" class="w150"  disabled="disabled"></td>
	 	 	<td class="dt1 w100">专业：</td> 
	 	 	<td class="dt2"><input type="text" id="x5" class="w150"  disabled="disabled"></td>
	 	 	<td class="dt1 w100">年级：</td> 
	 	 	<td class="dt2"><input type="text" id="x6" class="w150"  disabled="disabled"></td>
	 	 	 </tr>
	 	 	 <tr class="h30">
	 	 	<td class="dt1 w100">班级：</td> 
	 	 	<td class="dt2"><input type="text" id="x7" class="w150" disabled="disabled"></td>
	 	 	<td class="dt1 w100"><font color="red" style="position:relative; top:2px;">*</font>申请证书：</td> 
	 	 	<td class="dt2"><input type="text" id="x8" class="w150"></td>
	 	 	<td class="dt1 w100"><font color="red" style="position:relative; top:2px;">*</font>证书编号：</td> 
	 	 	<td class="dt2"><input type="text" id="x10" class="w150"></td>
	 	 	 </tr>
	 	 	  <tr class="h30">
	 	 	<td class="dt1 w100"><font color="red" style="position:relative; top:2px;">*</font>证书机构：</td> 
	 	 	<td class="dt2"><input type="text" id="x9" class="w150"></td>
	 	 	<td class="dt1 w100"></td> 
	 	 	<td class="dt2"></td>
	 	 	<td class="dt1 w100"></td> 
	 	 	<td class="dt2"></td>
	 	 	 </tr>
	 	 	<tr class="h30">
	 	 	 <td class="dt1 w100">备注：</td> 
	 	 	<td class="dt2" colspan="5"><textarea rows="2" id="x10" cols="130" style="resize: none;" ></textarea></td> 
	 	 	</tr>
	 	 	<tr>
	 	 	 <td class="dt2" colspan="6">
	 	 		<input type="button" id="but1" style="color: blue;font-weight: bold;" value="申请" title="申请新的鉴定机构" onmousedown="apply();" class="w60">
	 	 	</td>
	 	 </table>
 	</div>
 	<div  class="wp100"> 
	 	 <table class="f13 tab wp100" id="tab" align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr > 
			<th class="tab2 w50">序号</th>
			<th class="tab2">姓名</th>
			<th class="tab2">身份证</th>
			<th class="tab2">学院</th> 
			<th class="tab2">专业</th> 
			<th class="tab2">班级</th>
			<th class="tab2">申请证书</th>
			<th class="tab2">证书编号</th>
			<th class="tab2">状态</th>
			<th class="tab2">备注</th> 
			<th class="tab2">操作</th>
			</tr>
			<tbody id="trs">
				
			</tbody>
			</table>  
	</div> 
</body>
</html>
