<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>考生详细信息</title>
	<% String id =request.getParameter("id"); %>
	<style type="text/css">
		.c1{
			color: #4589C8;
		} 
	</style>
 <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
  <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <script type="text/javascript" src="/js/jquery.js"></script>
 <script type="text/javascript"> 
	$(document).ready(function () {  
	 	queryKaoShiInfo(); 
	});
	 function queryKaoShiInfo(){
			 var url ="/querykaoshibyid?bmid=<%=id%>";
			 $.getJSON(url,{Rand:Math.random()},function(data){
			 	var ks=data.bmxx; 
			 	$("#xh").html(ks.stu.xh);
			 	$("#xm").html(ks.stu.xm);
			 	$("#xb").html(ks.stu.xb);
			 	$("#sfzh").html(ks.sfzh); 
			 	
			 	$("#ksly").html(ks.stu.zyxx.collage.xymc); 
			 	$("#whcd").html(ks.whcd);
			 	$("#gzdw").html(ks.gzdw); 
			 	$("#zynx").html(ks.zynx);
			 	
			 	$("#jdzy").html(ks.zyzs.zsmc); 
			 	$("#jdjg").html(ks.zyzs.fzjg);
			 	$("#sxzy").html(ks.stu.zyxx.zymc); 
			 	$("#jb").html(ks.zyzs.zsdj);
			 	
			 	$("#jdkm").html(ks.jdkm); 
			 	$("#bmd").html(ks.bmdd);
			 	$("#lxdh").html(ks.lxdh); 
			 	$("#bkxx").html(ks.bkxx);
			 	
			 	$("#zpcj").html(ks.zpcj); 
			 	$("#bmjg").html(ks.bmjg);
			 	$("#khh").html(ks.khh); 
			 	$("#yhzh").html(ks.yhzh);
			 	
			 	$("#likd").html(ks.kdxxByLlkd!=null?ks.kdxxByLlkd.kdm:""); 
			 	$("#lisj").html(ks.lisj);
			 	$("#likc").html(ks.llkcmc); 
			 	$("#lizw").html(ks.llzwh);
			 	
			 	$("#sckd").html(ks.kdxxBySckd!=null?ks.kdxxBySckd.kdm:""); 
			 	$("#scsj").html(ks.scsj);
			 	$("#sckc").html(ks.sckcmc); 
			 	$("#sczw").html(ks.sczwh);
			 	
			 	$("#wykd").html(ks.kdxxByWykd!=null?ks.kdxxByWykd.kdm:""); 
			 	$("#wysj").html(ks.wysj);
			 	$("#wykc").html(ks.wykcmc); 
			 	$("#wyzw").html(ks.wyzwh);
			 	
			 	$("#zhkd").html(ks.kdxxByZhkd!=null?ks.kdxxByZhkd.kdm:""); 
			 	$("#zhsj").html(ks.zhsj);
			 	$("#zhkc").html(ks.zhkcmc); 
			 	$("#zhzw").html(ks.zhzwh);
			 }); 
		};
</script>
</head>
<body> 
	<div align="center">  
		<table class="f13 tab wp90 m10 mt20" id="tab"  align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr class="h30"> 
				<td class="dt1 w150 ">学&nbsp;&nbsp;&nbsp;号：</td><td class="dt2 w400" ><span id="xh"></span></td>
				<td class="dt1 w150">姓&nbsp;&nbsp;&nbsp;名：</td><td class="dt2 w400"><span id="xm"></span></td>
			</tr>
			<tr class="h30">	
				<td class="dt1">姓&nbsp;&nbsp;别：</td><td class="dt2"><span id="xb"></span></td>
				<td class="dt1">身份证号：</td><td class="dt2"><span id="sfzh"></span></td>
			</tr>
			<tr class="h30">
				<td class="dt1">考生来源：</td><td class="dt2"><span id="ksly"></span></td>
				<td class="dt1">文化程度：</td><td class="dt2"><span id="whcd"></span></td>
			</tr>
			<tr class="h30">
				<td class="dt1">工作单位：</td><td class="dt2"><span id="gzdw"></span></td>
				<td class="dt1">职业年限：</td><td class="dt2"><span id="zynx"></span></td>
			</tr>
			<tr class="h30">
				<td class="dt1">鉴定职业：</td><td class="dt2"><span id="jdzy"></span></td>
				<td class="dt1">鉴定机构：</td><td class="dt2"><span id="jdjg"></span></td>
			</tr>
			<tr class="h30">
				<td class="dt1">所学专业：</td><td class="dt2"><span id="sxzy"></span></td>
				<td class="dt1">级&nbsp;&nbsp;别：</td><td class="dt2"><span id="jb"></span></td>
			</tr>
			<tr class="h30">
				<td class="dt1">鉴定科目：</td><td class="dt2"><span id="jdkm"></span></td>
				<td class="dt1">报名点：</td><td class="dt2"><span id="bmd"></span></td>
			</tr>
			<tr class="h30">
				<td class="dt1">联系电话：</td><td class="dt2"><span id="lxdh"></span></td>
				<td class="dt1">补考信息：</td><td class="dt2"><span id="bkxx"></span></td>
			</tr>
			<tr class="h30">
				<td class="dt1">照片采集：</td><td class="dt2"><span id="zpcj"></span></td>
				<td class="dt1">报名机构：</td><td class="dt2"><span id="bmjg"></span></td>
				</tr>
			<tr class="h30">
				<td class="dt1">开户行：</td><td class="dt2"><span id="khh"></span></td>
				<td class="dt1">银行账号：</td><td class="dt2"><span id="yhzh"></span></td>
			</tr> 
			<tr class="h30 mt20">
				<td class="dt1 c1">理论考点：</td><td class="dt2 c1"><span id="likd"></span></td>
				<td class="dt1 c1">考试时间：</td><td class="dt2 c1"><span id="lisj"></span></td>
				</tr>
			<tr class="h30">
				<td class="dt1 c1">考场名称：</td><td class="dt2 c1"><span id="likc"></span></td>
				<td class="dt1 c1">座位号：</td><td class="dt2 c1"><span id="lizw"></span></td>
			</tr>
			<tr class="h30">
				<td class="dt1">实操考点：</td><td class="dt2"><span id="sckd"></span></td>
				<td class="dt1">考试时间：</td><td class="dt2"><span id="scsj"></span></td>
				</tr>
			<tr class="h30">
				<td class="dt1 c2">考场名称：</td><td class="dt2"><span id="sckc"></span></td>
				<td class="dt1 c2">座位号：</td><td class="dt2"><span id="sczw"></span></td>
			</tr>
			<tr class="h30">
				<td class="dt1 c1">外语考点：</td><td class="dt2 c1"><span id="wykd"></span></td>
				<td class="dt1 c1">考试时间：</td><td class="dt2 c1"><span id="wysj"></span></td>
				</tr>
			<tr class="h30">
				<td class="dt1 c1">考场名称：</td><td class="dt2 c1"><span id="wykc"></span></td>
				<td class="dt1 c1">座位号：</td><td class="dt2 c1"><span id="wyzw"></span></td>
			</tr>
			<tr class="h30">
				<td class="dt1">综合考点：</td><td class="dt2"><span id="zhkd"></span></td>
				<td class="dt1">考试时间：</td><td class="dt2"><span id="zhsj"></span></td>
				</tr>
			<tr class="h30">
				<td class="dt1">考场名称：</td><td class="dt2"><span id="zhkc"></span></td>
				<td class="dt1">座位号：</td><td class="dt2"><span id="zhzw"></span></td>
			</tr>
		</table> 
		</div> 
</body> 
</html> 