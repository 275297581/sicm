$(document).ready(function () { 
	 		 getxy(); 
	 		 setnj(); 
	 		 showVal(1);
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
		function getzy(){
			var xy =$('#xy').val();
			if(xy!=null && xy!=0){
				var url="/queryzy?xy="+xy;
				$.getJSON(url,null,function(data){ 
					var zys = data.zyxxs;
					var htmls="<option value=''>--请选择--</option>";
					for(var i=0;i<zys.length;i++){
						htmls +="<option value='"+zys[i].zyid+"'>"+zys[i].zymc+"</option>";
					}
					$("#zy").html(htmls); 
				}); 
			}
		}
		function getbj(){
			var zy =$('#zy').val();
			if(zy!=null && zy!=0){
				var url="/querybj?zy="+zy;
				$.getJSON(url,null,function(data){ 
					var bjs = data.bjs;
					var htmls="<option value=''>--请选择--</option>";
					for(var i=0;i<bjs.length;i++){
						htmls +="<option value='"+bjs[i].bjmc+"'>"+bjs[i].bjmc+"</option>";
					}
					$("#bj").html(htmls); 
				}); 
			}
		}
		function setnj(){
			var htmls="";
			for(var i=2008;i<2020;i++){
				htmls +="<option value='"+i+"'>"+i+"</option>";
			} 
			$("#nj").append(htmls);
		}
	  function exportVal(){
			  if(pager.itemCount==0){
			  	alert("没有需要导出的数据！");
				return;
			} 
			 if(!window.confirm("确定要导出已查询出数据吗？")){
				return;
			 }   
			 var url ="/exportZsxx"; 
			 url+="?xy="+$('#xy').val();
			 url+="&zy="+$('#zy').val();
			 url+="&nj="+$('#nj').val();
			 url+="&bjmc="+$('#bj').val();
			 url+="&zsfl=校外类";
			 window.location.href = url;
		}
	 	var pager;
		function showVal(index){
			 var url ="/queryXwZs";
			 var xy =$('#xy').val();
			 var zy =$('#zy').val();
			 var nj =$('#nj').val();
			 var bj =$('#bj').val();
			 var param ={index:index,xy:xy,zy:zy,nj:nj,bjmc:bj,Rand:Math.random()};
			 $.getJSON(url,param,function(data){
			 	if(index ==1){
						//显示分页导航  
						pager =spager(data.count); 
						pager.onclick = function(index){
							 pagerselect(index);
						};
					} 	
			 	 	var val =data.kszss;
					var htmls="";
					for(var i = 0 ; i < val.length;i++){
						htmls+="<tr>"+  
								"<td class='tab3'>"+(i+1)+"</td>"+
								"<td class='tab3'>"+val[i].stu.xh+"</td>"+
								"<td class='tab3'>"+val[i].stu.xm+"</td> "+
								"<td class='tab3'>"+val[i].stu.zyxx.collage.xymc+"</td>"+
								"<td class='tab3'>"+val[i].stu.zyxx.zymc+"</td> "+
								"<td class='tab3'>"+val[i].stu.nj+"</td> "+
								"<td class='tab3'>"+val[i].stu.bjmc+"</td> "+
								"<td class='tab3'>"+val[i].zsmc+"</td>"+
								"<td class='tab3'>"+val[i].zsdj+"</td>"+
								"<td class='tab3'>"+val[i].money+"</td>"+
								 "</tr>"; 
					}
			  		$("#trs").html(htmls);
				stab();
			 }); 
		} 
	function pagerselect(index){
		showVal(index);
	} 