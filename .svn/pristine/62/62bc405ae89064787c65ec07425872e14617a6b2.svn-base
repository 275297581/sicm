package com.iking.jcsj.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.iking.basic.BasicAction;
import com.iking.inter.XyZyXlsInter;

@SuppressWarnings({ "unused", "serial" })
public class XyZyXlsAction extends BasicAction{
	@Resource
	private XyZyXlsInter xyZyXlsServer;
	public void setXyZyXlsServer(XyZyXlsInter xyZyXlsServer) {
		this.xyZyXlsServer = xyZyXlsServer;
	}
	
	private File xyzyinfo; 
	private String message;
	private String xyzyinfoContentType;
	public String filename;
	public String getMessage() {
		return message;
	}
	public String getFilename() {
		return filename;
	}
	public void setXyzyinfo(File xyzyinfo) {
		this.xyzyinfo = xyzyinfo;
	}
	public void setXyzyinfoContentType(String xyzyinfoContentType) {
		this.xyzyinfoContentType = xyzyinfoContentType;
	}
	 
	public String downXyZyXls() throws Exception{
		filename = "InstituteOfProfessional.xls";
		return SUCCESS;
	}
	public InputStream getInputStream() throws Exception { 
		String filepath = ServletActionContext.getServletContext().getRealPath(
				"/excel/InstituteOfProfessional.xls");
        return new FileInputStream(filepath);
    }
	
	public String uploadZyZy(){
		/*if(!xyzyinfoContentType.equals("application/vnd.ms-excel")){
		message = "操作失败！\n上传文件格式错误！";
		return ERROR;
	} */
	String realpath = ServletActionContext.getServletContext().getRealPath(
			"/excel")
			+ "/temp";
	if (xyzyinfo != null) {
		File savefile = new File(new File(realpath), "InstituteOfProfessional.xls");
		if (savefile.exists())
			savefile.delete();
		try {
			FileUtils.copyFile(xyzyinfo, savefile);
			message = xyZyXlsServer.importExcel(realpath+"/InstituteOfProfessional.xls");
			savefile.delete();
			return SUCCESS;
		} catch (IOException e) {
			message = "操作失败！\n"+message; 
			e.printStackTrace();
		}
	}
	return ERROR;
	}
	
}
