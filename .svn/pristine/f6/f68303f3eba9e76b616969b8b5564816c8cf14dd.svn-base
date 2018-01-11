package com.iking.sys.server;

import org.hibernate.Session;

import com.iking.basic.BasicServer;
import com.iking.beans.Stuclass;
import com.iking.beans.Sysrole;
import com.iking.inter.XyBjInter;
import com.iking.tools.Tool;

public class XyBjServer extends BasicServer implements XyBjInter {
	@Override
	public void deleteClasses(String bjids) throws Exception { 
		Session session = this.sessionFactory.getCurrentSession();
		String [] ids =bjids.split(",");
		for(String id : ids){
			Stuclass stuclass = (Stuclass)session.get(Stuclass.class, Integer.parseInt(id));
			if(stuclass!=null)
				 session.delete(stuclass);
				 Tool.BJ.remove(stuclass.getBjmc());
		}
	}
}
