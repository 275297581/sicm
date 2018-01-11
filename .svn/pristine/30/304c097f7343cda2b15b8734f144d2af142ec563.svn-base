package com.iking.zsrd.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.iking.basic.BasicAction;
import com.iking.beans.Stu;
import com.iking.beans.Xwzsrd;
import com.iking.inter.ZsrdInter;
import com.iking.tools.Tool;

@SuppressWarnings({ "serial" ,"unchecked"})
public class ZsrdAction extends BasicAction{
	@Resource
	private ZsrdInter zsrdServer;
	public void setZsrdServer(ZsrdInter zsrdServer) {
		this.zsrdServer = zsrdServer;
	}
	
	private List<Xwzsrd> zs ; 
	public List<Xwzsrd> getZs() {
		return zs;
	} 
	private String sfz;
	private String sqzs;
	private String jg;
	private String bz;
	private String zsbh;
	private String  xm;
	
	public String getXm() {
		return xm;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}

	public String getZsbh() {
		return zsbh;
	}

	public void setZsbh(String zsbh) {
		this.zsbh = zsbh;
	}

	private int id;
	private Xwzsrd xwzs;
	private int index;
	private int count;
	private int xy;
	private int zy;
	private String mess;
	
	public String getMess() {
		return mess;
	}

	public void setXy(int xy) {
		this.xy = xy;
	}

	public void setZy(int zy) {
		this.zy = zy;
	}

	public int getCount() {
		return count;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public Xwzsrd getXwzs() {
		return xwzs;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setSfz(String sfz) {
		this.sfz = sfz;
	}

	public void setSqzs(String sqzs) {
		this.sqzs = sqzs;
	}

	public void setJg(String jg) {
		this.jg = jg;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String queryMyZSSq(){
		Stu stu = (Stu) ServletActionContext.getContext().getSession().get("stu");
		if(stu==null){
			zs= new ArrayList<Xwzsrd>();
			return SUCCESS;
		}
		this.hql ="SELECT x FROM Stu s,Xwzsrd x WHERE x.stu.xsid = s.xsid AND s.xsid="+stu.getXsid();
		zs = zsrdServer.executeQuery(hql, null);
		return SUCCESS;
	} 
	
	public String addZsrd(){
		if (!Tool.ZS.containsKey("校外证书")) {
			mess = "申请失败！校外证书不被认同或无数据信息！";
			return SUCCESS;
		}
		Stu stu = (Stu) ServletActionContext.getContext().getSession().get("stu");
		if(stu!=null){
			Xwzsrd xwzsrd = new Xwzsrd();
			xwzsrd.setStu(stu);
			xwzsrd.setSfzh(sfz);
			xwzsrd.setSqzs(sqzs);
			xwzsrd.setZskqjg(jg);
			xwzsrd.setBz(bz);
			xwzsrd.setZsbh(zsbh);
			xwzsrd.setZt("待审核");
			xwzsrd.setSqsj(Tool.FData(new Date()));
			xwzsrd.setMoney(Tool.ZSJE.get(Tool.ZS.get("校外证书")));
			xwzsrd.setXf(Tool.ZSXF.get(Tool.ZS.get("校外证书")));
			zsrdServer.add(xwzsrd);
			mess ="申请成功！";
		}
		return SUCCESS;
	}
	public String deleteZs(){
		Xwzsrd xwzsrd = (Xwzsrd) zsrdServer.getById(Xwzsrd.class, id);
		if(xwzsrd!=null){
			zsrdServer.delete(xwzsrd);
		} 
		return SUCCESS;
	}
	
	public String queryOneZs(){
		xwzs = (Xwzsrd) zsrdServer.getById(Xwzsrd.class, id);
		return SUCCESS;
	}
	public String modifyZs(){
		Xwzsrd xwzsrd = (Xwzsrd) zsrdServer.getById(Xwzsrd.class, id);
		if(xwzsrd!=null){
			xwzsrd.setBz(bz);
			xwzsrd.setSqzs(sqzs);
			xwzsrd.setZskqjg(jg);
			xwzsrd.setZt("待审核");
		}
		zsrdServer.update(xwzsrd);
		return SUCCESS;
	}
	public String querySpZs(){
		this.hql = "FROM Xwzsrd WHERE zt='待审核'";
		this.zs = zsrdServer.executeQueryByPage(hql, null, index,
				pageSize);
		if (index == 1) {
			this.hql = "SELECT COUNT(*) "+hql;
			count = Integer.parseInt(zsrdServer.uniqueQuery(hql, null)
					.toString());
		}
		return SUCCESS;
	}
	public String bhZs(){
		Xwzsrd xwzsrd = (Xwzsrd) zsrdServer.getById(Xwzsrd.class, id);
		if (xwzsrd != null) {
			if (xwzsrd.getBz() != null && !xwzsrd.getBz().trim().equals("")) {
				xwzsrd.setBz(xwzsrd.getBz() + "\n驳回原因：" + bz);
			} else {
				xwzsrd.setBz("驳回原因：" + bz);
			}
			xwzsrd.setZt("驳回");
			zsrdServer.update(xwzsrd);
		} 
		return SUCCESS;
	}
	public String throwZs(){
		Xwzsrd xwzsrd = (Xwzsrd) zsrdServer.getById(Xwzsrd.class, id);
		if (xwzsrd != null) { 
			xwzsrd.setZt("审核通过");
			this.zsrdServer.update(xwzsrd);
			Tool.ZSSQ.put(xwzsrd.getStu().getSfzh()+xwzsrd.getSqzs(), id);
		}
		return SUCCESS;
	}
	public String showZs(){
		this.hql = " FROM Xwzsrd x,Stu s,Zyxx z,Collage c WHERE x.stu.xsid=s.xsid AND" +
				" s.zyxx.zyid = z.zyid AND z.collage.xyid = c.xyid AND x.zt='审核通过' ";
		
		if(!this.xm.trim().equals("")){
			this.hql +=" AND s.xm ='"+this.xm+"' "; 
		}
		if(!this.sfz.trim().equals("")){
			this.hql +=" AND x.sfzh ='"+this.sfz+"' "; 
		}
		if(this.xy!=0){
			this.hql +=" AND c.xyid ="+this.xy;
		}
		if(this.zy!=0){
			this.hql +=" AND z.zyid ="+this.zy;
		}
		if(!this.sqzs.trim().equals("")){
			this.hql +=" AND x.sqzs like '%"+this.sqzs+"%' "; 
		}
		
		this.zs = this.zsrdServer.executeQueryByPage("SELECT x "+this.hql, null, index,
				pageSize);
		if (index == 1) {
			this.hql = "SELECT COUNT(*) "+this.hql;
			count = Integer.parseInt(this.zsrdServer.uniqueQuery(this.hql, null)
					.toString());
		}
		return SUCCESS;
	}
}
