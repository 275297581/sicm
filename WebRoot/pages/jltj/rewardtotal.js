$(document).ready(function () { 
	 getxy();
	 setnj();
	 showJl();
}); 
function setnj(){
	var htmls="";
	for(var i=2008;i<2020;i++){
		htmls +="<option value='"+i+"'>"+i+"</option>";
	} 
	$("#nj").append(htmls);
}
function getxy(){
	var url="/queryxy";
	$.getJSON(url,{Rand:Math.random()},function(data){ 
		var cols = data.collages;
		var htmls="";
		for(var i=0;i<cols.length;i++){
			htmls +="<option value='"+cols[i].xyid+"'>"+cols[i].xymc+"</option>";
		}
		$("#xy").append(htmls); 
	}); 
} 
var cals;
function showJl(){ 
	 var url ="/queryJl";
	 var param ={xy:$('#xy').val(),nj:$('#nj').val(),Rand:Math.random()};
	 $.getJSON(url,param,function(data){ 
	 	 	cals =data.cals; 
			var htmls=""; 
			var totalnum = 0;
			var totalxf =0;
			var totalmoney =0;
			var stuclasssum=0;
			for(var i = 0 ; i < cals.length;i++){
				totalnum +=cals[i].pnum;
				totalmoney+=cals[i].tmoney;
				totalxf+=cals[i].xf;
				stuclasssum+=cals[i].stuclassnum;
				htmls+="<tr ondblclick='clickRow("+cals[i].xyid+","+($('#nj').val()==""?"0":$('#nj').val())+")'>"+  
						"<td class='tab3' >"+(i+1)+"</td>"+
						"<td class='tab3'>"+cals[i].xymc+"</td>"+
						"<td class='tab3'>"+cals[i].stuclassnum+"</td>"+
						"<td class='tab3'>"+cals[i].pnum+"</td>"+
						"<td class='tab3'>"+cals[i].tmoney+"</td> "+
						"<td class='tab3'>"+cals[i].xf+"</td> "+
						"</tr>";
			} 
			htmls+="<tr>"+  
				"<td class='tab3' ></td>"+
				"<td class='tab3 allfc'>合计</td>"+
				"<td class='tab3 allfc'>"+stuclasssum+"</td>"+
				"<td class='tab3 allfc'>"+totalnum+"</td>"+
				"<td class='tab3 allfc'>"+totalmoney+"</td> "+
				"<td class='tab3 allfc'>"+totalxf+"</td> "+ 
				"</tr>";
						
	  		$("#trs").html(htmls);
			stab();
		 }); 
	}
function clickRow(xyid,nj) { 
  //swnidow(600,600,'/pages/jltj/collagetotal.jsp?nj='+nj+'&xyid='+xyid);
	window.open('/pages/jltj/collagetotal.jsp?nj='+nj+'&xyid='+xyid, '', 'left=0,top=0,width=1000,height=700')
}
 function daochu(){
	if(!window.confirm("确定要导出奖励统计吗？")){
		return;
	}
	var title="陕西工业职业技术学院"; 
	if($('#xy').val()!="") title= $('#xy').find("option:selected").text();
	
	if($('#nj').val()!="") 
		title= title+ $('#nj').val()+"年级"; 
	title =title+"奖励汇总";
	
	title = encodeURI(encodeURI(title));//进行格式化编码
	
	var url ="/printTotalJl";
		url+="?key=1&title="+title+"&xy="+$('#xy').val()+"&nj="+$('#nj').val(); 
	    window.location.href = url;
} 
function printVal(){ 
	if(cals.length==0){ alert("请统计出数据后进行打印！"); return ;}
	if(!confirm("请确定要打印奖励统计信息！")) return;
	
	var title="陕西工业职业技术学院"; 
	if($('#xy').val()!="") title= $('#xy').find("option:selected").text();
	
	if($('#nj').val()!="") 
		title= title+ $('#nj').val()+"年级"; 
	title =title+"奖励汇总";
	
	var data = new Array();
	data.push("<table width='100%' ><tbody>");
	data.push("<tr><td align='center' style='font-size: 18px; font-weight: bold; font-family: 宋体'>"+title+"</td></tr>");
	data.push("</tbody></table>");
	
	data.push("<table   border='1' bordercolor='#000000' style='border-collapse:collapse;text-align:center;font-size:12px;' width='100%' ><tbody>");
	data.push("<tr>");
	data.push("<th >序号</th>");
	data.push("<th >学院</th>");
	data.push("<th >班级数</th>");
	data.push("<th >奖励数</th>");
	data.push("<th >金额(元)</th>"); 
	data.push("</tr>");
	
	var totalnum = 0;
	var totalmoney =0;
	var stuclassnum=0;
	for(var i = 0 ; i < cals.length;i++){
		totalnum +=cals[i].pnum;
		totalmoney+=cals[i].tmoney;
		stuclassnum+=cals[i].stuclassnum;
		
	    data.push("<tr>");
	    data.push("<td >"+ (i+1) +"</td>");
	    data.push("<td >"+cals[i].xymc+"</td>");
	    data.push("<td >"+cals[i].stuclassnum+"</td>");
	    data.push("<td >"+cals[i].pnum+"</td>");
	    data.push("<td >"+cals[i].tmoney+"</td>"); 
	    data.push("</tr>");
	}
	
	data.push("<tr> <td > </td>"); 
    data.push("<td >合计</td>");
    data.push("<td >"+stuclassnum+" </td>");
    data.push("<td >"+totalnum+" </td>");
    data.push("<td >"+totalmoney+"</td>"); 
    data.push("</tr>");
	    
	data.push("</tbody></table>");  
   lodopPContent(data.join(''),1);
}   