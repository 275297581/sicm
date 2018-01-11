package com.iking.sys.action;

import java.util.List;
import javax.annotation.Resource;
import com.iking.basic.BasicAction;
import com.iking.beans.Sysmenu;
import com.iking.beans.Sysrole;
import com.iking.inter.RoleInter;

@SuppressWarnings("serial")
public class RoleManageAction extends BasicAction {

	@Resource
	private RoleInter roleServer;

	public void setRoleServer(RoleInter roleServer) {
		this.roleServer = roleServer;
	}

	public List<Sysrole> getSysroles() {
		return sysroles;
	}

	public void setSysroles(List<Sysrole> sysroles) {
		this.sysroles = sysroles;
	}

	private List<Sysrole> sysroles;
	private String rids;

	public void setRids(String rids) {
		this.rids = rids;
	}

	private Sysrole sysrole;

	public Sysrole getSysrole() {
		return sysrole;
	}

	public void setSysrole(Sysrole sysrole) {
		this.sysrole = sysrole;
	}

	private String rid;

	public void setRid(String rid) {
		this.rid = rid;
	}

	private String flag;

	public String getFlag() {
		return flag;
	}

	private String mids;

	public void setMids(String mids) {
		this.mids = mids;
	}

	private String roleName;
	private String descr;

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	@SuppressWarnings("unchecked")
	public String showRole() {
		hql = "FROM Sysrole Where locked = false";
		sysroles = roleServer.executeQuery(hql, null);
		return SUCCESS;
	}

	public String deleteRole() {
		if (this.rids != null && !rids.equals(""))
			try {
				roleServer.deleteRole(rids);
				flag = "true";
			} catch (Exception e) {
				flag = "false";
			}
		return SUCCESS;
	}

	public String getARole() {
		if (rid != null)
			sysrole = (Sysrole) roleServer.getById(Sysrole.class, Integer.parseInt(rid));
		return SUCCESS;
	}

	public String mofifyRole() {
		sysrole = new Sysrole();
		sysrole.setRid(Integer.parseInt(rid));
		sysrole.setLocked(false);
		sysrole.setRoleName(roleName);
		sysrole.setDescr(descr);
		roleServer.update(sysrole);
		return SUCCESS;
	}

	public String addRole() {
		sysrole = new Sysrole();
		sysrole.setLocked(false);
		sysrole.setRoleName(roleName);
		sysrole.setDescr(descr);
		roleServer.add(sysrole);
		return SUCCESS;
	}

	// rolepower show menu
	@SuppressWarnings("unchecked")
	public String showRoleMenu() {
		this.hql = "SELECT M FROM Rolemenu RM,Sysmenu M WHERE M.mid= RM.sysmenu.mid AND RM.sysrole.rid=?";
		this.parameters = new Object[] { Integer.parseInt(this.rid) };
		List<Sysmenu> sysmenus = roleServer.executeQuery(hql, parameters);
		flag = "";
		for (Sysmenu menu : sysmenus) {
			flag += menu.getMid() + ",";
		}
		flag = flag.substring(0, flag.length() - 1);
		return SUCCESS;
	}

	public String modifyRoleMenu() {
		try {
			roleServer.modifyRoleMenu(rid, mids);
			flag = "true";
		} catch (Exception e) {
			flag = "false";
		}
		return SUCCESS;
	}

	/** 从新加载数据库初始化数据信息 **/
	public String initSystemParam() {
		try {
			flag = Boolean.toString(roleServer.initParam());
		} catch (Exception e) {
			flag = "false";
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
