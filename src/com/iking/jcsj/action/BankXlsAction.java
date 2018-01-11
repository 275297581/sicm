package com.iking.jcsj.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.iking.basic.BasicAction;
import com.iking.inter.BankXlsInter;

public class BankXlsAction extends BasicAction{

	@Resource 
	public BankXlsInter bankXlsServer;
	
	public void setBankXlsServer(BankXlsInter bankXlsServer) {
		this.bankXlsServer = bankXlsServer;
	}
	
	private String filename;
	public String getFilename() {
		return filename;
	}
	public String downBankxls(){
		filename="BaknInfo.xls";
		return SUCCESS;
	}
	public InputStream getInputStream() throws Exception { 
		String filepath = ServletActionContext.getServletContext().getRealPath(
				"/excel/BaknInfo.xls");
        return new FileInputStream(filepath);
    }
	
	
	private File bankInfo;
	private String message;
	
	public void setBankInfo(File bankInfo) {
		this.bankInfo = bankInfo;
	}
	public String getMessage() {
		return message;
	}
	
	public String uploadBankInfo(){
		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/excel")
				+ "/temp";
		if (bankInfo != null) {
			File savefile = new File(new File(realpath), "BaknInfo.xls");
			if (savefile.exists())
				savefile.delete();
			try {
				FileUtils.copyFile(bankInfo, savefile);
				message = bankXlsServer.importExcel(realpath+"/BaknInfo.xls");
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
