<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<link  rel="stylesheet" type="text/css" href="/css/all.css" />
	<script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/pager.js"></script>
    <!--<script type="text/javascript" src="/js/bui.js"></script>-->
	<script type="text/javascript">
	
	function downloadZyzsinfo(){
		var url="/downkszsxls";
		window.location.href=url; 
	}
     function check(){ 
		if($('#zyzsinfo').val()==""){
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
			<td><span class="tf">校外证书导入</span></td>
		</tr>
	</table> 
	<div align="center" class=" mt50">
		<fieldset class="wp80 mt20">
			<legend>校外证书信息</legend>
			<form action="/uploadxwzsinfo"  id="form1" enctype="multipart/form-data" method="post">
				<table >
					<tr><td class="w150">证书信息模板：</td><td><input type="button" value="导出" onmousedown="downloadZyzsinfo();"  > </td> </tr>
					<tr> <td>校外证书信息：</td><td><input type="file" name="kszsinfo" id="kszsinfo" accept=".xls,.xlsx">
								<input type="button" value="上传"  onmousedown="check()">
					</td> </tr>
				</table>
			</form>
		</fieldset>
		<div align="left" class="wp80 mt20">注：1、导入信息中姓名、鉴定职业、等级归类为必填项，学号、身份证号至少一项必填；</div>
		<div align="left" class="wp80 ml60 mt5">2、校外证书导入必须进行校外证书申请、并且申请已经通过才能导入；</div>
	</div>
</body>
</html>
