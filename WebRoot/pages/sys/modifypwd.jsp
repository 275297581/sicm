<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <link href="/css/all.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="/js/jquery.js"></script>
 <script type="text/javascript">
 	function modifypwd(){
 		if($('#oldpwd').val()==""){
 			alert("请输入旧密码！");
 			return;
 		} 
 		if($('#newpwd').val()==""){
 			alert("请输入新密码！");
 			return;
 		} 
 		if($('#apwd').val()==""){
 			alert("请再次输入新密码！");
 			return;
 		}
 		if($('#newpwd').val()!=$('#apwd').val()){
 			alert("两次输入的新密码不一致！");
 			$('#newpwd').val("");
 			$('#apwd').val("");
 			return;
 		}
 		if(confirm("确定要修改密码吗?下次登录有效！")){
 		
			var oldp =$('#oldpwd').val();
     		var newp =$('#newpwd').val();
     		var url="";
 			if('${ltype}'=="1") {
	 			url="/modifypwd1?uid=${stu.xsid}&oldpwd="+oldp+"&newpwd="+newp;
	 			$.getJSON(url,{Rand:Math.random()},function(data){ 
	 				var mess = data.mess; 
	 					alert(mess); 
	 			}); 
 			}else{
	 			url="/modifypwdsysuser?uid=${sysuser.uid}&oldpwd="+oldp+"&newpwd="+newp;
	 			//alert('${sysuser.uid}');
	 			$.getJSON(url,{Rand:Math.random()},function(data){
	 			//alert(url);
	 				var mess = data.mess; 
	 					alert(mess); 
	 			}); 
 			}
 		}
 	}
 </script>
</head>
<body>
	<table width="100%" border="0" bgcolor="#353c44" align="center"
		cellpadding="0" cellspacing="0">
		<tr>
			<td height="24" width="35"><span class="ml10"><img
					src="../images/tb.gif" width="14" height="14" />
			</span>
			</td>
			<td><span class="tf"> 密码修改</span></td>
		</tr>
	</table>
	 <div class="tab1 h30">
		<input type="button" class=" mt5" value="修改密码" style="color: blue;font-weight: bold;" onmousedown="modifypwd();"> 
	</div>
	 <table class="ml10 mr10 f13 wp90" id="tab"  align="center" >
	 	<tr class="h30">
	 	<td class="w100" align="right">旧 密 码：</td><td align="left"><input type="password" name="oldpwd" id="oldpwd"> </td>
	 	</tr>
	 	<tr  class="h30">
	 	<td  class="w100"  align="right">新 密 码：</td> <td><input type="password" name="newpwd" id="newpwd"> </td>
	 	</tr>
	 	<tr  class="h30">
	 	<td  class="w100"  align="right">确认密码：</td><td><input type="password" name="apwd" id="apwd"> </td>
	 	</tr>
	 </table> 
</body>
</html>
