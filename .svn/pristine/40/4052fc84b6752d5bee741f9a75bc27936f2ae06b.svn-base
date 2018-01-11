package com.iking.beans;

import java.io.File;
import java.util.Calendar;

import com.iking.tools.Tool;

public class FileBean { 
	public FileBean(File file) {
		 this.fileName = file.getName();
		 this.fileSize = (file.length()/1024)+"KB";
		 Calendar cd = Calendar.getInstance();
		 cd.setTimeInMillis(file.lastModified());
		 this.createTime = Tool.FData1(cd.getTime()); 
	} 
	private String fileName;
	private String fileSize;
	private String createTime;
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}  
}
