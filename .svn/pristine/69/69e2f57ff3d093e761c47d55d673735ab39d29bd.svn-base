<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <script type="text/javascript" src="/js/jquery.js"></script> 
  	<link rel="stylesheet" href="/css/left.css" type="text/css"></link>
  	<script type="text/javascript">
  		 function doAction(index){
                 var obj = $('#u' + index); 
                 if(obj.css("display") =="none"){ 
                      obj.slideDown("slow");
              	 }
                for(var i=1;i<10;i++){
                	if(i!=index){
                		var obj1 = $('#u'+ i); 
                		 obj1.slideUp("slow");
                	}
                } 
           }
  	</script>
  </head>
  <body>
   <div>
  <ul id="navigation">
  	<c:forEach items="${sysmenus1}" var="menu1"> 
	    <li onmousedown="doAction(${menu1.mid});"><a class="head" title="${menu1.descr}">${menu1.menuName}</a> 
	      <ul style="display: none; margin-top: 5;margin-bottom: 5" id="u${menu1.mid}">
	      	 <c:forEach items="${sysmenus2}" var="menu2"> 
	      	 	<c:if test="${menu1.mid == menu2.parent }">
		        	<li><a href="/${menu2.url}" title="${menu2.descr}" target="rightFrame">${menu2.menuName}</a></li> 
		        </c:if>
	         </c:forEach>
	      </ul>
	    </li> 
   	</c:forEach>
  </ul>
</div>
  </body>
</html>
