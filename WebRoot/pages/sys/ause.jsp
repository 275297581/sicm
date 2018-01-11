<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>添加用户</title>
    <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 	<script type="text/javascript" src="/js/jquery.js"></script>
 	 <script language="javascript" type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript"> 
    	function guanbi(){
			window.close();
		}
		//用户添加
	    function aUser(){ 
		   var u1 = $('#u1').val();
			var u2 = $('#u2').val();
			var u3 = $('#u3').val(); 
			var u5 = $('#u5').val();
			if(u1==""){
				alert("用户登录名不能为空！");
				return;
			}
		 	if(u2==""){
				alert("用户名不能为空！");
				return;
			}
			var Rand = Math.random(); 
			var param = {Rand:Rand,userId:u1,uname:u2,lock:u3,descr:u5};
			var url ="/adduser";
		 	 $.getJSON(url,param,function(data){ 
		 });
	}
    </script>
  </head>
  		
  <body>
    	<div class="ml50 mt10">
			 <table class="f13" width="350" border="0" align="center" cellpadding="0" cellspacing="0" >
		 	<tr>
		 	<td class="w80 h35">登录名：</td>
		 	<td ><input type="text" id="u1" class="w250"/> </td>
		 	</tr>
		 	<tr>
		 	<td class="w80 h35">用户名：</td>
		 	<td ><input type="text" id="u2" class="w250"/> </td>
		 	</tr>
		 	<tr>
		 	<td class="w80 h35">使用状态：</td>
		 	<td ><select id="u3" class="w250">
		 			<option value="false">未锁定</option>
		 			<option value="true">锁定</option>
		 		</select>
		 	</td>
		 	</tr>
		 	<tr>
		 	<td class="w80 h35">创建时间：</td>
		 	<td ><input type="text" id="u4" class="w250"   onmousedown="WdatePicker()"/> </td>
		 	</tr>
		 	<tr>
		 	<td class="w80 h100">备注：</td>
		 	<td ><textarea rows="5" cols="25"  class="w250 f13" id="u5" ></textarea> </td>
		 	</tr> 
		 </table> 
		 <div class="m20" align="center">  
		 <input type="button" value="关闭" onmousedown="guanbi();">
		 <input type="button" value="添加" onmousedown="aUser();" />
		</div> 
		</div>
  </body>
</html>
