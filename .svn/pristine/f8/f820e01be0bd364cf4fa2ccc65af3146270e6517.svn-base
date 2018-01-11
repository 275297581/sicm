package com.iking.beans;

import java.util.HashSet;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;
/**
 * 
 * @Describ 专业表 
 * @Author lizhao
 * @Since 2017-6-16
 * @Version 1.0
 */
@SuppressWarnings({ "rawtypes", "serial" }) 
public class Zyxx implements java.io.Serializable {
 
	private Integer zyid;
	private Collage collage;//学院id
	private String zybh;//专业编号
	private String zymc;//专业名称
	private Set stus = new HashSet(0);
 
	public Integer getZyid() {
		return this.zyid;
	}

	public void setZyid(Integer zyid) {
		this.zyid = zyid;
	}

	public Collage getCollage() {
		return this.collage;
	}

	public void setCollage(Collage collage) {
		this.collage = collage;
	}

	public String getZybh() {
		return this.zybh;
	}

	public void setZybh(String zybh) {
		this.zybh = zybh;
	}

	public String getZymc() {
		return this.zymc;
	}

	public void setZymc(String zymc) {
		this.zymc = zymc;
	} 
	@JSON(serialize = false)
	public Set getStus() {
		return this.stus;
	} 
	public void setStus(Set stus) {
		this.stus = stus;
	}
}