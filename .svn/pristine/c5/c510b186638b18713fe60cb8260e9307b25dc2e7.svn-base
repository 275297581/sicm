package com.iking.login.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.iking.basic.BasicAction;
import com.iking.beans.Stu;
import com.iking.beans.Sysmenu;
import com.iking.beans.Sysrole;
import com.iking.beans.Sysuser;
import com.iking.beans.Timelock;
import com.iking.inter.UserLoginInter;

/**
 * 
 * @author YK
 * 
 */

@SuppressWarnings({ "unchecked", "serial" })
public class UserLoginAction extends BasicAction {

	@Resource
	public UserLoginInter userLoginServer;

	public void setUserLoginServer(UserLoginInter userLoginServer) {
		this.userLoginServer = userLoginServer;
	}

	private String uid;
	private String pwd;
	private String ltype;
	private String mess;
	
	
	//系统设置起始时间，结束时间
	private String  begintime;
	private String  endtime;
	private Timelock timelock;
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

	public String getMess() {
		return mess;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public void setLtype(String ltype) {
		this.ltype = ltype;
	}

	private List<Sysmenu> sysmenus1;

	public List<Sysmenu> getSysmenus1() {
		return sysmenus1;
	}

	private List<Sysmenu> sysmenus2;

	public List<Sysmenu> getSysmenus2() {
		return sysmenus2;
	}
	//系统使用时间设置
	 public String  tiemLuru(){
			String hql = "from Timelock";
			List list = userLoginServer.executeQuery(hql, null);
			 Timelock  timeLock=new Timelock();
			if(list.isEmpty()){
				 timeLock.setBegintime(begintime);
				 timeLock.setEndtime(endtime);
				 try {
					 userLoginServer.add(timeLock);
					    mess = "保存成功!";	
					} catch (Exception e) {
						mess = "保存失败！";
						e.printStackTrace();
				}
			}else{
				Timelock t = (Timelock) list.get(0);
			     t.setBegintime(begintime);
			     t.setEndtime(endtime);
				 //将日期转化为天数
				 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			     try {
					Date   begintime   = format.parse(t.getBegintime());
					Date   endtime   = format.parse(t.getEndtime());
					  long diff = (endtime.getTime() - begintime.getTime()) / (86400 * 1000);
					  t.setEndtime(Long.toString(diff));
					  t.setRuntime(Long.toString(diff));
				} catch (ParseException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			   
			     try {
			    	 mess = "保存成功!";
				userLoginServer.update(t);
			   
			     }catch (Exception e) {
						mess = "保存失败！";
				e.printStackTrace();
			     }
		   }
	  return SUCCESS;
	 }
	
	public String loginCheck() {
		if (ltype == null) {
			return "loginfail";
		}
		
		//判断系统时间到1356时，到期提示不能使用
		String hql = "from Timelock";
		List list = userLoginServer.executeQuery(hql, null);
		Timelock t = (Timelock) list.get(0);
		int i = Integer.parseInt(t.getRuntime());
		t.setRuntime(Integer.toString(i));
		if(i<1){
			mess = "系统过期！";
			return "loginfail";
		}else{
		
		// student logins
		if (ltype.equals("1")) {
			hql = "FROM Stu WHERE sfzh=? AND mm=?";
			parameters = new Object[] { uid, pwd };
			Stu stu = (Stu) userLoginServer.uniqueQuery(hql, parameters);
			if (stu != null) {
				Sysrole sysrole = (Sysrole) userLoginServer.getById(
						Sysrole.class, 1);
				ServletActionContext.getContext().getSession().put("stu", stu);
				// request.getSession().setAttribute("userName",stu.getXm());
				ServletActionContext.getContext().getSession()
						.put("userName", stu.getXm());
				getUserMenu(sysrole);
				return "loginsuccess";
			} else {
				mess = "用户名或密码错误！";
				return "loginfail";
			}
		}
		// manage login
		else {
			hql = "FROM Sysuser WHERE userId=? AND userPwd =?";
			parameters = new Object[] { uid, pwd };
			Sysuser sysuser = (Sysuser) userLoginServer.uniqueQuery(hql,
					parameters);
			if (sysuser != null) {
				// get role
				hql = "SELECT R FROM Sysrole R,Userrole UR Where UR.sysuser.uid=? AND R.rid = UR.sysrole.rid";
				parameters = new Object[] { sysuser.getUid() };
				Sysrole sysrole = (Sysrole) userLoginServer.uniqueQuery(hql,
						parameters);
				ServletActionContext.getContext().getSession()
						.put("sysuser", sysuser);
				ServletActionContext.getContext().getSession()
						.put("userName", sysuser.getUserName());
				// request.getSession().setAttribute("userName",
				// sysuser.getUserName());
				getUserMenu(sysrole);
			} else {
				mess = "用户名或密码错误！";
				return "loginfail";
			}
		}
		ServletActionContext.getContext().getSession().put("ltype", ltype);
		return "loginsuccess";
		}
	}

	public void getUserMenu(Sysrole sysrole) {
		if (sysrole != null) {
			ServletActionContext.getContext().getSession()
					.put("sysrole", sysrole);
			// get menu
			hql = "SELECT M  FROM Sysmenu M,Rolemenu R WHERE M.mid = R.sysmenu.mid AND R.sysrole.rid = ? AND M.parent=0 AND M.locked = false ORDER BY NUM";
			parameters = new Object[] { sysrole.getRid() };
			sysmenus1 = userLoginServer.executeQuery(hql, parameters);

			hql = "SELECT M  FROM Sysmenu M,Rolemenu R WHERE M.mid = R.sysmenu.mid AND R.sysrole.rid = ? AND M.parent <> 0  AND M.locked = false  ORDER BY NUM  ";
			parameters = new Object[] { sysrole.getRid() };
			sysmenus2 = userLoginServer.executeQuery(hql, parameters);
			ServletActionContext.getContext().getSession()
					.put("sysmenus1", sysmenus1);
			ServletActionContext.getContext().getSession()
					.put("sysmenus2", sysmenus2);
		}
	}

	public String showMenu() {
		hql = "FROM Sysmenu  WHERE parent=0 AND  locked=false";
		sysmenus1 = userLoginServer.executeQuery(hql, null);

		hql = "FROM Sysmenu  WHERE parent<>0 AND  locked=false";
		sysmenus2 = userLoginServer.executeQuery(hql, null);

		return SUCCESS;
	}
}
