package com.iking.sys.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.iking.basic.BasicAction;
import com.iking.beans.Stuclass;
import com.iking.beans.Sysuser;
import com.iking.beans.Zyxx;
import com.iking.beans.Zyzs;
import com.iking.inter.StuManageInter;
import com.iking.inter.XyBjInter;
import com.iking.tools.Tool;

@SuppressWarnings("serial")
public class XyBjAction extends BasicAction{
	@Resource 
	private XyBjInter xyBjServer;
	private int count;
	private int index;
	private List<Stuclass> stuclasses;
	private int xy;
	private int zy;
	private String msg;
	private String zyid;
	private String bjbh;
	private String bjmc;
	private String bjid;
	private String bjids;
	private Stuclass stuclass;
	
	
	public String getBjids() {
		return bjids;
	}

	public void setBjids(String bjids) {
		this.bjids = bjids;
	}

	public Stuclass getStuclass() {
		return stuclass;
	}

	public void setStuclass(Stuclass stuclass) {
		this.stuclass = stuclass;
	}

	public String getBjid() {
		return bjid;
	}

	public void setBjid(String bjid) {
		this.bjid = bjid;
	}

	public String getZyid() {
		return zyid;
	}

	public void setZyid(String zyid) {
		this.zyid = zyid;
	}

	public String getBjbh() {
		return bjbh;
	}

	public void setBjbh(String bjbh) {
		this.bjbh = bjbh;
	}

	public String getBjmc() {
		return bjmc;
	}

	public void setBjmc(String bjmc) {
		this.bjmc = bjmc;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	public void setXy(int xy) {
		this.xy = xy;
	}

	public void setZy(int zy) {
		this.zy = zy;
	}

	public List<Stuclass> getStuclasses() {
		return stuclasses;
	}

	public int getCount() {
		return count;
	}

	public void setXyBjServer(XyBjInter xyBjServer) {
		this.xyBjServer = xyBjServer;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String showBJ(){
		this.hql = "FROM Stuclass B,Zyxx Z,Collage C WHERE B.zyxx.zyid = Z.zyid AND Z.collage.xyid = C.xyid ";
		if(xy!=0){
			this.hql +=" AND C.xyid ="+xy;
		}
		if(zy!=0){
			this.hql +=" AND Z.zyid ="+zy;
		}
		stuclasses = xyBjServer.executeQueryByPage("SELECT B "+this.hql, this.parameters, index, pageSize);
		if (index == 1) {
			this.hql = "SELECT COUNT(*) "+hql;
			count = Integer.parseInt(xyBjServer.uniqueQuery(hql, null)
					.toString());
		}
		return SUCCESS;
	}
	
	//回写班级
	public String queryclass(){
		stuclass = (Stuclass) xyBjServer.getById(Stuclass.class, Integer.parseInt(bjid));
		return SUCCESS;
	}
		
	public String modifyClass() {

		int flag = 0;
		this.hql = "UPDATE Stuclass  SET bjmc=?,zyxx.zyid=?,bjbh=? WHERE bjid=? ";
		this.parameters = new Object[] {bjmc,Integer.parseInt(zyid),bjbh, Integer.parseInt(bjid) };
		flag = xyBjServer.executeUpdate(this.hql, this.parameters);
		if (flag == 1)
			this.msg = "信息修改成功！";
		else
			this.msg = "信息修改失败！";
		return SUCCESS;
	}

	public String saveclass() {
		Stuclass stuclass=new Stuclass();
		stuclass.setBjbh(bjbh);
		stuclass.setBjmc(bjmc);
		Zyxx z = (Zyxx) xyBjServer.getById(Zyxx.class,Integer.parseInt(zyid));
		stuclass.setZyxx(z);
		try {
			xyBjServer.add(stuclass);
			this.msg = "班级添加成功！";
		} catch (Exception e) {
			this.msg = "班级添加失败！";
		}
		return SUCCESS;
	}

	public String deleteClass() {
		try {
			xyBjServer.deleteClasses(bjids);
			this.msg = "信息删除成功！";
		} catch (Exception e) {
			e.printStackTrace();
			this.msg = "信息删除失败！重新进行删除";
		}
		return SUCCESS;
	}

	
	
}
