<%@ page language="java" import="java.util.*,java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>                                          
  <head>
    <title>学生职业资格证书管理系统</title>
	 <script type="text/javascript" src="/js/jquery.js"></script>
	 <script type="text/javascript" src="/js/pager.js"></script>
	<link href="/css/skin.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="/css/all.css" type="text/css"></link>
   <script type="text/javascript" >
	$(document).ready(function () {
	    show();
	});



	function show(){
			 var mydate = new Date();
			 var str = "" + mydate.getFullYear() + "-";
			 str += (mydate.getMonth()+1) + "-";
			 str += mydate.getDate() + "";
			 $("#begintime").attr("value",str);
			 return str;
			}
		
	function save(){
		var url="/tiemLuru";
		var begintime = $('#begintime').val();
		var endtime = $('#endtime').val();
		var param ={Rand:Math.random(),begintime:begintime,endtime:endtime};
			$.getJSON(url,param,function(data){
				var mess = data.mess;
				if(mess=="保存成功！"){
				 	alert(mess);
				}else{
					alert(mess);
			}
		});
	};

</script> 
  </head> 
  <body> 
  <table width="100%" height="166" border="0"  cellpadding="0" cellspacing="0">

  <tr>
    <td valign="top">
    <table width="70%" height="532"  border="0" cellpadding="0" cellspacing="0" class="login_bg">
      <tr>
        <td width="50%" align="right">
        <table width="91%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg2">
            <tr>
              <td height="138" valign="top">
              <table width="89%" height="300" border="0" cellpadding="0" cellspacing="0">
              
                <tr>
                  <td height="68" align="left" valign="top"><img src="/images/login_left.png" width="279"  height="68"></td>
                </tr>
             </table>
        </td>
        <td width="1%" >&nbsp;</td>
        <td width="50%" valign="bottom">
        <table width="100%" height="59" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="4%">&nbsp;</td>
              <td width="96%" height="38"><span class="login_txt_bt"></span></td>
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
                            <td width="13%" height="38" class="top_hui_text"><span class="login_txt" id="login_txt">当前时间：&nbsp;&nbsp; </span></td>
                            <td height="38" colspan="2" class="top_hui_text">
                            <input name="begintime" type="text"  id="begintime" class="editbox4" value="" size="20">  </td> 
                            
                          </tr>
                          <tr>
                            <td width="13%" height="35" class="top_hui_text"><span class="login_txt"> 到期时间： &nbsp;&nbsp; </span></td>
                            <td height="35" colspan="2" class="top_hui_text">
                            <input class="editbox4" type="text" value="" size="20" name="endtime" id="endtime">
                              <img src="images/luck.gif" width="19" height="18"> </td>
                          </tr>
              
                          <tr>
                            <td height="35" >&nbsp;</td>
                            <td width="20%" height="35" >
                            	<input name="Submit" type="button" class="button" id="Submit" value="添加"  onclick="save();"> 
                            </td>
                            <td width="70%" class="top_hui_text">
                            <input name="cs" type="button" class="button" id="cs" value="取 消" onmousedown="showConfirmMsg1()"></td>
                          </tr>
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
</table>
</table>
  </body>
</html>
