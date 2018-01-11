package com.iking.jcsj.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.iking.basic.BasicAction;
import com.iking.inter.ZyzsXlsInter;

@SuppressWarnings({ "unused", "serial" })
public class ZyzsXlsAction extends BasicAction{

	@Resource
	private ZyzsXlsInter zyzsXlsServer;
	
	public void setZyzsXlsServer(ZyzsXlsInter zyzsXlsServer) {
		this.zyzsXlsServer = zyzsXlsServer;
	}

	private File zyzsinfo;
	private String zyzsinfoFileName; 
	private String message="";
	private String zyzsinfoContentType;
	
	public void setZyzsinfoContentType(String zyzsinfoContentType) {
		this.zyzsinfoContentType = zyzsinfoContentType;
	}

	public void setZyzsinfo(File zyzsinfo) {
		this.zyzsinfo = zyzsinfo;
	}

	public void setZyzsinfoFileName(String zyzsinfoFileName) {
		this.zyzsinfoFileName = zyzsinfoFileName;
	} 
	public String getMessage() {
		return message;
	}

	public String filename;

	public String getFilename() {
		return filename;
	}
	
	public String uploadZyzsInfo() {
		/*if(!zyzsinfoContentType.equals("application/vnd.ms-excel")){
			message = "操作失败！\n上传文件格式错误！";
			return ERROR;
		} */
		
		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/excel")
				+ "/temp";
		if (zyzsinfo != null) {
			File savefile = new File(new File(realpath), zyzsinfoFileName);
			if (savefile.exists())
				savefile.delete();
			try {
				FileUtils.copyFile(zyzsinfo, savefile);
				message = zyzsXlsServer.importExcel(realpath+"/"+zyzsinfoFileName);
				savefile.delete();
				return SUCCESS;
			} catch (IOException e) {
				message = "操作失败！\n"+ message;
				e.printStackTrace();
			}
		}
		return ERROR;
	}
	
	
	public String  downZyzsXls() throws Exception {   
		filename = "certificationTypes.xls";
		return SUCCESS;
	}   
	
	public InputStream getInputStream() throws Exception { 
		String filepath = ServletActionContext.getServletContext().getRealPath(
				"/excel/certificationTypes.xls");
        return new FileInputStream(filepath);
    }
}
