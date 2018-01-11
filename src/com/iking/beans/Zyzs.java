package com.iking.beans;

import java.util.HashSet;
import java.util.Set;
import org.apache.struts2.json.annotations.JSON;
/**
 * 
 * @Describ 证书表
 * @Author lizhao
 * @Since 2017-6-16
 * @Version 1.0
 */
@SuppressWarnings({ "rawtypes", "serial" })
public class Zyzs implements java.io.Serializable {
 
	private Integer zsid;
	private String zsmc;//证书名称
	private String fzjg;//发证机构
	private String zsdj;//证书等级
	private String zsfl;//证书分类
	private String jlbz;//奖励标准
	private String xf;//学分
	private String bz;//备注
	private String xymc;//学院名称
	private String zymc;//专业名称
	
	private Set bmxxes = new HashSet(0);
	private Set xwzsrds = new HashSet(0);
	private Set kszses = new HashSet(0);
 

	public Integer getZsid() {
		return this.zsid;
	}

	public void setZsid(Integer zsid) {
		this.zsid = zsid;
	}

	public String getZsmc() {
		return this.zsmc;
	}

	public void setZsmc(String zsmc) {
		this.zsmc = zsmc;
	}

	public String getFzjg() {
		return this.fzjg;
	}

	public void setFzjg(String fzjg) {
		this.fzjg = fzjg;
	}

	public String getZsdj() {
		return this.zsdj;
	}

	public void setZsdj(String zsdj) {
		this.zsdj = zsdj;
	}

	public String getZsfl() {
		return this.zsfl;
	}

	public void setZsfl(String zsfl) {
		this.zsfl = zsfl;
	}

	public String getJlbz() {
		return this.jlbz;
	}

	public void setJlbz(String jlbz) {
		this.jlbz = jlbz;
	}

	public String getXf() {
		return this.xf;
	}

	public void setXf(String xf) {
		this.xf = xf;
	} 
	public String getBz() {
		return this.bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
	@JSON(serialize = false)
	public Set getBmxxes() {
		return this.bmxxes;
	}

	public void setBmxxes(Set bmxxes) {
		this.bmxxes = bmxxes;
	}
	@JSON(serialize = false)
	public Set getXwzsrds() {
		return this.xwzsrds;
	}

	public void setXwzsrds(Set xwzsrds) {
		this.xwzsrds = xwzsrds;
	}
	@JSON(serialize = false)
	public Set getKszses() {
		return this.kszses;
	}
	public void setKszses(Set kszses) {
		this.kszses = kszses;
	}

	public String getXymc() {
		return xymc;
	}

	public void setXymc(String xymc) {
		this.xymc = xymc;
	}

	public String getZymc() {
		return zymc;
	}

	public void setZymc(String zymc) {
		this.zymc = zymc;
	}
}