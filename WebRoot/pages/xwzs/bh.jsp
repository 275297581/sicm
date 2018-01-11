<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
  	<%
  		String id =request.getParameter("id");
  	 %>
    <title>驳回原因</title>
    <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 	<script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript"> 
      
		function guanbi(){
			window.close();
		}
		
		function modify(){
			var bz =$('#bz').val();
			if(bz==""){ alert("驳回原因不能为空！");return;} 
			$.getJSON("/bhzs?id=<%=id%>&bz="+bz,null,function(data){
				   window.close();
			}); 
		}
    </script>
  </head>
  		
  <body>
    	<div align="center" class="m10">
    		<table class="f13">
    		<tr class="h30">
	 	 	 <td class="dt1" align="right">原因：</td> 
	 	 	<td class="dt2" ><textarea rows="5" id="bz" cols="45" style="resize: none;" ></textarea></td> 
	 	 	</tr>
    		</table>
    		<div align="center" >
    			<input type="button" value="驳回" style="color: blue;font-weight: bold;" class="mr10" onmousedown="modify();">
    			<input type="button" value="关闭" style="color: blue;font-weight: bold;" onmousedown="guanbi();" >
    		</div>
    	</div>
  </body>
</html>
