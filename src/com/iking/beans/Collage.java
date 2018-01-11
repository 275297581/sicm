package com.iking.beans;

import java.util.HashSet;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;
/**
 * 
 * @Describ 学院表 
 * @Author lizhao
 * @Since 2017-6-16
 * @Version 1.0
 */
@SuppressWarnings({ "rawtypes", "serial" })
public class Collage implements java.io.Serializable {
 
	private Integer xyid;
	private String xybh;//学院编号
	private String xymc;//学院名称
	private Set zyxxes = new HashSet(0);
 
	public Integer getXyid() {
		return this.xyid;
	}

	public void setXyid(Integer xyid) {
		this.xyid = xyid;
	}

	public String getXybh() {
		return this.xybh;
	}

	public void setXybh(String xybh) {
		this.xybh = xybh;
	}

	public String getXymc() {
		return this.xymc;
	}

	public void setXymc(String xymc) {
		this.xymc = xymc;
	}
	@JSON(serialize= false)
	public Set getZyxxes() {
		return this.zyxxes;
	}

	public void setZyxxes(Set zyxxes) {
		this.zyxxes = zyxxes;
	}

}