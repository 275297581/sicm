package com.iking.beans;

import java.util.HashSet;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

@SuppressWarnings({ "rawtypes", "serial" })
public class Sysrole implements java.io.Serializable {

	private Integer rid;
	private String roleName;
	private String descr;
	private Boolean locked;
	private Set userroles = new HashSet(0);
	private Set rolemenus = new HashSet(0);

	public Integer getRid() {
		return this.rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getDescr() {
		return this.descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public Boolean getLocked() {
		return this.locked;
	}

	public void setLocked(Boolean locked) {
		this.locked = locked;
	}
	@JSON(serialize = false)
	public Set getUserroles() {
		return this.userroles;
	}

	public void setUserroles(Set userroles) {
		this.userroles = userroles;
	}
	@JSON(serialize = false)
	public Set getRolemenus() {
		return this.rolemenus;
	}

	public void setRolemenus(Set rolemenus) {
		this.rolemenus = rolemenus;
	}

}