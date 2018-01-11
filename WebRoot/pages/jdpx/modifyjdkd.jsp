<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
  	<%
  		String id =request.getParameter("id");
  	 %>
    <title>鉴定培训机构修改</title>
    <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 	<script type="text/javascript" src="/js/jquery.js"></script>
 <script language="javascript" type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript"> 
    	$(document).ready(function () { 
 	    	findjdkd();
		});
		
		function findjdkd(){
			var param ={id:<%=id %>,Rand:Math.random()};
			$.getJSON("/queryOneJdKd",param,function(data){
				  var kdxx = data.kdxx;
				  	$('#kdm').val(kdxx.kdm);
				 	$('#jg').val(kdxx.fzjg);
				 	$('#bz').val(kdxx.bz);
				 	$('#xm').val(kdxx.sqxm);
				 	$('#sx').val(kdxx.sqsx);
				 	$('#qx').val(kdxx.sqsj);
			}); 
		} 
		function guanbi(){
			window.close();
		}
		
		function modify(){
			var kdm = $('#kdm').val();
			var jg = $('#jg').val();
			var xm = $('#xm').val();
			var sx = $('#sx').val();
			var bz = $('#bz').val();
			var qx = $('#qx').val();
			if(kdm==""){ alert("考点名称不能为空！");return;}
			if(jg==""){ alert("管理机构不能为空！");return;}
			var param = {kdm:kdm,jg:jg,xm:xm,sx:sx,bz:bz,qx:qx,id:<%=id %>,Rand:Math.random()};
			$.post("/modifyjdkd",param,function(data){
				   alert(data.mess);
				   window.close();
			}); 
		}
    </script>
  </head>
  		
  <body>
    	<div align="center" class="mt10">
    		<table class="f13">
    		<tr class="h30">
    		<td class="dt1  w100" align="right">考点名称：</td>
	 	 	 <td class="dt2"><input type="text" id="kdm" class="w200"> </td>
	 	 	 </tr>
	 	 	 <tr> 
	 	 	 <td class="dt1  w100"  align="right">管理机构：</td>
	 	 	 <td class="dt2"><input type="text" id="jg" class="w200"> </td>
	 	 	 </tr>
	 	 	 <tr class="h30">
    		 <td class="dt1  w100" align="right">授权期限：</td>
	 	 	 <td class="dt2"><input type="text" id="qx" class="w200"  onmousedown="WdatePicker()"> </td>
	 	 	 </tr>
	 	 	 <tr class="h30"> 
    		 <td class="dt1  w100" align="right">授权项目：</td>
	 	 	 <td class="dt2"><input type="text" id="xm" class="w200"> </td> 
	 	 	 </tr>
	 	 	 <tr class="h30">
	 	 	 <td class="dt1  w100"  align="right">授权事项：</td>
	 	 	 <td class="dt2"><input type="text" id="sx" class="w200"> </td>
	 	 	  
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
