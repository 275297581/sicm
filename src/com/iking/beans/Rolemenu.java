package com.iking.beans;

@SuppressWarnings("serial" )
public class Rolemenu implements java.io.Serializable {

	private Integer id;
	private Sysmenu sysmenu;
	private Sysrole sysrole;

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Sysmenu getSysmenu() {
		return this.sysmenu;
	}

	public void setSysmenu(Sysmenu sysmenu) {
		this.sysmenu = sysmenu;
	}

	public Sysrole getSysrole() {
		return this.sysrole;
	}

	public void setSysrole(Sysrole sysrole) {
		this.sysrole = sysrole;
	}

}