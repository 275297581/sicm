<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
  	<%
  		String id =request.getParameter("id");
  	 %>
    <title>审核通过意见</title>
    <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 	<script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript"> 
    	  
		function guanbi(){
			window.close();
		} 
		function agreekd(){
			var y1 = $('#y1').val();
			if(y1==""){ alert("继续教育中心意见不能为空！");return;}
			var y2 = $('#y2').val();
			if(y2==""){ alert("主管院领导意见不能为空！");return;}
			
			var url ="/agreejdkd";
			var param ={zyj:y1,jyj:y2,id:<%=id %>,Rand:Math.random()};
				$.getJSON(url,param,function(data){
					window.close();    
				}); 
			}
    </script>
  </head>
  		
  <body>
    	<div align="center" class="m10">
    		<table class="f13">
    		<tr>
    		<td class="dt1  w130" align="right">继续教育中心意见：</td>
	 	 	 <td class="dt2"><textarea rows="5" cols="40" id="y1" style="resize: none;" ></textarea></td>
	 	 	 <tr> 
	 	 	 <td class="dt1  w130"  align="right">主管院领导意见：</td>
	 	 	 <td class="dt2"><textarea rows="5" cols="40" id="y2" style="resize: none;" ></textarea></td>
	 	 	 </tr> 
    		</table>
    		<div align="center" >
    			<input type="button" value="通过" style="color: blue;font-weight: bold;" class="mr10" onmousedown="agreekd();">
    			<input type="button" value="关闭" style="color: blue;font-weight: bold;" onmousedown="guanbi();" >
    		</div>
    	</div>
  </body>
</html>
