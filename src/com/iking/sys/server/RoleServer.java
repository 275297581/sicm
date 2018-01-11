package com.iking.sys.server;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.transaction.annotation.Transactional;

import com.iking.basic.BasicServer;
import com.iking.beans.Bmxx;
import com.iking.beans.Collage;
import com.iking.beans.Kdxx;
import com.iking.beans.Kszs;
import com.iking.beans.Rolemenu;
import com.iking.beans.Scor;
import com.iking.beans.Stu;
import com.iking.beans.Stuclass;
import com.iking.beans.Sysmenu;
import com.iking.beans.Sysrole;
import com.iking.beans.Xwzsrd;
import com.iking.beans.Zyxx;
import com.iking.beans.Zyzs;
import com.iking.inter.RoleInter;
import com.iking.tools.Tool;

@Transactional
@SuppressWarnings("unchecked")
public class RoleServer extends BasicServer implements RoleInter {

	@Override
	public void deleteRole(String rids) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		String[] ids = rids.split(",");
		for (String id : ids) {
			Sysrole sysrole = (Sysrole) session.get(Sysrole.class, Integer.parseInt(id));
			if (sysrole != null)
				session.delete(sysrole);
		}
	}

	@Override
	public void modifyRoleMenu(String rid, String mids) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "DELETE FROM Rolemenu WHERE sysrole.rid=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, Integer.parseInt(rid));
		query.executeUpdate();

		Sysrole sysrole = new Sysrole();
		sysrole.setRid(Integer.parseInt(rid));

		String[] ids = mids.split(",");
		for (String id : ids) {
			Sysmenu sysmenu = new Sysmenu();
			sysmenu.setMid(Integer.parseInt(id));
			Rolemenu rolemenu = new Rolemenu();
			rolemenu.setSysrole(sysrole);
			rolemenu.setSysmenu(sysmenu);
			session.save(rolemenu);
		}
	}

	/********************************************************/
	/** 从新加载格式化数据 ***************************************/
	/********************************************************/
	/**
	 * 调用初始化所有系统开始加载参数信息
	 * @return
	 */
	public boolean initParam() {
		initCollage();
		initZyxx();
		initStuclass();
		initZyzs();
		initStu();
		initBmxx();
		initKdxx();
		initScore();
		initKszs();
		initXwzs();
		System.out.println("系统参数从新初始化完成");
		return true;
	}

	public void initXwzs() {
		// key: xwzs Value:ID
		System.out.println("*** xwzssq INIT ***");
		Tool.ZSSQ.clear();
		List<Xwzsrd> xwzsrds = this.executeQuery("FROM Xwzsrd WHERE zt='审核通过'", null);
		for (Xwzsrd xszs : xwzsrds) {
			Tool.ZSSQ.put(xszs.getStu().getSfzh() + xszs.getSqzs(), xszs.getXwrdid());
			Tool.ZSBH.put(xszs.getStu().getSfzh(), xszs.getZsbh());
		}
		System.out.println("*** xwzssq OK ***");
	}

	public void initKszs() {
		// key: xh+zsmc+dj Value:ID
		System.out.println("*** Kszs Start ***");
		Tool.KSZS.clear();
		Tool.HXZS.clear();
		List<Kszs> kszss = this.executeQuery("FROM Kszs", null);
		for (Kszs kszs : kszss) {
			Tool.KSZS.put(kszs.getStu().getSfzh() + kszs.getZsmc() + kszs.getZsdj(), kszs.getKzid());
			if (kszs.getIfhx() != null && kszs.getIfhx().equals("1")) {
				Tool.HXZS.put(kszs.getStu().getSfzh(), kszs.getKzid());
			}
		}
		System.out.println("*** Kszs ok ***");
	}

	public void initScore() {
		// key: Zkzh Value:ID
		System.out.println("*** Score INIT ***");
		Tool.CJ.clear();
		List<Scor> scors = this.executeQuery("FROM Scor", null);
		for (Scor scor : scors)
			Tool.CJ.put(scor.getZkzh(), scor.getCjid());
		System.out.println("*** Score OK ***");
	}

	public void initKdxx() {
		// key: Kdmc Value:ID
		System.out.println("*** Kdxx INIT ***");
		Tool.KD.clear();
		List<Kdxx> kdxxs = this.executeQuery("FROM Kdxx WHERE zt='审核通过'", null);
		for (Kdxx kdxx : kdxxs)
			Tool.KD.put(kdxx.getKdm(), kdxx.getJdkdid());
		System.out.println("*** Kdxx OK ***");
	}

	public void initBmxx() {
		// key: Sfzh+Zsmc+zsdj Value:ID
		System.out.println("*** Bmxx INIT ***");
		Tool.BM.clear();
		List<Bmxx> bmxxs = this.executeQuery("FROM Bmxx", null);
		for (Bmxx bmxx : bmxxs)
			Tool.BM.put(bmxx.getSfzh() + bmxx.getZyzs().getZsmc() + bmxx.getZyzs().getZsdj(), bmxx.getBmid());
		System.out.println("*** Bmxx ok ***");
	}

	public void initStu() {
		System.out.println("*** Stu INIT ***");
		Tool.XS.clear();
		Tool.XHSF.clear();
		// Tool.XHZY.clear();
		Tool.SFZZY.clear();
		Tool.SFXM.clear();
		List<Stu> stus = this.executeQuery("FROM Stu", null);
		for (Stu stu : stus) {
			Tool.XS.put(stu.getSfzh(), stu.getXsid());
			Tool.XHSF.put(stu.getXh(), stu.getSfzh());
			// Tool.XHZY.put(stu.getXh(), stu.getZyxx().getZymc());
			Tool.SFZZY.put(stu.getSfzh(), stu.getZyxx().getZymc());
			Tool.SFXM.put(stu.getSfzh(), stu.getXm());
		}
		System.out.println("*** Stu OK ***");
	}

	public void initZyzs() {
		// key:zymc+Zsmc+dj Value:ID
		System.out.println("*** Zyzs INIT ***");
		Tool.ZS.clear();
		Tool.ZS1.clear();
		Tool.ZSFL.clear();
		List<Zyzs> zyzss = this.executeQuery("FROM Zyzs", null);
		for (Zyzs zyzs : zyzss) {
			Tool.ZS.put(zyzs.getZymc() + zyzs.getZsmc() + zyzs.getZsdj(), zyzs.getZsid());
			Tool.ZS1.put(zyzs.getZsmc() + zyzs.getZsdj(), zyzs.getZsid());
			Tool.ZSFL.put(zyzs.getZsmc() + zyzs.getZsdj(), zyzs.getZsfl());
			Tool.ZSJE.put(zyzs.getZsid(), zyzs.getJlbz());
			Tool.ZSXF.put(zyzs.getZsid(), zyzs.getXf());
		}
		System.out.println("*** Zyzs OK ***");
	}

	public void initStuclass() {
		// key: Bjmc Value:ID
		System.out.println("*** Stuclass INIT ***");
		Tool.BJ.clear();
		List<Stuclass> stuclasses = this.executeQuery("FROM Stuclass", null);
		for (Stuclass sc : stuclasses)
			Tool.BJ.put(sc.getBjmc(), sc.getBjid());
		System.out.println("*** Stuclass OK ***");
	}

	public void initZyxx() {
		// key: Zymc Value:ID
		System.out.println("*** Zyxx INIT ***");
		Tool.ZY.clear();
		List<Zyxx> zyxxs = this.executeQuery("FROM Zyxx", null);
		for (Zyxx zyxx : zyxxs)
			Tool.ZY.put(zyxx.getZymc(), zyxx.getZyid());
		System.out.println("*** Zyxx OK ***");
	}

	public void initCollage() {
		// key: Xymc Value:ID
		System.out.println("*** Collage INIT ***");
		Tool.XY.clear();
		List<Collage> collages = this.executeQuery("FROM Collage", null);
		for (Collage collage : collages)
			Tool.XY.put(collage.getXymc(), collage.getXyid());
		System.out.println("*** Collage OK ***");
	}
}
