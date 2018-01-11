<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改自定义查询123</title>
    <% String id =request.getParameter("id"); %>
	  <link  rel="stylesheet" type="text/css" href="/css/all.css" />
    <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 	<script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript"> 
    	/*function  zdyAdd(){
	       var  a=$("#zy  option:selected").text();
	       n=1;
	       var  html="<tr class='h30'>"+
	                  "<td class='dt1 w80' colspan='2'>字段名称：</td>"+ 
	                  "<td  class='dt2'><input type='text'  Id='count'  value=''></td>"
	                 "</tr>"
	                  
	  $('#trs').append(html);
	   n = n+1;
	   document.getElementById().value.parentNode=a;
	}*/
	       
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
		if(chestr == "")
		{
		  alert("请先选择字段名称！");
		}
		else
		{
		  
		  getrequest(chestr);
		}
		}


  function getrequest(chestr){
  	window.returnValue=chestr;
  	window.close();
	/* var url ='/pages/kscx/mansearch.jsp?chestr='+chestr;
	$.getJSON(url, function(data) {  
		alert("传值成功！");
		
	  }); */
	}	    

	</script>
  </head>
  <body>
    	<table width="100%" border="0" bgcolor="#353c44" align="center"  cellpadding="0" cellspacing="0">
		 <tr>
			<td height="24" width="35"><span class="ml10">
				<img src="/pages/images/tb.gif" width="14" height="14"/>
			</span>
			</td>
			<td><span class="tf">自定义信息查询</span></td>
		</tr>
	</table>  
	<!-- 内容 -->
 	 <div align="center">
	 	 <table  class=" f13 tab wp100"  align="center" bordercolor="#D0D0D0" border="1px" >
	 	 	<tr class="h30">
	 	 	    <td class="dt1  w80"  colspan="4"  align="left">
	 	 	       <!-- <input type="button"     value="添加"  onmousedown="zdyAdd();" onclick="" > -->
	 	 	       <input type="submit"    value="保存"  onmousedown="showStu();"   onclick="checkbox()"  >
	 	 	    </td> 
	 	 	</tr>
	 	 	
	 	 	<tr class="h30">
	 	 	   <td class="dt1 w80 " colspan="2">字段名称：</td> 
	 	 	  <!--;<select name='zy' id="zy" class="w150">
	 	 	      <option value="0">--请选择--</option>
	 	 	      <option value="1">身份证号</option>
	 	 	      <option value="2">学号</option>
	 	 	      <option value="3">姓名</option>
	 	 	      <option value="4">性别</option>
	 	 	      <option value="4">学院</option>
	 	 	      <option value="5">专业</option>
	 	 	      <option value="6">年级</option>
	 	 	      <option value="7">入学日期</option>
	 	 	      <option value="8">开户行</option>
	 	 	      <option value="9">银行卡号</option>
	 	 	      <option value="10">贯籍</option>
	 	 	      <option value="11">电话</option>
	 	       </select>--> 
	 	       
	 	      <td    style="background-color: F5F5F5;"><input name="Fruit" type="checkbox" value="sfzh" />身份证号  </td> 
	 	 	</tr>
	 	 	
	 	 	
	 	 	
	 	 	<tr class="h30">
	 	 	   <td class="dt1 w80 " colspan="2">字段名称：</td> 
	 	 	    <td  style="background-color: F5F5F5;"><input name="Fruit" type="checkbox" value="xm" />姓名  </td> 
	 	 	</tr>
	 	 	
	 	 	<tr class="h30">
	 	 	   <td class="dt1 w80 " colspan="2">字段名称：</td> 
	 	 	   <td  style="background-color: F5F5F5;"><input name="Fruit" type="checkbox" value="xb" />性别  </td> 
	 	 	</tr>
	 	 	
	 	 	
	 	 	
	 	 	<tr class="h30">
	 	 	   <td class="dt1 w80 "style="center" colspan="2">字段名称：</td> 
	 	 	   <td  style="background-color: F5F5F5;"><input name="Fruit" type="checkbox" value="rxrq" />入学日期</td> 
	 	 	</tr>
	 	 	
	 	 	<tr class="h30">
	 	 	   <td class="dt1 w80 " style="center" colspan="2">字段名称：</td> 
	 	 	   <td  style="background-color: F5F5F5;"><input name="Fruit" type="checkbox" value="khh" />开户行 </td> 
	 	 	   
	 	 	</tr>
	 	 	
	 	 	<tr class="h30">
	 	 	   <td class="dt1 w80 " style="center" colspan="2">字段名称：</td> 
	 	 	   <td  style="background-color: F5F5F5;"><input name="Fruit" type="checkbox" value="gj" />贯籍 </td> 
	 	 	</tr>
	 	 	
	 	 	<tr class="h30">
	 	 	   <td class="dt1 w80 " style="center" colspan="2">字段名称：</td> 
	 	 	   <td  style="background-color: F5F5F5;"><input name="Fruit" type="checkbox" value="lxdh" />电话</td> 
	 	 	</tr>
	 	 	
	 	 	<tr class="h30">
	 	 	   <td class="dt1 w80 " style="center" colspan="2">字段名称：</td> 
	 	 	   <td  style="background-color: F5F5F5;"><input name="Fruit" type="checkbox" value="xh" />学号</td> 
	 	 	</tr>
	 	 	
	 	 	<tr class="h30">
	 	 	   <td class="dt1 w80 " style="center" colspan="2">字段名称：</td> 
	 	 	   <td  style="background-color: F5F5F5;"><input name="Fruit" type="checkbox" value="xy" />学院 </td> 
	 	 	</tr>
	 	 	
	 	 	<tr class="h30">
	 	 	   <td class="dt1 w80 " style="center" colspan="2">字段名称：</td> 
	 	 	   <td  style="background-color: F5F5F5;"><input name="Fruit" type="checkbox" value="nj" />年级 </td> 
	 	 	</tr>
	 	 	
	 	 	<tr class="h30">
	 	 	   <td  class="dt1 w80 " style="center;background-color: E7EFF2;" colspan="2">字段名称：</td> 
	 	 	   <td  style="background-color: F5F5F5;"><input name="Fruit" type="checkbox" value="zy" />专业  </td> 
	 	 	</tr>
	 	 	
	 	 <tbody id="trs">
			</tbody>
	 	 </table>
 	</div>  
	<div  class="wp100"> 
	 	 <table class="f13 tab wp100" id="tab" align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr > 
			</table> 
			<div id="pager"></div> 
	</div>
  </body>
</html>
