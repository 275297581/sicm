  
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 <script type="text/javascript" src="/js/pager.js"></script>
 <script type="text/javascript" src="/js/jquery.js"></script> 
<script type="text/javascript" src="RcjdCount.js"></script></head>
<body> 
	<table width="100%" border="0" bgcolor="#353c44" align="center"
		cellpadding="0" cellspacing="0">
		<tr>
			<td height="24" width="35"><span class="ml10"><img
					src="/pages/images/tb.gif" width="14" height="14" />
			</span>
			</td>
			<td><span class="tf">日常鉴定证书统计</span></td>
		</tr>
	</table>  
	<!-- 内容 -->
 	 <div align="center">
	 	 <table  class="f13 tab wp100"  align="center" bordercolor="#D0D0D0" border="1px" >
	 	 	<tr class="h30">
	 	 	<td class="dt1  w80">学院：</td><td class="dt2">
	 	 	<select name='xy' id="xy" class="w150" onchange="getzy();"><option value="0">--请选择--</option> </select></td> 
	 	 	<td class="dt1  w80">专业：</td> <td class="dt2">
	 	 	<select name='zy' id="zy" class="w150" onchange="getbj();"><option value="0">--请选择--</option> </select></td> 
	 	 	<td class="dt1">年级：</td><td class="dt2">
	 	 	<select name='nj' id="nj" class="w150" >
	 	 	<option value="">--请选择--</option> 
	 	 	</select></td> 
 	 	   </tr>
	 	 	<tr class="h30">
 	 	    <td class="dt1">班级：</td><td class="dt2">
 	 	    <select name='bj' id="bj" class="w150" >
	 	 	<option value="">--请选择--</option>
	 	 	</select>
	 	 	 </td> 
	 	 	 <td class="dt1  w80">证书名称：</td> <td class="dt2">
	 	 	<select name='zs' id="zs" ><option value="">--请选择--</option> </select></td> 
	 	 	 
	 	 	<td class="dt2" colspan="2">
	 	 		<input type="button" style="color: blue;font-weight: bold;" value="查询" title="查询英语证书信息" onmousedown="showVal(1);" class="w60">
	 	 		<input type="button" style="color: blue;font-weight: bold;" value="导出" title="导出查询所有数据" onmousedown="exportVal();" class="w60">
	 	 	</td>
	 	 	</tr> 
	 	 </table>
 	</div>  
	<div  class="wp100"> 
	 	 <table class="f13 tab wp100" id="tab" align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr>
			<th class="tab2">序号</th>
			<th class="tab2">学号</th>
			<th class="tab2">姓名</th> 
			<th class="tab2">学院名称</th>
			<th class="tab2">专业名称</th> 
			<th class="tab2">年级</th>
			<th class="tab2">班级名称</th>
			<th class="tab2">证书名称</th>
			<th class="tab2">证书等级</th>
			<th class="tab2">奖励金额(元)</th>
			</tr> 
			<tbody id="trs">
			</tbody>
			</table> 
			<div id="pager"></div> 
	</div>
	
</body> 
</html>
 