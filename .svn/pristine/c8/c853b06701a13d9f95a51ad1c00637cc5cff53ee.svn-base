package com.iking.ggtz.server;

import org.hibernate.Session;

import com.iking.basic.BasicServer;
import com.iking.beans.Notice;
import com.iking.inter.NoticeInter;

public class NoticeServer extends BasicServer implements NoticeInter {

	@Override
	public void deleteGG(String ids) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		String [] Gids =ids.split(",");
		for(String id : Gids){
			Notice notice = (Notice)session.get(Notice.class, Integer.parseInt(id));
			if(notice!=null)
				 session.delete(notice);
		}
	}

}
