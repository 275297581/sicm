<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html>
<head>  
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <script type="text/javascript" src="/js/jquery.js"></script>
 <script type="text/javascript" src="/js/pager.js"></script>
 <%@ page  import="com.iking.beans.Sysuser"%>
 <!--<script type="text/javascript" src="/js/bui.js"></script>--> 
 <%
	String id = request.getParameter("uid");
	
	Sysuser user =  (Sysuser)request.getSession().getAttribute("sysuser");
	request.getSession().putValue("user", user);
%>
 <script language="javascript" type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
 <script type="text/javascript"> 
	 $(document).ready(function () { 
	   	showUser(1,null,null); 
	});
	var users ;
	function showUser(index,uname,lock){
		var url = "/showuser";
		var param;  
		if(uname==null&&lock==null) param = {index:index,Rand: Math.random()};
		else  param = {index:index,Rand: Math.random(),uname:uname,lock:lock};
   			$.getJSON(url,param,function(data){ 
			if(index ==1){
			//显示分页导航  
				var pager =spager(data.count);
				pager.onclick = function(index){
					 pagerselect(index);
				};
			}
		    users =data.sysusers;
			var htmls="";
			for(var i = 0 ; i < users.length;i++){
			  
			 if(users[i].userId!==('admin')){
				htmls+="<tr>"+
					"<td class='tab3 w20'><input type='checkbox' class='oneCheck' value='"+users[i].uid+"' ></td>"+
					"<td class='tab3 w40'>"+(i)+"</td>"+
					"<td class='tab3 w80'>"+users[i].userId+"</td>"+
					"<td class='tab3 w80'>"+users[i].userName+"</td>"+
					"<td class='tab3 w80'>"+ (users[i].locked ?"锁定" :"未锁定")+"</td>"+
					"<td class='tab3 w80'>"+users[i].createTime+"</td>"+
					"<td class='tab3 w100'>"+
					"<input type='image' src='/icon/modify.gif'  onmousedown='mUser("+users[i].uid+")' title='修改用户'>&nbsp;&nbsp;"+
					"<input type='image' src='/icon/usq.png'  onmousedown='puser("+users[i].uid+")' title='用户角色授权'>&nbsp;&nbsp;"+
					"<input type='image' src='/icon/key.png'  onmousedown='restpwd("+users[i].uid+")' title='重置用户登录密码'>&nbsp;&nbsp;"+
					"<input type='image' src='/icon/delete.gif'  onmousedown='duser("+users[i].uid+")' title='删除用户'></td>"+
					"</tr>"; 
				}	
			}  
		   $("#trs").html(htmls);
			stab(); 
		}); 
	}
	   
	//点击查询
	function showByRef(){
		var uname =$('#uname').val();
		var lock =$('#locked').val();
		showUser(1,uname,lock);
	}
	function pagerselect(index){
		var uname =$('#uname').val();
		var lock =$('#locked').val();
		showUser(index,uname,lock);
	}
	/* 全选选中、全不选中 */
	function sCheck(){
		 if($("#aCheck").attr("checked")){
		 	$(":checkbox").attr("checked",true);
		 }else{
		 	$(":checkbox").attr("checked",false);
		 }
	}
	 
	//用户修改
	function mUser(id){ 
		swnidow(450,400,'/pages/sys/muser.jsp?id='+id);
		showByRef();
		 
	}
	
	function adduser(){
		swnidow(450,400,'/pages/sys/ause.jsp');
		showByRef();
	} 
	//删除用户
	//批量删除
	function mostDel(){ 
		var checks = $('.oneCheck');
		var ids="";
		for(var i=0;i<checks.length;i++){ 
			if(checks[i].checked)
				ids +=checks[i].value+",";
		}
		if(ids=="") alert("您未选中任何记录！");
		else{
			if(confirm("您确定要批量删除用户信息吗？")) 
				deleteUser(ids.substring(0,ids.length-1));
		} 
	}
	//单个删除
	function duser(uid){
		if(confirm("您确定要删除用户信息吗？"))
			deleteUser(uid);
	}
	function deleteUser(uids){
		var url ="/deleteuser?userId="+uids;
		$.getJSON(url,{Rand:Math.random()},function(data){
		 	 	showByRef();
		 	 	alert(data.mess);
	 	 });
	}
	
	
	function puser(uid){
		swnidow(600,400,'/pages/sys/userrole.jsp?uid='+uid);
	}
	
	function restpwd(uid){
		var url ="/restpwd?uid="+uid;
		if(confirm("确定要进行密码重置？")){
			$.getJSON(url,{Rand:Math.random()},function(data){
			 	 	alert(data.mess);
		 	 });
	 	 }
	}
</script> 
</head>
<body> 
	<!-- 头部 -->
	<table width="100%" border="0" bgcolor="#353c44" align="center"
		cellpadding="0" cellspacing="0">
		<tr>
			<td height="24" width="35"><span class="ml10"><img
					src="/pages/images/tb.gif" width="14" height="14" />
			</span>
			</td>
			<td><span class="tf"> 用户管理</span></td>
		</tr>
	</table> 
 	<!-- 内容 -->
 	<!-- 左侧 -->
	<div  class="wp100">
		<div class=" f12 tab1 wp100 h30">
		<span class="mr10 ml10">用户姓名：<input type="text" name="uname" id="uname" value="${uname}"/> </span>
	 	<span class="mr20">用户状态：<select name="locked" id="locked" >
	 			<option value="">--请选择--</option>
	 			<option value="true">锁定</option>
	 			<option value="false">未锁定</option>
	 	</select></span> 
	 	<span class="mr10"><input type="button" value="查询" style="color: blue;font-weight: bold;" onmousedown="showByRef()"/> </span>
	 	<span class="mr10"><input type="button" value="批量删除" style="color: blue;font-weight: bold;" onmousedown="mostDel()"/> </span> 
	 	<span class="mr10"><input type="button" value="添加用户" style="color: blue;font-weight: bold;" onmousedown="adduser()"/> </span> 
	 	</div> 
	 	 <table class=" mr10 f13 tab wp100" id="tab" bordercolor="#D0D0D0"  align="center" border="1px"  > 
			<tr align="center"> 
			<th class="tab2 w20" align="center"><input type="checkbox" id="aCheck" onclick="sCheck()"/> </th>
			<th class="tab2 w40">序号</th>
			<th class="tab2 w80">登录名</th>
			<th class="tab2 w80">用户名</th>
			<th class="tab2 w80">使用状态</th>
			<th class="tab2 w80">创建时间</th>
			<th class="tab2 w100">操作</th>
			</tr>
			<tbody id="trs">
			</tbody>
		</table>
		<div id="pager"></div> 
		</div>
</body> 
</html>

 
