package com.iking.sys.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;

import com.iking.basic.BasicAction;
import com.iking.beans.Dbback;
import com.iking.tools.Tool;

@SuppressWarnings("serial")
public class BackUpDbAction extends BasicAction{
	
	private int index;
	private int count;
	private String sname;
	private List<Dbback> dbbacks;
	private String mess;
	public int getCount() {
		return count;
	}

	public String getMess() {
		return mess;
	}

	public List<Dbback> getDbbacks() {
		return dbbacks;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}
	
	public String backupDB(){
		String filename = System.currentTimeMillis()+"";
		if(sname!=null && !sname.trim().equals("")){
			filename = sname.trim().replace(" ", "");
		} 
		try{ 
			String sqlpath =Tool.backup(filename+".sql");
			Thread.sleep(3000);
			if(sqlpath.equals("")){
				mess ="备份失败! 请重新尝试...";
				return SUCCESS; 
			}else{
				mess ="备份成功！";
			}
		}catch (Exception e) {
			e.printStackTrace();
			mess ="备份失败!";
		}
		return SUCCESS;
	}
	 
	public String queryDBBackup(){
		
		  List<Dbback> dbbacks1 = new ArrayList<Dbback>(); 
		  Properties pros = Tool.getPprVue();
		  String sqlpath = pros.getProperty("sqlpath").replace(" ","");
		  File file = new File(sqlpath);
		  if(file.exists()){
			 File [] files = file.listFiles();
			 Calendar cd = Calendar.getInstance();
			 for(File f : files){
				 if(f.getName().lastIndexOf(".sql")!=-1){
					 Dbback dbback = new Dbback();
					 dbback.setFilename(f.getName().replace(".sql", ""));
			         cd.setTimeInMillis(f.lastModified());
					 dbback.setBacktime(Tool.FData1(cd.getTime()));
					 dbback.setFilesize((f.length()/1024)+"KB");
					 dbbacks1.add(dbback);
				 }
			 }
			 count = dbbacks1.size();
			 int pagecount =0;
			 if(count%pageSize==0){
				 pagecount = count / pageSize;
			 }else{
				 pagecount = count / pageSize  +1;
			 }
			 
			 if(index ==1 ){
				 if(count <= pageSize)dbbacks = dbbacks1;
				 else dbbacks = dbbacks1.subList(0,20);
			 }else if(pagecount>index){
				 dbbacks = dbbacks1.subList((index-1)*pageSize ,index*pageSize);
			 }else if(pagecount == index){
				 dbbacks = dbbacks1.subList((index-1)*pageSize ,count);
			 }
		  }else{
			  count=0; 
		  }
		return SUCCESS;
	}
	
	public String returnDB(){
		Properties pros = Tool.getPprVue();
	    String sqlpath = pros.getProperty("sqlpath").replace(" ","");
		File file = new File(sqlpath+sname+".sql");
		if(!file.exists()){  
			mess="还原失败！备份内容已丢失！";
		}else{
			if(Tool.returndb(sqlpath+sname+".sql")){ 
				mess= "还原成功！";
			}else{
				mess= "还原失败，请重新尝试！";
			}
		} 
		return SUCCESS;
	}
	
	public String deleteDB(){
		try{
		  Properties pros = Tool.getPprVue();
		  String sqlpath = pros.getProperty("sqlpath").replace(" ","");
			File file = new File(sqlpath+sname+".sql");
			if(file.exists()){
				file.delete();
			} 
			mess="删除成功！";
		}catch (Exception e) {
			e.printStackTrace();
			mess= "删除失败，请重新尝试！";
		}
		return SUCCESS;
	}
	
}
