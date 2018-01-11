<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>学生详细信息</title>
	<% String id =request.getParameter("id"); %>
 <link  rel="stylesheet" type="text/css" href="/css/detail.css" />
  <link  rel="stylesheet" type="text/css" href="/css/all.css" />
 <script type="text/javascript" src="/js/jquery.js"></script>
 <!--<script type="text/javascript" src="/js/bui.js"></script>-->
 <script type="text/javascript"> 
	$(document).ready(function () { 
	 	var id=<%=id %>;
	 	getxy();
	 	querystubyxsid(id);
	 	queryonescore(id);
	 	queryscore(id);
	 	querykszs(id);
	  	getjdzy();
	});
	
	window.onload=function(){
		var id=<%=id %>;
		var url ="/querystubyxsid?xsid="+id;
		 $.getJSON(url,{Rand:Math.random()},function(data){
		 var stu=data.stu;
		 var xyid = stu.zyxx.collage.xyid;
		 var zyid = stu.zyxx.zyid;
		 var s = document.getElementById("xymc"); 
        var ops = s.options;  
        for(var i=0;i<ops.length; i++){  
            var tempValue = ops[i].value;
           if(tempValue == xyid)   //这里是你要选的值  
            {  
                ops[i].selected = true;  
                break;
            }
        }
			if(xyid!=null && xyid!=0){
				var url="/queryzy";
				$.getJSON(url,{xy:xyid},function(data){ 
					var zys = data.zyxxs;
					var htmls="<option value='0'>--请选择--</option>";
					for(var i=0;i<zys.length;i++){
						if(zys[i].zyid==zyid){
							htmls +="<option selected='selected' name='"+zys[i].zymc+"' value='"+zys[i].zyid+"'>"+zys[i].zymc+"</option>";
						}
						else {htmls +="<option name='"+zys[i].zymc+"' value='"+zys[i].zyid+"'>"+zys[i].zymc+"</option>";}
					}
					$("#zymc").html(htmls); 
				}); 
			}
		});
		
		var url ="/queryOnesCore?xsid="+id; 
	   $.getJSON(url,{Rand:Math.random()},function(data){
		 var bm=data.bmxxs; 
		 var zsid= bm[0].zyzs.zsid;
		 	var url="/queryjdzy";
			$.getJSON(url,null,function(data){ 
				var jdzy = data.jdzys;
				var htmls="";
				for(var i=0;i<jdzy.length;i++){
					if(jdzy[i].zsid==zsid){
						htmls +="<option  selected='selected' title='"+jdzy[i].zsdj+"' name='"+jdzy[i].fzjg+"' value='"+jdzy[i].zsid+"'>"+jdzy[i].zsmc+"</option>";
					}
					htmls +="<option title='"+jdzy[i].zsdj+"' name='"+jdzy[i].fzjg+"' value='"+jdzy[i].zsid+"'>"+jdzy[i].zsmc+"</option>";
				}
				$("#jdzy").append(htmls); 
			});
		 });
	}
	function getxy(){
		var url="/queryxy";
		$.getJSON(url,null,function(data){ 
			var cols = data.collages;
			var htmls="";
			for(var i=0;i<cols.length;i++){
				htmls +="<option value='"+cols[i].xyid+"'>"+cols[i].xymc+"</option>";
			}
			$("#xymc").append(htmls); 
		}); 
	}
	
	function getzy(){
		var xy =$('#xymc').val();
		if(xy!=null && xy!=0){
			var url="/queryzy";
			$.getJSON(url,{xy:xy},function(data){ 
				var zys = data.zyxxs;
				var htmls="<option value='0'>--请选择--</option>";
				for(var i=0;i<zys.length;i++){
					//htmls +="<option value='"+zys[i].zyid+"'>"+zys[i].zymc+"</option>";
					htmls +="<option name='"+zys[i].zymc+"' value='"+zys[i].zyid+"'>"+zys[i].zymc+"</option>";
				}
				$("#zymc").html(htmls); 
			}); 
		}
	}
	function keepzyfx(){
	   var value = $("#zymc").find("option:selected").text();
		$('#zyfx').val(value);
	}
	function jdjg(){
		var value = $("#jdzy").find("option:selected").attr("name");
		var value2 = $("#jdzy").find("option:selected").attr("title");
		var value1 = $("#jdzy").find("option:selected").text();
		$('#jdjg').val(value);
		$('#jdzy1').val(value1);
		$('#jb').val(value2);
	}
	 function querystubyxsid(xsid){
			 var url ="/querystubyxsid?xsid="+xsid;
			 $.getJSON(url,{Rand:Math.random()},function(data){
			 var s=data.stu;
			 	$("#xh").val(s.xh);
			 	$("#xm").val(s.xm);
			 	$("#xb").val(s.xb);
			 	$("#sfzh").val(s.sfzh);
			 	$("#xymc1").val(s.zyxx.collage.xyid);
			 	$("#zymc1").val(s.zyxx.zyid);
			 	$("#bjmc").val(s.bjmc);
			 	$("#zyfx").val(s.zyxx.zymc);
			 	$("#zzmm").val(s.zzmm);
			 	$("#lxdh").val(s.lxdh);
			 	$("#jg").val(s.jg);
			 	$("#nj").val(s.nj);
			 	$("#rxrq").val(s.rxrq);
			 }); 
		};
	function queryonescore(xsid){
	   var url ="/queryOnesCore?xsid="+xsid; 
	   $.getJSON(url,{Rand:Math.random()},function(data){
		 var bm=data.bmxxs; 
		// alert("ok:"+url);
	 	var htmls="";
		for(var i = 0 ; i < bm.length;i++){
			$("#bmdd").val(bm[i].bmdd);
			$("#xm1").val(bm[i].stu.xm);
			$("#bmsj").val(bm[i].bmsj);
			$("#jdjg").val(bm[i].zyzs.fzjg);
			$("#jdkm").val(bm[i].jdkm);
			$("#lxdh1").val(bm[i].stu.lxdh);
			$("#bkxx").val(bm[i].bkxx);
			$("#zpcj").val(bm[i].zpcj);
			$("#bmjg").val(bm[i].bmjg);
		} 
	   }); 
	};
	function queryscore(xsid){
	   var url ="/queryscore?xsid="+xsid; 
	   $.getJSON(url,{Rand:Math.random()},function(data){
		var cor=data.scors;
	 	var htmls="";
		for(var i = 0 ; i < cor.length;i++){
			$("#zkzh").val(cor[i].zkzh);
			$("#bmsj1").val(cor[i].bmxx.bmsj);
			$("#jdzy1").val(cor[i].bmxx.zyzs.zsmc);
			$("#jb").val(cor[i].bmxx.zyzs.zsdj);
			$("#llcj").val(cor[i].llcj);
			$("#sccj").val(cor[i].sccj);
			$("#wycj").val(cor[i].wycj);
			$("#zhcj").val(cor[i].zhcj);
			$("#pdcj").val(cor[i].pdcj);
		} 
  		$("#tab4").append(htmls); 
	   }); 
	};	
		
function querykszs(xsid){
	   var url ="/querykszs?xsid="+xsid; 
	   $.getJSON(url,{Rand:Math.random()},function(data){
		var s_zs=data.kszss; 
	 	var htmls="";
		for(var i = 0 ; i < s_zs.length;i++){
	    htmls+="<tr ondblclick='clickRow("+s_zs[i].kzid+")'>"+  
			"<td class='dt2'>"+s_zs[i].zkzh+"</td>"+
			"<td class='dt2'>"+s_zs[i].zsbh+"</td>"+
			"<td class='dt2'>"+s_zs[i].zsmc+"</td> "+
			"<td class='dt2'>"+s_zs[i].zsdj+"</td>"+
			"<td class='dt2'>"+s_zs[i].fzrq+"</td> "+
			"<td class='dt2'>"+s_zs[i].cdrq+"</td> "+
			"<td class='dt2'>"+s_zs[i].xf+"</td> "+
			"<td class='dt2'>"+s_zs[i].money+"</td>"+
			"</tr>";
		}
  		$("#tab3").append(htmls);
	   }); 
};		
			
function clickRow(id){
		var url = '/pages/kscx/zsviewforupd.jsp?kzid='+id;
		var iWidth = 1200;
		var iHeight = 300;
		var iTop = 400;
		var iLeft = 355;
		var rev = window.showModalDialog(url,window,"dialogWidth:"+iWidth+"px;dialogHeight:"+iHeight+"px;dialogTop:"+iTop+"px;dialogLeft:"+iLeft+"px;edge: Raised; center: Yes; help: No; resizable: No;status:no;location:no;");
		if(rev=="refresh"){
			window.name = "__self"; 
			window.open(window.location.href, "__self");
		}
}

function save(){
		var xsid = <%=id%>;
		var url = "/updatestu";
		var xh = $('#xh').val();
		var xm = $('#xm').val();
		var xb = $('#xb').val();
		var sfzh = $('#sfzh').val();
		var xymc = $('#xymc').val();
		var zymc = $('#zymc').val();
		var bjmc = $('#bjmc').val();
		var zyfx = $('#zyfx').val();
		var zzmm = $('#zzmm').val();
		var lxdh = $('#lxdh').val();
		var jg = $('#jg').val();
		var xm1 = $('#xm1').val();
		var bmdd = $('#bmdd').val();
		var bmsj = $('#bmsj').val();
		var jdjg = $('#jdjg').val();
		var jdzy = $('#jdzy').val();
		var jdkm = $('#jdkm').val();
		var lxdh1 = $('#lxdh1').val();
		var bkxx = $('#bkxx').val();
		var zpcj = $('#zpcj').val();
		var bmjg = $('#bmjg').val();
		var zkzh = $('#zkzh').val();
		var bmsj1 = $('#bmsj1').val();
		var jdzy1 = $('#jdzy1').val();
		var jb = $('#jb').val();
		var llcj = $('#llcj').val();
		var sccj = $('#sccj').val();
		var wycj = $('#wycj').val();
		var zhcj = $('#zhcj').val();
		var pdcj = $('#pdcj').val();
		
		var nj = $('#nj').val();
		var rxrq = $('#rxrq').val();
		if(!$.trim(xh)){
			alert("学号不能为空！");
			return;
		}
		if(!$.trim(xm)){
			alert("姓名不能为空！");
			return;
		}
		if(xb=="0"){
			alert("性别不能为空！");
			return;
		}
		if(!$.trim(sfzh)){
			alert("身份证号不能为空！");
			return;
		}
		if(xymc=="0"){
			alert("学院名称不能为空！");
			return;
		}
		if(zymc=="0"){
			alert("专业名称不能为空！");
			return;
		}
		if(!$.trim(bjmc)){
			alert("班级名称不能为空！");
			return;
		}
		if(!$.trim(nj)){
			alert("年级不能为空！");
			return;
		}
		/* if(!$.trim(xm1)){
			alert("姓名不能为空！");
			return;
		} */
		/* if(!$.trim(bmdd)){
			alert("报名地点不能为空！");
			return;
		}
		if(!$.trim(bmsj)){
			alert("报名时间不能为空！");
			return;
		} */
		/* if(jdzy=="0"){
			alert("鉴定职业不能为空！");
			return;
		} */
		/* if(!$.trim(zkzh)){
			alert("准考证号不能为空！");
			return;
		}
		if(!$.trim(bmsj1)){
			alert("报名时间不能为空！");
			return;
		} */
		var param ={Rand:Math.random(),xsid:xsid,xh:xh,xm:xm,xb:xb,sfzh:sfzh,xymc:xymc,zymc:zymc,bjmc:bjmc,zyfx:zyfx,zzmm:zzmm,lxdh:lxdh,jg:jg,xm1:xm1,bmdd:bmdd,bmsj:bmsj,
		jdjg:jdjg,jdzy:jdzy,jdkm:jdkm,lxdh1:lxdh1,bkxx:bkxx,zpcj:zpcj,bmjg:bmjg,zkzh:zkzh,bmsj1:bmsj1,jdzy1:jdzy1,jb:jb,llcj:llcj,sccj:sccj,
		wycj:wycj,zhcj:zhcj,pdcj:pdcj,nj:nj,rxrq:rxrq};
		
		
		$.getJSON(url,param,function(data){
				var msg = data.msg;
				if(msg=="修改成功！"){
				 	alert(msg);
					$('#zsbut').show();
					window.returnValue='refresh';
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
				htmls +="<option title='"+jdzy[i].zsdj+"' name='"+jdzy[i].fzjg+"' value='"+jdzy[i].zsid+"'>"+jdzy[i].zsmc+"</option>";
			}
			$("#jdzy").append(htmls); 
		});
		
	}
	
	function keepXm1(){
		var namee= $('#xm').val();
		$('#xm1').val(namee);
	}
</script>
</head>
<body> 
	<div align="center">
		<fieldset class="wp98 f13 mt20">
			<legend>学生基本信息修改</legend>
			<table class="  f13 tab wp100" id="tab" align="center"
				bordercolor="#D0D0D0" border="1px">
				<tr class="h30">
					<td class="dt1 w80 "><font color="red" style="position:relative; top:2px;">*</font>学号：</td><td class="dt2"><input  name='xh' id="xh" type="text"></td>
					<td class="dt1  w80"><font color="red" style="position:relative; top:2px;">*</font>姓名：</td><td class="dt2"><input  name='xm' id="xm"  type="text"  onchange="keepXm1();"></td>
					<td class="dt1  w80"><font color="red" style="position:relative; top:2px;">*</font>性别：</td><td class="dt2"><select name='xb' id="xb" class="w150"><option value='0'>--请选择--</option><option value="男">男</option><option value="女">女</option></select></td>
					<td class="dt1  w80"><font color="red" style="position:relative; top:2px;">*</font>身份证号：</td><td class="dt2"><input  name='sfzh' id="sfzh"  type="text"></td>
				</tr>
				<tr class="h30">
					<td class="dt1  w80"><font color="red" style="position:relative; top:2px;">*</font>学院名称：</td><td class="dt2"><select name='xymc' id="xymc" class="w150" onchange="getzy();"><option  value="0">--请选择--</option> </select></td>
					<td class="dt1 w80"><font color="red" style="position:relative; top:2px;">*</font>专业名称：</td><td class="dt2"><select name='zymc' id="zymc"  onchange="keepzyfx();"  class="w150"><option value="0">--请选择--</option> </select></td>
					<td class="dt1  w80"><font color="red" style="position:relative; top:2px;">*</font>班级名称：</td><td class="dt2"><input  name='bjmc' id="bjmc"  type="text"></td>
					<td class="dt1  w80">专业方向：</td><td class="dt2"><input  name='zyfx' id="zyfx"  type="text"  readonly="readonly" style="background-color: #FDF5E6"></td>
				</tr>
				<tr class="h30">
					<td class="dt1 w80"><font color="red" style="position:relative; top:2px;">*</font>年级：</td><td class="dt2"><input  name='nj' id="nj"  type="text"></td>
					<td class="dt1  w80">政治面貌：</td><td class="dt2"><input  name='zzmm' id="zzmm"  type="text"></td>
					<td class="dt1  w80">联系电话：</td><td class="dt2"><input  name='lxdh' id="lxdh"  type="text"></td>
					<td class="dt1 w80">籍贯：</td><td class="dt2"><input  name='jg' id="jg"  type="text"></td>
				</tr>
				<tr>
					<td class="dt1 w80">入学日期：</td><td class="dt2"><input  name='rxrq' id="rxrq"  type="text"></td>
					<td class="dt1 w80"></td><td class="dt2"><br></td>
					<td class="dt1 w80"></td><td class="dt2"><br></td>
					<td class="dt1 w80"></td><td class="dt2"><br></td>
				</tr>
			</table>
		</fieldset>
		<fieldset class="wp98 f13 mt20">
			<legend>学生报名信息修改</legend>
			<table class=" f13 tab wp100" id="tab1" align="center"
				bordercolor="#D0D0D0" border="1px">
				<tr>
					<td class="dt1 w80">姓名</td><td class="dt2"><input  name='xm1' id="xm1"  type="text"></td>
					<td class="dt1 w80">报名地点</td><td class="dt2"><input  name='bmdd' id="bmdd"  type="text"></td>
					<td class="dt1 w80">报名时间</td><td class="dt2"><input  name='bmsj' id="bmsj"  type="text"></td>
					<td class="dt1 w80">鉴定职业</td><td class="dt2"><select title="" name='jdzy' id="jdzy" class="w150" onchange="jdjg();"><option  value="0">--请选择--</option></select></td>
				</tr>
				<tr>	
					<td class="dt1 w80">鉴定机构</td><td class="dt2"><input  name='jdjg' id="jdjg"  style="background-color: #FDF5E6" readonly="readonly" type="text"></td>
					<td class="dt1 w80">鉴定科目</td><td class="dt2"><input  name='jdkm' id="jdkm"  type="text"></td>
					<td class="dt1 w80">联系电话</td><td class="dt2"><input  name='lxdh1' id="lxdh1"  type="text"></td>
					<td class="dt1 w80">补考信息</td><td class="dt2"><input  name='bkxx' id="bkxx"  type="text"></td>
				</tr>	
				<tr>	
					<td class="dt1 w80">照片采集</td><td class="dt2"><input  name='zpcj' id="zpcj"  type="text"></td>
					<td class="dt1 w80">报名机构</td><td class="dt2"><input  name='bmjg' id="bmjg"  type="text"></td>
					<td class="dt1 w80"></td><td class="dt2"><br></td>
					<td class="dt1 w80"></td><td class="dt2"><br></td>
				</tr>
			</table>
		</fieldset>
		<fieldset class="wp98 f13 mt20">
			<legend>学生成绩信息修改</legend>
			<table class="f13 tab wp100" id="tab4" align="center"
				bordercolor="#D0D0D0" border="1px">
				<tr>
					<td class="dt1 w80">准考证号</td><td class="dt2"><input  name='zkzh' id="zkzh"  type="text"></td>
					<td class="dt1 w80">报名时间</td><td class="dt2"><input  name='bmsj1' id="bmsj1"  type="text"></td>
					<td class="dt1 w80">鉴定职业</td><td class="dt2"><input  name='jdzy1' id="jdzy1"  type="text" readonly="readonly" style="background-color: #FDF5E6"></td>
					<td class="dt1 w80">级别</td><td class="dt2"><input  name='jb' id="jb"  readonly="readonly" style="background-color: #FDF5E6" type="text"></td>
				</tr>
				<tr>	
					<td class="dt1 w80">理论成绩</td><td class="dt2"><input  name='llcj' id="llcj"  type="text"></td>
					<td class="dt1 w80">实操成绩</td><td class="dt2"><input  name='sccj' id="sccj"  type="text"></td>
					<td class="dt1 w80">外语成绩</td><td class="dt2"><input  name='wycj' id="wycj"  type="text"></td>
					<td class="dt1 w80">综合成绩</td><td class="dt2"><input  name='zhcj' id="zhcj"  type="text"></td>
				</tr>
				<tr>	
					<td class="dt1 w80">评定成绩</td><td class="dt2"><input  name='pdcj' id="pdcj"  type="text"></td>
					<td class="dt1 w80"></td><td class="dt2"><br></td>
					<td class="dt1 w80"></td><td class="dt2"><br></td>
					<td class="dt1 w80"></td><td class="dt2"><br></td>
				</tr>

			</table>

		</fieldset>
				<div id="pager"></div> 
		<fieldset class="wp99 f13 mt20">
			<legend>学生证书信息修改</legend>
			<table class="f13 tab wp100" id="tab3"  align="center" bordercolor="#D0D0D0" border="1px"  > 
				<tr>
					<th class="tab2">准考证号</th>
					<th class="tab2">证书编号</th>
					<th class="tab2">证书名称</th>
					<th class="tab2">证书等级</th>
					<th class="tab2">发证日期</th>
					<th class="tab2">存档日期</th>
					<th class="tab2">学分</th>
					<th class="tab2">奖励标准</th>
				</tr> 
			</table> 
			</fieldset>
		<input id="savebut" type="button" style="font-weight: bold;" value="保存" title="修改信息" onclick="save();" class="w60">
		<input id="" type="button" style="font-weight: bold;" value="关闭"  onclick="javascript:window.returnValue='refresh';window.close();" class="w60">
	</div>
</body> 
</html> 