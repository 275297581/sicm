package com.iking.ksxxcx.server;

import org.hibernate.Session;

import com.iking.basic.BasicServer;
import com.iking.beans.Stu;
import com.iking.beans.Sysuser;
import com.iking.inter.StuManageInter;
import com.iking.tools.Tool;

public class StuServer extends BasicServer implements StuManageInter{
	@Override
	public void deleteStu(String ids) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		String [] xsids =ids.split(",");
		for(String id : xsids){
			Stu stu = (Stu) session.get(Stu.class, Integer.parseInt(id));
			if(stu!=null)
				 session.delete(stu);
				Tool.XS.remove(stu.getSfzh());
		}	
	}
}
