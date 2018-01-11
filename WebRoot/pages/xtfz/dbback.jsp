<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 <script type="text/javascript" src="/js/pager.js"></script>
 <script type="text/javascript" src="/js/jquery.js"></script> 
  <script type="text/javascript" src="dbback.js"></script></head>
  <body>
	<!-- 头部 -->
	<table width="100%" border="0" bgcolor="#353c44" align="center"
		cellpadding="0" cellspacing="0">
		<tr>
			<td height="24" width="35">
			<span class="ml10"><img src="/pages/images/tb.gif" width="14" height="14" />
			</span>
			</td>
			<td><span class="tf">系统备份与还原</span></td>
		</tr>
	</table> 
	 <div align="center">
	 	 <table  class="f13 tab wp100"  align="center" bordercolor="#D0D0D0" border="1px" >
	 	 	<tr class="h30">
	 	 	 <td class="dt1 w100">备份名：</td>
	 	 	 <td class="dt2 w300"><input type="text" id="sname" class="w200" > </td>
	 	 	 <td class="dt2" colspan="2"> 
	 	 	 <input id="xtbfbt" type="button" value="备份系统" title="点击进行系统备份" onmousedown="backup();" style="color: blue;font-weight: bold;">
	 	 	 <span id="box" style="display: none;color: red;">系统正在备份，请稍候...</span>
	 	 	  </td>
	 	 	</tr> 
	 	 </table>
 	</div>
 	<div  class="wp100"> 
	 	 <table class="f13 tab wp100" id="tab" align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr > 
			<th class="tab2 w50">序号</th>
			<th class="tab2">备份名</th>
			<th class="tab2">备份时间</th> 
			<th class="tab2">备份大小</th>
			<th class="tab2">操作</th>
			</tr>
			<tbody id="trs"> 
			</tbody>
			</table>  
	</div>
	<div id="pager"></div> 
</body>
</html>
