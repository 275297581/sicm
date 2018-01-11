package com.iking.jcsj.server;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.transaction.annotation.Transactional;

import com.iking.basic.BasicServer;
import com.iking.beans.Zyzs;
import com.iking.inter.ZyzsXlsInter;
import com.iking.tools.Tool;
@Transactional
public class ZyzsXlsServer extends BasicServer implements ZyzsXlsInter{

	private ArrayList<List<String>> lists = null;
	private String Mess="";
	@Override
	public String importExcel(String xlsPath) {
		Mess="";
		lists = Tool.ReadXls(xlsPath);
		setListToBeans(); 
		return "操作完成！\n"+Mess; 
	}

	private void setListToBeans(){
		if (lists ==null){
			Mess = "上传文件存在问题！";
			return;
		}
		if(lists.size()<2){
			Mess = "获取Excel数据为空！";
			return;
		}
		if(lists !=null &&  lists.get(0).size()!=9){
			Mess = "获取Excel模板格式错误！";
			return;
		}
		lists.remove(0);
		Session  session = this.sessionFactory.getCurrentSession();
		int i=2;
		int okcount=0;
		int failcount=0;
		for(List<String> list : lists){
			try{
				
				 if(list.get(3).equals("")){
	 			 	Mess +="第"+i+"行数据未能导入！证书名为空！\n";
	 				i++;
	 				failcount++;
	 				continue;
	 			 }
				 if(!list.get(1).equals("")){
					 	if(!Tool.XY.containsKey(list.get(1)))
					 	{
					 		Mess +="第"+i+"行数据未能导入！学院名称不存在！\n";
			 				i++;
			 				failcount++;
			 				continue;
					 	}
		 			 }
				 if(!Tool.ZS.containsKey(list.get(2)+list.get(3)+list.get(5))){
					 Zyzs zyzs = new Zyzs(); 
					 zyzs.setXymc(list.get(1));
					 zyzs.setZymc(list.get(2));
					 zyzs.setZsmc(list.get(3)); 
					 zyzs.setFzjg(list.get(4));
					 zyzs.setZsdj(list.get(5));
					 zyzs.setZsfl(list.get(6));
					 zyzs.setXf(list.get(7));
					 zyzs.setJlbz(list.get(8));
					 int id = Integer.parseInt(session.save(zyzs).toString());
					 Tool.ZS.put(list.get(2)+list.get(3)+list.get(5),id);
					 Tool.ZS1.put(list.get(3)+list.get(5),id);
					 Tool.ZSFL.put(list.get(3)+list.get(5),list.get(6));
					 Tool.ZSJE.put( zyzs.getZsid(), zyzs.getJlbz());
					 Tool.ZSXF.put( zyzs.getZsid(), zyzs.getXf());
					 okcount++; 
				 } 
				 else{failcount++;Mess +="第"+i+"行数据是重复数据！ \n";}
			}catch (Exception e) {
				e.printStackTrace();
				Mess +="第"+i+"行数据导入失败！ \n";
				failcount++;
			}
			i++;
		} 
		 Mess +="总共"+lists.size()+"条数据!"+okcount+"条数据导入成功！"+failcount+"条数据导入失败！ \n";
	}
	
}
