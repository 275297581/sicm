package com.iking.jcsj.server;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;

import com.iking.basic.BasicServer;
import com.iking.beans.Bmxx;
import com.iking.beans.Scor;
import com.iking.beans.Stu;
import com.iking.inter.StuScoreXlsInter;
import com.iking.tools.Tool;

public class StuScoreXlsServer extends BasicServer implements StuScoreXlsInter{

	private String Mess;
	private ArrayList<List<String>> lists = null;
	private Session session=null;
	private int id = 0;
	@Override
	public String importExcel(String xlsPath) {
		Mess ="";
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
		if(lists.get(0).size()!=19){
			Mess = "获取Excel模板格式错误！";
			return;
		}
		lists.remove(0);
		int i = 2; 
		int okcount=0;
		int failcount=0;
		for (List<String> list : lists) {
			try {
				if (list.get(1).equals("")) {
					Mess += "第" + i + "行数据未能导入！   准考证号为空！\n";
					i++;
					failcount++;
					continue;
				}
				String SFZ = "";
				if (list.get(2).equals("")) {
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
					SFZ = list.get(2);
				}
				
				if (list.get(3).equals("")) {
					Mess += "第" + i + "行数据未能导入！   学生姓名为空！\n";
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
				if (list.get(4).equals("")) {
					Mess += "第" + i + "行数据未能导入！   鉴定职业为空！\n";
					i++;
					failcount++;
					continue;
				} 
				if (!Tool.BM.containsKey(list.get(2)+list.get(4)+list.get(5))) {
					Mess += "第" + i + "行数据导入失败！   没有该成绩的报名信息！\n";
					i++;
					failcount++;
					continue;
				}
				Bmxx bmxx = (Bmxx) session.get(Bmxx.class, Tool.BM.get(SFZ+list.get(4)+list.get(5))); 
				
				Scor scor = new Scor();
				scor.setBmxx(bmxx);
				scor.setZkzh(list.get(1));
				scor.setLlcj(list.get(7));
				scor.setLlksqk(list.get(8));
				scor.setSccj(list.get(9));
				scor.setScksqk(list.get(10));
				scor.setWycj(list.get(11));
				scor.setWyksqk(list.get(12));
				scor.setZhcj(list.get(13));
				scor.setZhksqk(list.get(14));
				scor.setPdcj(list.get(15));
				scor.setBmsj(list.get(16));
				scor.setTimer(Tool.FData(new Date())); 
				// if bmxx exists ,do merge
				if (Tool.CJ.containsKey(scor.getZkzh())) {
					scor.setCjid(Tool.CJ.get(scor.getZkzh()));
					session.merge(scor);
				} else { // else do add
					id = Integer.parseInt(session.save(scor).toString());
					Tool.CJ.put(scor.getZkzh(), id);
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