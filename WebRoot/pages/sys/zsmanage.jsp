  
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
	 		 setnj();
	 		 getzslx();
	 		 showJl(1); 
		});
		var pager;
		function getxy(){
			var url="/queryxy";
			$.getJSON(url,{Rand:Math.random()},function(data){ 
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
				$.getJSON(url,{Rand:Math.random()},function(data){ 
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
			for(var i=2005;i<2026;i++){
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
				$("#zslx").append(htmls); 
			}); 
		}
		
		function lxchange(){
			if($('#zslx').val()!=""){
				var url="/getzyzs";
				$.getJSON(url,{Rand:Math.random(),zsfl:$('#zslx').val()},function(data){ 
					var zs = data.zyzss;
					var htmls="<option value=''>--请选择--</option> ";
					for(var i=0;i<zs.length;i++){
						htmls +="<option value='"+zs[i]+"'>"+zs[i]+"</option>";
					}
					$("#zyzs").html(htmls); 
				});
			} 
		}
		 
		function showJl(index){ 
			 var url ="/queryStuJl";
			 if(index!=0){
					url+="?index="+index;
				} 
			 var param ={xy:$('#xy').val(),zy:$('#zy').val(),nj:$('#nj').val(),zs:$('#zyzs').val(),Rand:Math.random()};
			 $.getJSON(url,param,function(data){ 
		 		 if(index ==1){
						//显示分页导航  
						pager =spager(data.count);
						count = data.count;
						pager.onclick = function(index){
							 pagerselect(index);
						};
					}
			 	 	var zs =data.stuzss;
					var htmls="";
					for(var i = 0 ; i < zs.length;i++){
						htmls+="<tr>"+  
								"<td class='tab3'>"+(i+1)+"</td>"+
								"<td class='tab3'>"+(zs[i].xymc==null?"":zs[i].xymc)+"</td>"+
								"<td class='tab3'>"+(zs[i].zymc==null?"":zs[i].zymc)+"</td>"+
								"<td class='tab3'>"+(zs[i].nj==null?"":zs[i].nj)+"</td> "+
								"<td class='tab3'>"+(zs[i].bj==null?"":zs[i].bj)+"</td> "+
								"<td class='tab3'>"+(zs[i].xb==null?"":zs[i].xm)+"</td> "+
								"<td class='tab3'>"+(zs[i].xb==null?"":zs[i].xb)+"</td> "+
								"<td class='tab3'>"+(zs[i].xh==null?"":zs[i].xh)+"</td>"+
								"<td class='tab3'>"+(zs[i].sfzh==null?"":zs[i].sfzh)+"</td> "+
								"<td class='tab3'>"+(zs[i].zsbh==null?"":zs[i].zsbh)+"</td> "+ 
								"<td class='tab3'>"+(zs[i].zsmc==null?"":zs[i].zsmc)+"</td> "+ 
								"<td class='tab3'>"+(zs[i].dj==null?"":zs[i].dj)+"</td> "+ 
								"<td class='tab3'><input type='image' src='/icon/delete.gif'  onmousedown='delZs("+zs[i].id+")' title='删除证书信息'></td>"+
								"</tr>";
					} 
			  		$("#trs").html(htmls);
				stab();
			 }); 
		} 
	var index_ =1;
	function pagerselect(index){
		showJl(index);
		index_ = index;
	} 
	function delZs(id){
		var url="/deleteZs";
		var param = {Rand:Math.random(),kzid:id};
		 $.getJSON(url,param,function(data){
		 	showJl(index_);
		 	alert(data.mess);
		 }); 
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
			<td><span class="tf">证书管理</span></td>
		</tr>
	</table>  
	<!-- 内容 -->
 	 <div align="center">
	 	 <table  class="f13 tab wp100"  align="center" bordercolor="#D0D0D0" border="1px" >
	 	 	<tr class="h30">
	 	 	 <td class="dt1  w80">学院：</td><td class="dt2">
	 	 	<select name='xy' id="xy" class="w150"  onchange="getzy();"><option value="0">--请选择--</option> </select></td> 
	 	 	<td class="dt1  w80">专业：</td> <td class="dt2">
	 	 	<select name='zy' id="zy" class="w150"><option value="0">--请选择--</option> </select></td> 
	 	 	<td class="dt1">年级：</td><td class="dt2">
	 	 	<select name='nj' id="nj" class="w150">
	 	 	<option value="">--请选择--</option> 
	 	 	</select></td>
	 	 	</tr>
	 	 	<tr class="h30">
	 	 	<td class="dt1  w80">证书类型：</td> <td class="dt2">
	 	 	<select name='zslx' id="zslx" class="w150" onchange="lxchange();"><option value="">--请选择--</option> </select></td> 
	 	 	<td class="dt1  w80">证书名称：</td> <td class="dt2">
	 	 	<select name='zyzs' id="zyzs" class="w150"><option value=''>--请选择--</option> </select></td> 
	 	 	<td class="dt2" colspan="2">
	 	 		<input type="button" style="color: blue;font-weight: bold;" value="查询" title="查询学生奖励信息" onmousedown="showJl(1);" class="w60"> 
	 	 	</td>
	 	 	</tr>
	 	 </table>
 	</div>  
	<div  class="wp100"> 
	 	 <table class="f13 tab wp100" id="tab" align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr > 
			<th class="tab2 w50">序号</th>
			<th class="tab2">学院</th>
			<th class="tab2">专业</th> 
			<th class="tab2">年级</th>
			<th class="tab2">班级</th>
			<th class="tab2">姓名</th>
			<th class="tab2">性别</th>
			<th class="tab2">学号</th> 
			<th class="tab2">身份证号</th>
			<th class="tab2">证书编号</th>
			<th class="tab2">证书名称</th>
			<th class="tab2">证书等级</th>
			<th class="tab2">删除</th>
			</tr>
			<tbody id="trs">
			
			</tbody>
			</table> 
			<div id="pager"></div> 
	</div>
</body> 
</html> 