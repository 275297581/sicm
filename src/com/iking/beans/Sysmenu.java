package com.iking.beans;

import java.util.HashSet;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

@SuppressWarnings({ "rawtypes", "serial" })
public class Sysmenu implements java.io.Serializable {

	private Integer mid;
	private String menuName;
	private String url;
	private Integer parent;
	private Boolean locked;
	private String descr;
	private String reamrk1;
	private String reamrk2;
	private Set rolemenus = new HashSet(0);

	public Integer getMid() {
		return this.mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public String getMenuName() {
		return this.menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getParent() {
		return this.parent;
	}

	public void setParent(Integer parent) {
		this.parent = parent;
	}

	public Boolean getLocked() {
		return this.locked;
	}

	public void setLocked(Boolean locked) {
		this.locked = locked;
	}

	public String getDescr() {
		return this.descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public String getReamrk1() {
		return this.reamrk1;
	}

	public void setReamrk1(String reamrk1) {
		this.reamrk1 = reamrk1;
	}

	public String getReamrk2() {
		return this.reamrk2;
	}

	public void setReamrk2(String reamrk2) {
		this.reamrk2 = reamrk2;
	}
	@JSON(serialize = false)
	public Set getRolemenus() {
		return this.rolemenus;
	}

	public void setRolemenus(Set rolemenus) {
		this.rolemenus = rolemenus;
	}

}