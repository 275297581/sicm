package com.iking.jltj.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.iking.basic.BasicAction;
import com.iking.beans.JlCal;
import com.iking.beans.Kdxx;
import com.iking.beans.Kszs;
import com.iking.beans.Zyzs;
import com.iking.inter.JlInter;
import com.iking.tools.Tool;

@SuppressWarnings("serial")
public class JlManageAction extends BasicAction {

	@Resource
	private JlInter jlServer;
	private List<JlCal> cals=null;
	public void setJlServer(JlInter jlServer) {
		this.jlServer = jlServer;
	}
	
	private int index;
	private List<Zyzs> zyzs;
	private int count;
	private int zsid;
	private String money;
	private String xf;
	private Zyzs zs;
	private String filename;
	private int xy;
	private int key;
	private String nj;
	private String title;
	
	public void setKey(int key) {
		this.key = key;
	}
	public void setNj(String nj) {
		this.nj = nj;
	}
	public void setTitle(String title) {
		try {
			this.title = URLDecoder.decode(title , "UTF-8");
		} catch (UnsupportedEncodingException e) {
			this.title =""; 
		};
	}
	public String getFilename() {
		return filename;
	}
	public void setXy(int xy) {
		this.xy = xy;
	}
	public Zyzs getZs() {
		return zs;
	}
	public void setZsid(int zsid) {
		this.zsid = zsid;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public void setXf(String xf) {
		this.xf = xf;
	}
	public int getCount() {
		return count;
	} 
	public List<Zyzs> getZyzs() {
		return zyzs;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	
	
	@SuppressWarnings("unchecked")
	public String queryJL(){
		
		this.hql="FROM Zyzs z where z.zsid!='1001' order by z.zsid desc";
		zyzs = jlServer.executeQueryByPage(hql, null, index, pageSize);
		
		this.hql = "SELECT COUNT(*) "+ this.hql;
		count = Integer.parseInt(jlServer.uniqueQuery(hql, null).toString()); 
		
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String modifyJl(){
		try{ 
		Zyzs zs = (Zyzs) jlServer.getById(Zyzs.class, zsid);
		 if(zs!=null){
			zs.setJlbz(money.trim());
			zs.setXf(xf.trim());
			Tool.ZSJE.put(zsid,money.trim());
			Tool.ZSXF.put(zsid, xf.trim());
			jlServer.update(zs);
		 }
		// String hql=" FROM Kszs where stu.zyxx.collage.xymc='"+zs.getXymc()+"' AND stu.zyxx.zymc='"+zs.getZymc()+"' AND zsmc='"+zs.getZsmc()+"' AND zsdj='"+zs.getZsdj()+"'";
		// List<Kszs> kszslist = jlServer.executeQuery(hql, null);
		 List<Kszs> kszslist = jlServer.executeQuery("FROM Kszs where zyzs.zsid="+zsid, null);
		 if(null!=kszslist&&kszslist.size()>0)
		 {
			 for (Kszs kszs : kszslist) {
				kszs.setMoney(money.trim());
				kszs.setXf(xf.trim());
				jlServer.update(kszs);
			}
		 }
		}catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String queryJlById(){
		zs = (Zyzs) jlServer.getById(Zyzs.class, zsid);
		return SUCCESS;
	}
	String UNAME ="";
	public String printTotalJl() {
		
		UNAME =  (String) ServletActionContext.getContext().getSession()
				.get("userName");
		if(key==1) exportXYSJL();
		else if(key==2) exportXYJL();
		return SUCCESS;
	}
	private void exportXYSJL(){
		filename = "RewardTotal.xls";
		cals = new ArrayList<JlCal>();
		queryTotalJl();
		// 拷贝模板
		WritableWorkbook wwb = null;
		WritableSheet wws = null;
		FileOutputStream out = null;
		try {
			// 获取要读取的EXCEL表格模板
			String filepath = ServletActionContext.getServletContext()
					.getRealPath("/excel"); 
			File is = new File(filepath + "/RewardTotal.xls");
			// 写入到新的表格里
			File savefile = new File(filepath + "/temp/", "RewardTotal"+UNAME+".xls");
			if (savefile.exists())
				savefile.delete();
			// 创建新文件
			savefile.createNewFile();
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
			int k= 0;
			int pnum = 0;
			double money = 0;
			double xf = 0;
			int sclassSum=0;
			
			label = new Label(0, 0, title, wcf);
			wws.addCell(label);
			
			for (int i = 0; i < cals.size(); i++) {
				k=i;
				label = new Label(0, (i + 2), (i + 1) + "", wcf);
				wws.addCell(label);
				label = new Label(1, (i + 2), cals.get(i).getXymc(), wcf);
				wws.addCell(label);
				label = new Label(2, (i + 2), cals.get(i).getStuclassnum() + "", wcf);
				wws.addCell(label);
				label = new Label(3, (i + 2), cals.get(i).getPnum() + "", wcf);
				wws.addCell(label);
				label = new Label(4, (i + 2), cals.get(i).getTmoney() + "", wcf);
				wws.addCell(label);
				label = new Label(5, (i + 2), cals.get(i).getXf() + "", wcf);
				wws.addCell(label);
				pnum += cals.get(i).getPnum();
				money+=cals.get(i).getTmoney();
				xf+=cals.get(i).getXf();
				//班级数
				sclassSum+=cals.get(i).getStuclassnum() ;
			}
			
			label = new Label(0, (k + 3), "合计", wcf);
			wws.addCell(label);
			label = new Label(1, (k + 3), "", wcf);
			wws.addCell(label);
			label = new Label(2, (k + 3), sclassSum+"" , wcf);
			wws.addCell(label);
			label = new Label(3, (k + 3), pnum+"" , wcf);
			wws.addCell(label);
			label = new Label(4, (k + 3), money+"" , wcf);
			wws.addCell(label);
			label = new Label(5, (k + 3), xf+"" , wcf);
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
	
	private void exportXYJL(){
		filename = "CollageRewardDetial.xls";
		cals = new ArrayList<JlCal>();
		queryTotalJl();
		// 拷贝模板
		WritableWorkbook wwb = null;
		WritableSheet wws = null;
		FileOutputStream out = null;
		try { 
			// 获取要读取的EXCEL表格模板
			String filepath = ServletActionContext.getServletContext()
					.getRealPath("/excel");
			File is = new File(filepath + "/CollageRewardDetial.xls");
			// 写入到新的表格里
			File savefile = new File(filepath + "/temp/", "CollageRewardDetial"+UNAME+".xls");
			if (savefile.exists())
				savefile.delete();
			// 创建新文件
			savefile.createNewFile();
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
			label = new Label(0, 0, title, wcf);
			wws.addCell(label);
			int k=0;
			int num = 0;
			double money =0;
			for (int i = 0; i < cals.size(); i++) {
				label = new Label(0, (i + 2), (i + 1) + "", wcf);
				wws.addCell(label);
				label = new Label(1, (i + 2), cals.get(i).getBjmc(), wcf);
				wws.addCell(label);
				label = new Label(2, (i + 2), cals.get(i).getPnum() + "", wcf);
				num+=cals.get(i).getPnum();
				wws.addCell(label);
				label = new Label(3, (i + 2), cals.get(i).getTmoney() + "", wcf);
				money+=cals.get(i).getTmoney();
				wws.addCell(label);
				k=i;
			} 
			label = new Label(0, (k + 3), "合计", wcf);
			wws.addCell(label);
			label = new Label(1, (k + 3), "", wcf);
			wws.addCell(label);
			label = new Label(2, (k + 3), num+"", wcf);
			wws.addCell(label);
			label = new Label(3, (k + 3), money + "", wcf);
			wws.addCell(label);
			
			label = new Label(0, (k + 4), "制表人："+UNAME, wcf);
			wws.addCell(label);
			
			label = new Label(1, (k + 4), "部门负责人：", wcf);
			wws.addCell(label);
			label = new Label(2, (k + 4), "学生处：" , wcf);
			wws.addCell(label);
			label = new Label(3, (k + 4), "继续教育中心：" , wcf);
			wws.addCell(label);
		
			label = new Label(0, (k + 5),"主管院长：" , wcf);
			wws.addCell(label);
			label = new Label(1, (k + 5), "院长：", wcf);
			wws.addCell(label);
			label = new Label(2, (k + 5), "盖章" , wcf);
			wws.addCell(label);
			label = new Label(3, (k + 5), "财务处：" , wcf);
			wws.addCell(label);
	
			label = new Label(0, (k + 6), "", wcf);wws.addCell(label);
			label = new Label(1, (k + 6), "", wcf);wws.addCell(label);
			label = new Label(2, (k + 6), "", wcf);wws.addCell(label);
			label = new Label(3, (k + 6), "制表时间："+Tool.FData(new Date()) ,wcf);
			wws.addCell(label);
			
			label = new Label(0, (k + 7), "", wcf);wws.addCell(label);
			label = new Label(1, (k + 7), "", wcf);wws.addCell(label);
			label = new Label(2, (k + 7), "", wcf);wws.addCell(label);
			label = new Label(3, (k + 7), "打印格式：A4" , wcf);
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
	
	public String queryClassTj(){
		this.hql ="select t1.bjmc,count(t1.xsid),SUM(t2.money) from Stu t1,Kszs t2,Collage t3,Zyxx t4 "+
				"Where t1.xsid = t2.stu.xsid and t1.zyxx.zyid = t4.zyid and t3.xyid = t4.collage.xyid ";
		if (xy != 0) {
			this.hql += " AND t3.xyid=" + xy;
		}
		if (nj!=null && !nj.equals("0") && !nj.equals("")) {
			this.hql += " AND t1.nj='" + nj+"' ";
		}
		this.hql += "GROUP BY t1.bjmc ";
		List<Object[]> list = jlServer.executeQuery(hql, null);
		cals = new ArrayList<JlCal>();
		for (Object[] obj : list) {
			JlCal cal = new JlCal();
			cal.setBjmc((String) obj[0]);
			cal.setPnum(Integer.parseInt(obj[1].toString()));
			cal.setTmoney(Double.parseDouble(obj[2].toString()));
			cals.add(cal);
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	private void queryTotalJl() {
		//添加班级数
		this.hql = "SELECT t3.xymc,COUNT(t2.xsid),SUM(t1.money),SUM(t1.xf), COUNT( DISTINCT t2.bjmc) "
				+ " FROM Kszs t1,Stu t2,Collage t3,Zyxx t5 "
				+ " WHERE t1.stu.xsid = t2.xsid AND t2.zyxx.zyid = t5.zyid AND t5.collage.xyid = t3.xyid ";		 
		if (xy != 0) {
			this.hql += " AND t3.xyid=" + xy;
		}
		if (nj!=null && !nj.equals("0") && !nj.equals("")) {
			this.hql += " AND t2.nj='" + nj+"' ";
		}
		this.hql += " GROUP BY t3.xymc ";
		List<Object[]> list = jlServer.executeQuery(hql, null); 
		for (Object[] obj : list) {
			JlCal cal = new JlCal();
			cal.setXymc((String) obj[0]);
			cal.setPnum(Integer.parseInt(obj[1].toString()));
			cal.setTmoney(Double.parseDouble(obj[2].toString()));
			cal.setXf(Double.parseDouble(obj[3].toString()));
			//班级数
			cal.setStuclassnum(Integer.parseInt(obj[4].toString()));
			cals.add(cal);
		} 
	} 
	@JSON(serialize = false)
	public InputStream getInputStream() throws Exception {
		
		if(key==1){
			String filepath = ServletActionContext.getServletContext().getRealPath(
				"/excel/temp/RewardTotal"+UNAME+".xls");
			return new FileInputStream(filepath);
		}else {
			String filepath = ServletActionContext.getServletContext().getRealPath(
					"/excel/temp/CollageRewardDetial"+UNAME+".xls");
				return new FileInputStream(filepath);
		}
	}
}
