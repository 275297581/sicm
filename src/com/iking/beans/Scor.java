package com.iking.beans;

import java.util.HashSet;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

@SuppressWarnings({ "rawtypes", "serial" })
public class Scor implements java.io.Serializable {
 
	private Integer cjid;
	private Bmxx bmxx;
	private String zkzh;
	private String bmsj;
	private String llcj;
	private String llksqk;
	private String sccj;
	private String scksqk;
	private String wycj;
	private String wyksqk;
	private String zhcj;
	private String zhksqk;
	private String pdcj;
	private String timer;
	private Set kszses = new HashSet(0);
 
	public Integer getCjid() {
		return this.cjid;
	}

	public void setCjid(Integer cjid) {
		this.cjid = cjid;
	}

	public Bmxx getBmxx() {
		return this.bmxx;
	}

	public void setBmxx(Bmxx bmxx) {
		this.bmxx = bmxx;
	}

	public String getZkzh() {
		return this.zkzh;
	}

	public void setZkzh(String zkzh) {
		this.zkzh = zkzh;
	}

	public String getBmsj() {
		return this.bmsj;
	}

	public void setBmsj(String bmsj) {
		this.bmsj = bmsj;
	}

	public String getLlcj() {
		return this.llcj;
	}

	public void setLlcj(String llcj) {
		this.llcj = llcj;
	}

	public String getLlksqk() {
		return this.llksqk;
	}

	public void setLlksqk(String llksqk) {
		this.llksqk = llksqk;
	}

	public String getSccj() {
		return this.sccj;
	}

	public void setSccj(String sccj) {
		this.sccj = sccj;
	}

	public String getScksqk() {
		return this.scksqk;
	}

	public void setScksqk(String scksqk) {
		this.scksqk = scksqk;
	}

	public String getWycj() {
		return this.wycj;
	}

	public void setWycj(String wycj) {
		this.wycj = wycj;
	}

	public String getWyksqk() {
		return this.wyksqk;
	}

	public void setWyksqk(String wyksqk) {
		this.wyksqk = wyksqk;
	}

	public String getZhcj() {
		return this.zhcj;
	}

	public void setZhcj(String zhcj) {
		this.zhcj = zhcj;
	}

	public String getZhksqk() {
		return this.zhksqk;
	}

	public void setZhksqk(String zhksqk) {
		this.zhksqk = zhksqk;
	}

	public String getPdcj() {
		return this.pdcj;
	}

	public void setPdcj(String pdcj) {
		this.pdcj = pdcj;
	}

	public String getTimer() {
		return this.timer;
	}

	public void setTimer(String timer) {
		this.timer = timer;
	}
	@JSON(serialize=false)
	public Set getKszses() {
		return this.kszses;
	}

	public void setKszses(Set kszses) {
		this.kszses = kszses;
	}

}