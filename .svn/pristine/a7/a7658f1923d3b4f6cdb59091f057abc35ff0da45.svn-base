<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 <script type="text/javascript" src="/js/pager.js"></script>
 <script type="text/javascript" src="/js/jquery.js"></script> 
 <!--<script type="text/javascript" src="/js/bui.js"></script>--> 
	<script type="text/javascript">
	$(document).ready(function(){
		queryKd(1);
     });
     function queryKd(index){
     	/* $.blockUI();*/
     	var param={index:index,Rand:Math.random()}; 
		var url="/querydshJdKd";
		$.getJSON(url,param,function(data){
			/* $.unblockUI();*/
			 if(index ==1){
				//显示分页导航  
				var pager =spager(data.count);
				//alert(data.count);
				pager.onclick = function(index){
					 pagerselect(index);
				};
			} 	
			var kdxxs = data.kdxxs; 
			var htmls="";
			for(var i = 0 ; i < kdxxs.length;i++){
				htmls +="<tr>"+
				"<td class='tab3'>"+(i+1)+"</td>"+
				"<td class='tab3'>"+kdxxs[i].kdm+"</td>"+
				"<td class='tab3'>"+kdxxs[i].fzjg+"</td>"+ 
				"<td class='tab3'>"+kdxxs[i].jlsj+"</td>"+ 
				"<td class='tab3'>"+(kdxxs[i].sqxm==null ? "" :kdxxs[i].sqxm)+"</td>"+ 
				"<td class='tab3'>"+(kdxxs[i].sqsx==null ? "" :kdxxs[i].sqsx)+"</td>"+ 
				"<td class='tab3'>"+(kdxxs[i].sqsj==null ? "" :kdxxs[i].sqsj)+"</td>"+ 
				"<td class='tab3'>"+kdxxs[i].zt+"</td>"+ 
				"<td class='tab3'><input type='image' src='/icon/detial.png'  title='"+kdxxs[i].bz+"'></td>"+ 
				"<td class='tab3'><input type='image' src='/icon/reject.png'  title='驳回' onmousedown='rejectjdkd("+kdxxs[i].jdkdid+")'>"+
				"&nbsp;&nbsp;<input type='image' src='/icon/throw.png'  title='通过' onmousedown='throwjdkd("+kdxxs[i].jdkdid+")'></td>"+
				"</tr>"; 
			}
		  $('#trs').html(htmls); 
		  stab();	
		}); 
	}
	 function apply(){
	 	var kdm = $('#k1').val();
	 	if(kdm==""){
	 		alert("考点名称不能为空！");
	 		return;
	 	}
	 	var jg = $('#k2').val();
	 	if(jg==""){
	 		alert("管理机构不能为空！");
	 		return;
	 	}
	 	var bz = $('#k3').val();
	 	var param ={kdm:kdm,jg:jg,bz:bz,Rand:Math.random()};
	 	var url ="/addjdkd";
	 	$.post(url,param,function(data){
 			queryKd(1);
			alert(data.mess);
		});
	 }
	 
	 function pagerselect(index){
		queryKd(index);
	}
	 function rejectjdkd(id){
	 	var url ="/pages/jdpx/bh.jsp?id="+id;
	 	swnidow(420,200,url);
		queryKd(1);
	}
	function throwjdkd(id){
		var url ="/pages/jdpx/tg.jsp?id="+id;
	 	swnidow(520,270,url);
		queryKd(1);
	} 
	function print(id){
		alert("打印鉴定考点"+id);
	} 
	</script> 
  </head>
  <body>
	<!-- 头部 -->
	<table width="100%" border="0" bgcolor="#353c44" align="center"
		cellpadding="0" cellspacing="0">
		<tr>
			<td height="24" width="35">
			<span class="ml10"><img src="/pages/images/tb.gif" width="14" height="14" />
			</span>
			</td>
			<td><span class="tf">鉴定考点审批</span></td>
		</tr>
	</table> 
 	<div  class="wp100 mt10"> 
	 	 <table class="f13 tab wp100" id="tab" align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr > 
			<th class="tab2 w50">序号</th>
			<th class="tab2">考点名</th>
			<th class="tab2">管理机构</th> 
			<th class="tab2">建立时间</th>
			<th class="tab2">授权项目</th>
			<th class="tab2">授权事项</th>
			<th class="tab2">授权期限</th>
			<th class="tab2">状态</th>
			<th class="tab2">备注</th> 
			<th class="tab2">操作</th>
			</tr>
			<tbody id="trs">
				
			</tbody>
			</table> 
			<div id="pager"></div> 
	</div> 
</body>
</html>
