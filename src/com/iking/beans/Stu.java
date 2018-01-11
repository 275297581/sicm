package com.iking.beans;

import java.util.HashSet;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;
/**
 * 
 * @Describ 
 * @Author lizhao 学生表
 * @Since 2017-6-16
 * @Version 1.0
 */
@SuppressWarnings({ "rawtypes", "serial" })
public class Stu implements java.io.Serializable {
 
	private Integer xsid;
	private Zyxx zyxx;//专业id
	private String xh;//学号
	private String sfzh;
	private String xm;//姓名
	private String xb;//性别
	private String csny;//出生年月
	private String mz;//民族
	private String xz;//学制
	private String xjzt;//学籍状态
	private String nj;//年级
	private String bjmc;//班级名称
	private String rxrq;//入学日期
	private String xslb;//学生类别
	private String byxx;//毕业学校
	private String rxfs;//入学方式
	private String bxxs;//办学形式
	private String pycc;//培养层次
	private String syszd;//生源所在地
	private String jg;//籍贯
	private String csd;//出生地
	private String jtdz;//家庭地址
	private String yzbm;//邮政编码
	private String lxdh;//联系电话
	private String ywxw;//有无学位
	private String zzmm;//政治面貌
	private String jrsj;//加入时间
	private String jkzk;//健康状况
	private String tc; //特长
	private String mm;//密码
	private String hkzt;//户口状态
	private String jszh;//借书证号
	private String ylzh;//医疗证号
	private String ssh;//宿舍号
	private String xxnx;//限学年限
	private String rxzf;//入学总分
	private String bz;//备注
	private String timer;//执行时间
	private String khh;//开户行
	private String yhzh;//银行账号
	private String xy;//学院
	private String zy;//专业
	
	public String getXy() {
		return xy;
	}

	public void setXy(String xy) {
		this.xy = xy;
	}

	public String getZy() {
		return zy;
	}

	public void setZy(String zy) {
		this.zy = zy;
	}

	private Set xwzsrds = new HashSet(0);
	private Set bmxxes = new HashSet(0);
	private Set kszses = new HashSet(0);
 
	public Integer getXsid() {
		return this.xsid;
	}

	public void setXsid(Integer xsid) {
		this.xsid = xsid;
	}

	public Zyxx getZyxx() {
		return this.zyxx;
	}

	public void setZyxx(Zyxx zyxx) {
		this.zyxx = zyxx;
	}

	public String getXh() {
		return this.xh;
	}

	public void setXh(String xh) {
		this.xh = xh;
	}

	public String getXm() {
		return this.xm;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}

	public String getXb() {
		return this.xb;
	}

	public void setXb(String xb) {
		this.xb = xb;
	}

	public String getCsny() {
		return this.csny;
	}

	public void setCsny(String csny) {
		this.csny = csny;
	}

	public String getMz() {
		return this.mz;
	}

	public void setMz(String mz) {
		this.mz = mz;
	}

	public String getXz() {
		return this.xz;
	}

	public void setXz(String xz) {
		this.xz = xz;
	}

	public String getXjzt() {
		return this.xjzt;
	}

	public void setXjzt(String xjzt) {
		this.xjzt = xjzt;
	}

	public String getNj() {
		return this.nj;
	}

	public void setNj(String nj) {
		this.nj = nj;
	}

	public String getBjmc() {
		return this.bjmc;
	}

	public void setBjmc(String bjmc) {
		this.bjmc = bjmc;
	}

	public String getRxrq() {
		return this.rxrq;
	}

	public void setRxrq(String rxrq) {
		this.rxrq = rxrq;
	}

	public String getXslb() {
		return this.xslb;
	}

	public void setXslb(String xslb) {
		this.xslb = xslb;
	}

	public String getByxx() {
		return this.byxx;
	}

	public void setByxx(String byxx) {
		this.byxx = byxx;
	}

	public String getRxfs() {
		return this.rxfs;
	}

	public void setRxfs(String rxfs) {
		this.rxfs = rxfs;
	}

	public String getBxxs() {
		return this.bxxs;
	}

	public void setBxxs(String bxxs) {
		this.bxxs = bxxs;
	}

	public String getPycc() {
		return this.pycc;
	}

	public void setPycc(String pycc) {
		this.pycc = pycc;
	}

	public String getSyszd() {
		return this.syszd;
	}

	public void setSyszd(String syszd) {
		this.syszd = syszd;
	}

	public String getJg() {
		return this.jg;
	}

	public void setJg(String jg) {
		this.jg = jg;
	}

	public String getCsd() {
		return this.csd;
	}

	public void setCsd(String csd) {
		this.csd = csd;
	}

	public String getJtdz() {
		return this.jtdz;
	}

	public void setJtdz(String jtdz) {
		this.jtdz = jtdz;
	}

	public String getYzbm() {
		return this.yzbm;
	}

	public void setYzbm(String yzbm) {
		this.yzbm = yzbm;
	}

	public String getLxdh() {
		return this.lxdh;
	}

	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}

	public String getYwxw() {
		return this.ywxw;
	}

	public void setYwxw(String ywxw) {
		this.ywxw = ywxw;
	}

	public String getZzmm() {
		return this.zzmm;
	}

	public void setZzmm(String zzmm) {
		this.zzmm = zzmm;
	}

	public String getJrsj() {
		return this.jrsj;
	}

	public void setJrsj(String jrsj) {
		this.jrsj = jrsj;
	}

	public String getJkzk() {
		return this.jkzk;
	}

	public void setJkzk(String jkzk) {
		this.jkzk = jkzk;
	}

	public String getTc() {
		return this.tc;
	}

	public void setTc(String tc) {
		this.tc = tc;
	}

	public String getSfzh() {
		return this.sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public String getMm() {
		return this.mm;
	}

	public void setMm(String mm) {
		this.mm = mm;
	}

	public String getHkzt() {
		return this.hkzt;
	}

	public void setHkzt(String hkzt) {
		this.hkzt = hkzt;
	}

	public String getJszh() {
		return this.jszh;
	}

	public void setJszh(String jszh) {
		this.jszh = jszh;
	}

	public String getYlzh() {
		return this.ylzh;
	}

	public void setYlzh(String ylzh) {
		this.ylzh = ylzh;
	}

	public String getSsh() {
		return this.ssh;
	}

	public void setSsh(String ssh) {
		this.ssh = ssh;
	}

	public String getXxnx() {
		return this.xxnx;
	}

	public void setXxnx(String xxnx) {
		this.xxnx = xxnx;
	}

	public String getRxzf() {
		return this.rxzf;
	}

	public void setRxzf(String rxzf) {
		this.rxzf = rxzf;
	}

	public String getBz() {
		return this.bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getTimer() {
		return this.timer;
	}

	public void setTimer(String timer) {
		this.timer = timer;
	}
	@JSON(serialize=false)
	public Set getXwzsrds() {
		return this.xwzsrds;
	}

	public void setXwzsrds(Set xwzsrds) {
		this.xwzsrds = xwzsrds;
	}
	@JSON(serialize=false)
	public Set getBmxxes() {
		return this.bmxxes;
	}

	public void setBmxxes(Set bmxxes) {
		this.bmxxes = bmxxes;
	}
	@JSON(serialize=false)
	public Set getKszses() {
		return this.kszses;
	}

	public void setKszses(Set kszses) {
		this.kszses = kszses;
	}

	public String getKhh() {
		return khh;
	}

	public void setKhh(String khh) {
		this.khh = khh;
	}

	public String getYhzh() {
		return yhzh;
	}

	public void setYhzh(String yhzh) {
		this.yhzh = yhzh;
	}

}