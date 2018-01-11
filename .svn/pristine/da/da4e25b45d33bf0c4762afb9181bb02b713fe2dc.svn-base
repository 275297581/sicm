<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %> 
<% 
	String rand = (String)session.getAttribute("rand");  
	String inputrand = request.getParameter("rand");
	String uid = request.getParameter("uid"); 
	String  pwd= request.getParameter("pwd");
	String ltype = request.getParameter("longType");  
	session.setAttribute("uid", uid);
	session.setAttribute("pwd", pwd);
	session.setAttribute("ltype", ltype);
%>  
<html> 
<style>
	.hed{
		visibility:hidden;
	}
	body { 
		background-color: #D6DBDF;
	} 
</style> 
<body class="hed"> 
	 
	<form action="/login" id="form" method="post" class="hed">
		<input name="uid" id="uid" type="text" value="<%=uid %>">
		<input name="pwd" id="pwd" type="text" value="<%=pwd %>">
		<input name="ltype" id="ltype" type="text" value="<%=ltype %>">
	</form>
</body>
<%
	if(rand.equals(inputrand)){
	//if(1==1){
		 %>
	<script type="text/javascript"> 
		document.getElementById("form").submit(); 
	</script>		
 <%
	} else{  
		out.print("<script>alert('请输入正确的验证码！');location.href='index.jsp?flag=1';</script>"); 
	} 
 %>
</html>
