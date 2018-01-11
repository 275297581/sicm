package com.iking.jltj.server;

import org.hibernate.Session;

import com.iking.basic.BasicServer;
import com.iking.beans.Stu;
import com.iking.beans.Zyzs;
import com.iking.inter.StuJlInter;

public class StuJlServer extends BasicServer implements StuJlInter {

	@Override
	public void deleteZs(String zsids) {
		Session session = this.sessionFactory.getCurrentSession();
		String [] xsids =zsids.split(",");
		for(String id : xsids){
			Zyzs zyzs = (Zyzs) session.get(Zyzs.class, Integer.parseInt(id));
			if(zyzs!=null)
				 session.delete(zyzs);
		}
		
	}

}
