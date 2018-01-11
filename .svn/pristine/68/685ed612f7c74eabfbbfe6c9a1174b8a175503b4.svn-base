  
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 <script type="text/javascript" src="/js/pager.js"></script>
 <script type="text/javascript" src="/js/jquery.js"></script>
 <script type="text/javascript"> 
	 $(document).ready(function () { 
	   	 getxy();
	   	 showbj(1);
	}); 
	
	function getxy(){
			var url="/queryxy";
			$.getJSON(url, null,function(data){ 
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
	function showbj(index){
		var url = "/showbj?index="+index+"&xy="+$('#xy').val()+"&zy="+$('#zy').val();
		$.getJSON(url,{Rand:Math.random()},function(data){
			if(index ==1){
			//显示分页导航  
				var pager =spager(data.count);
				pager.onclick = function(index){
					 pagerselect(index);
				};
			}
		    var vals =data.stuclasses;
			var htmls="";
			for(var i = 0 ; i < vals.length;i++){
				htmls+="<tr>"+
					"<td class='tab3'><input name='checkbox' class='oneCheck' type='checkbox' value='"+vals[i].bjid+"'></td>"+
					"<td class='tab3 w40'>"+(i+1)+"</td>"+
					"<td class='tab3 w80'>"+vals[i].zyxx.collage.xymc+"</td>"+
					"<td class='tab3 w80'>"+vals[i].zyxx.zymc+"</td>"+
					"<td class='tab3 w80'>"+vals[i].zyxx.zybh+"</td>"+
					"<td class='tab3 w80'>"+vals[i].bjmc+"</td>"+
					"</tr>"; 
			}  
		   $("#trs").html(htmls);
			stab(); 
		}); 
	} 
	function pagerselect(index){
		showbj(index);
	} 
	
	
	function dosaveclass(){
		var value = swnidow(800,600,"/pages/sys/saveclass.jsp"); 
		if(value=="refresh"){
			window.location.reload();
		}
	}
	
	function doupdateclass(){
		var arry = [];
		$("input:checkbox:checked").each(function(){
			arry.push($(this).val());
		});
		if(arry.length>1){
			alert("只能选中一个修改！");
		}else if(arry.length==1){
			var id = $("input:checkbox:checked").attr('value');
			var value = swnidow(800,600,'/pages/sys/updateclass.jsp?bjid='+id);
			if(value == "refresh"){
				window.location.reload();
			}
			
		}else if(arry.length<1){
			alert("您没有选中项！");
		}
	}
		
	function deleteclasses(){
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
				deletecla(ids.substring(0,ids.length-1));
			}
		} 
	}
	
	function deletecla(bjids){
		var url ="/deleteClass?bjids="+bjids;
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
	<!-- 头部 -->
	<table width="100%" border="0" bgcolor="#353c44" align="center"
		cellpadding="0" cellspacing="0">
		<tr>
			<td height="24" width="35"><span class="ml10"><img
					src="/pages/images/tb.gif" width="14" height="14" />
			</span>
			</td>
			<td><span class="tf">学院--专业--班级信息对应表</span></td>
		</tr>
	</table>  
	 <div align="center">
 	  <table  class=" f13 tab wp100"  align="center" bordercolor="#D0D0D0" border="1px" >
 	 	<tr class="h30">
 	 	 <td class="dt1  w80">学院：</td>
 	 	 <td class="dt2 w250">
 	 	<select name='xy' id="xy" class="w150" onchange="getzy();"><option value="0">--请选择--</option> </select></td> 
 	 	<td class="dt1  w80">专业：</td>
		<td class="dt2 w250">
 	 	<select name='zy' id="zy" class="w150"><option value="0">--请选择--</option> </select></td> 
 	 	<td class="dt2" colspan="2">
 	 		<input type="button" style="color: blue;font-weight: bold;" value="查询" title="查询学院专业班级对应信息" onmousedown="showbj(1);" class="w60">
 	 		<input type="button" style="color: blue;font-weight: bold;" value="新增" title="录入学院专业班级对应信息" onmousedown="dosaveclass();" class="w60">
			<input type="button" style="color: blue;font-weight: bold;" value="修改" title="修改学院专业班级对应信息" onmousedown="doupdateclass();" class="w60">
			<input type="button" style="color: blue;font-weight: bold;" value="删除" title="删除学院专业班级对应信息" onmousedown="deleteclasses();" class="w60">
 	 	</td>
 	 	</tr>
	 </table>
 	</div>
 	 
	<div  class="wp100">
	 	 <table class="f13 tab wp100" id="tab" bordercolor="#D0D0D0"  align="center" border="1px"  > 
			<tr align="center">
			<th class="tab2 w20"><input id='quanxuan'  type='checkbox'  onclick="checkAll();" value="全选"></th> 
			<th class="tab2 w40">序号</th>
			<th class="tab2 w80">学院名</th>
			<th class="tab2 w80">专业名</th>
			<th class="tab2 w80">专业编号</th>
			<th class="tab2 w80">班级名</th> 
			</tr>
			<tbody id="trs">
			
			</tbody>
		</table>
		<div id="pager"></div> 
		</div>
</body> 
</html>
 