<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
  	<%
  		String id =request.getParameter("id");
  	 %>
    <title>奖励标准修改</title>
   <link  rel="stylesheet" type="text/css" href="/css/all.css" />
    <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 	<script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript"> 
    $(document).ready(function () { 
	 		 qjl();
		});
		function qjl(){
			var url="/queryJlById?zsid=<%=id%>";
				$.getJSON(url, null, function(data) {
					var zs = data.zs;
					$('#zsmc').html(zs.zsmc);
				});
		} 
		function modify(){ 
			var m;
			var xf; 
			if($('#money').val()==""){
				 m =0;
			}else if($('#money').val()<0){
				alert("奖励金额不能小于0");
				return;
			}else{
				m = $('#money').val();
			}
			if($('#xf').val()==""){
				 xf = 0;
			}else if($('#xf').val()<0){
				alert("奖励学分不能小于0");
				return;
			}else{
				xf =$('#xf').val();
			}
			var Rand = Math.random(); 
		 	var param = {Rand:Rand,money:m,xf:xf,zsid:<%=id%>};
			var url="/modifyJl";
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
    			<td align="right" class="w100 dt1">证书名称：</td>
   				<td align="left" class="w200 dt2" ><span id="zsmc"></span></td> 
    		</tr>
    		<tr>
    			<td  class="dt1" align="right">奖励金额：</td>
   				<td class="dt2" align="left"><input type="text" id="money" class="w150"> </td> 
    		</tr>
    		<tr>
    			<td align="right" class="dt1">奖励学分：</td>
   				<td align="left" class="dt2"><input type="text" id="xf" class="w150"> </td> 
    		</tr> 
    		</table>
    		<div align="center" class="mt10"> 
    			<input type="submit" value="修改" style="color: blue;font-weight: bold;" onmousedown="modify();">
    			<input type="button" value="关闭" style="color: blue;font-weight: bold;" onmousedown="guanbi()"  >
    		</div>
    	</div>
  </body>
</html>
