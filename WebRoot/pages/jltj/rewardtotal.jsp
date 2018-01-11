  <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 <script type="text/javascript" src="/js/pager.js"></script>
 <script type="text/javascript" src="/js/jquery.js"></script>  
 <script type="text/javascript" src="rewardtotal.js"></script>
<script type="text/javascript" src="/js/LodopFuncs.js"></script>
 </head>
<body> 
	<table class="wp100" border="0" bgcolor="#353c44" align="center"
		cellpadding="0" cellspacing="0">
		<tr>
			<td height="24" width="35"><span class="ml10"><img
					src="/pages/images/tb.gif" width="14" height="14" />
			</span>
			</td>
			<td><span class="tf">奖励汇总</span></td>
		</tr>
	</table>
	<!-- 内容 -->
 	 <div align="center">
	 	 <table  class="f13 tab wp100"  align="center" bordercolor="#D0D0D0" border="1px" >
	 	 	<tr class="h30">
 	 	   <td class="dt1  w80">学院名称：</td>
 	 	   <td class="dt2 w200" >
	 	 	<select name='xy' id="xy" class="w150"><option value="">--请选择--</option> </select></td> 
	 	 	<td class="dt1  w80">年级：</td>
	 	 	<td class="dt2 w200">
	 	 	<select name='nj' id="nj" class="w150" >
	 	 	<option value="">--请选择--</option> 
	 	 	</select></td> 
	 	 	<td class="dt2" colspan="3">
	 	 		<input type="button" style="color: blue;font-weight: bold;" value="查询" title="查询奖励汇总信息" onmousedown="showJl();" class="w60">
	 	 		<input type="button" style="color: blue;font-weight: bold;" value="导出" title="将查询的汇总信息进行导出" onmousedown="daochu();" class="w60">
	 	 		<input type="button" style="color: blue;font-weight: bold;" value="打印" title="打印奖励统计" onmousedown="printVal();" class="w60">
	 	 	</td> 
	 	 	</tr>
	 	 </table>
 	</div>  
	<div  class="wp100"> 
	 	 <table class="f13 tab wp100" id="tab" align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr > 
			<th class="tab2 w50">序号</th>
			<th class="tab2">学院</th>
			<th class="tab2">班级数</th>
			<th class="tab2">奖励数</th> 
			<th class="tab2">金额(元)</th> 
			<th class="tab2">学分</th> 
			</tr>
			<tbody id="trs"> 
			</tbody>
			</table>  
	</div> 
</body> 
</html>

 
 