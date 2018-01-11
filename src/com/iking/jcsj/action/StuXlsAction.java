package com.iking.jcsj.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.iking.basic.BasicAction;
import com.iking.inter.StuXlsInter;

@SuppressWarnings({ "unused", "serial" })
public class StuXlsAction extends BasicAction {
	@Resource
	private StuXlsInter stuXlsServer;
	public void setStuXlsServer(StuXlsInter stuXlsServer) {
		this.stuXlsServer = stuXlsServer;
	} 

	private File stuinfo;
	private String stuinfoContentType; //file type
	private String message;
	public String filename;

	public void setStuinfo(File stuinfo) {
		this.stuinfo = stuinfo;
	}
	public void setStuinfoContentType(String stuinfoContentType) {
		this.stuinfoContentType = stuinfoContentType;
	}
	
	public String getFilename() {
		return filename;
	}

	public String getMessage() {
		return message;
	}
	

	public String uploadStuInfo() {
		/*if(!stuinfoContentType.equals("application/vnd.ms-excel")){
			message = "操作失败！\n上传文件格式错误！";
			return ERROR;
		} */
		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/excel")
				+ "/temp";
		if (stuinfo != null) {
			File savefile = new File(new File(realpath), "StudentInfo.xls");
			if (savefile.exists())
					savefile.delete();
			try {
				FileUtils.copyFile(stuinfo, savefile);
				message = stuXlsServer.importExcel(realpath+"/StudentInfo.xls");
				savefile.delete();
				return SUCCESS;
			} catch (Exception e) {
				message = "操作失败！\n"+message; 
				e.printStackTrace();
			}
		}
		return ERROR;
	}
	
	public String  downStuXls() throws Exception {   
		filename = "studentinfo.xls";
		return SUCCESS;
	}   
	
	public InputStream getInputStream() throws Exception { 
		String filepath = ServletActionContext.getServletContext().getRealPath(
				"/excel/StudentInfo.xls");
        return new FileInputStream(filepath);
    }
}
