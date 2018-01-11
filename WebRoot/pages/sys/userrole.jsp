<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
  	<%
  		String uid =request.getParameter("uid");
  	 %>
    <title>用户授权</title>
    <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 	<script type="text/javascript" src="/js/jquery.js"></script>
 	 <script type="text/javascript" src="/js/pager.js"></script>
    <script type="text/javascript"> 
    	var roles;
    	$(document).ready(function () {
    		var url ="/showrole";
 	    	$.getJSON(url,{Rand:Math.random()},function(data){
				   roles = data.sysroles;
				  	var htmls="";
				  	var k =1;
				  	for(var i = 0 ; i < roles.length;i++){
					  	if(roles[i].rid==1){
					  		continue;
					  	} 
					  	htmls+='<tr>'+ 
						'<td class="tab3 w20"><input type="radio" name="roleid" value="'+roles[i].rid+'" id="r'+roles[i].rid+'"> </td>'+
						'<td class="tab3 w40">'+k+'</td>'+
						'<td class="tab3 w80">'+roles[i].roleName+'</td>'+
						'<td class="tab3 w80">'+roles[i].descr+'</td>'+
						'</tr>';
						k++;
				  	}
				  	 $("#tab").append(htmls); 
				  	 setUrole();
				  	 stab(); 
					}); 
		});
		
		function setUrole(){
		 var url ="/showurole?uid=<%=uid %>";
			$.getJSON(url,{Rand:Math.random()},function(data){
				   var rid ="";
				   rid = data.mess;
				   if(rid!=""){
				   		$("#r"+rid).attr("checked","checked");
				   }
			}); 
		}
		function guanbi(){
			window.close();
		}
		
		function shouquan(){ 
			var roleid;
			for(var i = 0 ; i < roles.length;i++){
				//alert($("#r"+roles[i].rid).attr("checked"));
				if($("#r"+roles[i].rid).attr("checked")==true){
						roleid = roles[i].rid;
						break;
					}
			}
			/* alert(roleid); */
			var url ="/modifyurole?uid=<%=uid %>&rid="+roleid;
			$.getJSON(url,{Rand:Math.random()},function(data){
				   alert(data.mess);
				   window.close();
			});
		}
    </script>
  </head>
  		
  <body >
  <div class=" f12 tab1 wp98">
		 <input type="submit" value="授权" style="color: blue;font-weight: bold;" class="mr10" onmousedown="shouquan();">
 		 <input type="button" value="关闭" style="color: blue;font-weight: bold;" onmousedown="guanbi();" >
 	</div> 
    	<div align="left" class="wp98">
    		<table class="f13 tab wp100" id="tab" bordercolor="#D0D0D0" border="1px"  > 
			<tr> 
			<td class="tab2 w20">选择</td>
			<td class="tab2 w40">序号</td>
			<td class="tab2 w80">角色名</td>
			<td class="tab2 w80">角色描述</td>
			</tr>
		</table> 
    	</div>
  </body>
</html>
