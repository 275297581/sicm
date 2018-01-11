package com.iking.sys.action;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import com.iking.basic.BasicAction;
import com.iking.beans.Stu;
import com.iking.beans.Sysrole;
import com.iking.beans.Sysuser;
import com.iking.beans.Userrole;
import com.iking.inter.UserInter;
import com.iking.tools.Tool;
@SuppressWarnings("serial")
public class UserManageAction extends BasicAction {
	@Resource
	private UserInter userServer;
	public List<Sysuser> sysusers;
	private String index;
	private int count;
	private String uname;
	private String lock;
	private Integer uid;
	private String userId;
	private String descr;
	private String mess;
	private Integer rid;
	private String newpwd;
	private String oldpwd;
	private Sysuser sysuser;

	


	public String getUname() {
		return uname;
	}

	public void setSysusers(List<Sysuser> sysusers) {
		this.sysusers = sysusers;
	}

	public void setSysuser(Sysuser sysuser) {
		this.sysuser = sysuser;
	}

	public Sysuser getSysuser() {
		return sysuser;
	}

	public void setOldpwd(String oldpwd) {
		this.oldpwd = oldpwd;
	}

	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public String getMess() {
		return mess;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public List<Sysuser> getSysusers() {
		return sysusers;
	}

	public String getIndex() {
		return index;
	}

	public void setIndex(String index) {
		this.index = index;
	}

	public int getCount() {
		return count;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public void setLock(String lock) {
		this.lock = lock;
	}

	@SuppressWarnings("unchecked")
	public String showUser() {
		String ref = "";
		if (this.lock != null) {
			if (this.lock.equals("")) {
				ref = " WHERE userName LIKE ?";
			} else if (this.lock.equals("true")) {
				ref = " WHERE userName LIKE ? AND locked = true";
			} else {
				ref = " WHERE userName LIKE ? AND locked = false";
			}
			this.parameters = new Object[] { "%" + this.uname + "%" };
		 } else {
			this.parameters = null;
		 }

		this.hql = "SELECT COUNT(*) FROM Sysuser " + ref;
		this.count = Integer.parseInt(this.userServer.uniqueQuery(this.hql, this.parameters)
				.toString());

		this.hql = "From Sysuser " + ref;
		this.sysusers = this.userServer.executeQueryByPage(this.hql, this.parameters,
				Integer.parseInt(this.index), this.pageSize);
		return "success";
	}
	public String queryOneUser(){
		
		sysuser = (Sysuser) userServer.getById(Sysuser.class, uid);
		return SUCCESS;
	}
	public String modifyUser() {

		int flag = 0;
		this.hql = "UPDATE Sysuser  SET userName=?,locked=?,descr=? WHERE uid=? ";
		this.parameters = new Object[] { uname,
				Boolean.parseBoolean(this.lock), descr, this.uid };
		flag = userServer.executeUpdate(this.hql, this.parameters);
		if (flag == 1)
			this.mess = "信息修改成功！";
		else
			this.mess = "信息修改失败！";
		return SUCCESS;
	}

	public String addUser() {

		this.hql = "SELECT COUNT(*) FROM Sysuser WHERE userId=?";
		this.parameters = new Object[] { userId };
		int val = Integer.parseInt(userServer.uniqueQuery(hql, parameters)
				.toString());
		if (val != 0) {
			this.mess = "该登录名已经被占用，选用其他登录名！";
			return SUCCESS;
		}
		Sysuser sysuser = new Sysuser();
		sysuser.setUserId(userId);
		sysuser.setUserName(uname);
		sysuser.setUserPwd("000000");
		sysuser.setLocked(false);
		sysuser.setCreateTime(Tool.FData(new Date()));
		sysuser.setDescr(descr);

		try {
			userServer.add(sysuser);
			this.mess = "信息添加成功！";
		} catch (Exception e) {
			this.mess = "信息添加失败！";
		}
		return SUCCESS;
	}

	public String deleteUser() {
		try {
			userServer.deleteUser(userId);
			this.mess = "信息删除成功！";
		} catch (Exception e) {
			e.printStackTrace();
			this.mess = "信息删除失败！重新进行删除";
		}
		return SUCCESS;
	}

	public String showURole() {
		this.hql = "SELECT R FROM Sysrole R,Userrole UR Where UR.sysuser.uid=? AND R.rid = UR.sysrole.rid";
		this.parameters = new Object[] { this.uid };
		Sysrole sysrole = (Sysrole) userServer.uniqueQuery(hql, parameters);
		this.mess = sysrole.getRid() + "";
		return SUCCESS;
	}

	public String modifyURole() {
		try {
			this.hql = "FROM Userrole WHERE sysuser.uid=?";
			this.parameters = new Object[] { this.uid };
			Userrole userrole = (Userrole) userServer.uniqueQuery(hql,
					parameters);
			Sysrole sysrole = (Sysrole) userServer.loadById(Sysrole.class, rid);
			if (userrole == null) {
				userrole = new Userrole();
				Sysuser sysuser = (Sysuser) userServer.loadById(Sysuser.class,
						uid);
				userrole.setSysrole(sysrole);
				userrole.setSysuser(sysuser);
				userServer.add(userrole);
			} else {
				userrole.setSysrole(sysrole);
				userServer.update(userrole);
			}
		} catch (Exception e) {
			this.mess = "授权失败！";
		}
		this.mess = "授权成功！";
		return SUCCESS;
	}

	// modify manage pwd
	public String modifyPwd() {
		System.out.println("管理者密码修改！！！！！");
		Sysuser user = (Sysuser) userServer.getById(Sysuser.class, uid);
		if (user != null) {
			if (!user.getUserPwd().equals(oldpwd)) {
				mess = "旧密码输入错误！请重新输入!";
				return SUCCESS;
			}
			user.setUserPwd(newpwd);
			try {
				userServer.update(user);
				mess = "密码修改成功！";
			} catch (Exception e) {
				mess = "密码修改失败！";
			}
		}
		return SUCCESS;
	}

	public String modifyPwd1() {
		System.out.println("学生密码修改！！！！！");
		Stu user = (Stu) userServer.getById(Stu.class, uid);
		if (user != null) {
			if (!user.getMm().equals(oldpwd)) {
				mess = "旧密码输入错误！请重新输入!";
				return SUCCESS;
			}
			user.setMm(newpwd);
			try {
				userServer.update(user);
				mess = "密码修改成功！";
			} catch (Exception e) {
				mess = "密码修改失败！";
			}
		}
		return SUCCESS;
	}

	public String restPwd() {
		Sysuser user = (Sysuser) userServer.getById(Sysuser.class, uid);
		mess = "";
		if (user != null) {
			user.setUserPwd("000000");
			try {
				userServer.update(user);
				mess = "密码重置成功！";
			} catch (Exception e) {
				mess = "密码重置失败，请重新尝试！";
			}
		}
		return SUCCESS;
	}
	
	
	
	// 自定义信息显示
	public String selectZdy() {
		this.parameters = new Object[] { userId };
		this.hql = "from Sysuser where xsid=?";
		sysuser= (Sysuser) userServer.uniqueQuery(this.hql, parameters);
		return SUCCESS;
	}
	
	
	// 自定义信息显示
	public String selectUname() {
		this.parameters = new Object[] { uname };
		this.hql = "from Sysuser where uname=?";
		sysuser= (Sysuser) userServer.uniqueQuery(this.hql, parameters);
		return SUCCESS;
	}
	
	
	/**
	 * 课程信息显示
	 * @return
	 */
	public  String  selectUser(){
		this.parameters = new Object[] { uname };
		this.hql = "from Sysuser where uname=?";
		sysuser = (Sysuser) userServer.uniqueQuery(this.hql, parameters);
		return SUCCESS;
		}
	
}
