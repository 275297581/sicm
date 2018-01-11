<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
  <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 <script type="text/javascript" src="/js/jquery.js"></script>
 <script type="text/javascript" src="/js/pager.js"></script>
 <!--<script type="text/javascript" src="/js/bui.js"></script>-->
 <script type="text/javascript"> 
	$(document).ready(function (){ 
	 	showallnotice(1);
	 	
	});
	//index=pager.self.index;
	var pager ;
	function showallnotice(index){
		/* $.blockUI();*/
		var power=$('#sel').val();
		var param ={index:index,power:power,Rand:Math.random()};
		var url="/queryAllNotice";
		$.getJSON(url,param,function(data){
			/* $.unblockUI();*/ 
			if(index ==1){
				//显示分页导航  
				pager =spager(data.count);
				
				pager.onclick = function(index){
					 pagerselect(index);
				};
			}  
			//alert(pager.index);
			var ns =data.notices;
			var htmls="";
			for(var i = 0 ; i < ns.length;i++){
					htmls+="<tr ondblclick='clickRow("+i+")'>"+
				"<td class='tab3'><input type='checkbox' class='oneCheck' value='"+ns[i].id+"' ></td>"+
				"<td class='tab3'id='rowid'>"+(i+1)+"</td>"+
				"<td class='tab3'>"+ns[i].title+"</td>"+
				"<td class='tab3'>"+ns[i].remark+"</td>"+
				"<td class='tab3'>"+(ns[i].ptime==null || ns[i].ptime==""? "":ns[i].ptime)+"</td>"+
				"<td class='tab3'>"+ns[i].puser+"</td>"+ 
				
				"<td class='tab3'><input type='image' src='/icon/delete.gif'   onmousedown='dgg("+ns[i].id+")' title='删除'>"+
				"&nbsp;&nbsp;<input type='image' src='/icon/modify.gif'  title='修改' onmousedown='mdpub("+ns[i].id+")'>"+
				"&nbsp;&nbsp;"+(ns[i].isp=="是"? "<input type='image' src='/icon/succ.png' title='发布中...'>":"<input type='image' src='/icon/fb.png' onmousedown='pubGg("+ns[i].id+")' title='待发布'>")+"</td>"+
				// "<td class='tab3 w80'><div id='dv'>"+(ns[i].zd==1 ? "<input type='image' src='/icon/reject.png' onmousedown='pubzdqx("+ns[i].id+")' title='取消公告置顶'>&nbsp;&nbsp;":"<input type='image' src='/icon/ding.png' onmousedown='pubzd("+ns[i].id+")' title='公告置顶'>&nbsp;&nbsp;")+(i==0 ? "&nbsp;&nbsp;&nbsp;":"<input type='image'src='/icon/sy.png' onmousedown='pubpxsy("+ns[i].id+","+ns[i].px+","+ns[i-1].id+","+ns[i-1].px+","+ns[i].zd+","+ns[i-1].zd+")' title='上移'>&nbsp;")+((i+1)==ns.length ? "&nbsp;&nbsp;" : "<input type='image' onmousedown='pubpxxy("+ns[count].id+","+ns[count].px+","+ns[count-1].id+","+ns[count-1].px+","+ns[count].zd+","+ns[count-1].zd+")'  src='/icon/xy.png' title='下移'>" )+"</div></td>"+ 
				"<td class='tab3 w80'><div id='dv'>"+(ns[i].zd==1 ? "<input type='image' src='/icon/reject.png' onmousedown='pubzdqx("+ns[i].id+")' title='取消公告置顶'>&nbsp;&nbsp;":"<input type='image' src='/icon/ding.png' onmousedown='pubzd("+ns[i].id+")' title='公告置顶'>&nbsp;&nbsp;")+((i==0&&index==1) ? "&nbsp;&nbsp;&nbsp;":"<input type='image'src='/icon/sy.png' onmousedown='pubpxsy("+ns[i].zd+","+ns[i].px+","+ns[i].id+","+i+")' title='上移'>&nbsp;")+(((i+1)==ns.length && index==pager._pageCount ) ? "&nbsp;&nbsp;" : "<input type='image' onmousedown='pubpxxy("+ns[i].zd+","+ns[i].px+","+ns[i].id+","+i+")'  src='/icon/xy.png' title='下移'>" )+"</div></td>"+
				"</tr>";
				}
				  
			 $('#trs').html(htmls); 
			stab();
		}); 
	}
	function pagerselect(index){
		showallnotice(index); 
	}
//全选全不选	
function sCheck(){
		 if($('#aCheck').attr("checked")){
		 	$('.oneCheck').attr("checked",true);
		 }else{
		 	$('.oneCheck').attr("checked",false);
		 }
	}
function delmanygg(){
	var checks = $('.oneCheck');
	var ids="";
	for(var i=0;i<checks.length;i++){ 
		if(checks[i].checked)
			ids +=checks[i].value+",";
	}
	if(ids=="") alert("您未选中任何记录！");
	else{
		if(confirm("您确定要批量删除公告信息吗？"))
			//alert(ids.substring(0,ids.length-1));
			deletegg1(ids.substring(0,ids.length-1));
	} 
}
function deletegg1(ids){
		var url ="/deletgg1";
		var param = {ids:ids,Rand:Math.random()};
		$.getJSON(url,param,function(data){
		 	 	alert(data.mess);
		 	 	showallnotice(1); 
	 	 });
	}
function pubpxsy(zd,px,id,i){
		var url ="/pubpxsy";
		var paras={u:zd,p:px,u1:id,Rand:Math.random()};
		$.getJSON(url,paras,function(data){
		if(data.mess!=null){
		alert(data.mess); 
		return;
		}
		 	 	showallnotice(i==0 ? (pager.index - 1):(pager.index));
	 	 });
	}	
function pubpxxy(zd,px,id,i){
		var url ="/pubpxxy";
		var paras={u:zd,p:px,u1:id,Rand:Math.random()};
		$.getJSON(url,paras,function(data){
		 	 	if(data.mess!=null){
		alert(data.mess); return;
		}
		 	 	showallnotice(i==19 ? (pager.index + 1):(pager.index));
	 	 });
	}	
	
	function dgg(id){
		if(confirm("您确定要删除该公告信息吗？")==true)
			deletegg(id);
	}
	function deletegg(ids){
		var url ="/deletgg";
		var param = {nid:ids,Rand:Math.random()};
		$.getJSON(url,param,function(data){
		 	 	alert(data.mess);
		 	 	showallnotice(1); 
	 	 });
	}
  
	function mdpub(id){
		swnidow(1020,600,'/pages/ggtz/noticemd.jsp?id='+id);
		showallnotice(1);
	}	
	function pubGg(id){
	var url ="/pubgg";
	var param = {nid:id,Rand:Math.random()};
		$.getJSON(url,param,function(data){ 
		 	 	showallnotice(1); 
	 	 });
	
	};
	function pubzd(id){
	var url ="/pubzd";
	var param = {nid:id,Rand:Math.random()};
		$.getJSON(url,param,function(data){
	 	 	showallnotice(1);
	 	 });
	
	};
	function pubzdqx(id){
	var url ="/pubzdqx";
	var param = {nid:id,Rand:Math.random()};
		$.getJSON(url,param,function(data){
	 	 	showallnotice(1); 
	 	 });
	
	};
	function addgg(){
		swnidow(1020,600,'/pages/ggtz/noticeadd.jsp');
		showallnotice(1); 
	}
</script>
</head>
<body> 
	<table width="100%" border="0" bgcolor="#353c44" align="center"
		cellpadding="0" cellspacing="0">
		<tr>
			<td height="24" width="35"><span class="ml10"><img
				src="/pages/images/tb.gif" width="14" height="14" />
			</span>
			</td>
			<td><span class="tf">公告通知管理</span></td>
		</tr>
	</table>
    <div class=" f12 tab1 wp100 h40">
	 	<input type="button" value="新建公告" title="新建公告" style="color: blue;font-weight: bold;" onmousedown="addgg()" class="mt10 mr10">
	 	<input type="button" value="删除公告" title="批量删除" style="color: blue;font-weight: bold;" onmousedown="delmanygg()" class="mt10 mr10">
 		
 		<select id="sel" onchange="showallnotice(1)">
 			<option value="2">全部</option>
	 		<option value="0" >通知公告中心</option>
	 		<option value="1" >登录公告</option>
		</select>
 	</div>
	<div class="wp100"> 
	 	 <table class="f13 tab wp100" id="tab" align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr> 
			<th class="tab2 w30"><input type="checkbox" id="aCheck" onchange="sCheck()"> </th>
			<th class="tab2 w40">序号</th>
			<th class="tab2 ">标题</th>
			<th class="tab2 w100">创建日期</th>
			<th class="tab2 w100">发布日期</th>
			<th class="tab2 w100">创建者</th>  
			<th class="tab2 w100">操作</th>  
			<th class="tab2 w100">置顶排序</th>  
			</tr>
		 	<tbody id="trs">
		 	
		 	</tbody>
		</table> 
		<div id="pager"></div> 
	</div>
</body>
</html>