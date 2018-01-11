<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>学生详细信息</title>
<%
	String kzid = request.getParameter("kzid");
%>
<link rel="stylesheet" type="text/css" href="/css/detail.css" />
<link rel="stylesheet" type="text/css" href="/css/all.css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<!--<script type="text/javascript" src="/js/bui.js"></script>-->
<script type="text/javascript">
	$(document).ready(function() {
		var kzid = <%=kzid %>;
		getjdzy();
		queryKszsbyid(kzid);
	});
	
	window.onload=function(){
		var kzid=<%=kzid %>;
		var url ="/queryKszsbyid?kzid="+kzid; 
	   $.getJSON(url,{Rand:Math.random()},function(data){
		 var kszs=data.kszs.zyzs; 
		 var zsid = kszs.zsid;
		 var s = document.getElementById("jdzy"); 
        var ops = s.options;
        for(var i=0;i<ops.length; i++){  
            var tempValue = ops[i].value;
           if(tempValue == zsid)   //这里是你要选的值  
            {  
                ops[i].selected = true;  
                break;
            }
        }
			
		 });
	}
	
	function queryKszsbyid(kzid){
			 var url ="/queryKszsbyid?kzid="+kzid;
			 $.getJSON(url,{Rand:Math.random()},function(data){
			 var s=data.kszs;
			 	$("#zkzh1").val(s.zkzh);
			 	$("#zsbh").val(s.zsbh);
			 	$("#zsdj").val(s.zsdj);
			 	$("#fzrq").val(s.fzrq);
			 	$("#cdrq").val(s.cdrq);
			 	$("#xf").val(s.xf);
			 	$("#jlbz").val(s.money);
			 }); 
	};
	// 修改证书
	function updatezs(){
		var url = "/updatezs";
		var kzid = $('#kzid').val(); 
		var zkzh1 = $('#zkzh1').val();
		var zsbh = $('#zsbh').val();
		var zsmc = $("#jdzy").find("option:selected").text();
		var zsid = $("#jdzy").val();
		var zsdj = $('#zsdj').val();
		var fzrq = $('#fzrq').val();
		var cdrq = $('#cdrq').val();
		var xf = $('#xf').val();
		var jlbz = $('#jlbz').val();
		if(!$.trim(zsbh)){
			alert("证书编号不能为空！");
			return;
		}
		if(zsid=="0"){
			alert("证书名称不能为空！");
			return;
		}
		var param ={Rand:Math.random(),kzid:kzid,zsid:zsid,zkzh1:zkzh1,zsbh:zsbh,zsmc:zsmc,zsdj:zsdj,fzrq:fzrq,cdrq:cdrq,xf:xf,jlbz:jlbz};
		
		$.getJSON(url,param,function(data){
				var msg = data.msg;
				if(msg=="修改成功！"){
				 	alert(msg);
				 	window.returnValue='refresh';
					//window.close();
				}else{
					alert(msg);
				}
		});
	};
	function getjdzy(){
		var url="/queryjdzy";
		$.getJSON(url,null,function(data){ 
			var jdzy = data.jdzys;
			var htmls="";
			for(var i=0;i<jdzy.length;i++){
				htmls +="<option jlbz='"+jdzy[i].jlbz+"' title='"+jdzy[i].zsdj+"' name='"+jdzy[i].xf+"' value='"+jdzy[i].zsid+"'>"+jdzy[i].zsmc+"</option>";
			}
			$("#jdzy").append(htmls); 
		});
		
	}
	function jdjg(){
		var value = $("#jdzy").find("option:selected").attr("name");
		var value2 = $("#jdzy").find("option:selected").attr("title");
		var value1 = $("#jdzy").find("option:selected").attr("jlbz");
		$('#zsdj').val(value2);
		$('#xf').val(value);
		$('#jlbz').val(value1);
	}
	
</script>
</head>
<body>
	<div align="center">
		
		<fieldset class="wp99 f13 mt20">
			<legend>学生证书信息录入</legend>
			<table class="f13 tab wp100" id="tab3" align="center"
				bordercolor="#D0D0D0" border="1px">
				<tr>
					<td class="dt1 w80">准考证号</td><td class="dt2"><input  name='zkzh1' id="zkzh1"  type="text"></td>
					<td class="dt1 w80"><font color="red" style="position:relative; top:2px;">*</font>证书名称</td><td class="dt2"><select  name='jdzy' id="jdzy" class="w150" onchange="jdjg();"><option  value="0">--请选择--</option></select></td>
					<td class="dt1 w80"><font color="red" style="position:relative; top:2px;">*</font>证书编号</td><td class="dt2"><input  name='zsbh' id="zsbh"  type="text"></td>
					<td class="dt1 w80">证书等级</td><td class="dt2"><input  name='zsdj' id="zsdj"  type="text" readonly="readonly" style="background-color: #FDF5E6" ></td>
				</tr>
				<tr>	
					<td class="dt1 w80">发证日期</td><td class="dt2"><input  name='fzrq' id="fzrq"  type="text"></td>
					<td class="dt1 w80">存档日期</td><td class="dt2"><input  name='cdrq' id="cdrq"  type="text"></td>
					<td class="dt1 w80">学分</td><td class="dt2"><input  name='xf' id="xf"  type="text" readonly="readonly" style="background-color: #FDF5E6" ></td>
					<td class="dt1 w80">奖励标准</td><td class="dt2"><input  name='jlbz' id="jlbz"  type="text" readonly="readonly" style="background-color: #FDF5E6" ></td>
				</tr>
			</table>
		</fieldset>
		<input id="kzid" type="text" value="<%=kzid%>" style="display: none;">
		<input type="button" value="修改" onclick="updatezs();">
		<input type="button" value="关闭" onclick="javascript:window.returnValue='refresh';window.close();">
		
	</div>
</body>
</html>
