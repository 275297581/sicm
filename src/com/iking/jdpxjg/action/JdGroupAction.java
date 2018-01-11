package com.iking.jdpxjg.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.iking.basic.BasicAction;
import com.iking.beans.Kdxx;
import com.iking.beans.Notice;
import com.iking.beans.Sysuser;
import com.iking.inter.JdGroupInter;
import com.iking.tools.Tool;

@SuppressWarnings({ "unchecked", "serial" })
public class JdGroupAction extends BasicAction {

	@Resource
	private JdGroupInter jdGroupServer;
	private String kdm;
	private String jg;
	private String bz;
	private String mess;
	private List<Kdxx> kdxxs;
	private int index;
	private int count;
	private int id;
	private Kdxx kdxx;
	private String xm;
	private String sx;
	private String qx;
	private String zyj;
	private String jyj;

	public void setZyj(String zyj) {
		this.zyj = zyj;
	}

	public void setJyj(String jyj) {
		this.jyj = jyj;
	}

	public void setQx(String qx) {
		this.qx = qx;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}

	public void setSx(String sx) {
		this.sx = sx;
	}

	public Kdxx getKdxx() {
		return kdxx;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCount() {
		return count;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public List<Kdxx> getKdxxs() {
		return kdxxs;
	}

	public void setJdGroupServer(JdGroupInter jdGroupServer) {
		this.jdGroupServer = jdGroupServer;
	}

	public String getMess() {
		return mess;
	}

	public void setKdm(String kdm) {
		this.kdm = kdm;
	}

	public void setJg(String jg) {
		this.jg = jg;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String addJdKd() {
		if (Tool.KD.containsKey(kdm)) {
			mess = "该考点已存在！";
			return SUCCESS;
		}
		int id = 0;
		Kdxx kdxx = new Kdxx();
		kdxx.setBz(bz);
		kdxx.setKdm(kdm);
		kdxx.setFzjg(jg);
		kdxx.setJlsj(Tool.FData(new Date()));
		kdxx.setZt("待审核");
		kdxx.setSqxm(xm);
		kdxx.setSqsx(sx);
		kdxx.setSqsj(qx);
		id = Integer.parseInt(jdGroupServer.add(kdxx).toString());
		Tool.KD.put(kdm, id);
		mess = "考点申请成功！";
		return SUCCESS;
	}

	public String queryJdKd() {

		this.hql = "FROM Kdxx WHERE zt='待审核' or zt ='驳回'";
		this.kdxxs = jdGroupServer.executeQueryByPage(hql, null, index,
				pageSize);

		if (index == 1) {
			this.hql = "SELECT COUNT(*) " + this.hql;
			count = Integer.parseInt(jdGroupServer.uniqueQuery(hql, null)
					.toString());
		}
		return SUCCESS;
	}

	public String querydshJdKd() {

		this.hql = "FROM Kdxx WHERE zt='待审核'";
		this.kdxxs = jdGroupServer.executeQueryByPage(hql, null, index,
				pageSize);
		if (index == 1) {
			this.hql = "SELECT COUNT(*) " + this.hql;
			count = Integer.parseInt(jdGroupServer.uniqueQuery(hql, null)
					.toString());
		}
		return SUCCESS;
	}

	public String deleteJdKd() {
		try {
			Kdxx kdxx = (Kdxx) jdGroupServer.getById(Kdxx.class, id);
			if (kdxx != null) {
				// Tool.Kdxxs.remove(kdxx.getCollage().getXymc());
				jdGroupServer.delete(kdxx);
				mess = "删除成功！";
			} else {
				mess = "考点不存在或已被删除！！";
			}
		} catch (Exception e) {
			e.printStackTrace();
			mess = "删除失败！";
		}
		return SUCCESS;
	}

	public String queryOneJdKd() {
		kdxx = (Kdxx) jdGroupServer.getById(Kdxx.class, id);
		return SUCCESS;
	}

	public String modifyJdKd() {
		try {
			Kdxx kdxx = (Kdxx) jdGroupServer.getById(Kdxx.class, id);

			if (kdxx != null) {
				kdxx.setKdm(kdm);
				kdxx.setFzjg(jg);
				kdxx.setJlsj(Tool.FData(new Date()));
				//kdxx.setZt("待审核");
				kdxx.setSqxm(xm);
				kdxx.setSqsx(sx);
				kdxx.setSqsj(qx);
				kdxx.setBz(bz);
				jdGroupServer.update(kdxx);
				Tool.XY.put(kdm, id);
				mess = "修改成功！";
			}
		} catch (Exception e) {
			e.printStackTrace();
			mess = "修改失败！";
		}
		return SUCCESS;
	}

	public String bhJdKd() {
		Kdxx kdxx = (Kdxx) jdGroupServer.getById(Kdxx.class, id);
		if (kdxx != null) {
			if (kdxx.getBz() != null && !kdxx.getBz().trim().equals("")) {
				kdxx.setBz(kdxx.getBz() + "\n驳回原因：" + bz);
			} else {
				kdxx.setBz("驳回原因：" + bz);
			}
			kdxx.setZt("驳回");
			jdGroupServer.update(kdxx);
		}
		return SUCCESS;
	}

	public String agreeJdKd() {
		Kdxx kdxx = (Kdxx) jdGroupServer.getById(Kdxx.class, id);
		if (kdxx != null) {
			kdxx.setZgyldyj(zyj);
			kdxx.setJxjyzxyj(jyj);
			kdxx.setZt("审核通过");
			jdGroupServer.update(kdxx);
			Tool.KD.put(kdxx.getKdm(),kdxx.getJdkdid());
			
			this.hql = "from Notice where px=(select MAX(px) from Notice)";
			Notice notice = (Notice) jdGroupServer.uniqueQuery(hql, null);
			Sysuser user = (Sysuser) request.getSession().getAttribute("sysuser");
			Notice notice1 = new Notice();
			notice1.setContent("考点名为"+kdxx.getKdm()+"已审批通过。");
			notice1.setTitle(kdxx.getKdm()+"审批通过");
			notice1.setRemark(Tool.FData(new Date())); 
			notice1.setPtime(Tool.FData(new Date())); 
			if(user!=null)
				notice1.setPuser(user.getUserName());
			notice1.setBm("考点审批部门");
			notice1.setIsp("是");
			notice1.setPower(1);
			notice1.setZd("0");
			if(notice!=null){
				notice1.setPx(notice.getPx() + 1);
			}else{
				notice1.setPx(1);
			}  
			jdGroupServer.add(notice1);
		}
		return SUCCESS;
	}

	public String showJdKd() {
		this.hql = "FROM Kdxx WHERE zt='审核通过' ";
		if (kdm != null)
			this.hql += " AND kdm like '%" + kdm + "%'";

		this.kdxxs = jdGroupServer.executeQueryByPage(hql, null,
				index, pageSize);

		if (index == 1) {
			this.hql = "SELECT COUNT(*) " + this.hql;
			count = Integer.parseInt(jdGroupServer.uniqueQuery(hql, null)
					.toString());
		}
		return SUCCESS;
	}
}
