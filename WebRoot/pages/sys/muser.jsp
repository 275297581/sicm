<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
  	<%
  		String uid =request.getParameter("id");
  	 %>
    <title>添加用户</title>
    <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 	<script type="text/javascript" src="/js/jquery.js"></script>
 	 <script language="javascript" type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript"> 
   	
	function guanbi(){
		window.close();
	} 
	$(document).ready(function () { 
	 		 queryoneuser();
	}); 
	function queryoneuser(){
		var Rand = Math.random(); 
		var param = {Rand:Rand,uid:<%=uid%>};
		var url ="/queryOneUser";
		 $.getJSON(url,param,function(data){ 
	 	 	var suser = data.sysuser;
	 	 	$('#u1').val(suser.userId);
		    $('#u2').val(suser.userName);
		    $('#u3').val(suser.locked ? "true" : "false" );
		    $('#u4').val(suser.createTime);
		    $('#u5').val(suser.descr); 
	 	 });
	} 
		//用户添加
	function mUser(){
		var u2 = $('#u2').val();
		var u3 = $('#u3').val(); 
		var u5 = $('#u5').val(); 
	 	if(u2==""){
			alert("用户名不能为空！");
			return;
		}
		if(!window.confirm("本次修改只能修改用户名、状态以及备注！确定要修改用户信息吗？")){return;}
		 var Rand = Math.random(); 
		 var param = {Rand:Rand,uid:<%=uid%>,uname:u2,lock:u3,descr:u5};
		 var url ="/modifyuser"; 
	 	 $.getJSON(url,param,function(data){ 
	 	 	alert(data.mess);
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
		 <input type="button" value="修改" onmousedown="mUser();" />
		</div> 
		</div>
  </body>
</html>
