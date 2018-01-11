<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
  	<%
  		String id =request.getParameter("id");
  	 %>
    <title>校外证书申请修改</title>
    <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 	<script type="text/javascript" src="/js/jquery.js"></script>
 <script language="javascript" type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript"> 
    	$(document).ready(function () { 
 	    	findzs();
		});
		
		function findzs(){
			var url="/queryOneZs"; 
			var Rand = Math.random(); 
			var param = {id:<%=id %>,Rand:Rand};
			$.getJSON(url,param,function(data){
				  var xwzs = data.xwzs;
				  	$('#zs').val(xwzs.sqzs);
				 	$('#jg').val(xwzs.zskqjg);
				 	$('#bz').val(xwzs.bz); 
			}); 
		} 
		function guanbi(){
			window.close();
		}
		
		function modify(){
			var zs = $('#zs').val();
			var jg = $('#jg').val(); 
			var bz = $('#bz').val(); 
			if(zs==""){ alert("申请证书不能为空！");return;}
			if(jg==""){ alert("证书机构不能为空！");return;}
			var param = {sqzs:zs,jg:jg,bz:bz,id:<%=id %>};
			$.getJSON("/modifyzs",param,function(data){
				   window.close();
			}); 
		}
    </script>
  </head>
  		
  <body>
    	<div align="center" class="mt10">
    		<table class="f13">
    		<tr class="h30">
    		<td class="dt1  w100" align="right">申请证书：</td>
	 	 	 <td class="dt2"><input type="text" id="zs" class="w200"> </td>
	 	 	 </tr>
	 	 	 <tr class="h30"> 
	 	 	 <td class="dt1  w100"  align="right">证书机构：</td>
	 	 	 <td class="dt2"><input type="text" id="jg" class="w200"> </td>
	 	 	 </tr> 
    		<tr class="h30">
	 	 	 <td class="dt1" align="right">备 &nbsp;&nbsp;&nbsp;注：</td> 
	 	 	<td class="dt2" ><textarea rows="5" id="bz" cols="26" style="resize: none;" ></textarea></td> 
	 	 	</tr>
    		</table>
    		<div align="center" >
    			<input type="button" value="修改" style="color: blue;font-weight: bold;" class="mr10" onmousedown="modify();">
    			<input type="button" value="关闭" style="color: blue;font-weight: bold;" onmousedown="guanbi();" >
    		</div>
    	</div>
  </body>
</html>
