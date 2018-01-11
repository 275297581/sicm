package com.iking.jcsj.server;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.transaction.annotation.Transactional;

import com.iking.basic.BasicServer;
import com.iking.beans.Kszs;
import com.iking.beans.Stu;
import com.iking.inter.BankXlsInter;
import com.iking.tools.Tool;
import com.opensymphony.xwork2.ActionContext;
@Transactional
public class BankXlsServer extends BasicServer implements BankXlsInter {
	private ArrayList<List<String>> lists = null;
	private String Mess; 
	@Override
	public String importExcel(String filePath) {
		Mess = "";
		lists = Tool.ReadXls(filePath);
		setListToBeans();
		return "操作完成！\n" + Mess;  
	}
	
	private void setListToBeans() {
		if (lists ==null){	
			Mess = "上传文件存在问题！";
			return;
		}
		if (lists.size() < 2) {
			Mess = "获取Excel数据为空！";
			return;
		}
		if (lists != null && lists.get(0).size() != 5) {
			Mess = "获取Excel模板格式错误！";
			return;
		}
		int id = 0;
		lists.remove(0);
		int i = 2;
		Session session = this.sessionFactory.getCurrentSession();
		HttpServletRequest request = (HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		String uname =(String)request.getSession().getAttribute("userName");
		String SFZ;
		Query query=null;
		int okcount=0;
		int failcount=0;
		for (List<String> list : lists) {
			try {
				SFZ = "";
				if (list.get(1).equals("")) {
					if (!list.get(0).equals("")) {
						if (Tool.XHSF.containsKey(list.get(0)))
							SFZ = Tool.XHSF.get(list.get(0));
						else {
							Mess += "第" + i + "行数据导入未导入！未能找到学号对应的学生！\n";
							i++;
							failcount++;
							continue;
						}
					} else {
						Mess += "第" + i + "行数据导入未导入！学号或者身份证号至少一个不能为空！\n";
						i++;
						failcount++;
						continue;
					}
				} else {
					SFZ = list.get(1);
				}
				
				if (list.get(2).equals("")) {
					Mess += "第" + i + "行数据未能导入！姓名为空！\n";
					i++;
					failcount++;
					continue;
				}
				if (!list.get(2).equals(Tool.SFXM.get(SFZ))) {
					Mess += "第" + i + "行数据导入未导入！学号或身份证号与姓名不匹配！\n";
					i++;
					failcount++;
					continue;
				} 
				if (list.get(3).equals("")) {
					Mess += "第" + i + "行数据未能导入！开户行为空！\n";
					i++;
					failcount++;
					continue;
				}
				if (list.get(4).equals("")) {
					Mess += "第" + i + "行数据未能导入！银行账号为空！\n";
					i++;
					failcount++;
					continue;
				}
				Stu stu = (Stu) session.load(Stu.class, Tool.XS.get(SFZ));
				if(stu.getYhzh()!=null){
					Mess += "第" + i + "行数据导入时 ，覆盖原来银行账号（"+stu.getYhzh()+"）！ \n";
				}else{
					stu.setYhzh("");
				} 
				if(stu.getYhzh().equals(list.get(4))){
					i++;
					okcount++;
					continue;
				} 
				stu.setKhh(list.get(3));
				stu.setYhzh(list.get(4));
				session.merge(stu);
				
				
				query = session.createQuery("FROM Kszs WHERE xsid = "+Tool.XS.get(SFZ));
				List<Kszs> kszss =  query.list();
				String rem;
				for (Kszs kszs : kszss) {
					if(kszs.getRemark()!=null){
						rem = kszs.getRemark();
						rem +="用户："+uname+"  时间："+Tool.FData(new Date())+"  操作：修改原银行账号"+kszs.getYhzh()+";";
						kszs.setRemark(rem);
					} 
					kszs.setKhh(list.get(3));
					kszs.setYhzh(list.get(4));
					session.merge(kszs);
				}
				okcount++;
			} catch (Exception e) {
				Mess += "第" + i + "行数据导入失败！ \n";
				failcount++;
			}
			i++;
		}
		 Mess +="总共"+lists.size()+"条数据!"+okcount+"条数据导入成功！"+failcount+"条数据导入失败！ \n";
	} 
}
