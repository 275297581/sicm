<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>角色信息添加</title>
    <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 	<script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript"> 
    	  
		function guanbi(){
			window.close();
		} 
		function Add(){
			if($('#rolename').val()==""){ alert("角色名称不能为空！");return ;}
			var url ="/addrole";
			var Rand = Math.random();  
	 		var param = {Rand:Rand,roleName:$('#rolename').val(),descr:$('#descr').val()};
			$.getJSON(url,param,function(data){
				   alert("添加成功");
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
    			<input type="submit" value="添加" class="mr10" onmousedown="Add();">
    			<input type="button" value="关闭" onmousedown="guanbi();" >
    		</div>
    	</div>
  </body>
</html>
