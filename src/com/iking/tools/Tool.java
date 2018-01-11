package com.iking.tools;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.apache.struts2.ServletActionContext;

import com.iking.basic.BasicServer;

public class Tool extends BasicServer{
   
	/**
	 * @name 学院信息
	 */
	public static Map<String, Integer> XY = new HashMap<String, Integer>();
	 
	/**
	 * @name 专业信息
	 */
	public static Map<String, Integer> ZY = new HashMap<String, Integer>();
	
	/**
	 * @name 班级信息
	 */
	public static Map<String, Integer> BJ = new HashMap<String, Integer>();
	 
	/**
	 * @name 学生信息
	 */
	public static Map<String, Integer> XS = new HashMap<String, Integer>();
	/**
	 * @name 证书信息(专业+证书名+等级)
	 */
	public static Map<String, Integer> ZS = new HashMap<String, Integer>();
	/**
	 * @name 非专业核心证书(证书名+等级)
	 */
	public static Map<String, Integer> ZS1 = new HashMap<String, Integer>();
	
	/**
	 * @name 报名信息
	 */
	public static Map<String, Integer> BM = new HashMap<String, Integer>();
	/**
	 * @name 考点信息
	 */
	public static Map<String, Integer> KD = new HashMap<String, Integer>();
	/**
	 * @name 成绩信息
	 */
	public static Map<String, Integer> CJ = new HashMap<String, Integer>();
	/**
	 * @name 考生证书信息
	 */
	public static Map<String, Integer> KSZS = new HashMap<String, Integer>();
	/**
	 * @name 考生核心证书信息
	 */
	public static Map<String, Integer> HXZS = new HashMap<String, Integer>();
	
	/**
	 * @name 学号 --身份证
	 */
	public static Map<String, String> XHSF = new HashMap<String, String>();
	/**
	 * @name 身份证--姓名
	 */
	public static Map<String, String> SFXM = new HashMap<String, String>();
	/**
	 * @name 学号 --专业public static Map<String, String> XHZY1 = new HashMap<String, String>();
	 */
	
	/**
	 * @name 身份证号 --专业
	 */
	public static Map<String, String> SFZZY = new HashMap<String, String>();

	/**
	 * @name 证书 --分类
	 */
	public static Map<String, String> ZSFL = new HashMap<String, String>();
	
	/**
	 * @name 证书 --奖励金额
	 */
	public static Map<Integer, String> ZSJE = new HashMap<Integer, String>();
	
	/**
	 * @name 证书 --学分
	 */
	public static Map<Integer, String> ZSXF = new HashMap<Integer, String>();
	/**
	 * @name 校外证书申请
	 */
	public static Map<String,Integer> ZSSQ = new HashMap<String,Integer>();
	/**
	 * @name 校外证书申请编号
	 */
	public static Map<String,String> ZSBH = new HashMap<String,String>();
	
	
	 
	public static String FData(Date date) {
		DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
		String reTime = format2.format(date);
		return reTime;
	}
	/**
	 * 
	 * @param date1
	 * @return yyyy-MM-dd HH:mm:ss
	 */
	public static String FData1(Date date1) {
		DateFormat format21 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String reTime1 = format21.format(date1);
		return reTime1;
	}
	public static String FData2(Date date1) {
		DateFormat format21 = new SimpleDateFormat("yyyy年MM月dd日");
		String reTime1 = format21.format(date1);
		return reTime1;
	}
	public static ArrayList<List<String>> ReadXls(String xlsPath) {
		Workbook readwb = null;
		ArrayList<List<String>> lists = new ArrayList<List<String>>();
		try { 
			InputStream instream = new FileInputStream(xlsPath);
			readwb = Workbook.getWorkbook(instream);
			 
			Sheet readsheet = readwb.getSheet(0); 
			int rsColumns = readsheet.getColumns(); 
			int rsRows = readsheet.getRows(); 
			lists.clear();
			for (int i = 0; i < rsRows; i++) {
				String s="";
				List<String> list = new ArrayList<String>();
				list.clear();
				for (int j = 0; j < rsColumns; j++) {
					Cell cell = readsheet.getCell(j, i);
					if(i==0&&cell.getContents().trim().equals("")){
						rsColumns=j;
						continue;
					}
					list.add(cell.getContents().trim()); 
					s+=cell.getContents().trim(); 
				}
				if(s.equals("")){
					break;
				}
				lists.add(list);
			}
			readwb.close();
			instream.close();
			return lists;
		} catch (Exception e) {
			 e.printStackTrace();
		}
		return null;
	} 
	
	 /*
	    * 备份数据库 1、读取配置文件 2、启动智能查询Mysql安装目录 3、备份数据库为sql文件
	    */
	   public static String backup(String sql) {
	      Properties pros = getPprVue();
	      String username = "root";
	      String password = pros.getProperty("rootpassword");
	      String databaseName = pros.getProperty("databaseName");
	      String address = pros.getProperty("address");
	      String sqlpath = pros.getProperty("sqlpath").replace(" ","");
	      try { 
	    	  File backupath = new File(sqlpath);
		         if (!backupath.exists()) {
		            backupath.mkdirs();
		         }
		     File file = new File(sqlpath+sql);
		     int i=1;
		     String repeat="";
		     while(file.exists()){
		    	 repeat =sql.replace(".sql",i+".sql");
		    	 file= new File(sqlpath+repeat);
		    	 i++;
		     }
		     if(!repeat.equals(""))
		    	 sql = repeat;
	         StringBuffer sb = new StringBuffer();
	         sb.append("mysqldump ");
	         //sb.append("--opt ");
	         sb.append("-h");
	         sb.append(address);
	         sb.append(" ");
	         //sb.append("--user=");
	         sb.append("-u");
	         sb.append(username);
	         sb.append(" ");
	         //sb.append("--password=");
	         sb.append("-p");
	         sb.append(password);
	         sb.append(" ");
	         //sb.append("--lock-all-tables=true ");
	         sb.append("--skip-lock-tables ");
	         sb.append(databaseName);
	         //sb.append(" ");
	         //sb.append("--result-file=");
	         sb.append(">");
	         sb.append(sqlpath);
	         sb.append(sql);
	         sb.append(" ");
	         sb.append("--default-character-set=utf8 ");
	         String[] cmd = { "cmd", "/c", sb.toString() };
	         try { 
	            Runtime.getRuntime().exec(cmd); 
	            return sqlpath+sql;
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      } catch (Exception e1) {
	         e1.printStackTrace();
	      }
	      return "";
	   } 
	   /*
	    * 读取属性文件
	    */
	   public static Properties getPprVue() { 
		  String configpath = ServletActionContext.getServletContext().getRealPath("WEB-INF/db.properties");
		  FileInputStream inputStream =null;
	      Properties p = new Properties();
	      try {
	    	 inputStream = new FileInputStream(configpath);
	         p.load(inputStream);
	         inputStream.close();
	      } catch (IOException e) {
	         e.printStackTrace();
	      } 
	      return p; 
	   } 
	   /*
	    * 根据备份文件恢复数据库
	    */
	   public static Boolean returndb (String filename) {
	      Properties pros = getPprVue();
	      String username ="root";// pros.getProperty("username");
	      String password = pros.getProperty("rootpassword");
	      String address = pros.getProperty("address");
	      String databaseName = pros.getProperty("databaseName"); 
	      StringBuffer sb = new StringBuffer();
	      sb.append("mysql ");
	      sb.append("-h");
	      sb.append(address);
	      sb.append(" -u");
	      sb.append(username);
	      sb.append(" -p");
	      sb.append(password);
	      sb.append(" ");
	      sb.append(databaseName);
	      sb.append("<");
	      sb.append(filename); 
	      String[] cmd = { "cmd", "/c", sb.toString()};
	      try {
	         Runtime.getRuntime().exec(cmd);
	         return true;
	      } catch (IOException e) {
	         e.printStackTrace();
	         return false;
	      }
	   }
	  
}
