<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>学生详细信息</title>
	<% String id =request.getParameter("id"); %>
 <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
  <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <script type="text/javascript" src="/js/jquery.js"></script>
 <!--<script type="text/javascript" src="/js/bui.js"></script>-->
 <script type="text/javascript"> 
	$(document).ready(function () { 
	 	var id=<%=id %>;
	 	 
	 	querystubyxsid(id);
	 	queryonescore(id);
	 	queryscore(id);
	 	querykszs(id);
	  
	});
	 function querystubyxsid(xsid){
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
		};
	function queryonescore(xsid){
	   var url ="/queryOnesCore?xsid="+xsid; 
	   $.getJSON(url,{Rand:Math.random()},function(data){
		 var bm=data.bmxxs; 
		// alert("ok:"+url);
	 	var htmls="";
		for(var i = 0 ; i < bm.length;i++){
	    htmls+="<tr >"+  
			"<td class='dt2'>"+bm[i].stu.xm+"</td>"+
			"<td class='dt2'>"+bm[i].bmdd+"</td>"+
			"<td class='dt2'>"+bm[i].bmsj+"</td> "+
			"<td class='dt2'>"+bm[i].zyzs.fzjg+"</td>"+
			"<td class='dt2'>"+bm[i].zyzs.zsmc+"</td> "+ 
			"<td class='dt2'>"+bm[i].jdkm+"</td> "+
			"<td class='dt2'>"+bm[i].stu.lxdh+"</td>"+
			"<td class='dt2'>"+bm[i].bkxx+"</td>"+
			"<td class='dt2'>"+bm[i].zpcj+"</td>"+ 
			"<td class='dt2'>"+bm[i].bmjg+"</td>"+
			"</tr>"; 
		} 
		//alert("ok");
  		$("#tab1").append(htmls);
	   }); 
	};
	function queryscore(xsid){
	   var url ="/queryscore?xsid="+xsid; 
	   $.getJSON(url,{Rand:Math.random()},function(data){
		var cor=data.scors;
	 	var htmls="";
		for(var i = 0 ; i < cor.length;i++){
	    htmls+="<tr >"+  
			"<td class='dt2'>"+cor[i].zkzh+"</td>"+
			"<td class='dt2'>"+cor[i].bmxx.bmsj+"</td>"+
			"<td class='dt2'>"+cor[i].bmxx.zyzs.zsmc+"</td> "+
			"<td class='dt2'>"+cor[i].bmxx.zyzs.zsdj+"</td>"+
			"<td class='dt2'>"+cor[i].llcj+"</td> "+
			"<td class='dt2'>"+cor[i].sccj+"</td> "+
			"<td class='dt2'>"+cor[i].wycj+"</td> "+
			"<td class='dt2'>"+cor[i].zhcj+"</td>"+
			"<td class='dt2'>"+cor[i].pdcj+"</td>"+
			"</tr>"; 
		} 
  		$("#tab4").append(htmls); 
	   }); 
	};	
	
function querykszs(xsid){
	   var url ="/querykszs?xsid="+xsid; 
	   $.getJSON(url,{Rand:Math.random()},function(data){
		var s_zs=data.kszss; 
	 	var htmls="";
		for(var i = 0 ; i < s_zs.length;i++){
	    htmls+="<tr >"+  
			"<td class='dt2'>"+s_zs[i].zkzh+"</td>"+
			"<td class='dt2'>"+s_zs[i].zsbh+"</td>"+
			"<td class='dt2'>"+s_zs[i].zsmc+"</td> "+
			"<td class='dt2'>"+s_zs[i].zsdj+"</td>"+
			"<td class='dt2'>"+s_zs[i].fzrq+"</td> "+
			"<td class='dt2'>"+s_zs[i].cdrq+"</td> "+
			"<td class='dt2'>"+s_zs[i].xf+"</td> "+
			"<td class='dt2'>"+s_zs[i].money+"</td>"+
			"</tr>"; 
		} 
  		$("#tab3").append(htmls);
	   }); 
	};		
		
</script>
</head>
<body> 
	<div align="center">
		<fieldset class="wp98 f13 mt20">
			<legend>学生基本信息展示</legend> 
			<table class="  f13 tab wp100" id="tab"  align="center" bordercolor="#D0D0D0" border="1px"  > 
				<tr class="h30"> 
					<td class="dt1 w80 ">学号：</td><td class="dt2" ><span id="xh"></span></td>
					<td class="dt1  w80">姓名：</td><td class="dt2"><span id="xm"></span></td>
					<td class="dt1  w80">姓别：</td><td class="dt2"><span id="xb"></span></td>
					<td class="dt1  w80">身份证号：</td><td class="dt2"><span id="sfzh"></span></td>
				</tr>
				<tr class="h30">
					<td class="dt1  w80">学院名称：</td><td class="dt2"><span id="xymc"></span></td>
					<td class="dt1 w80">专业名称：</td><td class="dt2"><span id="zymc"></span></td>
					<td class="dt1  w80">班级名称：</td><td class="dt2"><span id="bjmc"></span></td>
					<td class="dt1  w80">专业方向：</td><td class="dt2"><span id="zyfxmc"></span></td>
				</tr>
				<tr class="h30">
					<td class="dt1  w80">政治面貌：</td><td class="dt2"><span id="zzmm"></span></td>
					<td class="dt1  w80">联系电话：</td><td class="dt2"><span id="lxdh"></span></td>
					<td class="dt1 w80">籍贯：</td><td class="dt2"><span id="jg"></span></td>
					<td class="dt1 w80"></td><td class="dt2"><br></td>
				</tr>
			</table>
		</fieldset>
			<fieldset class="wp98 f13 mt20">
			<legend>学生报名信息展示</legend>
			<table class=" f13 tab wp100" id="tab1"  align="center" bordercolor="#D0D0D0" border="1px"  > 
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
		<fieldset class="wp98 f13 mt20">
			<legend>学生成绩信息展示</legend>
			<table class="f13 tab wp100" id="tab4"  align="center" bordercolor="#D0D0D0" border="1px"  > 
				<tr>
					<th class="tab2">准考证号</th>
					<th class="tab2">报名时间</th>
					<th class="tab2">鉴定职业</th>
					<th class="tab2">级别</th>
					<th class="tab2">理论成绩</th>
					<th class="tab2">实操成绩</th>
					<th class="tab2">外语成绩</th>
					<th class="tab2">综合成绩</th>
					<th class="tab2">评定成绩</th>
				</tr>
			
			</table>
			
			</fieldset>
				<div id="pager"></div> 
		<fieldset class="wp99 f13 mt20">
			<legend>学生证书信息展示</legend>
			<table class="f13 tab wp100" id="tab3"  align="center" bordercolor="#D0D0D0" border="1px"  > 
				<tr>
					<th class="tab2">准考证号</th>
					<th class="tab2">证书编号</th>
					<th class="tab2">证书名称</th>
					<th class="tab2">证书等级</th>
					<th class="tab2">发证日期</th>
					<th class="tab2">存档日期</th>
					<th class="tab2">学分</th>
					<th class="tab2">奖励标准</th>
				</tr> 
			</table> 
			</fieldset>
				 
	</div>
</body> 
</html> 