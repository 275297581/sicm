  
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 <script type="text/javascript" src="/js/pager.js"></script>
 <script type="text/javascript" src="/js/jquery.js"></script> 
 <!--<script type="text/javascript" src="/js/bui.js"></script>--> 
 <script type="text/javascript"> 
	$(document).ready(function () { 
	 		 getxy();
	 		 showZs(1);
		}); 
		function getxy(){
			var url="/queryxy";
			$.getJSON(url,null,function(data){ 
				var cols = data.collages;
				var htmls="";
				for(var i=0;i<cols.length;i++){
					htmls +="<option value='"+cols[i].xyid+"'>"+cols[i].xymc+"</option>";
				}
				$("#xy").append(htmls); 
			}); 
		}
		function getzy(){
			var xy =$('#xy').val();
			if(xy!=null && xy!=0){
				var url="/queryzy?xy="+xy;
				$.getJSON(url,null,function(data){ 
					var zys = data.zyxxs;
					var htmls="<option value='0'>--请选择--</option>";
					for(var i=0;i<zys.length;i++){
						htmls +="<option value='"+zys[i].zyid+"'>"+zys[i].zymc+"</option>";
					}
					$("#zy").html(htmls); 
				}); 
			}
		}
		function showZs(index){
			/* $.blockUI();*/
			
			var xm =$('#xm').val();
			var sfz =$('#sfzh').val();
			var xy =$('#xy').val();
			var zy =$('#zy').val();
			var zs =$('#zs').val(); 
			var url ="/showZs";
			var Rand = Math.random();
			var param = {xm:xm,sfz:sfz,xy:xy,zy:zy,sqzs:zs,index:index,Rand:Rand}; 
			 $.getJSON(url,param,function(data){
		 		 /* $.unblockUI();*/
		 		 if(index ==1){
					var pager =spager(data.count);
					pager.onclick = function(index){
						 pagerselect(index);
					};
				} 	
			var zs = data.zs; 
			var htmls="";
			for(var i = 0 ; i < zs.length;i++){
				htmls +="<tr>"+
				"<td class='tab3'>"+(i+1)+"</td>"+
				"<td class='tab3'>"+zs[i].stu.xm+"</td>"+
				"<td class='tab3'>"+zs[i].sfzh+"</td>"+
				"<td class='tab3'>"+zs[i].stu.xh+"</td>"+
				"<td class='tab3'>"+zs[i].stu.zyxx.collage.xymc+"</td>"+ 
				"<td class='tab3'>"+zs[i].stu.zyxx.zymc+"</td>"+ 
				"<td class='tab3'>"+zs[i].stu.bjmc+"</td>"+ 
				"<td class='tab3'>"+zs[i].sqzs+"</td>"+ 
				"<td class='tab3'><input type='image' src='/icon/detial.png'  title='"+zs[i].bz+"'></td>"+
				"</tr>"; 
			}
		  $('#trs').html(htmls);
		  stab();
		});
		}
		
	function pagerselect(index){
		showZs(index);
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
			<td><span class="tf">校外证书数据</span></td>
		</tr>
	</table>  
	<!-- 内容 -->
 	 <div align="center">
	 	 <table  class="f13 tab wp100"  align="center" bordercolor="#D0D0D0" border="1px" >
	 	 	<tr class="h30">
	 	 	<td class="dt1  w80">姓名：</td><td class="dt2"><input type="text" name='xm'  id='xm' class="w150"> </td>
	 	 	
	 	 	<td class="dt1  w80">学院：</td><td class="dt2">
	 	 	<select name='xy' id="xy" title="选择可关联得到专业" class="w150" onchange="getzy();"><option value="0">--请选择--</option> </select></td> 
	 	 	<td class="dt1  w80">专业：</td> <td class="dt2">
	 	 	<select name='zy' id="zy" class="w150"><option value="0">--请选择--</option> </select></td> 
	 	 	</tr>
	 	 	<tr class="h30">
	 	 	<td class="dt1 w80 ">身份证号：</td> <td  class="dt2"><input type="text" title="单个查询某一个学生校外奖励信息" name='sfzh' id='sfzh' class="w150"> </td> 
	 	 	<td class="dt1">证书名称：</td><td class="dt2">
	 	 		<input type="text" name='zs' title="可以进行粗略查询" id='zs' class="w150"> 
	 	 	 </td>
	 	 	<td class="dt2" colspan="4">
	 	 		<input type="button" style="color: blue;font-weight: bold;" value="查询" title="校外学生证书查询" onmousedown="showZs(1);" class="w60">
	 	 	</td>
	 	 	</tr>
	 	 	</table>
 	</div>  
	<div  class="wp100"> 
	 	 <table class="f13 tab wp100" id="tab" align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr > 
			<th class="tab2 w50">序号</th>
			<th class="tab2">姓名</th>
			<th class="tab2">身份证</th>
			<th class="tab2">学号</th>
			<th class="tab2">学院</th> 
			<th class="tab2">专业</th> 
			<th class="tab2">班级</th>
			<th class="tab2">申请证书</th>
			<th class="tab2">备注</th>
			</tr>
			<tbody id="trs">
			
			</tbody>
			</table> 
			<div id="pager"></div> 
	</div>
	
</body> 
</html>

 
 