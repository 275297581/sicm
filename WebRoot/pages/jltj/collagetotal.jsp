<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <% 
  	String xyid = request.getParameter("xyid");
  	String nj = request.getParameter("nj");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>学院奖励明细</title>
	<link  rel="stylesheet" type="text/css" href="/css/all.css" />
 	<link  rel="stylesheet" type="text/css" href="/css/detail.css" />
	<script type="text/javascript" src="/js/pager.js"></script>
 	<script type="text/javascript" src="/js/jquery.js"></script>  
 	<script type="text/javascript" src="/js/LodopFuncs.js"></script>
  	<script type="text/javascript">
  		$(document).ready(function () { 
		 	queryClassInfo();
		});
		var cals;
		var xymc ="";
		function queryClassInfo(){
			var xyid ="<%=xyid %>";
			var nj = "<%=nj %>";
			var url ="/queryClassTj";
			var param = {Rand:Math.random(),xy:xyid};
			if(nj!=""){
				url+="?nj="+nj;
			}
			$.getJSON(url,param,function(data){ 
			 	cals = data.cals;
			 	var htmls=""; 
			 	var totalnum = 0;
				var totalmoney =0;
				for(var i = 0 ; i < cals.length;i++){
					totalnum +=cals[i].pnum;
					totalmoney+=cals[i].tmoney;
					htmls+="<tr>"+  
							"<td class='tab3' >"+(i+1)+"</td>"+
							"<td class='tab3'>"+cals[i].bjmc+"</td>"+
							"<td class='tab3'>"+cals[i].pnum+"</td>"+
							"<td class='tab3'>"+cals[i].tmoney+"</td> "+
							"</tr>";
							xymc = cals[i].xymc;
				} 
				
				htmls+="<tr>"+  
						"<td class='tab3' ></td>"+
						"<td class='tab3 allfc'>合计</td>"+
						"<td class='tab3 allfc'>"+totalnum+"</td>"+
						"<td class='tab3 allfc'>"+totalmoney+"</td> "+
						"</tr>"; 
		  		$("#trs").html(htmls); 
		  		stab(); 
			});
		}
		function daochu(){
			if(!window.confirm("确定要导出学院明细吗？")){
				return;
			} 
			var title=xymc;  
			if("<%=nj %>"!="0") title = title+ <%=nj %>+"年级";
			title+="明细表";
			
			title = encodeURI(encodeURI(title));//进行格式化编码
			
			var xyid ="<%=xyid %>";
			var nj = "<%=nj %>";
			var url ="/printTotalJl";
				url+="?key=2&title="+title+"&xy="+xyid+"&nj="+nj;
				
		    window.location.href = url;
		}
		
		function printVal(){
			if(cals.length==0){ alert("请统计出数据后进行打印！"); return ;}
			if(!confirm("请确定要打印奖励统计信息！")) return;
			var njs ="" ;
			if("<%=nj %>"!="0") njs =<%=nj %>+"年级";
			var data = new Array();
			data.push("<table width='100%' ><tbody>");
			data.push("<tr><td align='center' style='font-size: 18px; font-weight: bold; font-family: 宋体'>"+xymc+njs+"奖励明细</td></tr>");
			data.push("</tbody></table>");
			
			data.push("<table   border='1' bordercolor='#000000' style='border-collapse:collapse;text-align:center;font-size:12px;' width='100%' ><tbody>");
			data.push("<tr>");
			data.push("<th >序号</th>");
			data.push("<th >班级</th>");
			data.push("<th >人数</th>");
			data.push("<th >金额(元)</th>"); 
			data.push("</tr>");
			
			var totalnum = 0;
			var totalmoney =0;
			for(var i = 0 ; i < cals.length;i++){
				totalnum +=cals[i].pnum;
				totalmoney+=cals[i].tmoney;
			    data.push("<tr>");
			    data.push("<td >"+ (i+1) +"</td>");
			    data.push("<td >"+cals[i].bjmc+"</td>");
			    data.push("<td >"+cals[i].pnum+"</td>");
			    data.push("<td >"+cals[i].tmoney+"</td>"); 
			    data.push("</tr>");
			}
			
			data.push("<tr> <td > </td>"); 
		    data.push("<td >合计</td>");
		    data.push("<td >"+totalnum+" </td>");
		    data.push("<td >"+totalmoney+"</td>"); 
		    data.push("</tr>");
			data.push("</tbody></table>");
			
			data.push("</br></br>");
			
			data.push("<table  style='text-align:right;font-size:12px;' width='100%' ><tbody>");
			data.push("<tr>");
		    data.push("<td >制表人：</td><td width='60px' align='left'>${userName}</td>");
		    data.push("<td >部门负责人：</td><td width='60px'></td>");
		    data.push("<td >学生处：</td><td width='60px'></td>");
		    data.push("<td >继续教育中心：</td><td width='60px'></td>"); 
		    data.push("</tr>");
		    
		    data.push("<tr>");
		    data.push("<td >主管院长：</td><td ></td>");
		    data.push("<td >院长：</td><td ></td>");
		    data.push("<td >财务处：</td><td ></td>");
		    data.push("<td  colspan='2'  align='center'>盖章</td>"); 
		    data.push("</tr>");
		    var now = new Date(); 
			var nowStr = now.format("yyyy-MM-dd"); 
			data.push("</tbody></table>");
			
 			data.push("</br>");
			
			data.push("<table  style='text-align:right;font-size:12px;' width='90%' ><tbody>");
		    data.push("<tr>"); 
		    data.push("<td align='right'>制表时间："+nowStr+"</td>"); 
		    data.push("</tr>");
		    
		    data.push("<tr>"); 
		    data.push("<td  align='right'>打印格式：A4</td>"); 
		    data.push("</tr>");
		    
			data.push("</tbody></table>");
			lodopPContent(data.join(''),1);
		}
	Date.prototype.format = function(format){ 
		var o = { 
		"M+" : this.getMonth()+1, //month 
		"d+" : this.getDate(), //day 
		"h+" : this.getHours(), //hour 
		"m+" : this.getMinutes(), //minute 
		"s+" : this.getSeconds(), //second 
		"q+" : Math.floor((this.getMonth()+3)/3), //quarter 
		"S" : this.getMilliseconds() //millisecond 
		} ;
	
		if(/(y+)/.test(format)) { 
		format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
		} 
	
		for(var k in o) { 
		if(new RegExp("("+ k +")").test(format)) { 
		format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length)); 
		} 
		} 
		return format; 
	};
  	</script>
  </head>
  
  <body>
     <div align="center">
	 	 <table  class="f13 tab wp100"  align="center" bordercolor="#D0D0D0" border="1px" >
	 	 	<tr class="h30" > 
	 	 	<td class="dt2">
	 	 	    <input type="button" style="color: blue;font-weight: bold;" value="导出"  title="导出学院明细" onmousedown="daochu();" class="w60">
	 	 		<input type="button" style="color: blue;font-weight: bold;" value="打印" title="打印信息" onmousedown="printVal();" class="w60">
	 	 	</td> 
	 	 	</tr>
	 	 </table>
 	</div>  
	<div  class="wp100"> 
	 	 <table class="f13 tab wp100" id="tab" align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr > 
			<th class="tab2 w50">序号</th>
			<th class="tab2">班级</th>
			<th class="tab2">人数</th> 
			<th class="tab2">金额(元)</th> 
			</tr>
			<tbody id="trs"> 
			</tbody>
			</table>  
	</div>
  </body>
</html>
