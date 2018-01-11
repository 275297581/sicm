<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<link  rel="stylesheet" type="text/css" href="/css/all.css" />
	<script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/pager.js"></script>
	<script type="text/javascript">
	
	function downloadBankInfo(){
		var url="/downBankxls";
		window.location.href=url; 
	}
     function check(){ 
		if($('#bankInfo').val()==""){
			alert("请选择需要上传的文件！");
			return ;
		}else{
			/* $.blockUI();*/
			$('#form1').submit();
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
			<td><span class="tf"> 学生银行账号导入</span></td>
		</tr>
	</table> 
	<div align="center" class=" mt50">
		<fieldset class="wp80 mt20">
			<legend>学生银行账号信息</legend>
			<form action="/uploadBankInfo"  id="form1" enctype="multipart/form-data" method="post">
				<table >
					<tr><td class="w150">学生银行账号模板：</td><td><input type="button" value="导出" onmousedown="downloadBankInfo();" > </td> </tr>
					<tr> <td>学生银行账号信息：</td><td><input type="file" name="bankInfo" id="bankInfo" alt="浏览" accept=".xls,.xlsx">
								<input type="button" value="上传"  onmousedown="check()">
					</td> </tr>
				</table>
			</form>
		</fieldset>
	</div>
</body>
</html>
