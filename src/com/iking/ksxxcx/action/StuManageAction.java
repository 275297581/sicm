package com.iking.ksxxcx.action;
import java.util.List;
import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import com.iking.basic.BasicAction;
import com.iking.beans.Bmxx;
import com.iking.beans.Collage;
import com.iking.beans.Kcxx;
import com.iking.beans.Stu;
import com.iking.beans.Stuclass;
import com.iking.beans.Zyxx;
import com.iking.beans.Zyzs;
import com.iking.inter.StuManageInter;
@SuppressWarnings({ "unchecked", "serial" })
public class StuManageAction extends BasicAction {
	@Resource
	private StuManageInter stuManageServer;
	private List<Collage> collages;
	public void setStuManageServer(StuManageInter stuManageServer) {
		this.stuManageServer = stuManageServer;
	}
	private List<Kcxx> kcxxs;
	public List<Kcxx> getKcxxs() {
		return kcxxs;
	}
	public void setKcxxs(List<Kcxx> kcxxs) {
		this.kcxxs = kcxxs;
	}
	private List<Zyzs> jdzys;
	public List<Zyzs> getJdzys() {
		return jdzys;
	}
	private String sfzh;
	private String xh;
	private int xy;
	private int zy;
	private String nj;
	private int index;
	private String zs;
	private String zsfl;
	private List<Bmxx> ks;
	private List<Zyxx> zyxxs;
	private List<String> zyzss;
	private List<Stu> stus;
	private int stuid;
	private String mess;
	private int count;
	private int bmid;
	private Bmxx bmxx;
	private List<String> zslxs;
	private List<Stuclass> bjs;
	private String   rxrq;//入学日期
	private String   xb; //性别
	private String   lxdh;//电话  
	private String   xm; //姓名
	private String   csny;//出生年月
	private String   khh; //开户行
	private String jg; 
	
	public String getJg() {
		return jg;
	}

	public void setJg(String jg) {
		this.jg = jg;
	}

	public String getRxrq() {
		return rxrq;
	}

	public void setRxrq(String rxrq) {
		this.rxrq = rxrq;
	}

	public String getXb() {
		return xb;
	}

	public void setXb(String xb) {
		this.xb = xb;
	}

	public String getLxdh() {
		return lxdh;
	}

	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}

	public String getXm() {
		return xm;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}

	public String getCsny() {
		return csny;
	}

	public void setCsny(String csny) {
		this.csny = csny;
	}

	public String getKhh() {
		return khh;
	}

	public void setKhh(String khh) {
		this.khh = khh;
	}

	private String bankName;
	private String bankNo;
	 
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
	}

	public String getBankName() {
		return bankName;
	}

	public String getBankNo() {
		return bankNo;
	}

	public List<Stuclass> getBjs() {
		return bjs;
	}

	public void setZs(String zs) {
		this.zs = zs;
	}

	public List<String> getZslxs() {
		return zslxs;
	}

	public Bmxx getBmxx() {
		return bmxx;
	}

	public void setBmid(int bmid) {
		this.bmid = bmid;
	}
	public List<Collage> getCollages()
	  {
	    return this.collages;
	  }
	

	public List<Zyxx> getZyxxs() {
		return zyxxs;
	}

	public List<String> getZyzss() {
		return zyzss;
	}

	public List<Stu> getStus() {
		return stus;
	}

	public int getCount() {
		return count;
	}

	public void setStuid(int stuid) {
		this.stuid = stuid;
	}

	public String getMess() {
		return mess;
	}

	public void setZsfl(String zsfl) {
		this.zsfl = zsfl;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public void setXh(String xh) {
		this.xh = xh;
	}

	public void setXy(int xy) {
		this.xy = xy;
	}

	public void setZy(int zy) {
		this.zy = zy;
	}

	public void setNj(String nj) {
		this.nj = nj;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public List<Bmxx> getKs() {
		return ks;
	}

	@Resource
	public SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	 public String queryXY()
	  {
	    this.hql = "FROM Collage";
	    this.collages = this.stuManageServer.executeQuery(this.hql, null);
	    return "success";
	  }

	public String queryjdzy() {
		this.hql = "FROM Zyzs z where z.zsid <> '1001'";
		jdzys = stuManageServer.executeQuery(hql, null);
		return SUCCESS;
	}
	public String queryZY(){
	    this.hql = "SELECT z FROM Zyxx z,Collage c WHERE z.collage.xyid = c.xyid AND c.xyid =?";
	    this.parameters = new Object[] { Integer.valueOf(this.xy) };
	    this.zyxxs = this.stuManageServer.executeQuery(this.hql, this.parameters);
	    return "success";
	 }
	public String queryBJ(){
		this.hql = "SELECT s FROM Zyxx z,Stuclass s WHERE s.zyxx.zyid = z.zyid AND z.zyid =?";
		this.parameters = new Object[]{zy};
		bjs = stuManageServer.executeQuery(hql, parameters);
		return SUCCESS;
	}
	// 获取专业证书
	 public String getZyzs()
	  {
	    this.parameters = new Object[] { this.zsfl };
	    this.hql = "select distinct(zsmc)  FROM Zyzs z where z.zsfl=?";
	    this.zyzss = this.stuManageServer.executeQuery(this.hql, this.parameters);
	    return "success";
	  }

	/*public String queryStu() {
		String ref = " FROM Stu s ,Zyxx z,Collage c WHERE s.zyxx.zyid = z.zyid AND z.collage.xyid = c.xyid ";
		if (sfzh != null && !sfzh.trim().equals("")) {
			ref += " AND s.sfzh =? ";
			this.parameters = new Object[] { sfzh.trim() };
		} else if (xh != null && !xh.trim().equals("")) {
			ref += " AND s.xh =? ";
			this.parameters = new Object[] { xh.trim() };
		}
		if (zy != 0) {
			ref += " AND z.zyid= " + zy;
		}
		if (xy != 0) {
			ref += " AND c.xyid = " + xy;
		}
		if (!nj.equals("0")) {
			ref += " AND s.nj= " + nj;
		} 

		this.hql = "SELECT s " + ref+"order by s.xsid desc";
		stus = stuManageServer.executeQueryByPage(hql, parameters, index,
				pageSize);
		if(index==1){
			this.hql = "SELECT COUNT(*) " + ref;
			this.count = Integer.parseInt(stuManageServer.uniqueQuery(hql,
					parameters).toString());
		}
		return SUCCESS;
	}*/
	
	//查询学生信息
		public String queryStu() {
			String ref = " FROM Stu s ,Zyxx z,Collage c WHERE s.zyxx.zyid = z.zyid AND z.collage.xyid = c.xyid  AND s.xjzt!='自定义' ";
			if (sfzh != null && !sfzh.trim().equals("")) {
				ref += " AND s.sfzh like '%"+sfzh+"%'";
				//this.parameters = new Object[] { sfzh.trim() };
			} else if (xh != null && !xh.trim().equals("")) {
				ref += " AND s.xh  like '%"+xh+"%'";
				//this.parameters = new Object[] { xh.trim() };
			}
			//性别
			if(xb!=null&&!xb.equals("0")){
				ref +="AND s.xb= '"+xb+"'";
			}
			
			//电话
			if(lxdh !=null  && !lxdh.trim().equals("")){
				ref +="AND s.lxdh  like '%"+lxdh+"%'";
			}
			//籍贯
			if(jg !=null  && !jg.trim().equals("")){
				ref +="AND s.jg  like '%"+jg+"%'";
			}
			//姓名
			if(xm  !=null   && !xm.trim().equals("")){
				ref +="AND  s.xm like '%"+xm+"%'";
			}
			//入学日期  
			if(rxrq !=null  && ! rxrq.trim().equals("")){
				ref+="AND   s.rxrq like '%"+rxrq+"%'";
			}
			//开户行名称
		     if(khh!=null  && !khh.trim().equals("")){
		    	 ref+="AND  s.khh like '%"+khh+"%'";
		     }
		     
			if (zy != 0) {
				ref += " AND z.zyid= " + zy;
			}
			if (xy != 0) {
				ref += " AND c.xyid = " + xy;
			}
			if (!nj.equals("0")) {
				ref += " AND s.nj= " + nj;
			} 
			this.hql = "SELECT s " + ref+"order by s.xsid desc";
			stus = stuManageServer.executeQueryByPage(hql, parameters, index,
					pageSize);
			if(index==1){
				this.hql = "SELECT COUNT(*) " + ref;
				this.count = Integer.parseInt(stuManageServer.uniqueQuery(hql,parameters).toString());
				
			}
			return SUCCESS;
		}
	// 重置学生密码
	public String modifyPwd() {
		Stu stu = (Stu) stuManageServer.getById(Stu.class, this.stuid);
		mess = "";
		if (stu != null) {
			stu.setMm(stu.getSfzh());
			try {
				stuManageServer.update(stu);
				mess = "密码重置成功！";
			} catch (Exception e) {
				mess = "密码重置失败，请重新尝试！";
			}
		}
		return SUCCESS;
	}

	// 查询考试情况
	public String queryKS() {

		String ref = " FROM Bmxx b,Stu s,Zyxx z,Collage c,Zyzs zs WHERE s.xsid = b.stu.xsid AND z.collage.xyid = c.xyid AND s.zyxx.zyid = z.zyid AND zs.zsid=b.zyzs.zsid ";
		if (sfzh != null && !sfzh.trim().equals("")) {
			ref += " AND b.sfzh =? ";
			this.parameters = new Object[] { sfzh.trim() };
		} else if (xh != null && !xh.trim().equals("")) {
			ref += " AND s.xh =? ";
			this.parameters = new Object[] { xh.trim() };
		}
		if (zy != 0) {
			ref += " AND z.zyid = " + zy;
		}
		if (xy != 0) {
			ref += " AND c.xyid = " + xy;
		}
		if (nj != null && !nj.equals("0")) {
			ref += " AND s.nj = " + nj;
		}
		if (zs != null && !zs.equals("")) {
			ref += " AND zs.zsmc ='"+zs+"'";
		}
		this.hql = "SELECT COUNT(*) " + ref;
		this.count = Integer.parseInt(stuManageServer.uniqueQuery(hql,
				parameters).toString());

		this.hql = "Select b  " + ref;
		ks = stuManageServer.executeQueryByPage(hql, parameters, index,
				pageSize);

		return SUCCESS;
	}

	// 查询考试详细情况
	public String queryKaoShiById() {

		bmxx = (Bmxx) stuManageServer.getById(Bmxx.class, bmid);

		return SUCCESS;
	}

	// 证书类型查询
	public String getZsLX() {

		this.hql = "SELECT distinct(zsfl) FROM Zyzs Where zsfl <> null AND zsfl <> ''";
		zslxs = stuManageServer.executeQuery(hql, null);
		return SUCCESS;
	}
	
	public String queryBankInfo(){
		Stu stu = (Stu) stuManageServer.loadById(Stu.class, stuid);
		this.bankName = stu.getKhh();
		this.bankNo = stu.getYhzh();
		return SUCCESS;
	}
	
	public String modifyYhzh(){
		Stu stu = (Stu) stuManageServer.loadById(Stu.class, stuid);
		stu.setKhh(bankName);
		stu.setYhzh(bankNo);
		stuManageServer.update(stu);
		return SUCCESS;
	}

}
