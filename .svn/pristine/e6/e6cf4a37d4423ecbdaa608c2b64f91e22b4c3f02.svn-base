<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 <script type="text/javascript" src="/js/pager.js"></script>
 <script type="text/javascript" src="/js/jquery.js"></script> 
 <script type="text/javascript" src="/pages/zstj/total.js"></script> 
 <script type="text/javascript" src="/js/LodopFuncs.js"></script>
 <script type="text/javascript"> 
	$(document).ready(function () { 
	 		 getxy(); 
	 		 setnj();
	 		 getzslx();
	 		 showVal();
		}); 
</script>
</head>
<body> 
	<table width="100%" border="0" bgcolor="#353c44" align="center"
		cellpadding="0" cellspacing="0">
		<tr>
			<td height="24" width="35"><span class="ml10"><img
					src="/pages/images/tb.gif" width="14" height="14" />
			</span>
			</td>
			<td><span class="tf">证书综合统计</span></td>
		</tr>
	</table>  
	<!-- 内容 -->
 	 <div align="center">
	 	 <table  class="f13 tab wp100"  align="center" bordercolor="#D0D0D0" border="1px" >
	 	 	<tr class="h30">
	 	 	<td class="dt1  w80">学院：</td><td class="dt2">
	 	 	<select name='xy' id="xy" class="w200" onchange="getzy();"><option value="0">--请选择--</option> </select></td> 
	 	 	<td class="dt1  w80">专业：</td> <td class="dt2">
	 	 	<select name='zy' id="zy" class="w200"><option value="0">--请选择--</option> </select></td> 
	 	 	<td class="dt1">年级：</td><td class="dt2">
	 	 	<select name='nj' id="nj" class="w200" >
	 	 	</select></td> 
 	 	   </tr> 
	 	 	<tr >
	 	 	<td class="dt1  w80">类别：</td><td class="dt2">
	 	 	<select name='lx' id="lx" class="w200" onchange="getzs()"><option value="">--请选择--</option> </select></td> 
	 	 	 <td class="dt1  w80">证书名称：</td> <td class="dt2">
	 	 	<select name='zs' id="zs" class="w200" ><option value="">--请选择--</option> </select></td>
	 	 	<td class="dt2" colspan="2">
	 	 		<input type="button" style="color: blue;font-weight: bold;" value="查询" title="查询证书综合统计" onmousedown="showVal();" class="w60">
	 	 		<input type="button" style="color: blue;font-weight: bold;" value="导出" title="导出查询所有数据" onmousedown="exportVal();" class="w60">
	 	 		<input type="button" style="color: blue;font-weight: bold;" value="打印" title="打印统计记录" onmousedown="printVal();" class="w60">
	 	 	</td>
	 	 	</tr> 
	 	 </table>
 	</div>  
	<div  class="wp100" style="overflow:auto;height: 80%" id="divtab"> 
	 	 <table class="f13 tab wp100"  id="tab" align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr height="15px"> 
			<th class="tab2 w50" rowspan="2">序号</th>
			<th class="tab2" rowspan="2">专业代码</th> 
			<th class="tab2" rowspan="2">专业名称</th>
			<!-- <th class="tab2" rowspan="2">专业方向代码</th> 
			<th class="tab2" rowspan="2">专业方向名称</th> -->
			<th class="tab2" rowspan="2">毕业生总数(人)</th>
			<th class="tab2" colspan="2">初级</th> 
			<th class="tab2" colspan="2">中级</th>
			<th class="tab2" colspan="2">高级</th> 
			<th class="tab2" colspan="2">无等级</th>
			<th class="tab2" rowspan="2">获得证书率（%）</th>
			<th class="tab2" rowspan="2">所属二级学院</th>
			<th class="tab2" rowspan="2">毕业年度</th>
			</tr> 
			<tr >  
			<th class="tab2">人数(人)</th> 
			<th class="tab2">比例(%)</th> 
			<th class="tab2">人数(人)</th> 
			<th class="tab2">比例(%)</th>
			<th class="tab2">人数(人)</th> 
			<th class="tab2">比例(%)</th>
			<th class="tab2">人数(人)</th> 
			<th class="tab2">比例(%)</th>
			</tr> 
			<tbody id="trs">
			</tbody> 
			</table> 
	</div>
</body> 
</html>

 
 