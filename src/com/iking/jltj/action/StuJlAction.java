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
import com.iking.beans.Bmxx;
import com.iking.beans.JlCal;
import com.iking.beans.Kszs;
import com.iking.beans.Scor;
import com.iking.beans.Stu;
import com.iking.beans.Stuzs;
import com.iking.beans.Zyxx;
import com.iking.beans.Zyzs;
import com.iking.inter.StuJlInter;
import com.iking.tools.Tool;

@SuppressWarnings({ "unchecked", "serial" })
public class StuJlAction extends BasicAction {

	@Resource
	private StuJlInter StuJlServer;
	private String ref ="";
	private List<Kszs> kszs =null; 
	
	public List<Kszs> getKszs() {
		return kszs;
	}

	public void setKszs(List<Kszs> kszs) {
		this.kszs = kszs;
	}
	private String title ;
	public void setTitle(String title) {
		try {
			this.title = URLDecoder.decode(title , "UTF-8");
		} catch (UnsupportedEncodingException e) {
			this.title ="";
		};
	}

	public void setStuJlServer(StuJlInter stuJlServer) {
		StuJlServer = stuJlServer;
	}

	private String filename;

	public String getFilename() {
		return filename;
	}

	private String xymc;
	public String getXymc() {
		return xymc;
	}

	public void setXymc(String xymc) {
		this.xymc = xymc;
	}

	public String getZymc() {
		return zymc;
	}

	public void setZymc(String zymc) {
		this.zymc = zymc;
	}

	public String getZsmc() {
		return zsmc;
	}

	public void setZsmc(String zsmc) {
		this.zsmc = zsmc;
	}

	public String getFzjg() {
		return fzjg;
	}

	public void setFzjg(String fzjg) {
		this.fzjg = fzjg;
	}

	public String getZsdj() {
		return zsdj;
	}

	public void setZsdj(String zsdj) {
		this.zsdj = zsdj;
	}

	public String getZsfl() {
		return zsfl;
	}

	public void setZsfl(String zsfl) {
		this.zsfl = zsfl;
	}

	public String getJlbz() {
		return jlbz;
	}

	public void setJlbz(String jlbz) {
		this.jlbz = jlbz;
	}

	public String getXf() {
		return xf;
	}

	public void setXf(String xf) {
		this.xf = xf;
	}
	private String msg;
	
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	private String zsid;
	public String getZsid() {
		return zsid;
	}

	public void setZsid(String zsid) {
		this.zsid = zsid;
	}

	private String zymc;
	private String zsmc;
	private String fzjg;
	private String zsdj;
	private String zsfl;
	private String jlbz;
	private String xf;
	private String zsids;
	
	public String getZsids() {
		return zsids;
	}

	public void setZsids(String zsids) {
		this.zsids = zsids;
	}

	private int xy;
	private int zy;
	private String nj;
	private String zs; 
	private int index;
	private List<Stuzs> stuzss;
	private int count;
	private List<JlCal> cals;

	private Zyzs zyzs;
	public Zyzs getZyzs() {
		return zyzs;
	}

	public void setZyzs(Zyzs zyzs) {
		this.zyzs = zyzs;
	}

	public List<JlCal> getCals() {
		return cals;
	}

	public int getCount() {
		return count;
	}

	public List<Stuzs> getStuzss() {
		return stuzss;
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

	public void setZs(String zs) {
		this.zs = zs;
	}

	public void setIndex(int index) {
		this.index = index;
	}
	 
	public String queryStuJlAll() {
		getRef();
		this.hql = "SELECT t1 " + ref;
		kszs = StuJlServer.executeQuery(hql, null);
		setBeans();
		return SUCCESS;
	}
	public String queryStuJl() {
		getRef();
		this.hql = "SELECT COUNT(*) " + ref;
		count = Integer.parseInt(StuJlServer.uniqueQuery(hql, null).toString());

		this.hql = "SELECT t1 " + ref;
		kszs = StuJlServer.executeQueryByPage(hql, null, index,
				this.pageSize); 
		setBeans();
		return SUCCESS;
	}
	
	/** 完整版奖励明细信息 **/
	public String queryStuJlExtends() {
		getRef();
		this.hql = "SELECT COUNT(*) " + ref;
		count = Integer.parseInt(StuJlServer.uniqueQuery(hql, null).toString());

		this.hql = "SELECT t1 " + ref;
		kszs = StuJlServer.executeQueryByPage(hql, null, index,
				this.pageSize); 
		return SUCCESS;
	}

	public String exportStuJl() {
		inputStuJlFile();
		filename = "RewardDetail.xls";
		return SUCCESS;
	}
	String UNAME="";
	private void inputStuJlFile() {
		
		UNAME =  (String) ServletActionContext.getContext().getSession()
				.get("userName");
		// 查询数据
		String ref = "FROM Kszs t1,Stu t2,Zyxx t3,Collage t4,Zyzs t5 "
				+ "WHERE t1.stu.xsid=t2.xsid AND t2.zyxx.zyid=t3.zyid AND t3.collage.xyid=t4.xyid "
				+ "AND t1.zyzs.zsid = t5.zsid ";
		if (xy != 0) {
			ref += " AND t4.xyid=" + xy;
		}
		if (zy != 0) {
			ref += " AND t3.zyid=" + zy;
		}
		if (nj != null && !nj.trim().equals("")) {
			ref += " AND t2.nj='" + nj.trim() + "' ";
		}
		if (zs != null && (zs.trim().equals("校外证书")||zs.trim().equals("非专业核心证书"))) {
			ref += " AND t1.zyzs.zsmc='" + zs.trim() + "' ";
		}else if (zs != null && !zs.trim().equals("")) {
			ref += " AND t1.zsmc='" + zs.trim() + "' ";
		} 
		this.hql = "SELECT t1 " + ref;
		List<Kszs> kszs = StuJlServer.executeQuery(hql, null);
		// 拷贝模板
		WritableWorkbook wwb = null;
		WritableSheet wws = null;
		FileOutputStream out = null;
		// 获取要读取的EXCEL表格模板
		String filepath = ServletActionContext.getServletContext().getRealPath(
				"/excel");

		File is = new File(filepath + "/rewarddetail.xls");

		// 写入到新的表格里
		File savefile = new File(filepath + "/temp/", "rewarddetail"+UNAME+".xls");
		if (savefile.exists())
			savefile.delete();
		try {
			if(!savefile.getParentFile().exists() && !savefile.getParentFile().isDirectory()){
				savefile.getParentFile().mkdirs();
			}
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
			double total = 0;
			try {
				
				label = new Label(0, 0, title, wcf);
				wws.addCell(label);
				
				for (int i = 0; i < kszs.size(); i++) {
					label = new Label(0, (i + 2), (i + 1) + "", wcf);
					wws.addCell(label);
					
					label = new Label(1, (i + 2), kszs.get(i).getStu()
							.getZyxx().getCollage().getXymc(), wcf);
					wws.addCell(label);
					
					label = new Label(2, (i + 2), kszs.get(i).getStu()
							.getZyxx().getZymc(), wcf);
					wws.addCell(label);
					
					label = new Label(3, (i + 2), kszs.get(i).getStu().getNj(),
							wcf);
					wws.addCell(label);
					
					label = new Label(4, (i + 2), kszs.get(i).getStu().getXm(),
							wcf);
					wws.addCell(label);
					
					label = new Label(5, (i + 2), kszs.get(i).getStu().getXb(),
							wcf);
					wws.addCell(label);
					
					label = new Label(6, (i + 2), kszs.get(i).getStu().getXh(), wcf);
					wws.addCell(label);
					
					label = new Label(7, (i + 2), kszs.get(i).getStu().getSfzh(), wcf);
					wws.addCell(label);
					
					label = new Label(8, (i + 2),
							kszs.get(i).getYhzh() != null ? kszs.get(i).getYhzh() : "", wcf);
					wws.addCell(label);
					
					label = new Label(9, (i + 2), kszs.get(i).getZsmc(), wcf);
					wws.addCell(label);
					
					label = new Label(10, (i + 2), kszs.get(i).getMoney(), wcf);
					wws.addCell(label);
					
					label = new Label(11, (i + 2), kszs.get(i).getXf(), wcf);
					wws.addCell(label);
					
					label = new Label(12, (i + 2), kszs.get(i).getQm(), wcf);
					wws.addCell(label);
					
					label = new Label(13, (i + 2), kszs.get(i).getRemark(), wcf);
					wws.addCell(label);
					
					if (kszs.get(i).getMoney() != null
							&& !kszs.get(i).getMoney().equals(""))
						total += Double.parseDouble(kszs.get(i).getMoney());
				}
				// 奖励金额合计
				int i = kszs.size();
				wcf = new WritableCellFormat();
				label = new Label(0, (i + 2), "金额合计", wcf);
				wws.addCell(label);
				label = new Label(10, (i + 2), total + "", wcf);
				wws.addCell(label);

				i = i + 2;
				wcf = new WritableCellFormat();
				label = new Label(0, (i + 1), "部门：学生处", wcf);
				wws.addCell(label);
				label = new Label(2, (i + 1), "制表人："
						+ UNAME, wcf);
				wws.addCell(label);
				label = new Label(4, (i + 1), "部门负责人：", wcf);
				wws.addCell(label);
				label = new Label(6, (i + 1), "主管院领导：", wcf);
				wws.addCell(label);
				label = new Label(8, (i + 1), "院长：", wcf);
				wws.addCell(label);
				label = new Label(10, (i + 1), "财务：", wcf);
				wws.addCell(label);
				label = new Label(12, (i + 1),
						"制表时间：" + Tool.FData(new Date()), wcf);
				wws.addCell(label);
				wwb.write();
			} catch (Exception e) {
				wwb.write();
			}
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
				"/excel/temp/rewarddetail"+UNAME+".xls");
		return new FileInputStream(filepath);
	}

	public String queryJl() {		
		String bjhql="SELECT COUNT( DISTINCT s.bjmc) FROM Stu s,Zyxx z1,Kszs k1 WHERE k1.stu.xsid=s.xsid AND s.zyxx.zyid=z1.zyid AND z1.collage.xyid=t5.collage.xyid";
		if (nj!=null && !nj.equals("")) {
			bjhql+= " AND s.nj='" + nj+"' ";
		}
		
		//统计为奖励维护中的金额
		//this.hql = "SELECT t3.xymc,COUNT(t2.xsid),SUM(t1.zyzs.jlbz),SUM(t1.zyzs.xf),t3.xyid,("+bjhql+")  "
		
		//统计为实际的奖励金额和学分
		this.hql = "SELECT t3.xymc,COUNT(t2.xsid),SUM(t1.money),SUM(t1.xf),t3.xyid,("+bjhql+")  "
					+ " FROM Kszs t1,Stu t2,Collage t3,Zyxx t5 "
					+ " WHERE t1.stu.xsid = t2.xsid AND t2.zyxx.zyid = t5.zyid AND t5.collage.xyid = t3.xyid ";			
		if (xy != 0) {
			this.hql += " AND t3.xyid=" + xy;
		}
		if (nj!=null && !nj.equals("")) {
			this.hql += " AND t2.nj='" + nj+"' ";
		}
		this.hql += " GROUP BY t3.xymc ";
		List<Object[]> list = StuJlServer.executeQuery(hql, null);
		cals = new ArrayList<JlCal>();
		for (Object[] obj : list) {
			JlCal cal = new JlCal();
			cal.setXymc((String) obj[0]);
			cal.setPnum(Integer.parseInt(obj[1].toString()));
			cal.setTmoney(Double.parseDouble(obj[2].toString()));
			cal.setXf(Double.parseDouble(obj[3].toString()));
			cal.setXyid(Integer.parseInt(obj[4].toString()));
			cal.setStuclassnum(Integer.parseInt(obj[5].toString()));
			cals.add(cal);
		}
		return SUCCESS;
	} 

	public String queryClassTj(){
		//奖励维护中标准金额和学分汇总
		//this.hql ="select t1.bjmc,count(t1.xsid),SUM(t2.zyzs.jlbz),SUM(t2.zyzs.xf),t3.xymc from Stu t1,Kszs t2,Collage t3,Zyxx t4 "+
		
		//具体实际的金额和学分
		this.hql ="select t1.bjmc,count(t1.xsid),SUM(t2.money),SUM(t2.xf),t3.xymc from Stu t1,Kszs t2,Collage t3,Zyxx t4 "+
				"Where t1.xsid = t2.stu.xsid and t1.zyxx.zyid = t4.zyid and t3.xyid = t4.collage.xyid ";
		if (xy != 0) {
			this.hql += " AND t3.xyid=" + xy;
		}
		if (nj!=null && !nj.equals("0")) {
			this.hql += " AND t1.nj='" + nj+"' ";
		}
		this.hql += "GROUP BY t1.bjmc ";
		List<Object[]> list = StuJlServer.executeQuery(hql, null);
		cals = new ArrayList<JlCal>();
		for (Object[] obj : list) {
			JlCal cal = new JlCal();
			cal.setBjmc((String) obj[0]);
			cal.setPnum(Integer.parseInt(obj[1].toString()));
			cal.setTmoney(Double.parseDouble(obj[2].toString()));
			cal.setXymc((String) obj[3]);
			cals.add(cal);
		}
		return SUCCESS;
	}
	
	private void getRef(){
		ref = "FROM Kszs t1,Stu t2,Zyxx t3,Collage t4,Zyzs t5 "
				+ "WHERE t1.stu.xsid=t2.xsid AND t2.zyxx.zyid=t3.zyid AND t3.collage.xyid=t4.xyid "
				+ "AND t1.zyzs.zsid = t5.zsid ";
		if (xy != 0) {
			ref += " AND t4.xyid=" + xy;
		}
		if (zy != 0) {
			ref += " AND t3.zyid=" + zy;
		}
		if (nj != null && !nj.trim().equals("")) {
			ref += " AND t2.nj='" + nj.trim() + "' ";
		} 
		if (zs != null && (zs.trim().equals("校外证书")||zs.trim().equals("非专业核心证书")||zs.trim().equals("核心证书再次考"))) {
			ref += " AND t1.zyzs.zsmc='" + zs.trim() + "' ";
		}else if (zs != null && !zs.trim().equals("")) {
			ref += " AND t1.zsmc='" + zs.trim() + "' ";
		} 
	}
	private void setBeans(){
		stuzss = new ArrayList<Stuzs>();
		for (Kszs zs : kszs) {
			Stuzs stuzs = new Stuzs();
			stuzs.setId(zs.getKzid());
			stuzs.setXymc(zs.getStu().getZyxx().getCollage().getXymc());
			//stuzs.setJlbz(zs.getMoney());
			stuzs.setJlbz(zs.getZyzs().getJlbz());
			stuzs.setNj(zs.getStu().getNj());
			stuzs.setBj(zs.getStu().getBjmc());
			stuzs.setRemark(zs.getRemark());
			stuzs.setSfzh(zs.getStu().getSfzh());
			stuzs.setXb(zs.getStu().getXb());
			//stuzs.setXf(zs.getXf());
			stuzs.setXf(zs.getZyzs().getXf());
			stuzs.setXh(zs.getStu().getXh());
			stuzs.setKhh(zs.getKhh()==null?"":zs.getKhh());
			stuzs.setYhzh(zs.getYhzh()==null?"":zs.getYhzh());
			stuzs.setZymc(zs.getStu().getZyxx().getZymc());
			stuzs.setQm(zs.getQm());
			stuzs.setZsmc(zs.getZsmc());
			stuzs.setXm(zs.getStu().getXm());
			stuzs.setDj(zs.getZsdj()); 
			stuzs.setZsbh(zs.getZsbh());
			stuzss.add(stuzs);
		}
	}
	// 证书信息录入
	public String savezyzs() {	
		String hql=" FROM Zyzs WHERE zymc='"+zymc+"' AND  xymc='"+xymc+"' AND zsmc='"+zsmc+"' AND zsdj='"+zsdj+"' ";
		List<Zyzs> list=StuJlServer.executeQuery(hql, null);
		if(null!=list&&list.size()>0)
		{
			msg = "该证书已经存在，不能重复添加！";
		}
		else
		{
			Zyzs zyzs = new Zyzs();
			zyzs.setFzjg(fzjg);
			zyzs.setJlbz(jlbz);
			zyzs.setZymc(zymc);
			zyzs.setXymc(xymc);
			zyzs.setZsmc(zsmc);
			zyzs.setZsdj(zsdj);
			zyzs.setZsfl(zsfl);
			zyzs.setXf(xf);
			try {
				StuJlServer.add(zyzs);
				msg = "保存成功！";	
			} catch (Exception e) {
				msg = "保存失败！";
				e.printStackTrace();
			}			
		}
		return SUCCESS;		
	}
	//回写证书
	public String queryzyzs(){
		 zyzs = (Zyzs) StuJlServer.getById(Zyzs.class, Integer.parseInt(zsid));
		return SUCCESS;
	}
	// 证书信息修改
		@SuppressWarnings("unchecked")
		public String updatezyzs() {
			Zyzs zyzs = (Zyzs) StuJlServer.getById(Zyzs.class, Integer.parseInt(zsid));
			zyzs.setFzjg(fzjg);
			zyzs.setJlbz(jlbz);
			zyzs.setZymc(zymc);
			zyzs.setXymc(xymc);
			zyzs.setZsmc(zsmc);
			zyzs.setZsdj(zsdj);
			zyzs.setZsfl(zsfl);
			zyzs.setXf(xf);
			String hql = " From Kszs k where k.zyzs.zsid='"+zsid+"'";
			List<Kszs> list =StuJlServer.executeQuery(hql, null);
			if(null!=list&&list.size()>0)
			{
				for (Kszs kszs : list) {
					if(null!=kszs)
					{
					kszs.setMoney(jlbz);
					kszs.setZsmc(zsmc);
					kszs.setZsdj(zsdj);
					kszs.setZsfl(zsfl);
					kszs.setXf(xf);
					StuJlServer.update(kszs);
					}
				}
			}
			try {
				StuJlServer.update(zyzs);
				msg = "修改成功！";	
			} catch (Exception e) {
				msg = "修改失败！";
				e.printStackTrace();
			}
			
			return SUCCESS;
		}
		
		public String deletezyzs() {
			try {
				String [] xsids =zsids.split(",");
				for(String id : xsids){
					String sql = "select * from kszs k where k.zsid='"+id+"'";
					List<Kszs> list = StuJlServer.executeQueryBySql(sql, null);
					if(!list.isEmpty()){
						this.msg = "有证书已被使用，禁止删除！";
						return SUCCESS;
					}
				}
				StuJlServer.deleteZs(zsids);
				this.msg = "信息删除成功！";
			} catch (Exception e) {
				e.printStackTrace();
				this.msg = "信息删除失败！重新进行删除";
			}
			return SUCCESS;
		}
}
