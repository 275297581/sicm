package com.iking.jcsj.server;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.springframework.transaction.annotation.Transactional;

import com.iking.basic.BasicServer;
import com.iking.beans.Stu;
import com.iking.beans.Zyxx;
import com.iking.inter.StuXlsInter;
import com.iking.tools.Tool;

@Transactional
public class StuXlsServer extends BasicServer implements StuXlsInter {
	private ArrayList<List<String>> lists = null;
	private String Mess;
	@Override
	public String importExcel(String xlsPath) {
		Mess = "";
		lists = Tool.ReadXls(xlsPath);
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
		if (lists != null && lists.get(0).size() != 36) {
			Mess = "获取Excel模板格式错误！";
			return;
		}
		int id = 0;
		lists.remove(0);
		int i = 2;
		int okcount=0;
		int failcount=0;
		Session session = this.sessionFactory.getCurrentSession();
		for (List<String> list : lists) {
			try {
				if (list.get(0).equals("")) {
					Mess += "第" + i + "行数据未能导入！学号为空！\n";
					i++;
					failcount++;
					continue;
				}
				if (list.get(1).equals("")) {
					Mess += "第" + i + "行数据未能导入！身份证号为空！\n";
					i++;
					failcount++;
					continue;
				}
				if (list.get(2).equals("")) {
					Mess += "第" + i + "行数据未能导入！姓名为空！\n";
					i++;
					failcount++;
					continue;
				}
				if (list.get(7).equals("")) {
					Mess += "第" + i + "行数据未能导入！专业为空！\n";
					i++;
					failcount++;
					continue;
				}
				if (!Tool.ZY.containsKey(list.get(7))) {
					Mess += "第" + i + "行数据未能导入！学校不存在该专业！\n";
					i++;
					failcount++;
					continue;
				}
				if (!Tool.XS.containsKey(list.get(1))) {
					Stu stu = new Stu();
					stu.setXh(list.get(0));
					stu.setSfzh(list.get(1));
					stu.setMm(list.get(1));
					stu.setXm(list.get(2));
					stu.setXb(list.get(3));
					stu.setCsny(list.get(4));
					stu.setMz(list.get(5));

					Zyxx zyxx = new Zyxx();
					zyxx.setZyid(Tool.ZY.get(list.get(7)));
					stu.setZyxx(zyxx);
					stu.setBjmc(list.get(8));
					stu.setXz(list.get(9));
					stu.setXjzt(list.get(10));
					stu.setNj(list.get(11));
					stu.setRxrq(list.get(12));
					stu.setXslb(list.get(13));
					stu.setByxx(list.get(14));
					stu.setRxfs(list.get(15));
					stu.setBxxs(list.get(16));
					stu.setPycc(list.get(17));
					stu.setSyszd(list.get(18));
					stu.setJg(list.get(19));
					stu.setCsd(list.get(20));
					stu.setJtdz(list.get(21));
					stu.setYzbm(list.get(22));
					stu.setLxdh(list.get(23));
					stu.setYwxw(list.get(24));
					stu.setZzmm(list.get(25));
					stu.setJrsj(list.get(26));
					stu.setJkzk(list.get(27));
					stu.setTc(list.get(28));
					stu.setHkzt(list.get(29));
					stu.setJszh(list.get(30));
					stu.setYlzh(list.get(31));
					stu.setSsh(list.get(32));
					stu.setXxnx(list.get(33));
					stu.setRxzf(list.get(34));
					stu.setBz(list.get(35));
					stu.setTimer(Tool.FData(new Date()));
					id = Integer.parseInt(session.save(stu).toString());
					Tool.XS.put(stu.getSfzh(), id);
					Tool.XHSF.put(stu.getXh(), stu.getSfzh()); 
					Tool.SFZZY.put(stu.getSfzh(), list.get(7));
					Tool.SFXM.put(stu.getSfzh(), list.get(2));
					okcount++; 
				}				 
				 else{
					 	Stu stu = (Stu) session.get(Stu.class, Tool.XS.get(list.get(1))); 
					 	stu.setXh(list.get(0));
						stu.setSfzh(list.get(1));
						stu.setMm(list.get(1));
						stu.setXm(list.get(2));
						stu.setXb(list.get(3));
						stu.setCsny(list.get(4));
						stu.setMz(list.get(5));

						Zyxx zyxx = new Zyxx();
						zyxx.setZyid(Tool.ZY.get(list.get(7)));
						stu.setZyxx(zyxx);
						stu.setBjmc(list.get(8));
						stu.setXz(list.get(9));
						stu.setXjzt(list.get(10));
						stu.setNj(list.get(11));
						stu.setRxrq(list.get(12));
						stu.setXslb(list.get(13));
						stu.setByxx(list.get(14));
						stu.setRxfs(list.get(15));
						stu.setBxxs(list.get(16));
						stu.setPycc(list.get(17));
						stu.setSyszd(list.get(18));
						stu.setJg(list.get(19));
						stu.setCsd(list.get(20));
						stu.setJtdz(list.get(21));
						stu.setYzbm(list.get(22));
						stu.setLxdh(list.get(23));
						stu.setYwxw(list.get(24));
						stu.setZzmm(list.get(25));
						stu.setJrsj(list.get(26));
						stu.setJkzk(list.get(27));
						stu.setTc(list.get(28));
						stu.setHkzt(list.get(29));
						stu.setJszh(list.get(30));
						stu.setYlzh(list.get(31));
						stu.setSsh(list.get(32));
						stu.setXxnx(list.get(33));
						stu.setRxzf(list.get(34));
						stu.setBz(list.get(35));
						stu.setTimer(Tool.FData(new Date()));
						id = Integer.parseInt(session.save(stu).toString());
						Tool.XS.put(stu.getSfzh(), id);
						Tool.XHSF.put(stu.getXh(), stu.getSfzh()); 
						Tool.SFZZY.put(stu.getSfzh(), list.get(7));
						Tool.SFXM.put(stu.getSfzh(), list.get(2));
						okcount++; 
					 //failcount++;Mess +="第"+i+"行数据是重复数据！ \n";
					 }
			} catch (Exception e) {
				Mess += "第" + i + "行数据导入失败！ \n";
				failcount++;
			}
			i++;
		}
		 Mess +="总共"+lists.size()+"条数据!"+okcount+"条数据导入成功！"+failcount+"条数据导入失败！ \n";
	}
}
