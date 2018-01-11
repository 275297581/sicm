package com.iking.ggtz.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.iking.basic.BasicAction;
import com.iking.beans.Notice;
import com.iking.beans.Sysuser;
import com.iking.inter.NoticeInter;
import com.iking.tools.Tool;

@SuppressWarnings({ "unchecked", "serial" })
public class NoticeAction extends BasicAction {

	@Resource
	private NoticeInter noticeServer;
	private List<Notice> notices;
	private String content;
	private String title;
	private String mess;
	private String bm;

	public String getBm() {
		return bm;
	}

	public void setBm(String bm) {
		this.bm = bm;
	}

	public String getMess() {
		return mess;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setNoticeServer(NoticeInter noticeServer) {
		this.noticeServer = noticeServer;
	}

	public List<Notice> getNotices() {
		return notices;
	}

	// 界面显示公告通知
	public String queryNotice() {
		this.hql = "FROM Notice WHERE power = 1 AND isp ='是' ORDER BY zd desc ,px DESC";
		notices = noticeServer.executeQueryByPage(hql, null, index, 5);
		if (index == 1) {
			this.hql = "SELECT COUNT(*) " + this.hql;
			count = noticeServer.queryPageCount(hql, null, 5);
		}
		return SUCCESS;
	}

	// 添加公告通知
	public String addGg() {
		this.hql = "from Notice where px=(select MAX(px) from Notice)";
		notice = (Notice) noticeServer.uniqueQuery(hql, null);
		Sysuser user = (Sysuser) request.getSession().getAttribute("sysuser");
		Notice notice1 = new Notice();
		notice1.setContent(content);
		notice1.setTitle(title);
		notice1.setRemark(Tool.FData(new Date()));
		notice1.setPuser(user.getUserName());
		notice1.setBm(bm);
		notice1.setIsp("否");
		notice1.setPower(power);
		notice1.setZd("0");
		if(notice!=null){
			notice1.setPx(notice.getPx() + 1);
		}else{
			notice1.setPx(1);
		} 
		try {
			noticeServer.add(notice1);
			this.mess = "信息添加成功！";
		} catch (Exception e) {
			this.mess = "信息添加失败！";
		}
		return SUCCESS;
	}

	private int nid;

	public void setNid(int nid) {
		this.nid = nid;
	}

	private Notice notice;

	public Notice getNotice() {
		return notice;
	}

	public String showDetilNotice() {
		notice = (Notice) noticeServer.getById(Notice.class, nid);
		return SUCCESS;
	}

	private int index;

	public void setIndex(int index) {
		this.index = index;
	}

	private int count;

	public int getCount() {
		return count;
	}

	public String showAllNotice() {

		this.hql = "FROM Notice  WHERE isp ='是' ORDER BY zd desc ,px DESC";
		notices = noticeServer.executeQueryByPage(hql, null, index, pageSize);

		if (index == 1) {
			this.hql = "SELECT COUNT(*) " + this.hql;
			count = Integer.parseInt(noticeServer.uniqueQuery(hql, null)
					.toString());
		}
		return SUCCESS;
	}

	public String pubshowAllNotice() {
		this.hql = "FROM Notice  WHERE  power = 1 AND  isp ='是' ORDER BY zd desc ,px DESC";
		notices = noticeServer.executeQueryByPage(hql, null, index, pageSize);

		if (index == 1) {
			this.hql = "SELECT COUNT(*) " + this.hql;
			count = Integer.parseInt(noticeServer.uniqueQuery(hql, null)
					.toString());
		}
		return SUCCESS;
	}

	private int power;

	public void setPower(int power) {
		this.power = power;
	}

	public String queryAllNotice() {
		if (power == 2) {
			this.hql = "FROM Notice  ORDER BY zd desc ,px DESC, ptime desc";
		} else {
			this.hql = "FROM Notice WHERE power=" + power
					+ "  ORDER BY zd desc ,px DESC, ptime desc";
		}
		this.notices = noticeServer.executeQueryByPage(hql, null, index,
				pageSize);
		if (index == 1) {
			this.hql = "SELECT COUNT(*) " + this.hql;
			count = Integer.parseInt(noticeServer.uniqueQuery(hql, null)
					.toString());
		}
		return SUCCESS;
	}

	// 删除功能
	public String deleteGg() {
		try {
			noticeServer.delById(Notice.class, nid);
			this.mess = "信息删除成功！";
		} catch (Exception e) {
			this.mess = "信息删除失败！重新进行删除";
		}
		return SUCCESS;
	}
	
	public String deleteGG() {
		try {
			noticeServer.deleteGG(ids);
			this.mess = "信息删除成功！";
		} catch (Exception e) {
			this.mess = "信息删除失败！重新进行删除";
		}
		return SUCCESS;
	}

	// 发布功能
	public String pubGg() {
		try {
			this.parameters = new Object[] { Tool.FData(new Date()), nid };
			this.hql = "update Notice set ptime=?,isp='是' where id=?";
			noticeServer.executeUpdate(hql, parameters);
			this.mess = "信息发布成功！";
		} catch (Exception e) {
			this.mess = "信息发布失败！重新进行发布";
		}
		return SUCCESS;
	}

	private int u;
	private int u1;
	private int p;
	private String ids;



	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public void setU(int u) {
		this.u = u;
	}

	public void setU1(int u1) {
		this.u1 = u1;
	}

	public void setP(int p) {
		this.p = p;
	}

	// 上移
	public String pubPxSy() {
		try {
			Notice notice1=new Notice();
			this.hql="FROM Notice WHERE zd='"+u+"' AND px>"+p+" order by px asc ";
			notice1 = (Notice) noticeServer.uniqueQueryObject(hql);
			if(notice1==null){
				this.mess = "不能超越置顶信息";
				return SUCCESS;
			}
			
			this.hql = "update Notice set px='" + notice1.getPx() + "' where id='" + u1 + "'";
			noticeServer.executeUpdate(hql, null);
			notice1.setPx(p);
			noticeServer.update(notice1);
			//this.mess = "上移成功！";
		} catch (Exception e) {
			//this.mess = "上移失败！";
		}
		return SUCCESS;
	}

	// 下移
	public String pubPxXy() {
		try {
			Notice notice1=new Notice();
			this.hql="FROM Notice WHERE zd='"+u+"' AND px<"+p+" order by px desc  ";
			notice1 = (Notice) noticeServer.uniqueQueryObject(hql);
			if(notice1==null){
				this.mess = "不能低于未置顶信息";
					return SUCCESS;
			}
			
			this.hql = "update Notice set px='" + notice1.getPx() + "' where id='" + u1 + "'";
			noticeServer.executeUpdate(hql, null);
			notice1.setPx(p);
			noticeServer.update(notice1);
			
//			this.hql = "update Notice set px='" + p + "' where id='" + u1 + "'";
//			noticeServer.executeUpdate(hql, null);
//			this.hql = "update Notice set px='" + p1 + "' where id='" + u + "'";
//			noticeServer.executeUpdate(hql, null);
//			this.mess = "下移成功！";
		} catch (Exception e) {
			//this.mess = "下移失败！";
		}
		return SUCCESS;
	}

	// 置顶功能
	public String pubZd() {
		try {
			this.parameters = new Object[] { "1", nid };
			this.hql = "update Notice set zd=? where id=?";
			noticeServer.executeUpdate(hql, parameters);
			this.mess = "置顶成功！";
		} catch (Exception e) {
			this.mess = "置顶失败！";
		}
		return SUCCESS;
	}

	// 置顶取消功能
	public String pubzdQx() {
		try {
			this.parameters = new Object[] { "0", nid };
			this.hql = "update Notice set zd=? where id=?";
			noticeServer.executeUpdate(hql, parameters);
			this.mess = "置顶取消成功！";
		} catch (Exception e) {
			this.mess = "置顶取消失败！";
		}
		return SUCCESS;
	}

	// 修改功能
	public String ModinfyPub() {
		try {
			Notice note = (Notice) noticeServer.getById(Notice.class, nid);
			note.setTitle(this.title);
			note.setContent(content);
			note.setBm(bm);
			note.setPower(power);
			noticeServer.update(note);
			this.mess = "修改成功！";
		} catch (Exception e) {
			this.mess = "修改失败！";
		}
		return SUCCESS;
	}

}
