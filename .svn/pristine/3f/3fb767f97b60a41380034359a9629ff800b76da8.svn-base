  <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 <script type="text/javascript" src="/js/pager.js"></script>
 <script type="text/javascript" src="/js/jquery.js"></script> 
<script type="text/javascript" src="rewarddetail.js"></script></head>
<script type="text/javascript" src="/js/LodopFuncs.js"></script>
<body>  
	<table width="100%" border="0" bgcolor="#353c44" align="center"
		cellpadding="0" cellspacing="0">
		<tr>
			<td height="24" width="35"><span class="ml10"><img
					src="/pages/images/tb.gif" width="14" height="14" />
			</span>
			</td>
			<td><span class="tf">奖励明细</span></td>
		</tr>
	</table>  
	<!-- 内容 -->
 	 <div align="center">
	 	 <table  class="f13 tab wp100"  align="center" bordercolor="#D0D0D0" border="1px" >
	 	 	<tr class="h30">
	 	 	 <td class="dt1  w80">学院：</td><td class="dt2">
	 	 	<select name='xy' id="xy" class="w150"  onchange="getzy();"><option value="0">--请选择--</option> </select></td> 
	 	 	<td class="dt1  w80">专业：</td> <td class="dt2">
	 	 	<select name='zy' id="zy" class="w150"><option value="0">--请选择--</option> </select></td> 
	 	 	<td class="dt1">年级：</td><td class="dt2">
	 	 	<select name='nj' id="nj" class="w150">
	 	 	<option value="">--请选择--</option> 
	 	 	</select></td>
	 	 	</tr>
	 	 	<tr class="h30">
	 	 	<td class="dt1  w80">证书类型：</td> <td class="dt2">
	 	 	<select name='zslx' id="zslx" class="w150" onchange="lxchange();"><option value="">--请选择--</option> </select></td> 
	 	 	<td class="dt1  w80">证书名称：</td> <td class="dt2">
	 	 	<select name='zyzs' id="zyzs" class="w150"><option value=''>--请选择--</option> </select></td> 
	 	 	<td class="dt2" colspan="2">
	 	 		<input type="button" style="color: blue;font-weight: bold;" value="查询" title="查询学生奖励信息" onmousedown="showJl(1);" class="w60">
	 	 		<input type="button" style="color: blue;font-weight: bold;" value="导出" title="将查询的所有奖励信息进行导出" onmousedown="exportExcel();" class="w60">
	 	 		<input type="button" style="color: blue;font-weight: bold;" value="打印" title="打印明细" onmousedown="prientVal();" class="w60">
	 	 		<input type="text" style="visibility: hidden;" id="uname" value="${userName}">
	 	 	</td>
	 	 	</tr>
	 	 </table>
 	</div>  
	<div  class="wp100"> 
	 	 <table class="f13 tab wp100" id="tab" align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr > 
			<th class="tab2 w50">序号</th>
			<th class="tab2">学院</th>
			<th class="tab2">专业</th> 
			<th class="tab2">年级</th>
			<th class="tab2">姓名</th>
			<th class="tab2">性别</th>
			<th class="tab2">学号</th> 
			<th class="tab2">身份证号</th>
			<th class="tab2">开户行</th> 
			<th class="tab2">银行卡号</th> 
			<th class="tab2">证书名称</th>
			<th class="tab2">证书等级</th>
			<th class="tab2">奖励金额(元)</th>
			<!-- <th class="tab2">实发金额(元)</th> -->
			<th class="tab2">奖励学分</th> 
			<!-- <th class="tab2">实际学分</th>  -->
			<th class="tab2">确认签名</th>
			<th class="tab2">备注</th>
			<!-- 
			<th class="tab2">操作</th>
			-->
			</tr>
			<tbody id="trs">
			
			</tbody>
			</table> 
			<div id="pager"></div>  
	</div> 
</body> 
</html>

 
 