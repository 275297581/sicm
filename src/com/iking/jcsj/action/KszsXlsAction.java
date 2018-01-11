package com.iking.jcsj.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.iking.basic.BasicAction;
import com.iking.inter.KszsXlsInter;

@SuppressWarnings({ "unused", "serial" })
public class KszsXlsAction extends BasicAction {
	@Resource
	private KszsXlsInter kszsXlsServer;
	private File kszsinfo;
	private String kszsinfoContentType; //file type
 

	public void setKszsXlsServer(KszsXlsInter kszsXlsServer) {
		this.kszsXlsServer = kszsXlsServer;
	}

	public void setKszsinfo(File kszsinfo) {
		this.kszsinfo = kszsinfo;
	}

	public void setKszsinfoContentType(String kszsinfoContentType) {
		this.kszsinfoContentType = kszsinfoContentType;
	}

	private String message;

	public String getMessage() {
		return message;
	}
	
	public String filename;

	public String getFilename() {
		return filename;
	}

	public String uploadKszsInfo() {
		/*if(!kszsinfoContentType.equals("application/vnd.ms-excel")){
			message = "操作失败！\n上传文件格式错误！";
			return ERROR;
		} */
		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/excel")
				+ "/temp";
		if (kszsinfo != null) {
			File savefile = new File(new File(realpath), "StudentCertificate.xls");
			if (savefile.exists())
				savefile.delete();
			try {
				FileUtils.copyFile(kszsinfo, savefile);
				message = kszsXlsServer.importExcel(realpath+"/StudentCertificate.xls");
				savefile.delete();
				return SUCCESS;
			} catch (IOException e) {
				message = "操作失败！\n"+message; 
				e.printStackTrace();
			}
		}
		return ERROR;
	}
	public String uploadXwZsinfo(){
		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/excel")
				+ "/temp";
		if (kszsinfo != null) {
			File savefile = new File(new File(realpath), "StudentCertificate.xls");
			if (savefile.exists())
				savefile.delete();
			try {
				FileUtils.copyFile(kszsinfo, savefile);
				message = kszsXlsServer.importExcelXW(realpath+"/StudentCertificate.xls");
				savefile.delete();
				return SUCCESS;
			} catch (IOException e) {
				message = "操作失败！\n"+message; 
				e.printStackTrace();
			}
		}
		return ERROR;
	}
	public String  downKszsXls() throws Exception {   
		filename = "StudentCertificate.xls";
		return SUCCESS;
	}   
	
	public InputStream getInputStream() throws Exception { 
		String filepath = ServletActionContext.getServletContext().getRealPath(
				"/excel/StudentCertificate.xls");
        return new FileInputStream(filepath);
    }
}
