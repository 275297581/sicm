<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
  	<%
  		String id =request.getParameter("id");
  	 %>
    <title>打印鉴定考点</title>
    <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 	<script type="text/javascript" src="/js/jquery.js"></script>
 	<script type="text/javascript" src="/js/LodopFuncs.js"></script>
 <script language="javascript" type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript"> 
    	$(document).ready(function () { 
 	    	findjdkd(); 
		});
		function findjdkd(){
			var param = {id:<%=id %>,Rand:Math.random()};
			$.getJSON("/queryOneJdKd",param,function(data){
				  var kdxx = data.kdxx;
				 	$('#jg').html(kdxx.fzjg);
				  	$('#kdm').html(kdxx.kdm);
				  	$('#sj').html(kdxx.jlsj);
				  	$('#fzjg').html(kdxx.fzjg);
				 	$('#qx').html(kdxx.sqsj);
				 	$('#xm').html(kdxx.sqxm);
				 	$('#sx').html(kdxx.sqsx);
				 	$('#zxyj').html(kdxx.jxjyzxyj);
				 	$('#ldyj').html(kdxx.zgyldyj);
				 	$('#bz').html(kdxx.bz); 
			});
		}
		function printkd(){
			CreateOneFormPage();
			LODOP.PREVIEW();
		}
		function printkd1(){
			CreateOneFormPage();
			LODOP.PRINT();
		}
		function CreateOneFormPage(){
			LODOP=getLodop();
			LODOP.ADD_PRINT_HTM(20,30,730,1100,document.getElementById("printval").innerHTML);
		}	 
    </script>
  </head>
  <body>
  		<div align="center">
    		<input type="button" value="打印预览" onmousedown="printkd();" style="color: blue;font-weight: bold;" title="打印预览查看">
    		<input type="button" value="打印" onmousedown="printkd1();" style="color: blue;font-weight: bold;" title="直接进行打印">
    	</div> 
    	<div align="center" id="printval">
    		<div style="font-size: 22;font-weight: bold;margin-top: 30px" align="center"><span id="jg"></span>职业技能鉴定及专项技能考点备案表 </div>
    		<table style="font-size: 16px;width: 95%;margin-top: 50px;border-collapse:collapse; " align="center" bordercolor="black" border="1px" >
    		<tr style="height: 60px">
    		<td style="text-align: center; width: 150px;">鉴定考点名称</td>
	 	 	 <td style="text-align: center;" id="kdm"></td>
	 	 	 <td style="text-align: center; width: 150px;">建立时间</td>
	 	 	 <td style="text-align: center;" id="sj"></td>
	 	 	 </tr>
	 	 	 <tr style="height: 60px">
    		<td style="text-align: center;">管理机构</td>
	 	 	 <td style="text-align: center;" id="fzjg"></td>
	 	 	 <td style="text-align: center;">授权期限</td>
	 	 	 <td style="text-align: center;" id="qx"></td>
	 	 	 </tr>
	 	 	 <tr style="height: 60px">
	 	 	 <td style="text-align: center;">授权项目</td>
	 	 	 <td style="text-align: center;" id="xm" colspan="3"></td> 
	 	 	 </tr>
	 	 	 <tr style="height: 230px">
	 	 	 <td style="text-align: center;">授权事项</td>
	 	 	 <td style="text-align: center;" id="sx" colspan="3"></td> 
	 	 	 </tr>
	 	 	 <tr style="height: 120px">
	 	 	 <td style="text-align: center;">继续教育中心意见</td>
	 	 	 <td style="text-align: center;" id="zxyj" colspan="3"></td> 
	 	 	 </tr>
	 	 	 <tr style="height: 120px">
	 	 	 <td style="text-align: center;">主管院领导意见</td>
	 	 	 <td style="text-align: center;" id="ldyj" colspan="3"></td> 
	 	 	 </tr>
	 	 	 <tr style="height: 120px">
	 	 	 <td style="text-align: center;">备  注</td>
	 	 	 <td style="text-align: center;" id="bz" colspan="3"></td> 
	 	 	 </tr> 
    		</table> 
    		<div style="margin-top: 30px">
	 	 	 	<div style="margin-right: 100px" align="right"> 填表人：</div>
	 	 	 	<div style="margin-right: 30px;margin-top: 20px"  align="right"> 年 &nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;  日</div>
	 	 	</div>
    	</div> 
  </body>
</html>
