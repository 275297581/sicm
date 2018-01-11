<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/all.css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/pager.js"></script>
<!--<script type="text/javascript" src="/js/bui.js"></script>-->
<script type="text/javascript">
	$(document).ready(function() {
		showRoles();
	});
	/* 查询角色信息 */
	function showRoles() {
		/* $.blockUI();*/
		$.getJSON("/showrole", {
			Rand : Math.random()
		}, function(data) {
			/* $.unblockUI();*/
			var roles = data.sysroles;
			var htmls = "";
			for ( var i = 0; i < roles.length; i++) {
				htmls += "<tr>" 
						+ "<td class='tab3 w30'><input type=checkbox class=oneCheck value='"+roles[i].rid+"' > </td>"
						+ "<td class='tab3 w50'>" + (i + 1) + "</td>" 
						+ "<td class='tab3 w100'>" + roles[i].roleName + "</td>"
						+ "<td class='tab3 w100'>" + roles[i].descr + "</td>";
				if (roles[i].rid == 1)
					htmls += "<td class='tab3 w40'></td>";
				else
					htmls += "<td class='tab3 w40'><input type='image' src='/icon/delete.gif'  title='删除' onmousedown='drole(" + roles[i].rid+ ")'></td>";
				htmls += "<td class='tab3 w40'><input type='image' src='/icon/modify.gif'  title='修改' onmousedown='mrole(" + roles[i].rid+ ")'></td>" 
						+ "<td class='tab3 w40'><input type='image' src='/icon/msq.png'  title='授权' onmousedown='prole(" + roles[i].rid+ ")'></td>" + "</tr>";
			}
			$('#trs').html(htmls);
			stab();
		});
	}
	/* 刷新 */
	function refresh() {
		showRoles();
	}
	/* 全选选中、全不选中 */
	function sCheck() {
		if ($('#aCheck').attr("checked")) {
			$('.oneCheck').attr("checked", true);
		} else {
			$('.oneCheck').attr("checked", false);
		}
	}
	/* 删除 单个 角色 */
	function drole(rid) {
		if (confirm("该操作将导致本角色的用户将无法使用，确定要删除该角色吗？"))
			deleteRole(rid);
	}
	function droles() {
		var checks = $('.oneCheck');
		var rids = "";
		for ( var i = 0; i < checks.length; i++) {
			if (checks[i].checked)
				rids += checks[i].value + ",";
		}
		if (rids != "" && confirm("确定要删除该角色吗？")) {
			rids = rids.substring(0, rids.length - 1);
			deleteRole(rids);
		}
	}
	function deleteRole(ids) {
		$.getJSON("/deleterole?rids=" + ids, null, function(data) {
			if (data.flag == "true")
				showRoles();
			else
				alert("删除失败！可能因为该角色还有用户在使用！");
		});
	}

	/* 修改单个 角色 */
	function mrole(rid) {
		swnidow(420, 230, '/pages/sys/mrole.jsp?rid=' + rid);
		showRoles();
	}

	function addrole() {
		swnidow(420, 230, '/pages/sys/arole.jsp');
		showRoles();
	}
	//角色授权
	function prole(rid) {
		swnidow(400, 500, '/pages/sys/rolepower.jsp?rid=' + rid);
	}

	//从新初始化系统开始加载必要参数数据信息
	function initSystemParam() {
		$.getJSON("/initSystemParam", null, function(data) {
			if (data.flag == "true")
				alert("执行系统初始化数据成功！");
			else
				alert("执行系统初始化数据失败");
		});
	}
</script>
</head>
<body>

	<!-- 头部 -->
	<table width="100%" border="0" bgcolor="#353c44" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="24" width="35">
				<span class="ml10">
					<img src="/pages/images/tb.gif" width="14" height="14" />
				</span>
			</td>
			<td>
				<span class="tf"> 角色管理</span>
			</td>
		</tr>
	</table>
	<!-- 内容 -->
	<div class="f12 tab1 wp100 h30">
		<input type="button" value="添加角色" style="color: blue;font-weight: bold;" onmousedown="addrole()" class="mr10">
		<input type="button" value="删除角色" style="color: blue;font-weight: bold;" onmousedown="droles()" class="mr10">
		<input type="button" value="刷新" style="color: blue;font-weight: bold;" onmousedown="refresh()" class="mr10">
		<input type="button" value="系统参数从新初始化加载" onclick="initSystemParam()" style="background-color: #EE799F;color:#FFFFFF; " title="特殊操作按钮:从新加载系统启动时的数据信息.">
	</div>
	<div class="wp100">
		<table class="f13 tab wp100" id="tab" align="center" bordercolor="#D0D0D0" border="1px">
			<tr>
				<th class="tab2 w30"><input type="checkbox" id="aCheck" onchange="sCheck()"></th>
				<th class="tab2 w50">序号</th>
				<th class="tab2 w100">角色名称</th>
				<th class="tab2 w100">角色描述</th>
				<th class="tab2 w40">删除</th>
				<th class="tab2 w40">修改</th>
				<th class="tab2 w40">授权</th>
			</tr>
			<tbody id="trs">

			</tbody>
		</table>
	</div>
	<script type="text/javascript">
		stab();
	</script>
</body>
</html>


