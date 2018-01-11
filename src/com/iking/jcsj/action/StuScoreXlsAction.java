package com.iking.jcsj.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.iking.basic.BasicAction;
import com.iking.inter.StuScoreXlsInter;

@SuppressWarnings({ "unused", "serial" })
public class StuScoreXlsAction extends BasicAction {
	@Resource
	private StuScoreXlsInter stuScoreXlsServer;
	
	 
	public void setStuScoreXlsServer(StuScoreXlsInter stuScoreXlsServer) {
		this.stuScoreXlsServer = stuScoreXlsServer;
	}

	private String filename;
	public String getFilename() {
		return filename;
	}

	private String scoreContentType; 
	public void setScoreContentType(String scoreContentType) {
		this.scoreContentType = scoreContentType;
	} 
	public void setScore(File score) {
		this.score = score;
	} 
	private File score;
	
	
	public String downStuScoreXls(){
		filename="StudentScore.xls";
		return SUCCESS;
	}
	private String message;

	public String getMessage() {
		return message;
	}
	public InputStream getInputStream() throws Exception { 
		String filepath = ServletActionContext.getServletContext().getRealPath(
				"/excel/StudentScore.xls");
        return new FileInputStream(filepath);
    }
	 
	public String uploadStuScore() {
		/*if(!scoreContentType.equals("application/vnd.ms-excel")){
			message = "操作失败！\n上传文件格式错误！";
			return ERROR;
		} */
		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/excel")
				+ "/temp";
		if (score != null) {
			File savefile = new File(new File(realpath), "StudentScore.xls");
			if (savefile.exists())
				savefile.delete();
			try {
				FileUtils.copyFile(score, savefile);
				message = stuScoreXlsServer.importExcel(realpath+"/StudentScore.xls");
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

