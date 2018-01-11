function printVal(){ 
    if(val.length==0){ alert("请统计出数据后进行打印！"); return ;}
    if(!confirm("请确定要打印证书统计信息！")) return;
    
    var title=""; 
    if($('#xy').val()!="0") title= $('#xy').find("option:selected").text();
	if($('#zy').val()!="0") title = title+$('#zy').find("option:selected").text(); 
	if(title=="") title ="陕西工业职业技术学院"; 
	title =title + $('#nj').val(); 
	title =title+"年级证书综合统计";
	
    var data = new Array();
    data.push("<table width='100%' ><tbody>");
    data.push("<tr><td align='center' style='font-size: 18px; font-weight: bold; font-family: 宋体'>"+title+"</td></tr>");
    data.push("</tbody></table>");
    
    data.push("<table   border='1' bordercolor='#000000' style='border-collapse:collapse;text-align:center;font-size:12px;' width='100%' ><tbody>");
    data.push("<tr>");
    data.push("<th rowspan='2'>序号</th>");
    data.push("<th rowspan='2'>专业代码</th>");
    data.push("<th rowspan='2'>专业名称</th>");
    data.push("<th rowspan='2'>专业方向代码</th>");
    data.push("<th rowspan='2'>专业方向名称</th>");
    data.push("<th rowspan='2'>毕业生总数</th>");
    data.push("<th colspan='2'>初级</th>");
    data.push("<th colspan='2'>中级</th>");
    data.push("<th colspan='2'>高级</th>");
    data.push("<th colspan='2'>无等级</th>");
    data.push("<th rowspan='2'>获得证书率（%）</th>");
    data.push("<th rowspan='2'>所属二级学院</th>");
    data.push("<th rowspan='2'>毕业年度</th>"); 
    data.push("</tr>");
    
    data.push("<tr>");
    data.push("<th >人数</th>");
    data.push("<th >比例(%)</th>");
    data.push("<th >人数</th>");
    data.push("<th >比例(%)</th>");
    data.push("<th >人数</th>");
    data.push("<th >比例(%)</th>");
    data.push("<th >人数</th>");
    data.push("<th >比例(%)</th>");
    data.push("</tr>"); 
    
    var data1 = new Array();
    var totalP =0;
    var cjrs = 0;
    var zjrs = 0;
    var gjrs = 0;
    var wdjrs = 0;
    for(var i = 0 ; i < val.length;i++){
    	 totalP += val[i].byrs;
         cjrs +=val[i].cjrs;
         zjrs +=val[i].zjrs;
         gjrs +=val[i].gjrs;
         wdjrs +=val[i].wdjrs;
        data1.push("<tr>");
        data1.push("<td >"+(i+1)+"</td>");
        data1.push("<td >"+ val[i].zydm +"</td>"); 
        data1.push("<td >"+ val[i].zymc +"</td>");
        data1.push("<td >"+ val[i].zydm +"</td>"); 
        data1.push("<td >"+ val[i].zymc +"</td>");
        data1.push("<td >"+ val[i].byrs +"</td>"); 
        data1.push("<td >"+ val[i].cjrs +"</td>"); 
        data1.push("<td >"+ val[i].cjbl +"</td>"); 
        data1.push("<td >"+ val[i].zjrs +"</td>"); 
        data1.push("<td >"+ val[i].zjbl +"</td>"); 
        data1.push("<td >"+ val[i].gjrs +"</td>");
        data1.push("<td >"+ val[i].gjbl +"</td>"); 
        data1.push("<td >"+ val[i].wdjrs +"</td>"); 
        data1.push("<td >"+ val[i].wdjbl +"</td>"); 
        data1.push("<td >"+ val[i].hdzs +"</td>");
        data1.push("<td >"+ val[i].xymc +"</td>"); 
        data1.push("<td >"+ val[i].bynd +"</td>"); 
        data1.push("</tr>");
    }
    var cjbl = cjrs *100 /totalP;
    var zjbl = zjrs *100 /totalP;
    var gjbl = gjrs *100/totalP;
    var wdjbl = wdjrs *100/totalP;
    
    var hjbl = (cjrs+zjrs+gjrs+wdjrs) *100/totalP;
    
    data.push("<tr>");
    data.push("<td >合计</td>");
    data.push("<td >"+ val.length +"</td>"); 
    data.push("<td ></td>");
    data.push("<td >"+ val.length +"</td>"); 
    data.push("<td ></td>");
    data.push("<td >"+ totalP +"</td>"); 
    data.push("<td >"+ cjrs +"</td>"); 
    data.push("<td >"+ cjbl.toFixed(2) +"</td>"); 
    data.push("<td >"+ zjrs +"</td>"); 
    data.push("<td >"+ zjbl.toFixed(2) +"</td>"); 
    data.push("<td >"+ gjrs +"</td>"); 
    data.push("<td >"+ gjbl.toFixed(2) +"</td>"); 
    data.push("<td >"+ wdjrs +"</td>"); 
    data.push("<td >"+ wdjbl.toFixed(2) +"</td>"); 
    data.push("<td >"+ hjbl.toFixed(2) +"</td>");
    data.push("<td ></td>"); 
    data.push("<td ></td>"); 
    data.push("</tr>");
    data.push(data1.join(''));
    data.push("</tbody></table>");
    lodopPContent(data.join(''),2);
}
function getxy(){
	var url="/queryxy";
	$.getJSON(url,null,function(data){ 
		var cols = data.collages;
		var htmls="";
		for(var i=0;i<cols.length;i++){
			htmls +="<option value='"+cols[i].xyid+"'>"+cols[i].xymc+"</option>";
		}
		$("#xy").append(htmls); 
	}); 
}
function getzy(){
	var xy =$('#xy').val();
	if(xy!=null && xy!=0){
		var url="/queryzy?xy="+xy;
		$.getJSON(url,null,function(data){ 
			var zys = data.zyxxs;
			var htmls="";
			for(var i=0;i<zys.length;i++){
				htmls +="<option value='"+zys[i].zyid+"'>"+zys[i].zymc+"</option>";
			}
			$("#zy").append(htmls); 
		}); 
	}
}
function setnj(){
	var htmls="";
	for(var i=2010;i<2020;i++){
		htmls +="<option value='"+i+"'>"+i+"</option>";
	} 
	$("#nj").append(htmls);
}
function getzslx(){
		var url="/getlx";
		$.getJSON(url,null,function(data){ 
			var lxs = data.zslxs; 
			var htmls="";
			htmls +="<option value='校外类'>校外类</option>";
			for(var i=0;i<lxs.length;i++){
				htmls +="<option value='"+lxs[i]+"'>"+lxs[i]+"</option>";
			}
			$("#lx").append(htmls); 
		}); 
	}
function getzs(){
	var lx =$('#lx').val();
	if(lx=="") return;
	lx=encodeURI(lx);
	var url="/queryzs";
	$.getJSON(url,{zslx:lx},function(data){ 
		var zs = data.zss;
		var htmls="<option value=''>--请选择--</option>";
		for(var i=0;i<zs.length;i++){
			htmls +="<option value='"+zs[i]+"'>"+zs[i]+"</option>";
		}
		$("#zs").html(htmls);
	}); 
}
var val;
function showVal(){
	 var url ="/queryZSTJ";
	 var param ={xy:$('#xy').val(),zy:$('#zy').val(),nj:$('#nj').val(),zslx:$('#lx').val(),zs:$('#zs').val(),Rand:Math.random()};
	 $.getJSON(url,param,function(data){
	 	 	val =data.cals;
			var htmls="";
			var totalP =0;
		    var cjrs = 0;
		    var zjrs = 0;
		    var gjrs = 0;
		    var wdjrs = 0;
			for(var i = 0 ; i < val.length;i++){
				 totalP += val[i].byrs;
		         cjrs +=val[i].cjrs;
		         zjrs +=val[i].zjrs;
		         gjrs +=val[i].gjrs;
		         wdjrs +=val[i].wdjrs;
				htmls+="<tr>"+  
						"<td class='tab3'>"+(i+1)+"</td>"+
						"<td class='tab3'>"+val[i].zydm+"</td>"+
						"<td class='tab3'>"+val[i].zymc+"</td>"+ 
						"<td class='tab3'>"+val[i].byrs+"</td>"+
						"<td class='tab3'>"+val[i].cjrs+"</td>"+
						"<td class='tab3'>"+val[i].cjbl+"</td>"+
						"<td class='tab3'>"+val[i].zjrs+"</td>"+
						"<td class='tab3'>"+val[i].zjbl+"</td>"+
						"<td class='tab3'>"+val[i].gjrs+"</td>"+
						"<td class='tab3'>"+val[i].gjbl+"</td>"+
						"<td class='tab3'>"+val[i].wdjrs+"</td>"+
						"<td class='tab3'>"+val[i].wdjbl+"</td>"+
						"<td class='tab3'>"+val[i].hdzs+"</td>"+
						"<td class='tab3'>"+val[i].xymc+"</td>"+
						"<td class='tab3'>"+val[i].bynd+"</td>"+
			 			"</tr>"; 
				}
			 	var cjbl = cjrs *100 /totalP;
			    var zjbl = zjrs *100 /totalP;
			    var gjbl = gjrs *100/totalP;
			    var wdjbl = wdjrs *100/totalP; 
			    var hjbl = (cjrs+zjrs+gjrs+wdjrs) *100/totalP;
			    if(val.length!=0)
					htmls+="<tr style='text-align:center;'>"+
					    "<td style='color:red'>合计</td>"+
					    "<td >"+ val.length +"</td>"+ 
					    "<td ></td>"+
					    "<td >"+ totalP +"</td>"+ 
					    "<td >"+ cjrs +"</td>"+ 
					    "<td >"+ cjbl.toFixed(2) +"</td>"+ 
					    "<td >"+ zjrs +"</td>"+ 
					    "<td >"+ zjbl.toFixed(2) +"</td>"+ 
					    "<td >"+ gjrs +"</td>"+ 
					    "<td >"+ gjbl.toFixed(2) +"</td>"+ 
					    "<td >"+ wdjrs +"</td>"+ 
					    "<td >"+ wdjbl.toFixed(2) +"</td>"+ 
					    "<td >"+ hjbl.toFixed(2) +"</td>"+
					    "<td ></td>"+ 
					    "<td ></td>"+ 
					    "</tr>";
			 
	  		$("#trs").html(htmls);
		stab();
	 }); 
} 
function pagerselect(index){
	showVal();
}
function exportVal(){
  if(!window.confirm("确定要导出证书统计吗？")){
		return;
	}
  var title=""; 
  	if($('#xy').val()!="0") title= $('#xy').find("option:selected").text();
	if($('#zy').val()!="0") title = title+$('#zy').find("option:selected").text(); 
	if(title=="") title ="陕西工业职业技术学院"; 
	title =title + $('#nj').val(); 
	title =title+"年级证书综合统计";
	
	title = encodeURI(encodeURI(title));//进行格式化编码
	
	var url ="/exportZstj";
		url+="?xy="+$('#xy').val();
		url+="&zy="+$('#zy').val();
		url+="&nj="+$('#nj').val();
		url+="&zslx="+$('#lx').val();
		url+="&zs="+$('#zs').val();
		url+="&title="+title; 
    window.location.href = url;
} 
