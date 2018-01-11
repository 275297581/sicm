$(document).ready(function() {
	getxy();
	setnj();
	getzslx();
	showJl(1);
});
var pager;
function getxy() {
	var url = "/queryxy";
	$.getJSON(url, {
		Rand : Math.random()
	}, function(data) {
		var cols = data.collages;
		var htmls = "";
		for ( var i = 0; i < cols.length; i++) {
			htmls += "<option value='" + cols[i].xyid + "'>" + cols[i].xymc + "</option>";
		}
		$("#xy").append(htmls);
	});
}
function getzy() {
	var xy = $('#xy').val();
	if (xy != null && xy != 0) {
		var url = "/queryzy?xy=" + xy;
		$.getJSON(url, {
			Rand : Math.random()
		}, function(data) {
			var zys = data.zyxxs;
			var htmls = "<option value='0'>--请选择--</option>";
			for ( var i = 0; i < zys.length; i++) {
				htmls += "<option value='" + zys[i].zyid + "'>" + zys[i].zymc + "</option>";
			}
			$("#zy").html(htmls);
		});
	}
}
function setnj() {
	var htmls = "";
	for ( var i = 2005; i < 2026; i++) {
		htmls += "<option value='" + i + "'>" + i + "</option>";
	}
	$("#nj").append(htmls);
}

function getzslx() {
	var url = "/getlx";
	$.getJSON(url, {
		Rand : Math.random()
	}, function(data) {
		var lxs = data.zslxs;
		var htmls = "";
		for ( var i = 0; i < lxs.length; i++) {
			htmls += "<option value='" + lxs[i] + "'>" + lxs[i] + "</option>";
		}
		$("#zslx").append(htmls);
	});
}

function lxchange() {
	if ($('#zslx').val() != "") {
		var url = "/getzyzs";
		$.getJSON(url, {
			Rand : Math.random(),
			zsfl : $('#zslx').val()
		}, function(data) {
			var zs = data.zyzss;
			var htmls = "<option value=''>--请选择--</option> ";
			for ( var i = 0; i < zs.length; i++) {
				htmls += "<option value='" + zs[i] + "'>" + zs[i] + "</option>";
			}
			$("#zyzs").html(htmls);
		});
	}
}
var count = 0;
function showJl(index) {
	// var url ="/queryStuJl";
	var url = "/queryStuJlExtends";
	var param = {
		xy : $('#xy').val(),
		index : index,
		zy : $('#zy').val(),
		nj : $('#nj').val(),
		zs : $('#zyzs').val(),
		Rand : Math.random()
	};
	$.getJSON(url, param, function(data) {
		if (index == 1) {
			// 显示分页导航
			pager = spager(data.count);
			count = data.count;
			pager.onclick = function(index) {
				pagerselect(index);
			};
		}
		// 原版数据
		// var zs =data.stuzss;
		// var htmls="";
		// for(var i = 0 ; i < zs.length;i++){
		// htmls+="<tr>"+
		// "<td class='tab3'>"+(i+1)+"</td>"+
		// "<td class='tab3'>"+(zs[i].xymc==null?"":zs[i].xymc)+"</td>"+
		// "<td class='tab3'>"+(zs[i].zymc==null?"":zs[i].zymc)+"</td>"+
		// "<td class='tab3'>"+(zs[i].nj==null?"":zs[i].nj)+"</td> "+
		// "<td class='tab3'>"+(zs[i].xm==null?"":zs[i].xm)+"</td> "+
		// "<td class='tab3'>"+(zs[i].xb==null?"":zs[i].xb)+"</td> "+
		// "<td class='tab3'>"+(zs[i].xh==null?"":zs[i].xh)+"</td>"+
		// "<td class='tab3'>"+(zs[i].sfzh==null?"":zs[i].sfzh)+"</td> "+
		// "<td class='tab3'>"+(zs[i].khh==null?"":zs[i].khh)+"</td> "+
		// "<td class='tab3'>"+(zs[i].yhzh==null?"":zs[i].yhzh)+"</td> "+
		// "<td class='tab3'>"+(zs[i].zsmc==null?"":zs[i].zsmc)+"</td> "+
		// "<td class='tab3'>"+(zs[i].zsdj==""?"0":zs[i].dj)+"</td>"+
		// "<td class='tab3'>"+(zs[i].jlbz==""?"0":zs[i].jlbz)+"</td>"+
		// "<td class='tab3'>"+0+"</td>"+
		// "<td class='tab3'>"+(zs[i].xf=="" ?"0": zs[i].xf)+"</td>"+
		// "<td class='tab3'>"+0+"</td>"+
		// "<td class='tab3'>"+(zs[i].qm==null? "" : zs[i].qm) +"</td>"+
		// "<td class='tab3'>" ;
		// if(zs[i].remark!=null&&zs[i].remark!="")
		// htmls+="<input type='image' src='/icon/info.gif' title='"+zs[i].remark+"'>" ;
		// htmls+="</td>";
		// //htmls+="<td><a href="+"javascript:window.open('','_blank');"+">修改实际奖励</a></td>";
		// htmls+="</tr>";
		// }

		var zs = data.kszs;
		var htmls = "";
		for ( var i = 0; i < zs.length; i++) {
			htmls += "<tr>";
			htmls += "<td class='tab3'>" + (i + 1) + "</td>";
			htmls += "<td class='tab3'>" + (zs[i].stu.zyxx.collage.xymc == null ? "" : zs[i].stu.zyxx.collage.xymc) + "</td>";
			htmls += "<td class='tab3'>" + (zs[i].stu.zyxx.zymc == null ? "" : zs[i].stu.zyxx.zymc) + "</td>";
			htmls += "<td class='tab3'>" + (zs[i].stu.nj == null ? "" : zs[i].stu.nj) + "</td> ";
			htmls += "<td class='tab3'>" + (zs[i].stu.xm == null ? "" : zs[i].stu.xm) + "</td> ";
			htmls += "<td class='tab3'>" + (zs[i].stu.xb == null ? "" : zs[i].stu.xb) + "</td> ";
			htmls += "<td class='tab3'>" + (zs[i].stu.xh == null ? "" : zs[i].stu.xh) + "</td>";
			htmls += "<td class='tab3'>" + (zs[i].stu.sfzh == null ? "" : zs[i].stu.sfzh) + "</td> ";
			htmls += "<td class='tab3'>" + (zs[i].stu.khh == null ? "" : zs[i].stu.khh) + "</td> ";
			htmls += "<td class='tab3'>" + (zs[i].stu.yhzh == null ? "" : zs[i].stu.yhzh) + "</td> ";
			htmls += "<td class='tab3'>" + (zs[i].zsmc == null ? "" : zs[i].zsmc) + "</td> ";
			htmls += "<td class='tab3'>" + (zs[i].zsdj == "" ? "" : zs[i].zsdj) + "</td>";
			/*htmls += "<td class='tab3'>" + (zs[i].zyzs.jlbz == "" ? "0" : zs[i].zyzs.jlbz) + "</td>";*/
			htmls += "<td class='tab3'>" + (zs[i].money == "" ? "0" : zs[i].money) + "</td>";
			/*htmls += "<td class='tab3'>" + (zs[i].zyzs.xf == "" ? "0" : zs[i].zyzs.xf) + "</td>";*/
			htmls += "<td class='tab3'>" + (zs[i].xf == "" ? "0" : zs[i].xf) + "</td>";
			htmls += "<td class='tab3'>" + (zs[i].qm == null ? "" : zs[i].qm) + "</td>";
			htmls += "<td class='tab3'>";
			if (zs[i].remark != null && zs[i].remark != "") {
				htmls += "<input type='image' src='/icon/info.gif' title='" + zs[i].remark + "'>";
			}
			htmls += "</td>";
			htmls += "</tr>";
		}
		$("#trs").html(htmls);
		stab();
	});
}
function pagerselect(index) {
	showJl(index);
}
function exportExcel() {
	if (!window.confirm("确定要导出查询的所有奖励明细吗？")) {
		return;
	}
	var title;
	if ($('#xy').val() != "0")
		title = $('#xy').find("option:selected").text();
	else {
		title = "陕西工业职业技术学院";
	}
	title = title + "奖励明细";

	title = encodeURI(encodeURI(title));// 进行格式化编码

	var url = "/exportStuJl";
	url += "?xy=" + $('#xy').val();
	url += "&zy=" + $('#zy').val();
	url += "&nj=" + $('#nj').val();
	url += "&zs=" + $('#zyzs').val();
	url += "&title=" + title;
	window.location.href = url;
}

function prientVal() {
	if (count == 0) {
		alert("无需要打印的数据！");
		return;
	}
	if (!confirm("请确定要打印奖励明细信息！"))
		return;
	var title;
	if ($('#xy').val() != "0")
		title = $('#xy').find("option:selected").text();
	else {
		title = "陕西工业职业技术学院";
	}
	title = title + "奖励明细";
	/* if($('#zy').val()!="0") zy =$('#zy').find("option:selected").text(); */
	var data = new Array();
	data.push("<table width='100%' ><tbody>");
	data.push("<tr><td align='center' style='font-size: 18px; font-weight: bold; font-family: 宋体'>" + title + "</td></tr>");
	data.push("</tbody></table>");
	data.push("<table   border='1' bordercolor='#000000' style='border-collapse:collapse;text-align:center;font-size:12px;' width='100%' ><tbody>");
	data.push("<tr>");
	data.push("<th >序号</th>");
	data.push("<th >学院</th>");
	data.push("<th >专业</th>");
	data.push("<th >年级</th>");
	data.push("<th >姓名</th>");
	data.push("<th >性别</th>");
	data.push("<th >学号</th>");
	// data.push("<th >身份证号</th>");
	data.push("<th >银行卡号</th>");
	data.push("<th >证书名称</th>");
	data.push("<th >奖励金额</th>");
	data.push("<th >奖励学分</th>");
	data.push("<th >确认签名</th>");
	// data.push("<th >备注</th>");
	data.push("</tr>");
	var url = "/queryStuJlAll";
	var param = {
		xy : $('#xy').val(),
		zy : $('#zy').val(),
		nj : $('#nj').val(),
		zs : $('#zyzs').val(),
		Rand : Math.random()
	};
	$.getJSON(url, param, function(datas) {
		var zss = datas.stuzss;
		var totalmoney = 0;
		for ( var j = 0; j < zss.length; j++) {
			data.push("<tr>");
			data.push("<td >" + (j + 1) + "</td>");
			data.push("<td >" + zss[j].xymc + "</td>");
			data.push("<td >" + zss[j].zymc + "</td>");
			data.push("<td >" + zss[j].nj + "</td>");
			data.push("<td >" + zss[j].xm + "</td>");
			data.push("<td >" + zss[j].xb + "</td>");
			data.push("<td >" + zss[j].xh + "</td>");
			// data.push("<td >"+zss[j].sfzh +"</td>");
			data.push("<td >" + zss[j].yhzh + "</td>");
			data.push("<td >" + zss[j].zsmc + "</td>");
			data.push("<td >" + zss[j].jlbz + "</td>");
			totalmoney += (zss[j].jlbz * 1);
			data.push("<td >" + zss[j].xf + "</td>");
			data.push("<td >" + zss[j].qm + "</td>");
			// data.push("<td ></td>");
			data.push("</tr>");
		}

		data.push("<tr>");
		data.push("<td colspan='2'>金额合计</td>");
		data.push("<td colspan='7'></td>");
		data.push("<td >" + totalmoney + "</td>");
		data.push("<td colspan='3'></td>");
		data.push("</tr>");

		data.push("</tbody></table>");

		data.push("</br></br>");

		data.push("<table  style='text-align:right;font-size:12px;' width='100%' ><tbody>");
		data.push("<tr>");
		data.push("<td >制表人：</td><td width='60px' align='left'>" + $('#uname').val() + "</td>");
		data.push("<td >部门负责人：</td><td width='60px'></td>");
		data.push("<td >学生处：</td><td width='60px'></td>");
		data.push("<td >继续教育中心：</td><td width='60px'></td>");
		data.push("</tr>");

		var now = new Date();
		var nowStr = now.format("yyyy-MM-dd");
		data.push("<tr>");
		data.push("<td >主管院长：</td><td ></td>");
		data.push("<td >院长：</td><td ></td>");
		data.push("<td >财务处：</td><td ></td>");
		data.push("<td >制表时间：</td><td align='left'>" + nowStr + "</td>");
		data.push("</tr>");
		data.push("</tbody></table>");
		lodopPContent(data.join(''), 2);
	});
}
Date.prototype.format = function(format) {
	var o = {
		"M+" : this.getMonth() + 1, // month
		"d+" : this.getDate(), // day
		"h+" : this.getHours(), // hour
		"m+" : this.getMinutes(), // minute
		"s+" : this.getSeconds(), // second
		"q+" : Math.floor((this.getMonth() + 3) / 3), // quarter
		"S" : this.getMilliseconds()
	// millisecond
	};

	if (/(y+)/.test(format)) {
		format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	}

	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(format)) {
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
		}
	}
	return format;
};