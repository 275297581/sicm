<%@ page language="java" import="java.util.*,java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>学生职业资格证书管理系统</title>
	 <script type="text/javascript" src="/js/jquery.js"></script>
	 <script type="text/javascript" src="/js/pager.js"></script>
	<link href="/css/skin.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="/css/all.css" type="text/css"></link>
	<%
		String uid = (String)session.getAttribute("uid");
		String pwd =(String)session.getAttribute("pwd");
		String flag = request.getParameter("flag");
		if(uid==null||flag==null) uid="";
		if(pwd==null||flag==null) pwd="";
	%>
<script type="text/javascript" >
	var pagenow = 1;
	var pagesize =1;
	$(document).ready(function () {
	 	getNotice(pagenow); 
	 	setInterval("startRequest()",10000);  
	});
	
	function startRequest(){
	 	pagenow++;
	 	if(pagenow>pagesize) pagenow =1;
		getNotice(pagenow); 
	}
	function loadimage(){ 
		document.getElementById("randImage").src = "image.jsp?"+Math.random();  
	}
	function getNotice(index){
		var param={index:index,Rand:Math.random()};
		var url="/pub_queryNotice";
		$.getJSON(url,param,function(data){
			$("#notices").slideUp(2000,function(){
				$("#notices").html("");
				var n = data.notices;
				var htmls ="";
				 for(var i=0;i<n.length;i++){ 
	                   htmls +="<div>"+
	                   		 "<span class='left_txt'  height='25' title='点击查看详情' >"+((index-1)*5+i+1)+"--<a href='javascript:showdetial("+n[i].id+");'>"+n[i].title+"</a></span>"+
	                   		 "<span class='ml30 left_txt' title='发布日期'  >"+n[i].ptime+"</span>"+
	                   		 "</div>" ;
				} 
				$("#notices").append(htmls);
				$("#notices").slideDown(2000);
			});
			if(index==1){
				pagesize = data.count;
			}
		}); 
	}
	
	function showdetial(id){
		swnidow(1000,700,'/public/noticeshow.jsp?val='+id);
	} 
</script> 
  </head> 
  <body> 
  <table width="100%" height="166" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="42" valign="top">
    <table width="100%" height="42" border="0" cellpadding="0" cellspacing="0" class="login_top_bg">
      <tr>
        <td width="1%" height="21">&nbsp;</td>
        <td height="42">&nbsp;</td>
        <td width="17%">&nbsp;</td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td valign="top">
    <table width="100%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg">
      <tr>
        <td width="40%" align="right">
        <table width="91%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg2">
            <tr>
              <td height="138" valign="top">
              <table width="89%" height="300" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="15">&nbsp;</td>
                </tr>
                <tr>
                  <td height="68" align="left" valign="top"><img src="/images/login_left.png" width="279"  height="68"></td>
                </tr>
                <tr>
                <td height="28" style="padding-top: 30px" align="left" valign="top"> 
				<img src='/images/icon-login-seaver.gif' width='16' height='16'><a href='/public/noticeall.jsp' target='_blank' title='点击查看更多公告' class='left_txt3'> 通知公告</a>
				 </td>
                </tr> 
                <tr>
                  <td   align="left" valign="top">
                  <div id="notices" ></div>
               </td>
            </tr>
        </table>
        </td>
        <td width="1%" >&nbsp;</td>
        <td width="50%" valign="bottom">
        <table width="100%" height="59" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="4%">&nbsp;</td>
              <td width="96%" height="38"><span class="login_txt_bt">学生职业资格证书管理系统</span></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td height="21">
              <table cellSpacing="0" cellPadding="0" width="100%" border="0" id="table211" height="328">
                  <tr>
                    <td height="164" colspan="2" align="center">
                    <form action="validate.jsp" method="post" name="myform" >  
                        <table cellSpacing="0" cellPadding="0" width="100%" border="0" height="143" id="table212">
                          <tr>
                            <td width="13%" height="38" class="top_hui_text"><span class="login_txt">登录者：&nbsp;&nbsp; </span></td>
                            <td height="38" colspan="2" class="top_hui_text">
                            	<input type="radio" name="longType" value="1" title="学生登陆"   ><span id="stu">学生</span>
                            	<input type="radio" name="longType" value="2" title="管理者登陆" class="man" checked="checked"> <span class="man">管理员</span>
                           </td>
                          </tr>
                          <tr>
                            <td width="13%" height="38" class="top_hui_text"><span class="login_txt">登录名：&nbsp;&nbsp; </span></td>
                            <td height="38" colspan="2" class="top_hui_text"><input name="uid" class="editbox4" value="<%=uid %>" size="20">        <%-- <%=uid %> --%>                    </td>
                          </tr>
                          <tr>
                            <td width="13%" height="35" class="top_hui_text"><span class="login_txt"> 密&nbsp;&nbsp; 码： &nbsp;&nbsp; </span></td>
                            <td height="35" colspan="2" class="top_hui_text"><input class="editbox4" type="password" value="<%=pwd %>" size="20" name="pwd"><%-- <%=pwd %> --%>
                              <img src="images/luck.gif" width="19" height="18"> </td>
                          </tr>
                          <tr>
                            <td width="13%" height="35" ><span class="login_txt">验证码：</span></td>
                            <td height="35" colspan="2" class="top_hui_text">
                              <input class=wenbenkuang name=rand id="verifycode" type=text value="" maxLength=4 size=8/>
                            <div id="rand">  
                              <img alt="点击刷新验证码" onmousedown="loadimage()" name="randImage" id="randImage" src="image.jsp" width="60" height="20" border="1" align="middle"/>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td height="35" >&nbsp;</td>
                            <td width="20%" height="35" >
                            	<input name="Submit" type="submit" class="button" id="Submit" value="登 录"> 
                            </td>
                            <td width="78%" class="top_hui_text">
                            <input name="cs" type="button" class="button" id="cs" value="取 消" onmousedown="showConfirmMsg1()"></td>
                          </tr>
                          	<tr><td colspan="3" align="left"><span style="color:pink;" >${mess}</span></td> </tr>
                        </table>
                        <br>
                    </form></td>
                  </tr>
                  <tr>
                    <td width="433" height="164" align="right" valign="bottom"><img src="/images/login-wel.gif" width="242" height="138"></td>
                    <td width="57" align="right" valign="bottom">&nbsp;</td>
                  </tr>
              </table></td>
            </tr>
          </table>
          </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="20"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="login-buttom-bg">
      	<!-- 版权 -->
    </table></td>
  </tr>
</table>
</td>
</tr>
</table>  
  </body>
</html>
