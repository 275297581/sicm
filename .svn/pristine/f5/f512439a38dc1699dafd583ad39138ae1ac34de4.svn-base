  
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head> 
	<% String key = request.getParameter("key");  %>
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 <script type="text/javascript" src="/js/pager.js"></script>
 <script type="text/javascript" src="/js/jquery.js"></script>
 <!--<script type="text/javascript" src="/js/bui.js"></script>--> 
 <script type="text/javascript"> 
	var pagenow = 1;
	$(document).ready(function () { 
	 		 getxy();
	 		 setnj();
	 		 showStu();
	 		 $("body").focus();
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
				var url="/queryzy";
				$.getJSON(url,{xy:xy},function(data){ 
					var zys = data.zyxxs;
					var htmls="<option value='0'>--请选择--</option>";
					for(var i=0;i<zys.length;i++){
						htmls +="<option value='"+zys[i].zyid+"'>"+zys[i].zymc+"</option>";
					}
					$("#zy").html(htmls); 
				}); 
			}
		}
		function setnj(){
			var htmls="";
			for(var i=2008;i<2025;i++){
				htmls +="<option value='"+i+"'>"+i+"</option>";
			} 
			$("#nj").append(htmls);
		}
		
		var stus;
		function showStu(){
			/* $.blockUI();*/  
			var url ="/querystu";
			var param ={Rand:Math.random(),index:pagenow,nj:$('#nj').val(),sfzh:$('#sfzh').val(),xh:$('#xh').val(),xy:$('#xy').val(),zy:$('#zy').val()}; 
			 $.getJSON(url,param,function(data){
			 		/* $.unblockUI();*/
			 		if(pagenow ==1){
						var pager =spager(data.count);
						pager.onclick = function(index){
							 pagerselect(index);
						};
					} 	
			 	 	stus =data.stus;
					var htmls="";
					for(var i = 0 ; i < stus.length;i++){
						htmls+="<tr ondblclick='clickRow("+stus[i].xsid+")'>"+  
								"<td class='tab3'><input name='checkbox' class='oneCheck' type='checkbox' value='"+stus[i].xsid+"'></td>"+
								"<td class='tab3'>"+stus[i].xh+"</td>"+
								"<td class='tab3'>"+stus[i].sfzh+"</td>"+
								"<td class='tab3'>"+stus[i].xm+"</td> "+
								"<td class='tab3'>"+stus[i].xb+"</td>"+
								"<td class='tab3'>"+stus[i].zyxx.collage.xymc+"</td> "+
								"<td class='tab3'>"+stus[i].zyxx.zymc+"</td> "+
								"<td class='tab3'>"+stus[i].nj+"</td> "+
								"<td class='tab3'>"+stus[i].rxrq+"</td>"+
								"<td class='tab3'>"+(stus[i].khh==null?"":stus[i].khh)+"</td>"+
								"<td class='tab3'>"+(stus[i].yhzh==null?"":stus[i].yhzh)+"</td>"+
								"<td class='tab3'>"+stus[i].jg+"</td>"+
								"<td class='tab3'>"+stus[i].lxdh+"</td>"+ 
								<% if(key.equals("1")){ %>
								"<td class='tab3'><input type='image' src='/icon/key.png'  onmousedown='restpwd("+stus[i].xsid+")' title='密码重置'> <input type='image' src='/icon/modify.gif'  onmousedown='modifyYhzh("+stus[i].xsid+")' title='修改银行账号'> </td>"+
								<% } %>
								"</tr>"; 
					}
			  		$("#trs").html(htmls);
				stab();
			 }); 
		} 
	function pagerselect(index){
		pagenow = index;
		showStu();
	} 
	
	function clickRow(id){
		swnidow(1200,600,'/pages/kscx/studetialinfo.jsp?id='+id);
	} 
	
	function restpwd(id) {
		if(confirm("确定要重置学生密码吗？")){
			var url ="/modifypwd";
			$.getJSON(url,{Rand:Math.random(),stuid:id},function(data){
				alert(data.mess);
			});
		}
	}
	function modifyYhzh(id){
		swnidow(300,130,'/pages/kscx/bankinfo.jsp?id='+id);
		showStu();
	}
	function showStuInfo(){
		var value = swnidow(1200,600,'/pages/kscx/stuforluru.jsp');
		if(value == "refresh"){
			window.location.reload();
		}
	}
	function updateStu(){
		var arry = [];
		$("input:checkbox:checked").each(function(){
			arry.push($(this).val());
		});
		if(arry.length>1){
			alert("只能选中一个修改！");
		}else if(arry.length==1){
			var id = $("input:checkbox:checked").attr('value');
			var value = swnidow(1200,600,'/pages/kscx/updateStu.jsp?id='+id);
			if(value == "refresh"){
				window.location.reload();
			}
			
		}else if(arry.length<1){
			alert("您还没有选中任何学生！");
		}
	}
	
	function checkAll(){
		 if ($("#quanxuan").attr("checked")) {  
		        $(":checkbox").attr("checked", true);  
		    } else {  
		        $(":checkbox").attr("checked", false);
		    }
	}
	
	function deleteStuAll(){
		var checks = $('.oneCheck');
		var ids="";
		for(var i=0;i<checks.length;i++){ 
			if(checks[i].checked)
				ids +=checks[i].value+",";
		}
		if(ids==""){
			alert("您未选中任何记录！");
		}else{
			if(confirm("您确定要删除所选学生信息吗？")){
				deleteStu(ids.substring(0,ids.length-1));
			}
		} 
	}
	
	function deleteStu(xsids){
		var url ="/deletestu?xsids="+xsids;
		$.getJSON(url,{Rand:Math.random()},function(data){
		 	 	window.location.reload();
		 	 	alert(data.msg);
	 	 });
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
			<td><span class="tf">学生信息录入</span></td>
		</tr>
	</table>  
	<!-- 内容 -->
 	 <div align="center">
	 	 <table  class=" f13 tab wp100"  align="center" bordercolor="#D0D0D0" border="1px" >
	 	 	<tr class="h30" >
	 	 	<td class="dt1 w80 ">身份证号：</td> <td  class="dt2"><input type="text" name='sfzh' id='sfzh' class="w150"> </td> 
	 	 	<td class="dt1  w80">学号：</td><td class="dt2"><input type="text" name='xh' id='xh' class="w150"></td>  
	 	 	<td class="dt1  w80">学院：</td><td class="dt2">
	 	 	<select name='xy' id="xy" class="w150" onchange="getzy();"><option value="0">--请选择--</option> </select></td> 
	 	 	</tr>
	 	 	<tr class="h30">
	 	 	<td class="dt1  w80">专业：</td> <td class="dt2">
	 	 	<select name='zy' id="zy" class="w150"><option value="0">--请选择--</option> </select></td> 
	 	 	
	 	 	<td class="dt1">年级：</td><td class="dt2">
	 	 	<select name='nj' id="nj" class="w150">
	 	 	<option value="0">--请选择--</option> 
	 	 	</select></td>   
	 	 	<td class="dt2" colspan="2">
	 	 		<input type="button" style="color: blue;font-weight: bold;" value="查询" title="查询学生基础信息及报名信息" onmousedown="showStu(1);" class="w60">
	 	 		<input type="button" style="color: blue;font-weight: bold;" value="录入" title="录入学生基础信息及报名信息" onmousedown="showStuInfo();" class="w60">
	 	 			<input type="button" style="color: blue;font-weight: bold;" value="修改" title="修改学生基础信息及报名信息" onmousedown="updateStu();" class="w60">
	 	 			<input type="button" style="color: blue;font-weight: bold;" value="删除" title="删除学生基础信息及报名信息" onmousedown="deleteStuAll();" class="w60">
	 	 	</td>
	 	 <!-- 	</tr>
	 	 	<tr>
	 	 		<td class="dt2" colspan="2">
	 	 			
	 	 			<input type="button" style="color: blue;font-weight: bold;" value="查询" title="查询学生基础信息及报名信息" onmousedown="showStu(1);" class="w60">
	 	 		</td>
	 	 	</tr> -->
	 	 </table>
 	</div>  
	<div  class="wp100"> 
	 	 <table class="f13 tab wp100" id="tab" align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr > 
			<th class="tab2 w70">全选：<input id='quanxuan'  type='checkbox'  onclick="checkAll();" value="全选"></th>
			<th class="tab2">学号</th>
			<th class="tab2">身份证号</th>
			<th class="tab2">姓名</th> 
			<th class="tab2">性别</th>
			<th class="tab2">学院</th> 
			<th class="tab2">专业</th> 
			<th class="tab2">年级</th> 
			<th class="tab2">入学日期</th>
			<th class="tab2">开户行</th>
			<th class="tab2">银行卡号</th>
			<th class="tab2">籍贯</th>
			<th class="tab2">联系电话</th>
			<% if(key.equals("1")){ %>
			<th class="tab2">操作</th>
			<% }%>
			</tr> 
			<tbody id="trs">
			
			</tbody>
			</table> 
			<div id="pager"></div> 
	</div>
	
</body> 
</html>

 
 