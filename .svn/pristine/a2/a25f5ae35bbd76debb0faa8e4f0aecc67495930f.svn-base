package com.iking.jltj.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.channels.FileChannel;
import java.util.Date;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.iking.basic.BasicAction;
import com.iking.tools.Tool;
import com.iking.tools.Words;

public class WorkFormAction extends BasicAction {

	private String val;
	private String filename;

	public String getFilename() {
		return filename;
	}

	public void setVal(String val) {
		 try { 
			 this.val = URLDecoder.decode(val , "UTF-8"); 
			 }
		 catch (UnsupportedEncodingException e) { e.printStackTrace(); }
	}
	String UNAME = "";
	String filepath="";
	public String exportWorkForm() {
		UNAME = (String) ServletActionContext.getContext().getSession().get("userName");
		filepath = ServletActionContext.getServletContext().getRealPath("/excel");
		filename = "WorkForm.doc";
		val +="@@"+UNAME+"@@"+Tool.FData2(new Date());
		
		String info[] = val.split("@@");
		if (info.length == 13) {
			copyWordFile();
			inputWordFile(info);
		}
		return SUCCESS;
	}
	private void copyWordFile() {
		FileOutputStream out = null;
		FileInputStream in = null;
		FileChannel inchannel = null;
		FileChannel outchannel = null;
		try {
			
			File is = new File(filepath + "/WorkFormWord.doc");
			// 写入到新的表格里
			File savefile = new File(filepath + "/temp/", "WorkFormWord"+ UNAME + ".doc");
			if (savefile.exists()){				
				savefile.delete();}
			else{
				File dirname = new File(filepath + "/temp");
				if (!dirname.isDirectory())
				{ //目录不存在
				     dirname.mkdir(); //创建目录
				}  
				// 创建新文件
				savefile.createNewFile();
			}
			in = new FileInputStream(is);
			out = new FileOutputStream(savefile);
			inchannel = in.getChannel();
			outchannel = out.getChannel();
			inchannel.transferTo(0, inchannel.size(), outchannel); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				in.close();
				out.close();
				inchannel.close();
				outchannel.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	} 
	private void inputWordFile(String[] info) { 
		Words wordBean = new Words();  
			try{ 
		        wordBean.setVisible(false); // 是否前台打开word 程序，或者后台运行  
		        wordBean.openFile(filepath + "/temp/WorkFormWord"+ UNAME + ".doc"); 
		        for (int i = 0; i < info.length; i++) {
		        	wordBean.insertAtMark("w"+(i+1), info[i]); 
				} 
		        wordBean.save();  
			}catch (Exception e) {
				
			}finally{
		      try {
		    	  wordBean.closeDocument();  
			        wordBean.closeWord();
			} catch (Exception e2) {
				e2.printStackTrace();
			}   
			}
	} 
	@JSON(serialize = false)
	public InputStream getInputStream() throws Exception {
		String filepath = ServletActionContext.getServletContext().getRealPath(
				"/excel/temp/WorkFormWord" + UNAME + ".doc");
		return new FileInputStream(filepath);
	}

}
