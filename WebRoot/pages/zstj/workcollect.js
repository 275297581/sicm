 		$(document).ready(function () { 
	 		 //getxy();
	 		 getzslx();
		}); 
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
		
		function getzslx(){
		var url="/getlx";
		$.getJSON(url,null,function(data){ 
			var lxs = data.zslxs; 
			var htmls="";
			htmls +="<option value='0'>--请选择--</option>";
			for(var i=0;i<lxs.length;i++){
				htmls +="<option value='"+lxs[i]+"'>"+lxs[i]+"</option>";
			}
			$("#lx").append(htmls); 
		}); 
	}
	function getzs(){
		var lx =$('#lx').val();
		lx=encodeURI(lx);
		if(lx=="0") return;
		var url="/queryzs";
		$.getJSON(url,{zslx:lx},function(data){ 
			var zs = data.zss;
			var htmls="";
			for(var i=0;i<zs.length;i++){
				htmls +="<option value='"+zs[i]+"'>"+zs[i]+"</option>";
			}
			$("#zs").html(htmls);
		}); 
	}
	
	function createForm(){
		var zs = $("#zs").val();
		if(zs == null){
			alert("请选择证书名称！");
			return ;
		}
		var d1 = $("#d1").val();
		if(d1 == ""){
			alert("请选择起始日期！");
			return ;
		}
		var d2 = $("#d2").val();
		if(d2 == ""){
			alert("请选择结束日期！");
			return ;
		} 
		 var url="/queryworkform";
		$.getJSON(url,{zs:zs,d1:d1,d2:d2,ramdom:Math.random()},function(data){ 
			 $("#w1").html(zs); 
			 $("#w2").val(data.count2);
			 $("#w3").html(data.count); 
			 if(data.count2 !=0 ){
			  	 $("#w4").html(data.count2-data.count);
			  	 $("#w5").html((data.count * 100/data.count2).toFixed(2)+"%");
			 }else{
			 	 $("#w4").html("");
			  	 $("#w5").html("");
			 }
			 $("#w6").html(d1+" ～ "+d2);
			 $("#b2").attr("disabled","");
			 $("#b3").attr("disabled","");
		});
	}
	function changw2(){
		var count =$("#w3").html()*1; 
		var count2 =$("#w2").val()*1;
		if( count2 >= count){
			 $("#w4").html(count2-count);
			 $("#w5").html((count * 100/count2).toFixed(2)+"%");
		}
	}
	function printForm(){ 
	    var data = new Array();
	    data.push("<table width='100%' ><tbody>");
	    data.push("<tr><td align='center' style='font-size: 18px; font-weight: bold; font-family: 宋体'> 职业资格及专项技能证书工作汇总表</td></tr>");
	    data.push("</tbody></table>");
	    
	    data.push("<table class='f15 ' width='90%' cellpadding='0' cellspacing='0' style='text-align: center;' align='center' bordercolor='#D0D0D0' border='1px' >");
		data.push("<tr height='60px'><td width='20%' >证书名称</td><td width='30%'>"+$('#w1').html()+"</td>");
			data.push("<td width='20%' >参加人数</td><td  width='30%'>"+$('#w2').val()+"</td></tr>");
		data.push("<tr height='60px'><td >获证人数</td><td>"+$('#w3').html()+"</td>");
			data.push("<td >未获证人数</td><td>"+$('#w4').html()+"</td></tr>");
		data.push("<tr height='60px'><td >获证比例</td><td>"+$('#w5').html()+"</td>");
			data.push("<td >相关工作起止时间</td><td>"+$('#w6').html()+"</td> </tr>");
		data.push("<tr height='80px'><td >组织过程</td><td colspan='3'>"+$('#w7').val()+"</td> </tr>");
		data.push("<tr height='100px'><td >不足之处</td><td colspan='3'>"+$('#w8').val()+"</td></tr>");
		data.push("<tr height='100px'><td >二级学院（部）院长意见</td><td colspan='3'>"+$('#w9').val()+"</td></tr>");
		data.push("<tr height='100px'><td >继续教育中心意见</td><td colspan='3'>"+$('#w10').val()+"</td></tr>");
		data.push("<tr height='100px'><td >主管院领导意见</td><td colspan='3'>"+$('#w11').val()+"</td></tr> ");
		data.push("</table>");
		
		var now = new Date(); 
		var nowStr = now.format("yyyy年MM月dd日");
		
		data.push("<table width='90%' ><tbody>");
		data.push("<tr height='60px'><td width='50%' align='center'>盖章</td><td  width='50%' align='right'>填表人："+$('#uname').val()+"</td>");
		data.push("<tr height='60px'><td  width='50%'></td><td  width='50%' align='right'>"+nowStr+"</td>"); 
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
	 
	function exportWord(){
		
		if(!window.confirm("确定要导出证书工作汇总表吗？")){
			return;
		}
		var url ="/exportWorkForm";
		var val = $('#w1').html()+"@@"+$('#w2').val()+"@@"+$('#w3').html()+"@@"+$('#w4').html()+"@@"+$('#w5').html()+"@@"+$('#w6').html()+"@@"+$('#w7').val()+"@@"+$('#w8').val()+"@@"+$('#w9').val()+"@@"+$('#w10').val()+"@@"+$('#w11').val();
		val=encodeURI(encodeURI(val));
		url=url+"?val="+val;
		window.location.href = url;
	}
			