<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>学生详细信息</title>
<%
	String id = request.getParameter("id");
%>
<link rel="stylesheet" type="text/css" href="/css/detail.css" />
<link rel="stylesheet" type="text/css" href="/css/all.css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<!--<script type="text/javascript" src="/js/bui.js"></script>-->
<script type="text/javascript">
	$(document).ready(function () {  
	 selectZdy();
	 
	 
	}); 
	
	

   /* function checkbox()
	{
	var str=document.getElementsByName("Fruit");
	var objarray=str.length;
	var chestr="";
		for (i=0;i<objarray;i++)
		{
		  if(str[i].checked == true)
		  {
		   chestr+=str[i].value+",";
		  }
		  
		}
	
		
	 }	*/
		
function checkbox()
	{
	var str=document.getElementsByName("Fruit");
	var objarray=str.length;
	var chestr="";
		for (i=0;i<objarray;i++)
		{
		  if(str[i].checked == true)
		  {
		   chestr+=str[i].value+",";
		  }
	
	}

	
	if($("input[type='checkbox']:checked").length>4)
		{
		  alert("您的自定义名称选择不能超过四个！");
		}
		else
		{
		addCheck(chestr);
		}

}
		
		
	function addCheck(chestr) {
			var url ="/addCheck";
			$.getJSON(url,{Rand:Math.random(),chestr:chestr,xsid:35965},function(data){
			selectZdy();
			window.returnValue='refresh';
				window.close();
		});
	}
	
	//自定义查询36719
		function  selectZdy(){
		var url ="/selectZdy?xsid="+'35965';
		$.getJSON(url,{Rand:Math.random()},function(data){
			 var s=data.stu;
			if(s.xm=="xm"){
			 $("#xm").attr({"checked":true}); 
			 } 
		    if(s.sfzh==("sfzh")){
			 $("#sfzh").attr({"checked":true}); 
			 }
			if(s.rxrq=="rxrq"){
			$("#rxrq").attr({"checked":true}); 
		     }
		     if(s.khh=="khh"){
			$("#khh").attr({"checked":true}); 
		     }
		    if(s.xb=="xb"){
			$("#xb").attr({"checked":true}); 
		     }
			if(s.jg=="jg"){
			$("#jg").attr({"checked":true}); 
		     }
		     if(s.lxdh=="lxdh"){
		     $("#lxdh").attr({"checked":true}); 
			 }; 
		     if(s.xh=="xh"){
			 $("#xh").attr({"checked":true}); 
		      }
		     if(s.xy=="xy"){
			 $("#xy").attr({"checked":true}); 
			 $("#zy").attr({"checked":true}); 
		      }
		     if(s.zy=="zy"){
			 $("#zy").attr({"checked":true}); 
			 $("#xy").attr({"checked":true});
		     } 
		     if(s.nj=="nj"){
			 $("#nj").attr({"checked":true}); 
		     } 
			}); 
		}
		function  chec(){
		    
		  if($("#xy").attr("checked")==true){
		       $("#zy").attr({"checked":true}); 
		   }else{
		    $("#zy").removeAttr("checked");//取消全选
		   
		   }
		 
		 
		}
   
   
   	function  checd(){
		    
		  if($("#zy").attr("checked")==true){
		       $("#xy").attr({"checked":true}); 
		   }else{
		    $("#xy").removeAttr("checked");//取消全选
		   
		   }
		 
		 
		}
</script>
</head>
<body>
    <div align="right">
         <input id="savebut" type="button" style="font-weight: bold;" value="保存" title="保存信息" onclick="checkbox();" class="w60">
	</div>
	<div align="center">
		<fieldset class="wp90 f13 mt20" >
			<legend>自定义查询</legend>
			<table class="  f13 tab wp100" id="tab" align="center"
				bordercolor="#D0D0D0" border="1px">
				<tr class="h30">
					 <td class="dt1 w80 " colspan="2">字段名称：</td> 
					 <td    style="background-color: F5F5F5;"><input  name="Fruit" type="checkbox" value="sfzh"  id="sfzh" >身份证号</td>
				</tr>
				<tr class="h30">
					<td class="dt1  w80" colspan="2">字段名称：</td>
					<td    style="background-color: F5F5F5;"><input  name="Fruit" type="checkbox"  value="xm" id="xm"  >姓名</td>
					</tr>	
				<tr class="h30">
					<td class="dt1  w80" colspan="2">字段名称：</td>
					<td    style="background-color: F5F5F5;"><input  name="Fruit" type="checkbox" value="xb" id="xb"  >性别</td>
				</tr>
				
				 <tr class="h30">
					<td class="dt1  w80" colspan="2">字段名称：</td>
					<td    style="background-color: F5F5F5;"><input  name="Fruit" type="checkbox" value="xh" id="xh"  >学号</td>
				   </tr>
				   
				   
					<tr class="h30">
					<td class="dt1 w80" colspan="2">字段名称：</td>
					<td style="background-color: F5F5F5;"><input name="Fruit" type="checkbox" value="jg" id="jg" >籍贯</td>
					</tr>
				   <tr class="h30">
					<td class="dt1 w80" colspan="2">字段名称：</td>
					<td style="background-color: F5F5F5;"><input name="Fruit" type="checkbox"   id="rxrq"  value="rxrq" >入学日期</td>
				   </tr>
				   <tr class="h30">
					<td class="dt1  w80" colspan="2">字段名称：</td>
					<td style="background-color: F5F5F5;"><input name="Fruit" type="checkbox"   id="lxdh" value="lxdh" >联系电话</td>
				   </tr>
				    <tr class="h30">
					<td class="dt1  w80" colspan="2">字段名称：</td>
					<td style="background-color: F5F5F5;"><input name="Fruit" type="checkbox"   id="xy" value="xy" onclick="chec()">学院名称</td>
					</tr>
					<tr class="h30">
					<td class="dt1 w80" colspan="2">字段名称：</td>
					<td style="background-color: F5F5F5;"><input name="Fruit" type="checkbox"  id="zy" value="zy" onclick="checd()" >专业名称</td>
					</tr>
					<tr class="h30">
					<td class="dt1  w80" colspan="2">字段名称：</td>
					<td style="background-color: F5F5F5;"><input  name="Fruit" type="checkbox" id="nj"  value="nj">年级</td>
					</tr>
			</table>
		</fieldset>
		<fieldset class="wp98 f13 mt20" style="display: none;">
			<table  align="center"border="1px" >
				
				<tr>
					<td class="dt1  w80" colspan="2">字段名称：</td>
					<td style="background-color: F5F5F5;"><input  name="Fruit" type="checkbox" name='zzmm' id="zzmm"  type="text">政治面貌</td>
					<td class="dt1 w80"><td class="dt2"><input  name='bmdd' id="bmdd" value="1" type="text"></td>
					<td class="dt1 w80"><td class="dt2"><input  name='bmsj' id="bmsj" value="1" type="text"></td>
					<td class="dt1 w80"><td class="dt2"><input  name='jdzy'  value="1" id="jdzy" class="w150" ></td>
				</tr>
			
			</table>
		</fieldset>

	</div>
</body>
</html>
