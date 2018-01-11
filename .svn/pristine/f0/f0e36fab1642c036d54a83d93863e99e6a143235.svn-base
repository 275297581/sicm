<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page  import="com.iking.beans.Sysuser"%>
<!-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>  
 <% String key = request.getParameter("key");  %>
 <%String Fruit = request.getParameter("chestr"); 
   Fruit = Fruit+"**";
   String[] arr = Fruit.split(",");
 %>
 <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
 <script type="text/javascript" src="/js/jquery.js"></script>
 <script type="text/javascript" src="/js/pager.js"></script>
 <!--<script type="text/javascript" src="/js/bui.js"></script>--> 
 <script type="text/javascript"> 
  var pagenow = 1;
  $(document).ready(function () {
  		 selectZdy();
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
	function showStu(){
			/* $.blockUI();*/                                                                                                                                        
			var url ="/querystu";        
			var param ={Rand:Math.random(),index:pagenow,jg:$('#jg').val(),nj:$('#nj').val(),sfzh:$('#sfzh').val(),xh:$('#xh').val(),xy:$('#xy').val(),zy:$('#zy').val(),xb:$('#xb').val(),lxdh:$('#lxdh').val(),xm:$('#xm').val(),rxrq:$('#rxrq').val(),khh:$('#khh').val()}; 
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
								"<td class='tab3'>"+(i+1)+"</td>"+
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
								"<td class='tab3'><input type='image' src='/icon/key.png'  onmousedown='restpwd("+stus[i].xsid+")' title='密码重置'> <input type='image' src='/icon/modify.gif'  onmousedown='modifyYhzh("+stus[i].xsid+")' title='修改银行账号'> </td>"+
								"</tr>"; 
								
					}
			  		$("#trs").html(htmls);
			  		
				stab();
			 }); 
		} 
		
		//自定义查询
		function  selectZdy(){
		var url ="/selectZdy?xsid="+'35965';
		$.getJSON(url,{Rand:Math.random()},function(data){
			 var s=data.stu;
			if(s.xm=="xm"){
			   $('#xm1').show();
			   $('#xm2').show();
			 } 
		    if(s.sfzh==("sfzh")){
			 	$('#sfzh1').show();
			    $('#sfzh2').show();
			 }
		    if(s.sfzh=="sfzh"){
			 	$('#sfzh1').show();
			    $('#sfzh2').show();
			 }
			if(s.rxrq=="rxrq"){
			 $('#rxrq1').show();
			 $('#rxrq2').show();
		     }
		     if(s.khh=="khh"){
			 $('#khh1').show();
			 $('#khh2').show();
		     }
		    if(s.xb=="xb"){
			 $('#xb1').show();
			 $('#xb2').show();
		     }
			 if(s.jg=="jg"){
			 $('#gj1').show();
			 $('#gj2').show();
		     }
		     if(s.lxdh=="lxdh"){
			 $('#lxdh1').show();
			 $('#lxdh2').show();
			 }; 
		     if(s.xh=="xh"){
			 $('#xh1').show();
			 $('#xh2').show();
		      }
		     if(s.xy=="xy"){
		     $('#xy1').show();
			 $('#xy2').show();
			 $('#zy1').show();
			 $('#zy2').show();
		     }
		      if(s.zy=="zy"){
		     $('#zy1').show();
			 $('#zy2').show();
			 $('#xy1').show();
			 $('#xy2').show();
		     }
		      if(s.nj=="nj"){
		     $('#nj1').show();
			 $('#nj2').show();
		     }
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
	
	//添加查询自定义功能   
	function  zdySelect(){
	var str = swnidow(700,480,'/pages/kscx/NewFile.jsp');
	if(str == "refresh"){
			window.location.reload();
		}
	selectZdy();
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
			<td><span class="tf">综合信息查询</span>   
			</td>
			
			<td class="dt2" style="display: none;"><input  name='userId' id="userId"  type="text" value="${sysuser.userId }"></td>
		</tr>
	</table>  
 	<!-- 内容 -->
 	 <div align="center">
	 	 <table  class=" f13 tab wp100 dt1"  align="center" bordercolor="#D0D0D0" border="1px" >
		  <tr  class="h30" >
		    <td id="sfzh1"  style="display: none;" class="dt1 w100 ">身份证号： </td>
	 	 	<td id="sfzh2"  style="display: none;text-align: left;" class="dt5"><input type="text" name='sfzh' id='sfzh' class="w150"/> </td> 
	 	 	<td id="xm1"    style="display: none;" class="dt1 w100 ">姓名： </td>   
		    <td id="xm2"    style="display: none;text-align: left;" class="dt5"><input type="text" name='xm' id='xm'  class="w150"/> </td> 
		    <td id="xb1"    style="display: none;" class="dt1 w80 ">性别： </td>   
		    <td id="xb2"    style="display: none;text-align: left;" class="dt5"><select name='xb' id="xb" class="w150"><option value='0'>--请选择--</option><option value="男">男</option><option value="女">女</option></select> </td> 
		    <td id="xh1"    style="display: none;" class="dt1 w80 ">学号：</td>
	 	 	<td id="xh2"    style="display: none;text-align: left;" class="dt5"><input type="text" name='xh' id='xh' class="w150"/></td>  
	 	 	<td id="lxdh1"  style="display: none;" class="dt1 w80 ">联系电话：</td>
	 	 	<td id="lxdh2"  style="display: none;text-align: left;" class="dt5"><input type="text" name='lxdh' id="lxdh" class="w150"/></td> 
	 	 	<td id="gj1"    style="display: none;" class="dt1 w80 ">籍贯：</td>
	 	 	<td id="gj2"    style="display: none;text-align: left;" class="dt5"><input type="text" name='jg' id='jg' class="w150"/></td>
	 	<!--   </tr>
	 	 <tr class="dt5">-->
	 	 	<td id="rxrq1"  style="display: none;" class="dt1 w80">入学日期：</td>
	 	 	<td id="rxrq2"  style="display: none;text-align: left;" class="dt5"><input type="text" name='rxrq' id='rxrq' class="w150"/></td>  
	 	    <td id="khh1"   style="display: none;" class="dt1 w80 ">开户行：</td>
	 	 	<td id="khh2"   style="display: none;text-align: left;" class="dt5"><input type="text" name='khh' id="khh" class="w150"/></td> 
	 	 	<td id="xy1"    style="display: none;" class="dt1 w80 ">学院：</td>
	 	 	<td id="xy2"    style="display: none;text-align: left;" class="dt5"><select name='xy' id="xy" class="w150" onChange="getzy();"><option value="0">--请选择--</option> </select></td> 
	 	 	<td id="zy1"    style="display: none;" class="dt1 w80 ">专业：</td> 
	 	 	<td id="zy2"    style="display: none;text-align: left;" class="dt5"><select name='zy' id="zy" class="w150"><option value="0">--请选择--</option></select></td> 
	 	 	<td id="nj1"    style="display: none;" class="dt1 w80 ">年级：</td>
	 	 	<td id="nj2"    style="display: none;text-align: left;" class="dt5 "><select name='nj' id="nj" class="w150"><option value="0">--请选择--</option></select></td> 
	 	</tr>
	 	 	
	 	 <tr>	
	 	 <td class="dt1  " colspan="10" align="right">
	 	 	  <input type="button" style="color: blue;font-weight: bold;" value="查询" title="查询学生基础信息及报名信息" onMouseDown="showStu(1);" class="w60" />
	 	 	  <input type="button" style="color: blue;font-weight: bold;" value="查询条件自定义" title="查询学生基础信息及报名信息" onmousedown="zdySelect();" title='修改银行账号' />
	 	  </td> 
	 	  </tr>
	 	 </table>
	 	         
 	</div> 
 	<!-- 左侧 -->
<div  class="wp100"> 
	 	 <table class="f13 tab wp100" id="tab" align="center" bordercolor="#D0D0D0" border="1px"  > 
			<tr > 
			<th class="tab2">序号 </th>
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
			<th class="tab2">操作</th>
			</tr> 
			<tbody id="trs">
			</tbody>
			</table> 
			 
			<div id="pager"></div> 
	</div>
</body> 
</html>

 
