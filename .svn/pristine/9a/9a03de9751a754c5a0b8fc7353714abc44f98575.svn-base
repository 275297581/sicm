<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 <script type="text/javascript" src="/js/pager.js"></script>
 <script type="text/javascript" src="/js/jquery.js"></script>  
 <script type="text/javascript" src="/js/LodopFuncs.js"></script>
 <script language="javascript" type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
  <script language="javascript" type="text/javascript" src="/My97DatePicker/config.js"></script>
 <script type="text/javascript" src="/pages/zstj/workcollect.js"></script></head>
  <body>
    <table width="100%" border="0" bgcolor="#353c44" align="center"
		cellpadding="0" cellspacing="0">
		<tr>
			<td height="24" width="35"><span class="ml10"><img
					src="/pages/images/tb.gif" width="14" height="14" />
			</span>
			</td>
			<td><span class="tf">证书工作汇总</span></td>
		</tr>
	</table>
	 <div align="center">
	 	 <table  class="f13 tab wp100"  align="center" bordercolor="#D0D0D0" border="1px" >
	 	 	<tr class="h30">
	 	 	<td class="dt1  w80">证书类别：</td><td class="dt2">
	 	 	<select name='lx' id="lx" class="w200" onchange="getzs()"></select></td> 
	 	 	<td class="dt1  w80">证书名称：</td><td class="dt2">
	 	 	<select name='zs' id="zs" class="w200"></select></td>  
	 	 <!-- 	<td class="dt1  w80">学院名称：</td><td class="dt2">
	 	 	<select name='xy' id="xy" class="w200"></select></td>   -->
 	 	   </tr> 
 	 	   <tr class="h30">
	 	 	<td class="dt1  w80">起始时间：</td><td class="dt2">
	 	 		<input type="text" class="Wdate w200"  id="d1" onfocus="WdatePicker({maxDate:'%y-%M-%d'||'#F{$dp.$D(\'d2\')'})"> 
	 	 	</td> 
	 	 	<td class="dt1">结束时间：</td><td class="dt2">
	 	 		<input type="text" class="Wdate w200"  id="d2" onfocus="WdatePicker({minDate: '#F{$dp.$D(\'d1\')}',maxDate:'%y-%M-%d'})"> 
	 	 		 
	 	 	</td> 
	 	 	<!-- <td colspan="2" class="dt1"></td> -->
 	 	   </tr> 
 	 	   <tr class="h30">
	 	 	 <td  style="background-color:#E7EFF2;" align="center" colspan="4">
	 	 		<input type="button" value="生成汇总表" onclick="createForm();" id="b1"> 
	 	 		<input type="button" value="导出汇总表" disabled="disabled" onclick="exportWord();" id="b2"> 
	 	 		<input type="button" value="打印汇总表" onclick="printForm()" disabled="disabled"  id="b3">
	 	 		<input type="text" style="visibility: hidden;" id="uname" value="${userName}">
	 	 	</td> 
 	 	   </tr> 
 	 	   </table>
 	 	   </div>
 	 	   <hr>
 	 	   <div align="center" style="font-size: 18px;font-weight: bold;">职业资格及专项技能证书工作汇总表</div>
 	 	    <table class="f15 " width="800px" id="tab" cellpadding="0" cellspacing="0" style="text-align: center;" align="center" bordercolor="#D0D0D0" border="1px" >
			<tr height="40px">
				<td width="20%" >证书名称</td><td width="30%"><span id="w1"></span></td>
				<td width="20%" >参加人数</td><td  width="30%"><input type="text" border="0" id="w2" onchange="changw2();"></td>
			</tr>
			<tr height="40px">
				<td >获证人数</td><td><span id="w3"></span></td><td >未获证人数</td><td><span id="w4"></span></td>
			</tr>
			<tr height="40px">
				<td >获证比例</td><td><span id="w5"></span></td><td >相关工作起止时间</td><td><span id="w6"></span></td>
			</tr>
			 <tr height="60px">
				<td >组织过程</td><td colspan="3">
					<textarea rows="3" cols="80" id="w7"></textarea>
				</td>
			</tr>
			<tr height="80px">
				<td >不足之处</td><td colspan="3">
				<textarea rows="5" cols="80"  id="w8"></textarea>
				</td>
			</tr>
			<tr height="80px">
				<td >二级学院（部）院长意见</td><td colspan="3">
				<textarea rows="5" cols="80"  id="w9"></textarea>
				</td>
			</tr>
			<tr height="80px">
				<td >继续教育中心意见</td><td colspan="3">
				<textarea rows="5" cols="80"  id="w10"></textarea>
				</td>
			</tr>
			<tr height="80px">
				<td >主管院领导意见</td><td colspan="3">
				<textarea rows="5" cols="80"  id="w11"></textarea>
				</td>
			</tr> 
		</table>
  </body>
</html>
