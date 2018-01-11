package com.iking.sys.server;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.iking.basic.BasicServer;
import com.iking.beans.Sysuser;
import com.iking.inter.UserInter;

public class UserServer extends BasicServer implements UserInter {
 

	@Override
	public void deleteUser(String ids) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		String [] uids =ids.split(",");
		for(String id : uids){
			Sysuser sysuser = (Sysuser)session.get(Sysuser.class, Integer.parseInt(id));
			if(sysuser!=null)
				 session.delete(sysuser);
		}	
	}

	 
}
