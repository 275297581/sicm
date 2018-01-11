  
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
  <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 <script type="text/javascript" src="/js/jquery.js"></script>
 <script type="text/javascript" src="/js/pager.js"></script>
 <!--<script type="text/javascript" src="/js/bui.js"></script>-->
  <script type="text/javascript"> 
	$(document).ready(function () { 
	 	 getxy(); 
		 setnj();
		 getzslx();
		 showKS(1);
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
				var url="/queryzy";
				$.getJSON(url,{xy:xy},function(data){ 
					var zys = data.zyxxs;
					var htmls="<option value='0'>--请选择--</option>";
					for(var i=0;i<zys.length;i++){
						htmls +="<option value='"+zys[i].zyid+"'>"+zys[i].zymc+"</option>";
					}
					$("#zy").html(htmls); 
				}); 
			}
		}
		function setnj(){
			var htmls="";
			for(var i=2008;i<2025;i++){
				htmls +="<option value='"+i+"'>"+i+"</option>";
			} 
			$("#nj").append(htmls);
		}
		function getzslx(){
			var url="/getlx";
			$.getJSON(url,{Rand:Math.random()},function(data){ 
				var lxs = data.zslxs; 
				var htmls="";
				for(var i=0;i<lxs.length;i++){
					htmls +="<option value='"+lxs[i]+"'>"+lxs[i]+"</option>";
				}
				$("#zylx").append(htmls); 
			}); 
		}
		function lxchange(){
			if($('#zylx').val()!=""){
				var url="/getzyzs";
				$.getJSON(url,{Rand:Math.random(),zsfl:$('#zylx').val()},function(data){ 
					var zs = data.zyzss;
					var htmls="<option value=''>--请选择--</option> ";
					for(var i=0;i<zs.length;i++){
						htmls +="<option value='"+zs[i]+"'>"+zs[i]+"</option>";
					}
					$("#zs").html(htmls); 
				});
			} 
		}
		
		
		var ks;
		function showKS(index){ 
			var url ="/queryKS";
			var Rand = Math.random(); 
			var param ={Rand:Rand,index:index,zs:$('#zs').val(),nj:$('#nj').val(),sfzh:$('#sfzh').val(),xh:$('#xh').val(),xy:$('#xy').val(),zy:$('#zy').val()}; 
			$.getJSON(url,param,function(data){ 
			 	 if(index ==1){
						//显示分页导航  
					var pager =spager(data.count);
					pager.onclick = function(index){
						 pagerselect(index);
					};
				} 		 
			 	 ks =data.ks;
					var htmls="";
					for(var i = 0 ; i < ks.length;i++){
						htmls+="<tr ondblclick='clickRow("+ks[i].bmid+")'>"+
								"<td class='tab3'>"+(i+1)+"</td>"+  
								"<td class='tab3'>"+ks[i].stu.xm+"</td>"+
								"<td class='tab3'>"+ks[i].sfzh+"</td>"+
								"<td class='tab3'>"+ks[i].stu.xh+"</td>"+
								"<td class='tab3'>"+ks[i].stu.nj+"</td>"+
								"<td class='tab3'>"+ks[i].bmdd+"</td> "+
								"<td class='tab3'>"+ks[i].bmsj+"</td> "+
								"<td class='tab3'>"+ks[i].zyzs.fzjg+"</td>"+
								"<td class='tab3'>"+ks[i].zyzs.zsmc+"</td> "+
								"<td class='tab3'>"+ks[i].jdkm+"</td> "+
								"<td class='tab3'>"+ks[i].lxdh+"</td> "+
								"<td class='tab3'>"+ks[i].bkxx+"</td> "+ 
								"</tr>"; 
					} 
			  		$('#trs').html(htmls);
				stab();
	 	 	});
		}
		 function  clickRow(id){
		 	swnidow(1200,600,'/pages/kscx/kaoshiinfo.jsp?id='+id);
		 }
		function pagerselect(index){
			showKS(index);
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
			<td><span class="tf">考试信息查询</span></td>
		</tr>
	</table>  
	<!-- 内容 -->
 	 <div align="center">
	 	 <table  class="f13 tab wp100" align="center" bordercolor="#D0D0D0" border="1px" >
	 	 	<tr class="h30">
	 	 	<td class="dt1 w80 ">身份证号：</td> <td  class="dt2"><input type="text" name='sfzh' id='sfzh' class="w150"> </td> 
	 	 	<td class="dt1  w80">学号：</td><td class="dt2"><input type="text" name='xh' id='xh' class="w150"></td>  
	 	 	<td class="dt1  w80">学院：</td><td class="dt2"><select name='xy' id="xy" class="w150" onchange="getzy();"><option value="0">--请选择--</option> </select></td> 
	 	 	<td class="dt1  w80">专业：</td> <td class="dt2"><select name='zy' id="zy" class="w150"><option value="0">--请选择--</option> </select></td> 
	 	 	</tr>
	 	 	<tr class="h30">
	 	 	<td class="dt1">年级：</td><td class="dt2"><select name='nj' id="nj" class="w150">
	 	 	<option value="0">--请选择--</option>  </select></td>
	 	 	<td class="dt1">职业类型：</td> <td class="dt2">
	 	 	<select name='zslx' id="zylx" class="w150" onchange="lxchange();"><option value="">--请选择--</option> </select></td> 
	 	 	<td class="dt1">鉴定职业：</td><td class="dt2"><select name='zs' id="zs"><option value=''>--请选择--</option></select></td>
	 	 	<td class="dt2" colspan="2">
	 	 		<input type="button" style="color: blue;font-weight: bold;" value="查询" title="查询学生基础信息及报名信息" onmousedown="showKS(1);" class="w60">
	 	 	</td>
	 	 	</tr> 
	 	 </table>
 	</div>  
	<div  class="wp100"> 
	 	 <table class="f13 tab wp100" id="tab" align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr > 
			<th class="tab2">序号</th>
			<th class="tab2">姓名</th> 
			<th class="tab2">身份证号</th>
			<th class="tab2">学号</th>
			<th class="tab2">年级</th> 
			<th class="tab2">报名地点</th>
			<th class="tab2">报名时间</th>
			<th class="tab2">鉴定机构</th> 
			<th class="tab2">鉴定职业</th> 
			<th class="tab2">鉴定科目</th> 
			<th class="tab2">联系电话</th>
			<th class="tab2">补考信息</th>
			</tr> 
			<tbody id="trs">
			
			</tbody>
			</table> 
			<div id="pager"></div> 
	</div>
	
</body> 
</html>

 
 