 
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
	<title>公告通知修改</title>
<% String id = request.getParameter("id"); %>
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
  <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 <script type="text/javascript" src="/js/pager.js"></script>
 <script language="javascript" type="text/javascript" src="/js/jquery.js"></script>
 
 <link rel="stylesheet" href="/pages/ggtz/themes/default/default.css" />
	 <link rel="stylesheet" href="/pages/ggtz/plugins/code/prettify.css" /> 
	<script charset="utf-8" src="/pages/ggtz/kindeditor.js"></script>
	<script charset="utf-8" src="/pages/ggtz/lang/zh_CN.js"></script>
 	<script charset="utf-8" src="/pages/ggtz/plugins/code/prettify.js"></script> 
 <script language="javascript" type="text/javascript"> 
 var editor1;
 KindEditor.ready(function(K) {
				editor1 = K.create('textarea[name="content"]', {
				cssPath : '/pages/ggtz/plugins/code/prettify.css',
				uploadJson : '/pages/ggtz/upload_json.jsp',
				fileManagerJson : '/pages/ggtz/file_manager_json.jsp',
				allowFileManager : true
			});
			prettyPrint();
		});
 
 
	$(document).ready(function () { 
		getcontent();
	});
	
	function getcontent(){
	var url="/pub_showDetilNotice";
	var paras={nid:<%=id %>,Rand:Math.random()};
	$.getJSON(url,paras,function(data){ 
		var s=data.notice;
		$('#title').val(s.title);
		$('#bm').val(s.bm);
		$('#sel').val(s.power); 
		//alert(s.content);   
 		//$('#content').editor1.setSource(s.content);
 		editor1.html(s.content);
 		//alert(s.content);  
		});  
	}
	function modinfyPub(id){ 
		var u1 = $('#title').val();
		if(u1==""){
			alert("公告标题不能为空！");
			return;
		}
		var u2 = editor1.html();//$('#content').val();
	 	if(u2==""){
			alert("公告内容不能为空！");
			return;
		} 
		var u3 = $('#bm').val();
		var u4 = $('#sel').val();
		var url ="/modinfyPub"; 
		var  paras ={nid:id,title:u1,bm:u3,content:u2,power:u4};
		$.post(url,paras,function(data){ 
			alert(data.mess); 
			window.close();
		});  
	}
</script>
<title>公告通知修改</title>
</head>
<body class="ccont">  
 	 <div align="center" class="wp100">
	 	 <table  class="f13 tab"  align="center" bordercolor="#D0D0D0" border="1px" >
	 	 	<tr class="h25">
	 	 	<td class="dt1 wp10">标题：</td> 
	 	 	<td  class="dt3 "><input type="text" name='title' id='title'> </td>
	 	 	<td class="dt1 ">部门：</td> 
	 	 	<td  class="dt3"><input type="text" name='bm' id='bm' > </td>  
	 	 	<td class="dt1 ">
	 	 		公告类型
	 	 	</td>
	 	 	<td class="dt3">
	 	 		<select id="sel">
	 		<option value="0" >通知公告中心</option>
	 		<option value="1">登录公告</option>
		</select>
	 	 	</td>
	 	 	</tr>
	 	 	<tr>
	 	 		<td class="dt1 ">内容：</td>
	 	 		<td class="dt3" colspan="6"> 
	 	 		<textarea  id="content" name="content" style="height:500px;width:100%;resize: none;" > </textarea>
	 	 		<!-- <textarea  class="xheditor {skin:'default',height:400}"  id="content" name="content" style="height:95%;width:100%;resize: none;">  </textarea> -->
	 	 		</td>  
	 	 	</tr>
	 	 	<tr>
	 	 		<td colspan="6" class="dt2"> 
	 	 			<div align="center"><input  type="button"  onmousedown="modinfyPub(<%=id %>);" style="color: blue;font-weight: bold;"  value="修改" class="mt10 mr10"/></div>
	 	 		</td>
	 	 	</tr>
	 	 </table>
 	</div>  
</body> 
</html>

 
