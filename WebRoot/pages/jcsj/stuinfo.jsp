<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <script type="text/javascript" src="/js/jquery.js"></script>
  <!--<script type="text/javascript" src="/js/bui.js"></script>-->
 <script type="text/javascript"> 
	function downloadStuinfo(){
		var url="/downstuxls";
		window.location.href=url; 
	}
	function shaun(){ 
		if($('#stuinfo').val()==""){
			alert("请选择需要上传的文件！");
			return ;
		}
		/* $.blockUI();*/
		$('#form1').submit();
		
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
			<td><span class="tf"> 学生信息导入</span></td>
		</tr>
	</table> 
	<div align="center" class=" mt50">
		<fieldset class="wp80 f13">
			<legend>学生基础信息</legend>
			<form action="/uploadstuinfo"  id="form1" enctype="multipart/form-data" method="post">
				<table class="f13">
					<tr><td class="w150">学生信息模板：</td><td><input type="button" value="导出" onmousedown="downloadStuinfo();" class="f13"> </td> </tr>
					<tr> <td>学生信息：</td><td><input type="file" name="stuinfo" id="stuinfo" accept=".xls,.xlsx">
						<input type="button" value="上传"  class="f13" onmousedown="shaun()">
					</td> </tr>
				</table>
			</form>
		</fieldset>
		<div align="left" class="wp80 mt20">注：1、导入信息中 学号、身份证号、姓名、专业为必填项;</div>
		<div align="left" class="wp80 ml60 mt5">2、若将要导入信息身份证号已存在系统中，本次将不再导入该学生;</div>
	</div>
</body> 
</html>

 
