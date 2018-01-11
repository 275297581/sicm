<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>添加专业证书</title>
    <link rel="stylesheet" type="text/css" href="/css/detail.css" />
	<link rel="stylesheet" type="text/css" href="/css/all.css" />
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		
		getxy();
		
	});
		function savezyzs(){
		
		var url = "/savezyzs";
		var xymc = $("#xymc").find("option:selected").text();
		var zymc = $("#zymc").find("option:selected").text();
		if(zymc=="--请选择--"){
			zymc="";
		}
		var zsmc = $('#zsmc').val();
		var fzjg = $('#fzjg').val();
		var zsdj = $('#zsdj').val();
		var zsfl = $('#zsfl').val();
		var jlbz = $('#jlbz').val();
		var xf = $('#xf').val();
		
		if(xymc=="--请选择--"){
			alert("学院名称不能为空！");
			return;
		}
		if(!$.trim(zsmc)){
			alert("证书名称不能为空！");
			return;
		}
		/* if(!$.trim(jlbz)){
			alert("奖励金额不能为空！");
			return;
		}
		if(!$.trim(xf)){
			alert("获奖学分不能为空！");
			return;
		} */
		var param ={Rand:Math.random(),zsmc:zsmc,fzjg:fzjg,zsdj:zsdj,zsfl:zsfl,xymc:xymc,zymc:zymc,jlbz:jlbz,xf:xf};
		
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
		var xy =$('#xymc').val();
		if(xy!=null && xy!=0){
			var url="/queryzy";
			$.getJSON(url,{xy:xy},function(data){ 
				var zys = data.zyxxs;
				var htmls="<option value='0'>--请选择--</option>";
				for(var i=0;i<zys.length;i++){
					//htmls +="<option value='"+zys[i].zyid+"'>"+zys[i].zymc+"</option>";
					htmls +="<option name='"+zys[i].zymc+"' value='"+zys[i].zyid+"'>"+zys[i].zymc+"</option>";
				}
				$("#zymc").html(htmls); 
			}); 
		}
	}
	</script>
  </head>
  
  <body>
  <div align="center">
  <fieldset class="wp98 f13 mt20">
  		<legend>学生基本信息录入</legend>
    	<table class="  f13 tab wp100" id="tab" align="center"
				bordercolor="#D0D0D0" border="1px">
				<tr class="h30">
					<td class="dt1 w80 "><font color="red" style="position:relative; top:2px;">*</font>学院名称：</td><td class="dt2"><select name='xymc' id="xymc" class="w150" onchange="getzy();"><option value="0">--请选择--</option> </select></td>
					<td class="dt1  w80">专业名称：</td><td class="dt2"><select name='zymc' id="zymc"  onchange="keepzyfx();"  class="w150"><option value="0">--请选择--</option></td>
					<td class="dt1  w80"><font color="red" style="position:relative; top:2px;">*</font>证书名称：</td><td class="dt2"><input name='zsmc' id="zsmc" type="text"></td>
				</tr>
				<tr class="h30">
					<td class="dt1  w80">发证机构：</td><td class="dt2"><input name='fzjg' id="fzjg" class="w150" type="text"></td>
					<td class="dt1 w80">证书等级：</td><td class="dt2"><input name='zsdj' id="zsdj"    class="w150" type="text"></td>
					<td class="dt1  w80">奖励证书分类：</td><td class="dt2"><input  name='zsfl' id="zsfl"  type="text"></td>
				</tr>
				<tr class="h30">
					<td class="dt1 w80">奖励金额：</td><td class="dt2"><input  name='jlbz' id="jlbz"  type="text"></td>
					<td class="dt1  w80">获奖学分：</td><td class="dt2"><input  name='xf' id="xf"  type="text"></td>
					<td class="dt1  w80"></td><td class="dt2"></td>
				</tr>
		</table>
	</fieldset>
	</div>
	<div style="text-align: center;">
		<input id="savebut" type="button" style="font-weight: bold;" value="保存" title="保存信息" onclick="savezyzs();" class="w60">
		<input id="" type="button" style="font-weight: bold;" value="关闭"  onclick="javascript:window.returnValue='refresh';window.close();" class="w60">
			<div style="text-align: center;color: red;font-size: x-small;">(温馨提示：带星号的为必填项。) </div>
	</div>
  </body>
</html>
