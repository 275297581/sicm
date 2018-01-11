package com.iking.jcsj.server;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.iking.basic.BasicServer;
import com.iking.beans.Collage;
import com.iking.beans.Stuclass;
import com.iking.beans.Zyxx;
import com.iking.inter.XyZyXlsInter;
import com.iking.tools.Tool;

public class XyZyXlsServer extends BasicServer implements XyZyXlsInter{
private ArrayList<List<String>> lists = null;
	
	private String Mess;
	@Override
	public String importExcel(String xlsPath) {
		Mess ="";
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
		if(lists !=null && lists.get(0).size()!=4){
			Mess = "获取Excel模板格式错误！";
			return;
		}
		int id = 0;  
		lists.remove(0);
		int i=2;
		int okcount=0;
		int failcount=0;
		Session  session = this.sessionFactory.getCurrentSession();
		for(List<String> list : lists){
	 		 try{
	 			 if(list.get(0).equals("")){
	 				 Mess +="第"+i+"行数据未能导入！学院名称为空！\n";
	 				i++;
	 				failcount++;
	 				 continue;
	 			 }
	 			 if(list.get(1).equals("")){
	 				 Mess +="第"+i+"行数据未能导入！专业名称为空！\n";
	 				i++;
	 				failcount++;
	 				 continue;
	 			 }
	 			 if(list.get(3).equals("")){
	 				 Mess +="第"+i+"行数据未能导入！班级名称为空！\n";
	 				i++;
	 				failcount++;
	 				 continue;
	 			 }
				  
				 //学院信息
				 Collage collage = new Collage(); 
				 if(Tool.XY.containsKey(list.get(0))){
					 collage.setXyid(Tool.XY.get(list.get(0)));
				 }else{
					 collage.setXymc(list.get(0));
					 id = Integer.parseInt(session.save(collage).toString());
					 collage.setXyid(id);
					 Tool.XY.put(collage.getXymc(),id);
				 }
				 
				//专业信息
				 Zyxx zyxx = new Zyxx(); 
				 if(!Tool.ZY.containsKey(list.get(1))){
					 zyxx.setZymc(list.get(1));
					 zyxx.setZybh(list.get(2));
					 zyxx.setCollage(collage);
					 id = Integer.parseInt(session.save(zyxx).toString());
					 Tool.ZY.put(zyxx.getZymc(), id); 
				 }else{
					 zyxx.setZyid(Tool.ZY.get(list.get(1)));
				 }
				  
				 Stuclass stuclass = new Stuclass();
				 if(!Tool.BJ.containsKey(list.get(3))){
					 stuclass.setBjmc(list.get(3));
					 stuclass.setZyxx(zyxx);
					 id = Integer.parseInt(session.save(stuclass).toString());
					 Tool.BJ.put(stuclass.getBjmc(), id); 					
					 okcount++; 
				 }
				 else{failcount++;	Mess +="第"+i+"行数据是重复数据！ \n";}
			
	 		 }catch (Exception e) {
	 			Mess +="第"+i+"行数据导入失败！ \n";
	 			failcount++;
			}
	 		 i++;	 		
		} 
		 Mess +="总共"+lists.size()+"条数据!"+okcount+"条数据导入成功！"+failcount+"条数据导入失败！ \n";
	}
}
