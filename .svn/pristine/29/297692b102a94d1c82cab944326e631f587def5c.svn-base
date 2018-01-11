<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>添加班级</title>
    <link rel="stylesheet" type="text/css" href="/css/detail.css" />
	<link rel="stylesheet" type="text/css" href="/css/all.css" />
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		
		getxy();
		
	});
		function saveclass(){
		
		var url = "/saveclass";
		var xymc = $("#xymc").val();
		var zymc = $("#zymc").val();
		var bjbh = $("#zymc").find("option:selected").attr("name");
		var bjmc = $('#bjmc').val();
				
		if(xymc=="0"){
			alert("学院名称不能为空！");
			return;
		}
		if(zymc=="0"){
			alert("专业名称不能为空！");
			return;
		}
		if(!$.trim(bjmc)){
			alert("班级名称不能为空！");
			return;
		}

		var param ={Rand:Math.random(),zyid:zymc,bjmc:bjmc,bjbh:bjbh};
		
		$.getJSON(url,param,function(data){
				var msg = data.msg;
				if(msg=="保存成功！"){
				 	alert(msg);
					window.returnValue='refresh';
					$('#savebut').attr('disabled','true');
				}else{
					alert(msg);
				}
		});
	};
	
	function getxy(){
		var url="/queryxy";
		$.getJSON(url,null,function(data){ 
			var cols = data.collages;
			var htmls="";
			for(var i=0;i<cols.length;i++){
				htmls +="<option value='"+cols[i].xyid+"'>"+cols[i].xymc+"</option>";
			}
			$("#xymc").append(htmls); 
		}); 
	}
	function getzy(){
		$("#bjbh").val("");
		var xy =$('#xymc').val();
		if(xy!=null && xy!=0){
			var url="/queryzy";
			$.getJSON(url,{xy:xy},function(data){ 
				var zys = data.zyxxs;
				var htmls="<option value='0'>--请选择--</option>";
				for(var i=0;i<zys.length;i++){
					//htmls +="<option value='"+zys[i].zyid+"'>"+zys[i].zymc+"</option>";
					htmls +="<option name='"+zys[i].zybh+"' value='"+zys[i].zyid+"'>"+zys[i].zymc+"</option>";
				}
				$("#zymc").html(htmls); 
			}); 
		}
	}
	
	function getbh(){
			var bjbh = $("#zymc").find("option:selected").attr("name");
			$("#bjbh").val(bjbh);
	}
	</script>
  </head>
  
  <body>
  <div align="center">
  <fieldset class="wp98 f13 mt20">
  		<legend>班级信息录入</legend>
    	<table class="  f13 tab wp100" id="tab" align="center"
				bordercolor="#D0D0D0" border="1px">
				<tr class="h30">
					<td class="dt1 w80 "><font color="red" style="position:relative; top:2px;">*</font>学院名称：</td>
					<td class="dt2">
						<select name='xymc' id="xymc" class="w150" onchange="getzy();">
							<option value="0">--请选择--</option> 
						</select>
					</td>
				</tr>
				<tr class="h30">
					<td class="dt1  w80"><font color="red" style="position:relative; top:2px;">*</font>专业名称：</td>
					<td class="dt2">
						<select name='zymc' id="zymc"  class="w150" onchange="getbh()">
							<option value="0">--请选择--</option>
						</select>
					</td>		
				</tr>
				<tr class="h30">
					<td class="dt1  w80">专业编号：</td>
					<td class="dt2"><input name='bjbh' id="bjbh" type="text" disabled="disabled"></td>
				</tr>
				<tr class="h30">
					<td class="dt1  w80"><font color="red" style="position:relative; top:2px;">*</font>班级名称：</td>
					<td class="dt2"><input name='bjmc' id="bjmc" type="text"></td>
				</tr>
				
		</table>
	</fieldset>
	</div>
	<div style="text-align: center;">
		<input id="savebut" type="button" style="font-weight: bold;" value="保存" title="保存信息" onclick="saveclass();" class="w60">
		<input id="" type="button" style="font-weight: bold;" value="关闭"  onclick="javascript:window.returnValue='refresh';window.close();" class="w60">
			<div style="text-align: center;color: red;font-size: x-small;">(温馨提示：带星号的为必填项。) </div>
	</div>
  </body>
</html>
