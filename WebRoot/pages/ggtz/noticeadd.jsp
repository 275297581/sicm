 
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
<title>添加公告</title>
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
  <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 <script language="javascript" type="text/javascript" src="/js/jquery.js"></script>
 <link rel="stylesheet" href="/pages/ggtz/themes/default/default.css" />
 <link rel="stylesheet" href="/pages/ggtz/plugins/code/prettify.css" />
<script  src="/pages/ggtz/kindeditor.js"></script>
<script  src="/pages/ggtz/lang/zh_CN.js"></script>
 <script  src="/pages/ggtz/plugins/code/prettify.js"></script>
 <script type="text/javascript" > 
 var editor1;
 KindEditor.ready(function(K) {
				editor1 = K.create('textarea[name="content1"]', {
				cssPath : '/pages/ggtz/plugins/code/prettify.css',
				uploadJson : '/pages/ggtz/upload_json.jsp',
				fileManagerJson : '/pages/ggtz/file_manager_json.jsp',
				allowFileManager : true
			});
			prettyPrint();
		});
	
	function noticeadd(){
		 var u1 = $('#title').val();
		
		if(u1==""){
				alert("公告标题不能为空！");
				return;
			} 
			
		var u2 =editor1.html(); 
		//alert("u2="+u2);
	 	if(u2==""){
			alert("公告内容不能为空！");
			return;
		} 
		
		var u3 = $('#bm').val();
		var u4 = $('#sel').val();
		var url ="/noticeadd";
		var  paras ={title:u1,bm:u3,content:u2,power:u4};
		if(!confirm("确定要添加该通知公告吗？")){return ;}
		 $.post(url,paras,function(data){ 
			alert(data.mess);
			window.close();
		});   
	}
	 function addPic(){
		swnidow(1320,700,'/pages/ggtz/noticepic.jsp'); 
	}
	function addvido(){
		swnidow(1320,700,'/pages/ggtz/noticevido.jsp'); 
	} 
</script>
</head>
<body class="ccont">  
	<!-- 内容 -->
 	 <div align="center">
	 	 <table  class="f13 tab wp98" bordercolor="#D0D0D0" border="1px" >
	 	 	<tr class="h25 ">
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
	 	 		 <td class="dt1 wp5">内容：</td>
	 	 		<td class="dt3" colspan="6">
	 	 		<textarea  id="content1" name="content1" style="height:500px;width:100%;resize: none;" ></textarea>
	 	 		</td> 
	 	 	</tr>
	 	 	<tr>
	 	 		<td colspan="6" class="dt2 " align="center"> 
	 	 		 <input  type="button" onmousedown="noticeadd();" style="color: blue;font-weight: bold;"  value="添加" /> 
	 	 		<!-- <input  type="button" onclick="noticeadd();" style="color: blue;font-weight: bold;"  value="添加" />  --> 
	 	 		</td>
	 	 	</tr>
	 	 </table>
 	</div>  
</body> 
</html>
 
