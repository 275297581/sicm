package com.iking.zstj.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import jxl.Workbook;
import jxl.format.Colour;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.hql.FilterTranslator;
import org.hibernate.hql.QueryTranslatorFactory;
import org.hibernate.impl.SessionFactoryImpl;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.iking.basic.BasicAction;
import com.iking.beans.JlCal;
import com.iking.beans.Kszs;
import com.iking.beans.ZsCal;
import com.iking.beans.Zyxx;
import com.iking.beans.Zyzs;
import com.iking.inter.ZsStatInter;
import com.iking.tools.Tool;
@SuppressWarnings({ "serial","unused" })
public class ZsStatAction extends BasicAction{
	
	@Resource
	private ZsStatInter zsStatServer;
	public void setZsStatServer(ZsStatInter zsStatServer) {
		this.zsStatServer = zsStatServer;
	}
	
	@Resource
	public SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	private int index;
	private int xy;
	private int zy;
	private String nj;
	private String bjmc;
	private String zslx;
	private String zs;
	private List<Kszs> kszss;
	private int count;
	private int count2;
	private List<String> zss;
	private List<ZsCal> cals;
	private String filename;
	private int kzid;
	private String mess;
	private String zsfl;
	private String d1;
	private String d2;
	private String title;
	
	
	public void setTitle(String title) {
		try {
			this.title = URLDecoder.decode(title , "UTF-8");
		} catch (UnsupportedEncodingException e) {
			this.title ="";
		}
	}
	public int getCount2() {
		return count2;
	}
	public void setD1(String d1) {
		this.d1 = d1;
	}
	public void setD2(String d2) {
		this.d2 = d2;
	}
	public void setZsfl(String zsfl) {
		this.zsfl = zsfl;
	}
	public String getMess() {
		return mess;
	}
	public void setKzid(int kzid) {
		this.kzid = kzid;
	}
	public String getFilename() {
		return filename;
	}
	public List<ZsCal> getCals() {
		return cals;
	}
	public List<String> getZss() {
		return zss;
	}
	public void setBjmc(String bjmc) {
		this.bjmc = bjmc;
	}
	public void setZslx(String zslx) {
		try {
			this.zslx = URLDecoder.decode(zslx , "UTF-8");
		} catch (UnsupportedEncodingException e) {
			this.zslx ="";
		}
	}
	public void setZs(String zs) {
		this.zs = zs;
	}
	public int getCount() {
		return count;
	}
	public List<Kszs> getKszss() {
		return kszss;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public void setXy(int xy) {
		this.xy = xy;
	} 
	public void setZy(int zy) {
		this.zy = zy;
	}
	public void setNj(String nj) {
		this.nj = nj;
	}
	
	@SuppressWarnings("unchecked")
	public String queryZs(){
		this.hql="SELECT distinct(zsmc) FROM Zyzs WHERE zsfl='"+zslx+"' AND zsmc <> '校外证书'";
		zss = zsStatServer.executeQuery(hql, null);
		return SUCCESS;
	}
	
	public String queryZSTJ(){
		this.hql = "SELECT\n" +
				"	b.zybh,\n" +
				"	b.zymc,\n" +
				"	b.xymc,\n" +
				"	b.nj,\n" +
				"	b.zrs,\n" +
				"	SUM(b.cj) AS cj,\n" +
				"	SUM(b.zj) AS zj,\n" +
				"	SUM(b.gj) AS gj,\n" +
				"	SUM(b.wdj) AS wdj\n" +
				"FROM\n" +
				"	(\n" +
				"		SELECT\n" +
				"			*\n" +
				"		FROM\n" +
				"			(\n" +
				"				SELECT\n" +
				"					(\n" +
				"						CASE\n" +
				"						WHEN (k.djfl = '无等级') THEN\n" +
				"							3\n" +
				"						WHEN (k.djfl = '初级') THEN\n" +
				"							2\n" +
				"						WHEN (k.djfl = '中级') THEN\n" +
				"							1\n" +
				"						WHEN (k.djfl = '高级') THEN\n" +
				"							0\n" +
				"						END\n" +
				"					) AS dj,\n" +
				"					k.kzid,\n" +
				"					s.xsid,\n" +
				"					s.xm,\n" +
				"					z.zybh,\n" +
				"					z.zymc,\n" +
				"					c.xymc,\n" +
				"					s.nj,\n" +
				"					(\n" +
				"						SELECT\n" +
				"							count(*)\n" +
				"						FROM\n" +
				"							Stu s2,\n" +
				"							Zyxx z2\n" +
				"						WHERE\n" +
				"							s2.zyid = z2.zyid\n" +
				"						AND z2.zymc = z.zymc\n" +
				"						AND z2.xyid = c.xyid\n" +
				"						AND s2.zyid = z.zyid\n" +
				"						AND s2.nj = s.nj\n" +
				"					) AS zrs,\n" +
				"					(\n" +
				"						CASE\n" +
				"						WHEN k.djfl = '初级' THEN\n" +
				"							count(*)\n" +
				"						ELSE\n" +
				"							0\n" +
				"						END\n" +
				"					) AS cj,\n" +
				"					(\n" +
				"						CASE\n" +
				"						WHEN k.djfl = '中级' THEN\n" +
				"							count(*)\n" +
				"						ELSE\n" +
				"							0\n" +
				"						END\n" +
				"					) AS zj,\n" +
				"					(\n" +
				"						CASE\n" +
				"						WHEN k.djfl = '高级' THEN\n" +
				"							count(*)\n" +
				"						ELSE\n" +
				"							0\n" +
				"						END\n" +
				"					) AS gj,\n" +
				"					(\n" +
				"						CASE\n" +
				"						WHEN k.djfl = '无等级' THEN\n" +
				"							count(*)\n" +
				"						ELSE\n" +
				"							0\n" +
				"						END\n" +
				"					) AS wdj\n" +
				"				FROM\n" +
				"					Kszs k,\n" +
				"					Stu s,\n" +
				"					Zyxx z,\n" +
				"					Collage c\n" +
				"				WHERE\n" +
				"					k.xsid = s.xsid\n" +
				"				AND s.zyid = z.zyid\n" +
				"				AND z.xyid = c.xyid\n" +
				"				AND s.nj = '"+nj+"'\n" ;
				if(xy!=0){		
					this.hql +=	" AND c.xyid="+xy;
				}
				if(zy!=0){
					this.hql +=	" AND z.zyid="+zy;
				}
				if(zslx!=null&&!zslx.equals("")){
					this.hql +=	" AND k.zsfl='"+zslx+"'";
				}
				if(zs!=null&&!zs.equals("")){
					this.hql +=	" AND k.zsmc='"+zs+"'";
				}
				this.hql +="				GROUP BY\n" +
				"					k.kzid\n" +
				"				ORDER BY\n" +
				"					dj\n" +
				"			) AS t\n" +
				"		GROUP BY\n" +
				"			t.xsid\n" +
				"	) AS b\n" +
				"GROUP BY\n" +
				"	b.zymc";
		
//		this.hql +=	" SELECT z.zybh,z.zymc,c.xymc,s.nj,(";
//		this.hql +=	" SELECT count(s2) FROM Stu s2,Zyxx z2 WHERE s2.zyxx.zyid = z2.zyid AND z2.zymc=z.zymc AND z2.collage.xyid=c.xyid AND s2.zyxx.zyid=z.zyid AND s2.nj=s.nj ) as zrs,";
//		this.hql +=	" (CASE WHEN k.djfl='初级'  THEN count(k) ELSE 0 END) AS cj,";
//		this.hql +=	" (CASE WHEN k.djfl='中级' THEN count(k) ELSE 0 END) AS zj,";
//		this.hql +=	" (CASE WHEN k.djfl='高级' THEN count(k) ELSE 0 END) AS gj,";
//		this.hql +=	" (CASE WHEN k.djfl='无等级' THEN count(k) ELSE 0 END) AS wdj";
//		this.hql +=	" FROM Kszs k,Stu s,Zyxx z,Collage c";
//		this.hql +=	" Where k.stu.xsid = s.xsid AND  s.zyxx.zyid = z.zyid AND  z.collage.xyid = c.xyid ";
//		this.hql +=	" AND s.nj='"+nj+"'";
//		if(xy!=0){		
//			this.hql +=	" AND c.xyid="+xy;
//		}
//		if(zy!=0){
//			this.hql +=	" AND z.zyid="+zy;
//		}
//		if(zslx!=null&&!zslx.equals("")){
//			this.hql +=	" AND k.zsfl='"+zslx+"'";
//		}
//		if(zs!=null&&!zs.equals("")){
//			this.hql +=	" AND k.zsmc='"+zs+"'";
//		}
//		this.hql +=	" GROUP BY k.zsdj,z.zymc ";
		@SuppressWarnings("unchecked")
		SQLQuery q = this.sessionFactory.getCurrentSession().createSQLQuery(hql);
		if (parameters != null && parameters.length > 0)
			for (int i = 0; i < parameters.length; i++)
				q.setParameter(i, parameters[i]);
		List<Object []> list = q.list();
//		List<Object []> list = zsStatServer.executeQuery(hql, null);
		SetBean(list); 
		return SUCCESS;
	}
	 
	private void SetBean(List<Object[]> list) {
		cals = new ArrayList<ZsCal>();
		Map<String, Integer> map = new HashMap<String, Integer>(); 
		int i = 0;
        for(Object [] obj : list){ 
        	if(!map.containsKey((String)obj[1])){
        		ZsCal cal = new ZsCal();
        		cal.setZydm((String)obj[0]);
            	cal.setZymc((String)obj[1]);
            	cal.setXymc((String)obj[2]);
            	cal.setBynd((String)obj[3]);
            	cal.setByrs(Integer.parseInt(obj[4].toString()));
            	cal.setCjrs(Integer.parseInt(obj[5].toString()));
            	cal.setZjrs(Integer.parseInt(obj[6].toString()));
            	cal.setGjrs(Integer.parseInt(obj[7].toString()));
            	cal.setWdjrs(Integer.parseInt(obj[8].toString()));
            	map.put((String)obj[1], i);
            	i++;
            	cals.add(cal);
        	}else{
        		ZsCal cal =cals.get(map.get((String)obj[1]));
        		if(cal!=null){
        			cal.setCjrs(cal.getCjrs()+Integer.parseInt(obj[5].toString()));
                	cal.setZjrs(cal.getZjrs()+Integer.parseInt(obj[6].toString()));
                	cal.setGjrs(cal.getGjrs()+Integer.parseInt(obj[7].toString()));
                	cal.setWdjrs(cal.getWdjrs()+Integer.parseInt(obj[8].toString()));
        		}
        	} 
        }
        for(int j=0;j<cals.size();j++){ 
        	double total =cals.get(j).getByrs();
        	double cj =  cals.get(j).getCjrs();
        	double zj = cals.get(j).getZjrs();
        	double gj = cals.get(j).getGjrs();
        	double wdj = cals.get(j).getWdjrs();
        	double cjb = cj*100.00/total;
        	double zjb = zj*100.00/total;
        	double gjb = gj*100.00/total;
        	double wdjb = wdj*100.00/total;
        	
        	cals.get(j).setCjbl(String.format("%.2f", cjb));
        	cals.get(j).setZjbl(String.format("%.2f", zjb));
        	cals.get(j).setGjbl(String.format("%.2f", gjb));
        	cals.get(j).setWdjbl(String.format("%.2f", wdjb));
        	cals.get(j).setHdzs(String.format("%.2f",zjb+gjb+wdjb));
        } 
	}
	public String queryEnglishZs(){
		dohuizong("英语");
		return SUCCESS;
	}
	public String queryTmZs(){
		dohuizong("土木类");
		return SUCCESS;
	}
	public String queryComZs(){
		dohuizong("计算机类");
		return SUCCESS;
	}
	public String queryXgzZs(){
		dohuizong("新工种");
		return SUCCESS;
	}
	public String queryRcZs(){
		dohuizong("日常鉴定");
		return SUCCESS;
	}
	public String queryQtZs(){
		dohuizong("其它类");
		return SUCCESS;
	}
	public String queryXwZs(){
		dohuizong("校外类");
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	private void dohuizong(String lx){
		this.hql = " FROM Kszs k,Stu s,Zyxx z,Collage c,Zyzs zs ";
		this.hql +=" Where k.stu.xsid = s.xsid AND s.zyxx.zyid = z.zyid AND z.collage.xyid = c.xyid ";
		this.hql +=" AND k.zyzs.zsid = zs.zsid AND k.zsfl='"+lx+"' ";
		if(xy!=0){
			this.hql +=" AND c.xyid = "+xy;
		}
		if(zy!=0){
			this.hql +=" AND z.zyid = "+zy;
		}
		if(nj!=null && !nj.trim().equals("")){
			this.hql +=" AND s.nj = '"+nj+"' ";
		}
		if(bjmc!=null&&!bjmc.trim().equals("")){
			this.hql +=" AND s.bjmc = ? ";
			parameters = new Object[]{bjmc};
		}
		if(zs!=null && !zs.trim().equals("")){
			this.hql +=" AND k.zsmc ='"+zs+"' ";
		}
		kszss = zsStatServer.executeQueryByPage("SELECT k " + this.hql, parameters, index,
				pageSize);
		if(index==1){
			this.hql = "SELECT COUNT(*) " + this.hql;
			this.count = Integer.parseInt(zsStatServer.uniqueQuery(hql,
					parameters).toString());
		}  
	}
	String UNAME="";
	public String exportZstj(){
		UNAME =  (String) ServletActionContext.getContext().getSession()
				.get("userName");
		filename = "CertificateStatistics.xls";
		download();
		return SUCCESS;
	}
	
	
	private void download() { 
		queryZSTJ();
		// 拷贝模板
		WritableWorkbook wwb = null;
		WritableSheet wws = null;
		FileOutputStream out = null;
		try {
			// 获取要读取的EXCEL表格模板
			String filepath = ServletActionContext.getServletContext()
					.getRealPath("/excel");
			File is = new File(filepath + "/CertificateStatistics.xls");
			// 写入到新的表格里
			File savefile = new File(filepath + "/temp/", "CertificateStatistics"+UNAME+".xls");
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
			out = new FileOutputStream(savefile);
			// 获取工作簿对象
			Workbook wb = Workbook.getWorkbook(is);
			// 创建可写入的工作簿对象
			wwb = Workbook.createWorkbook(out, wb);
			// 根据工作表名获取WritableSheet对象
			wws = wwb.getSheet("Sheet1");
			WritableCellFormat wcf = new WritableCellFormat();
			// 设置样式
			wcf.setBorder(jxl.format.Border.ALL,
					jxl.format.BorderLineStyle.THIN);
			Label label = null;
			int zrs =0,cjrs=0,zjrs =0,gjrs=0,wdjrs=0;
			double cjbl=0.0,zjbl=0.0,gjbl=0.0,wdjbl=0.0,hdzs=0.0;
			
			label = new Label(0, 0,title, wcf);
			wws.addCell(label);
			
			for (int i = 0; i < cals.size(); i++) {
				label = new Label(0, (i + 6), (i + 1) + "", wcf);
				wws.addCell(label);
				label = new Label(1, (i + 6), cals.get(i).getZydm(), wcf);
				wws.addCell(label);
				label = new Label(2, (i + 6), cals.get(i).getZymc(), wcf);
				wws.addCell(label);
				label = new Label(3, (i + 6), cals.get(i).getZydm(), wcf);
				wws.addCell(label);
				label = new Label(4, (i + 6), cals.get(i).getZymc(), wcf);
				wws.addCell(label);
				label = new Label(5, (i + 6), cals.get(i).getByrs()+"", wcf);
				zrs +=cals.get(i).getByrs();
				wws.addCell(label);
				label = new Label(6, (i + 6), cals.get(i).getCjrs()+"", wcf);
				cjrs +=cals.get(i).getCjrs();
				wws.addCell(label);
				label = new Label(7, (i + 6), cals.get(i).getCjbl(), wcf);
				cjbl+=Double.parseDouble(cals.get(i).getCjbl());
				wws.addCell(label);
				label = new Label(8, (i + 6), cals.get(i).getZjrs()+"", wcf);
				zjrs +=cals.get(i).getZjrs();
				wws.addCell(label);
				label = new Label(9, (i + 6), cals.get(i).getZjbl(), wcf);
				zjbl+=Double.parseDouble(cals.get(i).getZjbl());
				wws.addCell(label);
				label = new Label(10, (i + 6), cals.get(i).getGjrs()+"", wcf);
				gjrs +=cals.get(i).getGjrs();
				wws.addCell(label);
				label = new Label(11, (i + 6), cals.get(i).getGjbl(), wcf);
				gjbl+=Double.parseDouble(cals.get(i).getGjbl());
				wws.addCell(label);
				label = new Label(12, (i + 6), cals.get(i).getWdjrs()+"", wcf);
				wdjrs +=cals.get(i).getWdjrs();
				wws.addCell(label);
				label = new Label(13, (i + 6), cals.get(i).getWdjbl(), wcf);
				wdjbl+=Double.parseDouble(cals.get(i).getWdjbl());
				wws.addCell(label);
				label = new Label(14, (i + 6), cals.get(i).getHdzs(), wcf);
				hdzs+=Double.parseDouble(cals.get(i).getHdzs());
				wws.addCell(label);
				label = new Label(15, (i + 6), cals.get(i).getXymc(), wcf);
				wws.addCell(label);
				label = new Label(16, (i + 6), cals.get(i).getBynd(), wcf);
				wws.addCell(label);
			}
			wcf = new WritableCellFormat(); 
			wcf.setBorder(jxl.format.Border.ALL,
					jxl.format.BorderLineStyle.THIN);
			wcf.setBackground(Colour.GRAY_25 );
			label = new Label(5, 5,zrs+"", wcf);
			wws.addCell(label);
			label = new Label(6, 5,cjrs+"", wcf);
			wws.addCell(label);
			label = new Label(7, 5,cjbl+"", wcf);
			wws.addCell(label);
			label = new Label(8, 5,zjrs+"", wcf);
			wws.addCell(label);
			label = new Label(9, 5,zjbl+"", wcf);
			wws.addCell(label);
			label = new Label(10, 5,gjrs+"", wcf);
			wws.addCell(label);
			label = new Label(11, 5,gjbl+"", wcf);
			wws.addCell(label);
			label = new Label(12, 5,wdjrs+"", wcf);
			wws.addCell(label);
			label = new Label(13, 5,wdjbl+"", wcf);
			wws.addCell(label);
			label = new Label(14, 5,hdzs+"", wcf);
			wws.addCell(label);
			
			wwb.write();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭流
			try {
				wwb.close();
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
	}
	@JSON(serialize = false)
	public InputStream getInputStream() throws Exception {
		String filepath = ServletActionContext.getServletContext().getRealPath(
				"/excel/temp/CertificateStatistics"+UNAME+".xls");
		return new FileInputStream(filepath);
	}
	 
	public String exportZs(){
		UNAME =  (String) ServletActionContext.getContext().getSession()
				.get("userName");
		filename = "CertificateInfo.xls";
		download1();
		return SUCCESS;
	}
 	
	private void download1() { 
		this.hql = " FROM Kszs k,Stu s,Zyxx z,Collage c,Zyzs zs ";
		this.hql +=" Where k.stu.xsid = s.xsid AND s.zyxx.zyid = z.zyid AND z.collage.xyid = c.xyid ";
		this.hql +=" AND k.zyzs.zsid = zs.zsid AND k.zsfl='"+zsfl+"' ";
		if(xy!=0){
			this.hql +=" AND c.xyid = "+xy;
		}
		if(zy!=0){
			this.hql +=" AND z.zyid = "+zy;
		}
		if(nj!=null && !nj.trim().equals("")){
			this.hql +=" AND s.nj = '"+nj+"' ";
		}
		if(bjmc!=null&&!bjmc.trim().equals("")){
			this.hql +=" AND s.bjmc = ? ";
			parameters = new Object[]{bjmc};
		}
		if(zs!=null && !zs.trim().equals("")){
			this.hql +=" AND k.zsmc ='"+zs+"' ";
		}
		kszss = zsStatServer.executeQuery("SELECT k " + this.hql,null);
		// 拷贝模板
		WritableWorkbook wwb = null;
		WritableSheet wws = null;
		FileOutputStream out = null;
		try {
			// 获取要读取的EXCEL表格模板
			String filepath = ServletActionContext.getServletContext()
					.getRealPath("/excel");
			File is = new File(filepath + "/CertificateInfo.xls");
			// 写入到新的表格里
			File savefile = new File(filepath + "/temp/", "CertificateInfo"+UNAME+".xls");
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
		
			out = new FileOutputStream(savefile);
			// 获取工作簿对象
			Workbook wb = Workbook.getWorkbook(is);
			// 创建可写入的工作簿对象
			wwb = Workbook.createWorkbook(out, wb);
			// 根据工作表名获取WritableSheet对象
			wws = wwb.getSheet("Sheet1");
			WritableCellFormat wcf = new WritableCellFormat();
			// 设置样式
			wcf.setBorder(jxl.format.Border.ALL,
					jxl.format.BorderLineStyle.THIN);
			Label label = null;
			  
			for (int i = 0; i < kszss.size(); i++) {
				label = new Label(0, (i + 1), (i + 1) + "", wcf);
				wws.addCell(label);
				label = new Label(1, (i + 1), kszss.get(i).getStu().getXh(), wcf);
				wws.addCell(label);
				label = new Label(2, (i + 1), kszss.get(i).getStu().getXm(), wcf);
				wws.addCell(label);
				label = new Label(3, (i + 1), kszss.get(i).getStu().getZyxx().getCollage().getXymc(), wcf);
				wws.addCell(label);
				label = new Label(4, (i + 1), kszss.get(i).getStu().getZyxx().getZymc(), wcf);
				wws.addCell(label);
				label = new Label(5, (i + 1), kszss.get(i).getStu().getNj(), wcf);
				wws.addCell(label);
				label = new Label(6, (i + 1), kszss.get(i).getStu().getBjmc(), wcf);
				wws.addCell(label);
				label = new Label(7, (i + 1), kszss.get(i).getZsmc(), wcf);
				wws.addCell(label);
				label = new Label(8, (i + 1), kszss.get(i).getZsdj(), wcf);
				wws.addCell(label); 
				label = new Label(9, (i + 1), kszss.get(i).getMoney(), wcf);
				wws.addCell(label); 
			} 
			wwb.write();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭流
			try {
				wwb.close();
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
	}
	@JSON(serialize = false)
	public InputStream getInputStream1() throws Exception {
		String filepath = ServletActionContext.getServletContext().getRealPath(
				"/excel/temp/CertificateInfo"+UNAME+".xls");
		return new FileInputStream(filepath);
	}
	
	public String deleteZs(){
		try{
			Kszs kszs =(Kszs) zsStatServer.getById(Kszs.class, kzid);
			Tool.KSZS.remove(kszs.getStu().getSfzh() + kszs.getZsmc()+kszs.getZsdj());
			if(kszs.getIfhx()!=null && kszs.getIfhx().equals("1")){
				Tool.HXZS.remove(kszs.getStu().getSfzh());
			}
			zsStatServer.delete(kszs);
			mess="删除成功！";
		}catch (Exception e) {
			mess="删除失败！";
		}
		return SUCCESS;
	}
	
	public String queryWorkForm(){ 
		hql ="SELECT Count(*) FROM Kszs t1 WHERE t1.zsmc =? AND t1.timer >= ? and t1.timer <= ?"; 
		parameters=new Object []{zs,d1,d2};
		try{
			count = Integer.parseInt(zsStatServer.uniqueQuery(hql,parameters)+"");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		hql ="SELECT Count(*) FROM Bmxx t1,Zyzs t2 WHERE t1.zyzs.zsid = t2.zsid AND t2.zsmc =? AND t1.timer >= ? and t1.timer <= ?"; 
		parameters=new Object []{zs,d1,d2};
		try{
			count2 = Integer.parseInt(zsStatServer.uniqueQuery(hql,parameters)+"");
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return SUCCESS;
	}
	
}
















