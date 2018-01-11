<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
 <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
  <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <script type="text/javascript" src="/js/jquery.js"></script>
 <script type="text/javascript"> 
	$(document).ready(function () { 
	 	var xsid=${stu.xsid};
	 	querystubysfzh(xsid);
	 	queryonescore(xsid);
	 	queryscore(xsid);
	 	querykszs(xsid);
	});
	 function querystubysfzh(xsid){
	  		var url ="/querystubyxsid?xsid="+xsid;
			 $.getJSON(url,{Rand:Math.random()},function(data){
			 var s=data.stu;
			 	$("#xh").html(s.xh);
			 	$("#xm").html(s.xm);
			 	$("#xb").html(s.xb);
			 	$("#sfzh").html(s.sfzh);
			 	$("#xymc").html(s.zyxx.collage.xymc);
			 	$("#zymc").html(s.zyxx.zymc);
			 	$("#bjmc").html(s.bjmc);
			 	$("#zyfxmc").html(s.zyxx.zymc);
			 	$("#zzmm").html(s.zzmm);
			 	$("#lxdh").html(s.lxdh);
			 	$("#jg").html(s.jg);
			 }); 
	}
	function queryonescore(xsid){
	   var url ="/queryOnesCore?xsid="+xsid; 
	   $.getJSON(url,{Rand:Math.random()},function(data){
		 var s=data.bmxxs;
	 	//alert("ok1"+s[0].zyzs.zsmc);
	 	var htmls="";
		for(var i = 0 ; i < s.length;i++){
	    htmls+="<tr >"+  
			"<td class='dt2'>"+s[i].stu.xm+"</td>"+
			"<td class='dt2'>"+s[i].bmdd+"</td>"+
			 "<td class='dt2'>"+s[i].bmsj+"</td> "+
			"<td class='dt2'>"+s[i].zyzs.fzjg+"</td>"+
			"<td class='dt2'>"+s[i].zyzs.zsmc+"</td> "+
			"<td class='dt2'>"+s[i].jdkm+"</td> "+
			"<td class='dt2'>"+s[i].stu.lxdh+"</td>"+
			"<td class='dt2'>"+s[i].bkxx+"</td>"+
			"<td class='dt2'>"+s[i].zpcj+"</td>"+ 
			"<td class='dt2'>"+s[i].bmjg+"</td>"+
			"</tr>"; 
		}
		//alert(htmls);
  		$("#tab1").append(htmls);
	   }); 
	};
	function queryscore(xsid){
	   var url ="/queryscore?xsid="+xsid; 
	   $.getJSON(url,{Rand:Math.random()},function(data){
		var s=data.scors;
		//alert(s[0].bmxx.zyzs.zsmc);
	 	var htmls="";
		for(var i = 0 ; i < s.length;i++){
	    htmls+="<tr >"+  
			"<td class='dt2'>"+s[i].zkzh+"</td>"+
			"<td class='dt2'>"+s[i].bmxx.bmsj+"</td>"+
			 "<td class='dt2'>"+s[i].bmxx.zyzs.zsmc+"</td> "+
			"<td class='dt2'>"+s[i].bmxx.zyzs.zsdj+"</td>"+
			"<td class='dt2'>"+s[i].llcj+"</td> "+
			 "<td class='dt2'>"+s[i].sccj+"</td> "+
			"<td class='dt2'>"+s[i].wycj+"</td> "+
			"<td class='dt2'>"+s[i].zhcj+"</td>"+
			"<td class='dt2'>"+s[i].pdcj+"</td>"+
			"</tr>"; 
		}
		//alert(htmls);
  		$("#tab4").append(htmls); 
	   }); 
	};	
	
function querykszs(xsid){
	   var url ="/querykszs"; 
	   var param = {xsid:xsid,Rand:Math.random()};
	   $.getJSON(url,param,function(data){
		var s=data.kszss; 
	 	var htmls="";
		for(var i = 0 ; i < s.length;i++){
	    htmls+="<tr >"+  
			"<td class='dt2'>"+s[i].zkzh+"</td>"+
			"<td class='dt2'>"+s[i].zsbh+"</td>"+
			"<td class='dt2'>"+s[i].zyzs.zsmc+"</td> "+
			"<td class='dt2'>"+s[i].zyzs.zsdj+"</td>"+
			"<td class='dt2'>"+s[i].fzrq+"</td> "+
			"<td class='dt2'>"+s[i].cdrq+"</td> "+
			"<td class='dt2'>"+s[i].xf+"</td> "+
			"<td class='dt2'>"+s[i].money+"</td>"+
			"</tr>"; 
		}
		//alert(htmls);
  		$("#tab3").append(htmls);
	   }); 
	};		
		
</script>
</head>
<body>
	<!-- 头部 -->
	<table width="100%" border="0" bgcolor="#353c44" align="center"
		cellpadding="0" cellspacing="0">
		<tr>
			<td height="24" width="35"><span class="ml10"><img
					src="/pages/images/tb.gif" width="14" height="14" />
			</span>
			</td>
			<td><span class="tf">学生信息查询</span><span class="tf"></span></td>
		</tr>
	</table> 
	<div align="center">
		<fieldset class="wp99 f13 mt20">
			<legend>学生基本信息</legend>
			
			<table class="f13 tab wp100" id="tab"  align="center" bordercolor="#D0D0D0" border="1px"  > 
				<tr class="h30"> 
					<td class="dt1 w80 ">学号：</td><td class="dt2" ><span id="xh"></span></td>
					<td class="dt1 ">姓名：</td><td class="dt2"><span id="xm"></span></td>
					<td class="dt1 ">姓别：</td><td class="dt2"><span id="xb"></span></td>
					<td class="dt1 ">身份证号：</td><td class="dt2"><span id="sfzh"></span></td>
				</tr>
				<tr class="h30">
					<td class="dt1 ">学院名称：</td><td class="dt2"><span id="xymc"></span></td>
					<td class="dt1 w80">专业名称：</td><td class="dt2"><span id="zymc"></span></td>
					<td class="dt1 ">班级名称：</td><td class="dt2"><span id="bjmc"></span></td>
					<td class="dt1 ">专业方向：</td><td class="dt2"><span id="zyfxmc"></span></td>
				</tr>
				<tr class="h30">
					<td class="dt1 ">政治面貌：</td><td class="dt2"><span id="zzmm"></span></td>
					<td class="dt1 ">联系电话：</td><td class="dt2"><span id="lxdh"></span></td>
					<td class="dt1 w80">籍贯：</td><td class="dt2"><span id="jg"></span></td>
					<td class="dt1"></td><td class="dt2"><br></td>
				</tr>
			</table>
		</fieldset>
			<fieldset class="wp99 f13 mt20">
			<legend>学生报名信息</legend>
			<table class="f13 tab wp100" id="tab1"  align="center" bordercolor="#D0D0D0" border="1px"  > 
				<tr>
			<th class="tab2">姓名</th> 
			<th class="tab2">报名地点</th>
			<th class="tab2">报名时间</th>
			<th class="tab2">鉴定机构</th> 
			<th class="tab2">鉴定职业</th> 
			<th class="tab2">鉴定科目</th> 
			<th class="tab2">联系电话</th>
			<th class="tab2">补考信息</th> 
			<th class="tab2">照片采集</th>
			<th class="tab2">报名机构</th>
			</tr>
		</table>
		</fieldset>
		<fieldset class="wp99 f13 mt20">
			<legend>学生成绩信息</legend>
			<table class="f13 tab wp100" id="tab4"  align="center" bordercolor="#D0D0D0" border="1px"  > 
				<tr>
					<td class="tab2">准考证号</td>
					<td class="tab2">报名时间</td>
					<td class="tab2">鉴定职业</td>
					<td class="tab2">级别</td>
					<td class="tab2">理论成绩</td>
					<td class="tab2">实操成绩</td>
					<td class="tab2">外语成绩</td>
					<td class="tab2">综合成绩</td>
					<td class="tab2">评定成绩</td>
				</tr>
			
			</table>
			
			</fieldset>
				<div id="pager"></div> 
		<fieldset class="wp99 f13 mt20">
			<legend>考取证书信息</legend>
			<table class="f13 tab wp100" id="tab3"  align="center" bordercolor="#D0D0D0" border="1px"  > 
				<tr>
					<td class="tab2">准考证号</td>
					<td class="tab2">证书编号</td>
					<td class="tab2">证书名称</td>
					<td class="tab2">证书等级</td>
					<td class="tab2">发证日期</td>
					<td class="tab2">存档日期</td>
					<td class="tab2">学分</td>
					<td class="tab2">奖励标准</td>
				</tr>
			  </table>
			</fieldset>
				<div id="pager"></div> 
	</div>
</body> 
</html>

 
