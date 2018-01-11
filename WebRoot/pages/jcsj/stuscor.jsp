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
		var url="/downStuScoreXls";
		window.location.href=url; 
	}
	function shaun(){ 
		if($('#score').val()==""){
			alert("请选择需要上传的文件！");
			return ;
		}  
		$('#form1').submit();
		/* $.blockUI();*/
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
			<td><span class="tf"> 考试成绩导入</span></td>
		</tr>
	</table> 
	<div align="center" class=" mt50">
		<fieldset class="wp80 mt20">
			<legend>考试成绩信息</legend>
			<form action="/uploadStuScore"  id="form1" enctype="multipart/form-data" method="post">
				<table>
					<tr><td class="w150">考试成绩模板：</td><td><input type="button" value="导出" onmousedown="downloadStuinfo();" > </td> </tr>
					<tr> <td>考试成绩：</td><td><input type="file" name="score" id="score" accept=".xls,.xlsx">
						<input type="button" value="上传"  onmousedown="shaun()">
					</td> </tr>
				</table>
			</form>
		</fieldset>
		<div align="left" class="wp80 mt20">注：1、导入成绩信息前必须已经进行过报名;</div>
		<div align="left" class="wp80 ml60 mt5">2、导入信息中准考证号、姓名、鉴定职业为必填项，学号、身份证号至少一项必填;</div>
		<div align="left" class="wp80 ml60 mt5">3、若同一准考证号的成绩信息二次导入，则覆盖旧成绩信息;</div>
	</div>
</body> 
</html>

 
