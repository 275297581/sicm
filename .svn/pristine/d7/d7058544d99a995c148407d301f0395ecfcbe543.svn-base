package com.iking.ksxxcx.action;
import java.util.List;
import javax.annotation.Resource;
import com.iking.basic.BasicAction;
import com.iking.beans.Bmxx;
import com.iking.beans.Kcxx;
import com.iking.beans.Kszs;
import com.iking.beans.Scor;
import com.iking.beans.Stu;
import com.iking.beans.Timelock;
import com.iking.beans.Zyxx;
import com.iking.beans.Zyzs;
import com.iking.inter.StuManageInter;
@SuppressWarnings("serial")
public class StuAction extends BasicAction {
	@Resource
	private StuManageInter stuServer;
	public void setStuServer(StuManageInter stuServer) {
		this.stuServer = stuServer;
	}
	private String msg;
	private String xh;
	private String xm;
	private String xb;
	private String sfzh;
	private String xymc;
	private String zymc;
	private String bjmc;
	private String zyfx;
	private String zzmm;
	private String lxdh;
	private String jg;
	private String xm1;
	private String bmdd;
	private String bmsj;
	private String jdjg;
	private String jdzy;
	private String jdkm;
	private String lxdh1;
	private String bkxx;
	private String zpcj;
	private String bmjg;
	private String zkzh;
	private String bmsj1;
	private String jdzy1;
	private String jb;
	private String llcj;
	private String sccj;
	private String wycj;
	private String zhcj;
	private String pdcj;
	private String zkzh1;
	private String zsbh;
	private String zsmc;
	private String zsdj;
	private String fzrq;
	private String cdrq;
	private String xf;
	private String jlbz;
	private String nj;
	private String rxrq;
	private String zsid;
	private String xsids;
	private String chestr;
	private String index;
	/*课程录入*/
	private Integer   id;
	private Kcxx      kcxx;
	private String    kcmc;
	private String    bz1;
	private String    bz2;
	private String    bz3;
	public List<Kcxx> Kcxxs;
	private int count;
	
	
	/**
	 *时间
	 * @return
	 */
	private Timelock timelock;
	private String begintime;
	private String endtime;
	private String runtime;
	
	public Timelock getTimelock() {
		return timelock;
	}

	public void setTimelock(Timelock timelock) {
		this.timelock = timelock;
	}

	public String getBegintime() {
		return begintime;
	}

	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getRuntime() {
		return runtime;
	}

	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<Kcxx> getKcxxs() {
		return Kcxxs;
	}

	public void setKcxxs(List<Kcxx> kcxxs) {
		Kcxxs = kcxxs;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getIndex() {
		return index;
	}

	public void setIndex(String index) {
		this.index = index;
	}

	public Kcxx getKcxx() {
		return kcxx;
	}

	public void setKcxx(Kcxx kcxx) {
		this.kcxx = kcxx;
	}

	public String getKcmc() {
		return kcmc;
	}

	public void setKcmc(String kcmc) {
		this.kcmc = kcmc;
	}

	public String getBz1() {
		return bz1;
	}

	public void setBz1(String bz1) {
		this.bz1 = bz1;
	}

	public String getBz2() {
		return bz2;
	}

	public void setBz2(String bz2) {
		this.bz2 = bz2;
	}

	public String getBz3() {
		return bz3;
	}

	public void setBz3(String bz3) {
		this.bz3 = bz3;
	}

	public String getChestr() {
		return chestr;
	}

	public void setChestr(String chestr) {
		this.chestr = chestr;
	}

	public String getXsids() {
		return xsids;
	}

	public void setXsids(String xsids) {
		this.xsids = xsids;
	}

	public String getZsid() {
		return zsid;
	}

	public void setZsid(String zsid) {
		this.zsid = zsid;
	}

	public String getNj() {
		return nj;
	}

	public void setNj(String nj) {
		this.nj = nj;
	}

	public String getRxrq() {
		return rxrq;
	}

	public void setRxrq(String rxrq) {
		this.rxrq = rxrq;
	}

	public String getXm() {
		return xm;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}

	public String getXb() {
		return xb;
	}

	public void setXb(String xb) {
		this.xb = xb;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
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

	public String getBjmc() {
		return bjmc;
	}

	public void setBjmc(String bjmc) {
		this.bjmc = bjmc;
	}

	public String getZyfx() {
		return zyfx;
	}

	public void setZyfx(String zyfx) {
		this.zyfx = zyfx;
	}

	public String getZzmm() {
		return zzmm;
	}

	public void setZzmm(String zzmm) {
		this.zzmm = zzmm;
	}

	public String getLxdh() {
		return lxdh;
	}

	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}

	public String getJg() {
		return jg;
	}

	public void setJg(String jg) {
		this.jg = jg;
	}

	public String getXm1() {
		return xm1;
	}

	public void setXm1(String xm1) {
		this.xm1 = xm1;
	}

	public String getBmdd() {
		return bmdd;
	}

	public void setBmdd(String bmdd) {
		this.bmdd = bmdd;
	}

	public String getBmsj() {
		return bmsj;
	}

	public void setBmsj(String bmsj) {
		this.bmsj = bmsj;
	}

	public String getJdjg() {
		return jdjg;
	}

	public void setJdjg(String jdjg) {
		this.jdjg = jdjg;
	}

	public String getJdzy() {
		return jdzy;
	}

	public void setJdzy(String jdzy) {
		this.jdzy = jdzy;
	}

	public String getJdkm() {
		return jdkm;
	}

	public void setJdkm(String jdkm) {
		this.jdkm = jdkm;
	}

	public String getLxdh1() {
		return lxdh1;
	}

	public void setLxdh1(String lxdh1) {
		this.lxdh1 = lxdh1;
	}

	public String getBkxx() {
		return bkxx;
	}

	public void setBkxx(String bkxx) {
		this.bkxx = bkxx;
	}

	public String getZpcj() {
		return zpcj;
	}

	public void setZpcj(String zpcj) {
		this.zpcj = zpcj;
	}

	public String getBmjg() {
		return bmjg;
	}

	public void setBmjg(String bmjg) {
		this.bmjg = bmjg;
	}

	public String getZkzh() {
		return zkzh;
	}

	public void setZkzh(String zkzh) {
		this.zkzh = zkzh;
	}

	public String getBmsj1() {
		return bmsj1;
	}

	public void setBmsj1(String bmsj1) {
		this.bmsj1 = bmsj1;
	}

	public String getJdzy1() {
		return jdzy1;
	}

	public void setJdzy1(String jdzy1) {
		this.jdzy1 = jdzy1;
	}

	public String getJb() {
		return jb;
	}

	public void setJb(String jb) {
		this.jb = jb;
	}

	public String getLlcj() {
		return llcj;
	}

	public void setLlcj(String llcj) {
		this.llcj = llcj;
	}

	public String getSccj() {
		return sccj;
	}

	public void setSccj(String sccj) {
		this.sccj = sccj;
	}

	public String getWycj() {
		return wycj;
	}

	public void setWycj(String wycj) {
		this.wycj = wycj;
	}

	public String getZhcj() {
		return zhcj;
	}

	public void setZhcj(String zhcj) {
		this.zhcj = zhcj;
	}

	public String getPdcj() {
		return pdcj;
	}

	public void setPdcj(String pdcj) {
		this.pdcj = pdcj;
	}

	public String getZkzh1() {
		return zkzh1;
	}

	public void setZkzh1(String zkzh1) {
		this.zkzh1 = zkzh1;
	}

	public String getZsbh() {
		return zsbh;
	}

	public void setZsbh(String zsbh) {
		this.zsbh = zsbh;
	}

	public String getZsmc() {
		return zsmc;
	}

	public void setZsmc(String zsmc) {
		this.zsmc = zsmc;
	}

	public String getZsdj() {
		return zsdj;
	}

	public void setZsdj(String zsdj) {
		this.zsdj = zsdj;
	}

	public String getFzrq() {
		return fzrq;
	}

	public void setFzrq(String fzrq) {
		this.fzrq = fzrq;
	}

	public String getCdrq() {
		return cdrq;
	}

	public void setCdrq(String cdrq) {
		this.cdrq = cdrq;
	}

	public String getXf() {
		return xf;
	}

	public void setXf(String xf) {
		this.xf = xf;
	}

	public String getJlbz() {
		return jlbz;
	}

	public void setJlbz(String jlbz) {
		this.jlbz = jlbz;
	}

	public int getXsid() {
		return xsid;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public void setXh(String xh) {
		this.xh = xh;
	}
	public String getXh() {
		return xh;
	}
	
	private Stu stu;

	public Stu getStu() {
		return stu;
	}

	/*private Bmxx bmxx;
	

	public Bmxx getBmxx() {
		return bmxx;
	}

	public void setBmxx(Bmxx bmxx) {
		this.bmxx = bmxx;
	}*/

	public Stu getStu2() {
		return stu2;
	}

	public void setStu2(Stu stu2) {
		this.stu2 = stu2;
	}
	private List<Scor> scors;

	public List<Scor> getScors() {
		return scors;
	}

	private List<Bmxx> bmxxs;

	public List<Bmxx> getBmxxs() {
		return bmxxs;
	}

	private List<Kszs> kszss;

	public List<Kszs> getKszss() {
		return kszss;
	}
	private Kszs kszs;
	private String kzid;
	public Kszs getKszs() {
		return kszs;
	}

	public void setKszs(Kszs kszs) {
		this.kszs = kszs;
	}

	public String getKzid() {
		return kzid;
	}

	public void setKzid(String kzid) {
		this.kzid = kzid;
	}

	/*
	 * private String sfzh; private String xh; private String nj;
	 */
	private int xsid;
	private Stu stu1;
	private Stu stu2;

	// 学生基本信息展示
	public String queryStuByXsid() {
		this.parameters = new Object[] { xsid };
		this.hql = "from Stu where xsid=?";
		stu = (Stu) stuServer.uniqueQuery(this.hql, parameters);
		return SUCCESS;
	}

	// 学生报名信息展示
	@SuppressWarnings("unchecked")
	public String queryOnesCoreByXsid() {
		this.parameters = new Object[] { xsid };
		this.hql = "select b from Bmxx b,Stu s where b.stu.xsid=? and b.stu.xsid=s.xsid";
		bmxxs = stuServer.executeQuery(hql, parameters);
		return SUCCESS;
	}

	// 学生成绩信息展示
	@SuppressWarnings("unchecked")
	public String queryCoreByXsid() {
		this.parameters = new Object[] { xsid };
		this.hql = "select a from Scor a,Stu b,Bmxx c where b.xsid=? and b.xsid=c.stu.xsid and a.bmxx.bmid=c.bmid ";
		scors = stuServer.executeQuery(hql, parameters);
		return SUCCESS;
	}

	// 学生证书信息展示
	@SuppressWarnings("unchecked")
	public String queryKszsByXsid() {
		this.parameters = new Object[] { xsid };
		this.hql = "select k from Stu s,Kszs k where s.xsid=? and s.xsid=k.stu.xsid";
		kszss = stuServer.executeQuery(hql, parameters);
		return SUCCESS;
	}
	// 获取证书
	@SuppressWarnings("unchecked")
	public String queryKszsbyid() {
		kszs = (Kszs) stuServer.getById(Kszs.class,Integer.parseInt(kzid));
		return SUCCESS;
	}

	// 学生信息录入
		@SuppressWarnings("unchecked")
		public String stuLuru() {
			Stu stu = new Stu();
			Zyxx z = (Zyxx) stuServer.getById(Zyxx.class,Integer.parseInt(zymc));
			stu.setXh(xh);
			stu.setXm(xm);
			stu.setXb(xb);
			stu.setSfzh(sfzh);
			stu.setZyxx(z);
			stu.setBjmc(bjmc);
			stu.setZzmm(zzmm);
			stu.setLxdh(lxdh);
			stu.setJg(jg);
			stu.setNj(nj);
			stu.setRxrq(rxrq);
			Bmxx bmxx = new Bmxx();
			bmxx.setSfzh(sfzh);
			bmxx.setBmdd(bmdd);
			bmxx.setBmsj(bmsj);
			bmxx.setJdkm(jdkm);
			bmxx.setBkxx(bkxx);
			bmxx.setZpcj(zpcj);
			bmxx.setBmjg(bmjg);
			if(!jdzy.equals("0")){
				Zyzs zyzs = (Zyzs) stuServer.getById(Zyzs.class,Integer.parseInt(jdzy));
				bmxx.setZyzs(zyzs);
			}else{
				Zyzs zyzs = (Zyzs) stuServer.getById(Zyzs.class,1001);
				bmxx.setZyzs(zyzs);
			}
			bmxx.setStu(stu);
			Scor scor = new Scor();
			scor.setZkzh(zkzh);
			scor.setBmsj(bmsj1);
			scor.setLlcj(llcj);
			scor.setSccj(sccj);
			scor.setWycj(wycj);
			scor.setZhcj(zhcj);
			scor.setPdcj(pdcj);
			scor.setBmxx(bmxx);
			try {
				stuServer.add(scor);
				msg = "保存成功！";	
			} catch (Exception e) {
				msg = "保存失败！";
				e.printStackTrace();
			}
			
			return SUCCESS;
		}
		// 学生信息修改
				@SuppressWarnings("unchecked")
				public String updatestu() {
					Stu stu = (Stu) stuServer.getById(Stu.class, xsid);
					Zyxx z = (Zyxx) stuServer.getById(Zyxx.class,Integer.parseInt(zymc));
					stu.setXh(xh);
					stu.setXm(xm);
					stu.setXb(xb);
					stu.setSfzh(sfzh);
					stu.setZyxx(z);
					stu.setBjmc(bjmc);
					stu.setZzmm(zzmm);
					stu.setLxdh(lxdh);
					stu.setJg(jg);
					stu.setNj(nj);
					stu.setRxrq(rxrq);
				
					String sql = "select b.bmid from Bmxx b where b.xsid='"+xsid+"'";
					 List<Object> list =  stuServer.executeQueryBySql(sql, null);
					 Bmxx bmxx = null;
					 if(!list.isEmpty()){
						 int i = (Integer) list.get(0);
						  bmxx = (Bmxx) stuServer.getById(Bmxx.class,i);
						bmxx.setSfzh(sfzh);
						bmxx.setBmdd(bmdd);
						bmxx.setBmsj(bmsj);
						bmxx.setJdkm(jdkm);
						bmxx.setBkxx(bkxx);
						bmxx.setZpcj(zpcj);
						bmxx.setBmjg(bmjg);
						//Zyzs zyzs = (Zyzs) stuServer.getById(Zyzs.class,Integer.parseInt(jdzy));
						if(!jdzy.equals("0")){
							Zyzs zyzs = (Zyzs) stuServer.getById(Zyzs.class,Integer.parseInt(jdzy));
							bmxx.setZyzs(zyzs);
						}else{
							Zyzs zyzs = (Zyzs) stuServer.getById(Zyzs.class,1001);
							bmxx.setZyzs(zyzs);
						}
						bmxx.setStu(stu);
						
					 }else{
						 bmxx = new Bmxx();
						 bmxx.setSfzh(sfzh);
							bmxx.setBmdd(bmdd);
							bmxx.setBmsj(bmsj);
							bmxx.setJdkm(jdkm);
							bmxx.setBkxx(bkxx);
							bmxx.setZpcj(zpcj);
							bmxx.setBmjg(bmjg);
							//Zyzs zyzs = (Zyzs) stuServer.getById(Zyzs.class,Integer.parseInt(jdzy));
							if(!jdzy.equals("0")){
								Zyzs zyzs = (Zyzs) stuServer.getById(Zyzs.class,Integer.parseInt(jdzy));
								bmxx.setZyzs(zyzs);
							}else{
								Zyzs zyzs = (Zyzs) stuServer.getById(Zyzs.class,1001);
								bmxx.setZyzs(zyzs);
							}
							bmxx.setStu(stu);
							
					 }
					String sql1 = "select s.cjid from Scor s where s.bmid='"+bmxx.getBmid()+"'";
					List<Object> list1= stuServer.executeQueryBySql(sql1, null);
					Scor scor = null;
					if(!list1.isEmpty()){
						int i1 = (Integer) list1.get(0);
						scor = (Scor) stuServer.getById(Scor.class,i1);
						scor.setZkzh(zkzh);
						scor.setBmsj(bmsj1);
						scor.setLlcj(llcj);
						scor.setSccj(sccj);
						scor.setWycj(wycj);
						scor.setZhcj(zhcj);
						scor.setPdcj(pdcj);
						scor.setBmxx(bmxx);
					}else{
						scor= new Scor();
						scor.setZkzh(zkzh);
						scor.setBmsj(bmsj1);
						scor.setLlcj(llcj);
						scor.setSccj(sccj);
						scor.setWycj(wycj);
						scor.setZhcj(zhcj);
						scor.setPdcj(pdcj);
						scor.setBmxx(bmxx);
					}
					try {
						stuServer.saveorupdate(scor);
						msg = "修改成功！";	
					} catch (Exception e) {
						msg = "修改失败！";
						e.printStackTrace();
					}
					
					return SUCCESS;
				}
	// 证书信息录入
	@SuppressWarnings("unchecked")
	public String saveZs() {
		String hql = "from Stu s where s.sfzh='"+sfzh+"'";
		List<Stu> list = stuServer.executeQuery(hql, null);
		Kszs  kszs = new Kszs();
		kszs.setZsbh(zsbh);
		kszs.setZkzh(zkzh1);
		kszs.setZsmc(zsmc);
		kszs.setZsdj(zsdj);
		kszs.setFzrq(fzrq);
		kszs.setCdrq(cdrq);
		kszs.setXf(xf);
		kszs.setMoney(jlbz);
		//kszs.setZsid(Integer.parseInt(zsid));
		Zyzs Zyzs= (com.iking.beans.Zyzs) stuServer.getById(Zyzs.class, Integer.parseInt(zsid));
		kszs.setZyzs(Zyzs);
		kszs.setStu(list.get(0));
		try {
			stuServer.add(kszs);
			msg = "保存成功！";	
		} catch (Exception e) {
			msg = "保存失败！";
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
	// 证书信息修改
		@SuppressWarnings("unchecked")
		public String updatezs() {
			Kszs kszs =(Kszs) stuServer.getById(Kszs.class, Integer.parseInt(kzid));
			kszs.setZsbh(zsbh);
			kszs.setZkzh(zkzh1);
			kszs.setZsmc(zsmc);
			kszs.setZsdj(zsdj);
			kszs.setFzrq(fzrq);
			kszs.setCdrq(cdrq);
			kszs.setXf(xf);
			kszs.setMoney(jlbz);
			Zyzs Zyzs= (com.iking.beans.Zyzs) stuServer.getById(Zyzs.class, Integer.parseInt(zsid));
			kszs.setZyzs(Zyzs);
			try {
				stuServer.update(kszs);
				msg = "修改成功！";	
			} catch (Exception e) {
				msg = "修改失败！";
				e.printStackTrace();
			}
			
			return SUCCESS;
		}
	public void setStu(Stu stu) {
		this.stu = stu;
	}

	public void setXsid(int xsid) {
		this.xsid = xsid;
	}

	
	public String deletestu() {
		try {
			stuServer.deleteStu(xsids);
			this.msg = "信息删除成功！";
		} catch (Exception e) {
			e.printStackTrace();
			this.msg = "信息删除失败！重新进行删除";
		}
		return SUCCESS;
	}
	
	 //数据库中xsid为 36719的 数据 不能 删除  
	 @SuppressWarnings("unchecked")
	public String addCheck() {
	this.hql = "from Stu where xsid='"+xsid+"'";
	stu= (Stu) stuServer.uniqueQuery(this.hql, parameters);
	stu.setSfzh("");
	stu.setXm("");
	stu.setXb("");
	stu.setXh("");
	stu.setNj("");
	stu.setLxdh("");
	stu.setJg("");
	stu.setRxrq("");
	stu.setXy("");
	stu.setZy("");

	String  chestr1=chestr.toString();
	System.out.println(chestr1);
	String[] arr = chestr1.split(",");
	for(int i=0;i<arr.length;i++){
		if((arr[i].trim().equals("sfzh"))){
			stu.setSfzh(arr[i]);
		}
		if((arr[i].trim().equals("xm"))){
			stu.setXm(arr[i]);
		}
       if((arr[i].trim().equals("xb"))){
      	 stu.setXb(arr[i]);
		}                           	

       if((arr[i].trim().equals("xh"))){
      	 stu.setXh(arr[i]);
		}
       
       if((arr[i].trim().equals("nj"))){
      	 stu.setNj(arr[i]);
		}
       if((arr[i].trim().equals("lxdh"))){
      	 stu.setLxdh(arr[i]);
		}
       if((arr[i].trim().equals("jg"))){
      	 stu.setJg(arr[i]);
		}
       if((arr[i].trim().equals("rxrq"))){
      	 stu.setRxrq(arr[i]);
		}
       if(arr[i].trim().equals("xy")){
       stu.setXy(arr[i]);
       	
       }
       if(arr[i].trim().equals("zy")){
       	stu.setZy(arr[i]);
       }
	}


	try {
		stuServer.update(stu);
		msg = "保存成功！";	
	} catch (Exception e) {
		msg = "保存失败！";
		e.printStackTrace();
	}	
		 return SUCCESS; 
	}
	
		// 自定义信息显示
	 @SuppressWarnings("unchecked")
		public String selectZdy() {
			this.parameters = new Object[] { xsid };
			this.hql = "from Stu where xsid=?";
			stu = (Stu) stuServer.uniqueQuery(this.hql, parameters);
			return SUCCESS;
		}
	
	 /**
	  * 课程信息录入
	  * @return
	  */
		@SuppressWarnings("unchecked")
		public String saveKcxx() {
			Kcxx kcxx = new Kcxx();
			kcxx.setKcmc(kcmc);
			kcxx.setBz1(bz1);
			kcxx.setBz2(bz2);
			kcxx.setBz3(bz3);
			try {
				stuServer.add(kcxx);
				msg = "保存成功！";	
			} catch (Exception e) {
				msg = "保存失败！";
				e.printStackTrace();
			}
			
			return SUCCESS;
		}
	/**
	 * 课程查询信息
	 * @return
	 */
	public  String  selectKcxx(){
		this.parameters = null;
		String ref = "";
		if (this.bz3 != null) {
			if (this.bz3.equals("")) {
				ref = " WHERE bz3 LIKE ?";
			} else if (this.bz3.equals("0")) {
				ref = " WHERE bz3 LIKE ? ";
			} 
			this.parameters = new Object[] { "%" + bz3 + "%" };
		 } else {
			this.parameters = null;
		 }
		
		this.hql = "SELECT COUNT(*) FROM Kcxx " ;
		this.count = Integer.parseInt(stuServer.uniqueQuery(hql, parameters)
				.toString());

		this.hql = "From Kcxx " ;
		this.Kcxxs = stuServer.executeQueryByPage(hql, parameters,
				Integer.parseInt(index), pageSize);
		return SUCCESS;
		}
	
  /**
   * 学生课程信息删除
   * @return
   */
	public String deleteKcxx() {
		try {
			stuServer.delById(Kcxx.class, id);
			this.msg = "信息删除成功！";
		} catch (Exception e) {
			e.printStackTrace();
			this.msg = "信息删除失败！重新进行删除";
		}
		return SUCCESS;
	}

	
	
	
	 /**
	  * 时间录入
	  * @return
	  */
		@SuppressWarnings("unchecked")
		public String saveTime(){
			Timelock timelock = new Timelock();
			String hql = "from Timelock";
			List list = stuServer.executeQuery(hql, null);
			timelock.setBegintime(begintime);
			timelock.setEndtime(endtime);
			try {
				//stuServer.add(timelock);
				stuServer.add(timelock);
				msg = "保存成功！";	
			} catch (Exception e) {
				msg = "保存失败！";
				e.printStackTrace();
			}
			
			return SUCCESS;
		}
	
}
