package com.iking.jcsj.server;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;

import com.iking.basic.BasicServer;
import com.iking.beans.Bmxx;
import com.iking.beans.Kdxx;
import com.iking.beans.Stu;
import com.iking.beans.Zyzs;
import com.iking.inter.StuBmXlsInter;
import com.iking.tools.Tool;

public class StuBmXlsServer extends BasicServer implements StuBmXlsInter {

	private String Mess;
	private ArrayList<List<String>> lists = null;
	private Session session = null;
	private int id = 0;

	@Override
	public String importExcel(String xlsPath) {
		Mess = "";
		lists = Tool.ReadXls(xlsPath);
		session = this.sessionFactory.getCurrentSession();
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
		if (lists.get(0).size() != 43) {
			Mess = "获取Excel模板格式错误！";
			return;
		}
		lists.remove(0);
		int i = 2;
		String SFZ;
		int okcount=0;
		int failcount=0;
		for (List<String> list : lists) {
			try {
				
				SFZ = "";
				if (list.get(2).equals("")) {
					if (!list.get(1).equals("")) {
						if (Tool.XHSF.containsKey(list.get(1)))
							SFZ = Tool.XHSF.get(list.get(1));
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
					SFZ = list.get(2);
				}
				
				
				if (!Tool.XS.containsKey(SFZ)) {
					Mess += "第" + i + "行数据导入未导入！未能找到该学生！\n";
					i++;
					failcount++;
					continue;
				}
				if (list.get(3).equals("")) {
					Mess += "第" + i + "行数据导入未导入！学生姓名为空！\n";
					i++;
					failcount++;
					continue;
				}
				if (!list.get(3).equals(Tool.SFXM.get(SFZ))) {
					Mess += "第" + i + "行数据导入未导入！学号或身份证号与姓名不匹配！\n";
					i++;
					failcount++;
					continue;
				} 
				if (list.get(10).equals("")) {
					Mess += "第" + i + "行数据导入未导入！鉴定职业为空！\n";
					i++;
					failcount++;
					continue;
				}
				//10鉴定职业12专业13级别
				Zyzs zyzs = new Zyzs();
				if (Tool.ZS.containsKey(Tool.SFZZY.get(SFZ)+list.get(10)+list.get(13))) {
					zyzs.setZsid(Tool.ZS.get(Tool.SFZZY.get(SFZ)+list.get(10)+list.get(13)));
				}else if(Tool.ZS1.containsKey(list.get(10)+list.get(13))){
					zyzs.setZsid(Tool.ZS1.get(list.get(10)+list.get(13)));
				}else{
					Mess += "第" + i + "行数据导入未导入！该鉴定职业不存在！\n";
					i++;
					failcount++;
					continue;
				} 
				Bmxx bmxx = new Bmxx();
				bmxx.setZyzs(zyzs); 
				Stu stu = (Stu) session.get(Stu.class, Tool.XS.get(SFZ)); 
				stu.setKhh(list.get(21));
				stu.setYhzh(list.get(22));
				bmxx.setStu(stu);
				
				bmxx.setBmsj(Tool.FData(new Date()));
				bmxx.setSfzh(list.get(2));
				bmxx.setWhcd(list.get(7));
				bmxx.setGzdw(list.get(8));
				bmxx.setZynx(list.get(9));
				bmxx.setJdkm(list.get(14));
				bmxx.setBmdd(list.get(15));
				bmxx.setLxdh(list.get(16));
				bmxx.setBkxx(list.get(17));
				bmxx.setZpcj(list.get(18));
				bmxx.setBmjg(list.get(19));
				bmxx.setBmjgbm(list.get(20));
				bmxx.setKhh(list.get(21));
				bmxx.setYhzh(list.get(22));
				 
				Kdxx kdxx = new Kdxx();
				 
				if(!"".equals(list.get(23))&& Tool.KD.containsKey(list.get(23))){
					kdxx.setJdkdid(Tool.KD.get(list.get(23)));
					bmxx.setKdxxByLlkd(kdxx);
				}
				bmxx.setLisj(list.get(24));
				bmxx.setLlkscc(list.get(25));
				bmxx.setLlkcmc(list.get(26));
				bmxx.setLlzwh(list.get(27));
				 
				kdxx = new Kdxx();
				if(!"".equals(list.get(28))&&  Tool.KD.containsKey(list.get(28))){
					kdxx.setJdkdid(Tool.KD.get(list.get(28)));
					bmxx.setKdxxBySckd(kdxx);
				}
				bmxx.setScsj(list.get(29));
				bmxx.setSckscc(list.get(30));
				bmxx.setSckcmc(list.get(31));
				bmxx.setSczwh(list.get(32));
				
				kdxx = new Kdxx();
				if(!"".equals(list.get(33)) && Tool.KD.containsKey(list.get(33))){
					kdxx.setJdkdid(Tool.KD.get(list.get(33)));
					bmxx.setKdxxByWykd(kdxx);
				}
				bmxx.setWysj(list.get(34));
				bmxx.setWykscc(list.get(35));
				bmxx.setWykcmc(list.get(36));
				bmxx.setWyzwh(list.get(37));
				
				kdxx = new Kdxx();
				if(!"".equals(list.get(38)) && Tool.KD.containsKey(list.get(38))){
					kdxx.setJdkdid(Tool.KD.get(list.get(38)));
					bmxx.setKdxxByZhkd(kdxx);
				}
				bmxx.setZhsj(list.get(39));
				bmxx.setZhkscc(list.get(40));
				bmxx.setZhkcmc(list.get(41));
				bmxx.setZhzwh(list.get(42));
				
				bmxx.setTimer(Tool.FData(new Date()));
				if (Tool.BM.containsKey(SFZ + list.get(10)+list.get(13))) {//身份证号和鉴定职业
					bmxx.setBmid(Tool.BM.get(SFZ + list.get(10)));
					bmxx.setBkxx("补考");
					session.merge(bmxx);
				} else { 
					id = Integer.parseInt(session.save(bmxx).toString());
					Tool.BM.put(SFZ + list.get(10)+list.get(13), id);
				}
				session.merge(stu);
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
