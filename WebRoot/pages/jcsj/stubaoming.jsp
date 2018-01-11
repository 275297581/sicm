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
		var url="/downstubmxls";
		window.location.href=url; 
	}
	function shaun(){ 
		if($('#stubm').val()==""){
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
			<td><span class="tf"> 学生报名信息导入</span></td>
		</tr>
	</table> 
	<div align="center" class="mt50">
		<fieldset class="wp80 mt20">
			<legend>报名信息</legend>
			<form action="/uploadstubm"  id="form1" enctype="multipart/form-data" method="post">
				<table>
					<tr><td class="w150">报名信息模板：</td><td><input type="button" value="导出" onmousedown="downloadStuinfo();" > </td> </tr>
					<tr> <td>报名信息：</td><td><input type="file" name="stubm" id="stubm" accept=".xls,.xlsx">
						<input type="button" value="上传"  onmousedown="shaun()">
					</td> </tr>
				</table>
			</form>
		</fieldset>
		<div align="left" class="wp80 mt20">注：1、报名信息导入学号、身份证号至少填一项;</div>
		<div align="left" class="wp80 ml60 mt5">2、姓名、检定职业为必填项;</div>
		<div align="left" class="wp80 ml60  mt5">3、学号或者身份证号对应的姓名与录入的姓名必须一致;</div>
		<div align="left" class="wp80 ml60  mt5">4、如果二次导入信息，则将覆盖原来信息，并将标明为"补考";</div>
	</div>
</body> 
</html>

 
