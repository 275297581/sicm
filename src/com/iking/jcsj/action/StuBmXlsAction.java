package com.iking.jcsj.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.iking.basic.BasicAction;
import com.iking.inter.StuBmXlsInter;

@SuppressWarnings({"serial" })
public class StuBmXlsAction extends BasicAction{
	@Resource
	private StuBmXlsInter stuBmXlsServer;
	public void setStuBmXlsServer(StuBmXlsInter stuBmXlsServer) {
		this.stuBmXlsServer = stuBmXlsServer;
	}
	private String filename;
	public String getFilename() {
		return filename;
	}

	private String stubmContentType;
	public void setStubmContentType(String stubmContentType) {
		this.stubmContentType = stubmContentType;
	}
	public void setStubm(File stubm) {
		this.stubm = stubm;
	}
	private File stubm;
	
	public String downStuBmXls(){
		filename="StudentRegistration.xls";
		return SUCCESS;
	}
	private String message;

	public String getMessage() {
		return message;
	}  
	public InputStream getInputStream() throws Exception { 
		String filepath = ServletActionContext.getServletContext().getRealPath(
				"/excel/StudentRegistration.xls");
        return new FileInputStream(filepath);
    } 
	public String uploadStuBm() {
		if(!stubmContentType.equals("application/vnd.ms-excel")){
			message = "操作失败！\n上传文件格式错误！";
			return ERROR;
		}
		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/excel")+ "/temp";
		if (stubm != null) {
			File savefile = new File(new File(realpath), "StudentRegistration.xls");
			if (savefile.exists())
				savefile.delete();
			try {
				FileUtils.copyFile(stubm, savefile);
				message = stuBmXlsServer.importExcel(realpath+"/StudentRegistration.xls");
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
