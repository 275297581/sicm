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
		queryZs(1);
     });
     function queryZs(index){
     	/* $.blockUI();*/ 
 		var param = {Rand:Math.random(),index:index};
		var url="/querySpZs";
		$.getJSON(url,param,function(data){ 
			 /* $.unblockUI();*/
			 if(index ==1){
				//显示分页导航  
				var pager =spager(data.count); 
				pager.onclick = function(index){
					 pagerselect(index);
				};
			}
			var zs = data.zs; 
			var htmls="";
			for(var i = 0 ; i < zs.length;i++){
			var zsbh = "";
			if(zs[i].zsbh!=null){
				zsbh = zs[i].zsbh;
			}
				htmls +="<tr>"+
				"<td class='tab3'>"+(i+1)+"</td>"+
				"<td class='tab3'>"+zs[i].stu.xm+"</td>"+
				"<td class='tab3'>"+zs[i].sfzh+"</td>"+
				"<td class='tab3'>"+zs[i].stu.zyxx.collage.xymc+"</td>"+ 
				"<td class='tab3'>"+zs[i].stu.zyxx.zymc+"</td>"+ 
				"<td class='tab3'>"+zs[i].stu.bjmc+"</td>"+ 
				"<td class='tab3'>"+zs[i].sqzs+"</td>"+ 
				"<td class='tab3'>"+zsbh+"</td>"+ 				
				"<td class='tab3'>"+zs[i].zt+"</td>"+
				"<td class='tab3'><input type='image' src='/icon/detial.png'  title='"+zs[i].bz+"'></td>"+
				"<td class='tab3'><input type='image' src='/icon/reject.png'  title='驳回' onmousedown='rejectzs("+zs[i].xwrdid+")'>"+
				"&nbsp;&nbsp;<input type='image' src='/icon/throw.png'  title='通过' onmousedown='throwzs("+zs[i].xwrdid+")'></td>"+
				"</tr>"; 
			}
		  $('#trs').html(htmls); 
		  stab();
		});
	} 
	function pagerselect(index){
		queryZs(index);
	}
	 function rejectzs(id){
	 	var url ="/pages/xwzs/bh.jsp?id="+id;
	 	swnidow(420,200,url);
		queryZs(1);
	}
	function throwzs(id){
		var url ="/throwZs?id="+id;
	 	 $.getJSON(url,{Rand:Math.random()},function(data){ 
	 		queryZs(1);
	 	});
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
			<td><span class="tf">校外证书审批</span></td>
		</tr>
	</table> 
 	<div  class="wp100"> 
	 	 <table class="f13 tab wp100" id="tab" align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr > 
			<th class="tab2 w50">序号</th>
			<th class="tab2">姓名 </th>
			<th class="tab2">身份证</th>
			<th class="tab2">学院</th> 
			<th class="tab2">专业</th> 
			<th class="tab2">班级</th>
			<th class="tab2">申请证书</th>
			<th class="tab2">证书编号</th>
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
