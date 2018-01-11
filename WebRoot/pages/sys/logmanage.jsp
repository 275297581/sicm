<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
   	 <link href="../../css/all.css" rel="stylesheet" type="text/css" />
	 <script type="text/javascript" src="../../js/pager.js"></script> 
  </head>
  
  <body> 
  <div id="pager"></div> 
</body>
		<script type="text/javascript">
		var pager =spager(500);
		pager.onclick = function(index){
			 alert(index);
		};
	 </script>
</html>
