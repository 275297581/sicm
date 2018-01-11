<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head> 
<% String rid =request.getParameter("rid"); %>
<title>角色授权</title>
<link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <script type="text/javascript" src="/js/jquery.js"></script>
 <script type="text/javascript" src="/js/pager.js"></script>
 <script type="text/javascript">
	$(document).ready(function () { 
	 	 showMenus();
	});
	function showMenus(){
		var param ={Rand:Math.random()};
	 	$.getJSON("/showmenu",param,function(data){	
	 		var menus1 = data.sysmenus1;
	 		var menus2 = data.sysmenus2;
	 		var html;
		  for(var i = 0 ; i < menus1.length;i++){
				html ='<tr>'+
				'<td class="tab3 w50"><input type="checkbox" id="m'+menus1[i].mid+'" name="checkbox" value="'+menus1[i].mid+'"></td>'+
				'<td class="tab3 ">'+menus1[i].menuName+'</td>'+
				'<td class="tab3 w150"></td>'+
				'</tr>'; 
				$("#tab").append(html);
				for(var j = 0 ; j < menus2.length;j++){
					if(menus1[i].mid==menus2[j].parent){
						html ='<tr>'+
						'<td class="tab3 w50"></td>'+   
						'<td class="tab3 " align="right"><input type="checkbox" name="checkbox" id="m'+menus2[j].mid+'"  value="'+menus2[j].mid+'"></td>'+
						'<td class="tab3 w150">'+menus2[j].menuName+'</td>'+
						'</tr>';
						$("#tab").append(html);
					}
				} 
			 } 
			 var url ="/showrolemenu?rid=<%=rid %>";
				$.getJSON(url,{Rand:Math.random()},function(data){
					var ids = data.flag; 
					var misd = ids.split(',');  
					for(var i=0;i<misd.length;i++){
						$('#m'+misd[i]).attr("checked",true);
					} 
				});  
		  	stab();  
	 	});
	} 
	function shouquan(){
		var mids ="";
		 $("[name='checkbox'][checked]").each(function(){
		     mids+=$(this).val()+","; 
		 });
		 mids = mids.substring(0,mids.length-1); 
		 
		  var url ="/modifyrolemenu?rid=<%=rid %>&mids="+mids;
		 $.getJSON(url,{Rand:Math.random()},function(data){
			 var flag =data.flag;
			 if(flag=="true"){
			 	alert("授权成功！");
			 }else{
			 	alert("授权失败！");
			 }
		}); 
	}
	
	function seleAll(){
		$("[name='checkbox']").each(function(){
		    $(this).attr("checked",true); 
		 });
	}
	
	function seleFan(){
		$("[name='checkbox']").each(function(){
		    $(this).attr("checked",!$(this).attr("checked")); 
		 });
	}
</script>
</head>
<body>
	 <div  class="wp100">
	 	<div class="mb10" align="center">
	 		<input type="button" value="授权" style="color: blue;font-weight: bold;" onmousedown="shouquan();">
	 		<input type="button" value="全选" style="color: blue;font-weight: bold;" onmousedown="seleAll();">
	 		<input type="button" value="反选" style="color: blue;font-weight: bold;" onmousedown="seleFan();">
	 	</div>
	 	<table class="f13 tab wp98" id="tab" align="left" bordercolor="#D0D0D0" border="1px"  > 
		<tr> 
		<th class="tab2 w50"></th>
		<th class="tab2 " >一级菜单</th>
		<th class="tab2 w150">二级菜单</th> 
		</tr> 
		</table>
	</div>
</body>
</html>
