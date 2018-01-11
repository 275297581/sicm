<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
  	<%
  		String rid =request.getParameter("rid");
  	 %>
    <title>角色信息修改</title>
    <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 	<script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript"> 
    	$(document).ready(function () { 
		    	var Rand = Math.random(); 
		 		var param = {Rand:Rand};
	 	    	$.getJSON("/getonerole?rid=<%=rid %>",param,function(data){
				  var role = data.sysrole;
				  	$('#rid').val(role.rid);
				 	$('#rolename').val(role.roleName);
				 	$('#descr').val(role.descr);
			}); 
		});
		
		function guanbi(){
			window.close();
		}
		
		function modify(){
			if($('#rolename').val()==""){ alert("角色名称不能为空！");return;}
			var Rand = Math.random(); 
		 	var param = {Rand:Rand,rid:$('#rid').val(),roleName:$('#rolename').val(),descr:$('#descr').val()};
			var url ="/modifyrole";
			$.getJSON(url,param,function(data){
				   alert("修改成功");
				   window.close();
			}); 
		}
    </script>
  </head>
  		
  <body>
    	<div align="center" class="m10">
    		<table class="f13">
    		<tr>
    			<td class="w80">角色名称：</td>
   				<td class="w300"><input type="text" id="rolename" class="w150"> </td> 
    		</tr>
    		<tr>
    			<td>描述：</td>
   				<td><textarea rows="5" cols="30" id="descr" class="w280 f13"></textarea>
				</td> 
    		</tr>
    		</table>
    		<div align="center" class="mt10">
    			<input type="text" class="vh" id="rid" >
    			<input type="submit" value="修改" style="color: blue;font-weight: bold;" class="mr10" onmousedown="modify();">
    			<input type="button" value="关闭" style="color: blue;font-weight: bold;" onmousedown="guanbi();" >
    		</div>
    	</div>
  </body>
</html>
