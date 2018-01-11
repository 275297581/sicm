<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     
    <title>学生银行信息</title>
    <% String id =request.getParameter("id"); %>
	  <link  rel="stylesheet" type="text/css" href="/css/all.css" />
    <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 	<script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript"> 
    $(document).ready(function () { 
	 		 qBankInfo();
		});
		function qBankInfo(){
			var url="/queryBankInfo?stuid=<%=id%>";
				$.getJSON(url, null, function(data) {  
					$('#khh').val(data.bankName);
					$('#yhzh').val(data.bankNo);
				});
		} 
		function modify(){ 
			var khh = $('#khh').val();
			var yhzh = $('#yhzh').val(); 
			var Rand = Math.random(); 
		 	var param = {Rand:Rand,bankName:khh,bankNo:yhzh,stuid:<%=id%>};
			var url="/modifyYhzh";
				$.getJSON(url, param, function(data) {
					alert("修改成功！");
					window.close();
				});
		} 
		function guanbi() {
			window.close();
		}
	</script>
  </head>
  		
  <body>
    	<div align="center" class="m10">
    		<table class="f13" align="center"> 
    		<tr>
    			<td  align="right">开户行：</td>
   				<td align="left"><input type="text" id="khh" class="w150"> </td> 
    		</tr>
    		<tr>
    			<td align="right">银行账号：</td>
   				<td align="left" ><input type="text" id="yhzh" class="w150"> </td> 
    		</tr> 
    		</table>
    		<div align="center" class="mt10"> 
    			<input type="button" value="修改" style="color: blue;font-weight: bold;" onmousedown="modify();">
    			<input type="button" value="关闭" style="color: blue;font-weight: bold;" onmousedown="guanbi()"  >
    		</div>
    	</div>
  </body>
</html>
