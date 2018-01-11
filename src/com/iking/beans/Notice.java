package com.iking.beans;

@SuppressWarnings("serial" )
public class Notice implements java.io.Serializable {

	private Integer id;
	private String title;
	private String content;
	private String puser;
	private String ptime;
	private String isp;
	private Integer power;
	private String remark;
	private String zd;
	private Integer px;
	private String bm;
 
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPuser() {
		return this.puser;
	}

	public void setPuser(String puser) {
		this.puser = puser;
	}

	public String getPtime() {
		return this.ptime;
	}

	public void setPtime(String ptime) {
		this.ptime = ptime;
	}

	public String getIsp() {
		return this.isp;
	}

	public void setIsp(String isp) {
		this.isp = isp;
	}

	public Integer getPower() {
		return this.power;
	}

	public void setPower(Integer power) {
		this.power = power;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getZd() {
		return this.zd;
	}

	public void setZd(String zd) {
		this.zd = zd;
	}

	public Integer getPx() {
		return this.px;
	}

	public void setPx(Integer px) {
		this.px = px;
	}

	public String getBm() {
		return this.bm;
	}

	public void setBm(String bm) {
		this.bm = bm;
	}

}