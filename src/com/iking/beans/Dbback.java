package com.iking.beans;

@SuppressWarnings("serial")
public class Dbback implements java.io.Serializable {
 
	private String filename;
	private String backtime;
	private String filesize;
	
	public String getFilesize() {
		return filesize;
	}

	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
  
	public String getBacktime() {
		return this.backtime;
	}

	public void setBacktime(String backtime) {
		this.backtime = backtime;
	}  
}