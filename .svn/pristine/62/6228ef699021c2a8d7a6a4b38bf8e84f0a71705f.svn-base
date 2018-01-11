package com.iking.jcsj.server;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;

import com.iking.basic.BasicServer;
import com.iking.beans.Kszs;
import com.iking.beans.Scor;
import com.iking.beans.Stu;
import com.iking.beans.Zyzs;
import com.iking.inter.KszsXlsInter;
import com.iking.tools.Tool;

public class KszsXlsServer extends BasicServer implements KszsXlsInter {

	private String Mess;
	private ArrayList<List<String>> lists = null;
	private Session session = null;
	private int id = 0;

	@Override
	public String importExcel(String path) {
		Mess = "";
		lists = Tool.ReadXls(path);
		session = this.sessionFactory.getCurrentSession();
		setListToBeans();
		return "操作完成！\n" + Mess;
	}

	@Override
	public String importExcelXW(String path) {
		Mess = "";
		lists = Tool.ReadXls(path);
		session = this.sessionFactory.getCurrentSession();
		setListToXWBeans();
		return "操作完成！\n" + Mess;
	}

	@SuppressWarnings("unchecked")
	private void setListToBeans() {
		if (lists == null) {
			Mess = "上传文件存在问题！";
			return;
		}
		if (lists.size() < 2) {
			Mess = "获取Excel数据为空！";
			return;
		}
		if (lists.get(0).size() != 24) {
			Mess = "获取Excel模板格式错误！";
			return;
		}
		lists.remove(0);
		int i = 2;
		String zskey = "";
		int okcount = 0;
		int failcount = 0;

		for (List<String> list : lists) {
			try {
				String SFZ = "";
				if (list.get(4).equals("")) {
					if (!list.get(1).equals("")) {
						if (Tool.XHSF.containsKey(list.get(1)))
							SFZ = Tool.XHSF.get(list.get(1));
						else {
							Mess += "第" + i + "行数据导入未导入！未能找到学号对应的学生！\n";
							i++;
							failcount++;
							continue;
						}
					} else {
						Mess += "第" + i + "行数据导入未导入！学号或者身份证号至少一个不能为空！\n";
						i++;
						failcount++;
						continue;
					}
				} else {
					SFZ = list.get(4);
				}
				if (list.get(5).equals("")) {
					Mess += "第" + i + "行数据未能导入！学生姓名不能为空！\n";
					i++;
					failcount++;
					continue;
				}
				if (!list.get(5).equals(Tool.SFXM.get(SFZ))) {
					Mess += "第" + i + "行数据导入未导入！学号或身份证号与姓名不匹配！\n";
					i++;
					failcount++;
					continue;
				}
				if (list.get(17).equals("")) {
					Mess += "第" + i + "行数据未能导入！鉴定职业不能为空！\n";
					i++;
					failcount++;
					continue;
				}
				if (list.get(19).equals("")) {
					Mess += "第" + i + "行数据未能导入！等级归类不能为空！\n";
					i++;
					failcount++;
					continue;
				}
				// 已导入数据无需导入
				if (Tool.KSZS.containsKey(SFZ + list.get(17) + list.get(18))) {
					Mess += "第" + i + "行数据是重复数据！ \n";
					i++;
					failcount++;
					continue;
				}
				Kszs kszs = new Kszs();
				kszs.setIfhx("0");
				// 证书信息
				Zyzs zyzs = new Zyzs();
				zskey = Tool.SFZZY.get(SFZ) + list.get(17) + list.get(18);
				if (Tool.ZS.containsKey(zskey)) {
					/*if (Tool.HXZS.containsKey(SFZ)) {
						zyzs.setZsid(Tool.ZS.get("核心证书再次考"));
						kszs.setIfhx("2");
					} else {*/
						zyzs.setZsid(Tool.ZS.get(zskey));
						Tool.HXZS.put(SFZ, 0);
						kszs.setIfhx("1");
					/*}*/
				} else if (Tool.ZS.containsKey(list.get(17) + list.get(18))) {
					zyzs.setZsid(Tool.ZS.get(list.get(17) + list.get(18)));
				} else if (Tool.ZS1.containsKey(list.get(17) + list.get(18))) {
					zyzs.setZsid(Tool.ZS1.get(list.get(17) + list.get(18)));
					/*if (Tool.ZS1.containsKey("非专业核心证书")) {
						zyzs.setZsid(Tool.ZS1.get("非专业核心证书"));
					} else {
						Mess += "第" + i + "行数据未能导入！系统不存在非专业核心证书奖励！\n";
						i++;
						failcount++;
						continue;
					}*/
				} else {
					Mess += "第" + i + "行数据未能导入！本系统不存在该证书！\n";
					i++;
					failcount++;
					continue;
				}
				
				Stu stu = (Stu) session.load(Stu.class, Tool.XS.get(SFZ));
				// 判断学生是否信息工程学院
				if (list.get(17).equals("全国计算机等级考试") && list.get(18).equals("初级")) {
					if (stu.getZyxx().getCollage().getXymc().equals("信息工程学院")) {
						String hql = " FROM Zyzs where zsmc='" + list.get(17) + "' and zsdj='" + list.get(18) + "' and xymc='信息工程学院' ";
						List<Zyzs> zyzslist = executeQuery(hql, null);
						if (null != zyzslist && zyzslist.size() > 0) {
							zyzs = zyzslist.get(0);
						}
					} else {
						String hql = " FROM Zyzs where zsmc='" + list.get(17) + "' and zsdj='" + list.get(18) + "' and xymc!='信息工程学院' ";
						List<Zyzs> zyzslist = executeQuery(hql, null);
						if (null != zyzslist && zyzslist.size() > 0) {
							zyzs = zyzslist.get(0);
						}
					}
				}
				kszs.setZyzs(zyzs);
				kszs.setZsfl(Tool.ZSFL.get(list.get(17) + list.get(18)));
				kszs.setStu(stu);
				kszs.setKhh(stu.getKhh());
				kszs.setYhzh(stu.getYhzh());

				kszs.setZsbh(list.get(2).trim());
				// 成绩信息
				if(list.get(3)!=null&&!list.get(3).equals(""))
				{
					if (Tool.CJ.containsKey(list.get(3))) {
						Scor score = new Scor();
						score.setCjid(Tool.CJ.get(list.get(3)));
						kszs.setScor(score);
					}
				}
				kszs.setZkzh(list.get(3));
				kszs.setWhcd(list.get(7));
				kszs.setSsjh(list.get(13));
				kszs.setFzrq(list.get(14));
				kszs.setCdrq(list.get(15));
				kszs.setZsmc(list.get(17));
				kszs.setZsdj(list.get(18));
				kszs.setDjfl(list.get(19));
				kszs.setZybm(list.get(20));

				if (Tool.ZSJE.containsKey(zyzs.getZsid()))
					kszs.setMoney(Tool.ZSJE.get(zyzs.getZsid()));
				else
					kszs.setMoney("0");
				if (Tool.ZSXF.containsKey(zyzs.getZsid()))
					kszs.setXf(Tool.ZSXF.get(zyzs.getZsid()));
				else
					kszs.setXf("0");

				// 检查奖励明细 Kszs 中是否存在当前学生奖励, 如果存在判断实际奖励 money 是否超过当前奖励, 超过则制空所有其他记录,保留一条最高money记录奖励
				List<Kszs> listKszs = session.createQuery(" from Kszs where stu.xsid=:xsid ").setInteger("xsid", stu.getXsid()).list();
				if (listKszs.size() > 0) {
					List<Integer> kszsIdList = new ArrayList<Integer>();
					// 找出查询出来数据最大的金额和id
					Integer maxKszsIdInteger = 0;
					String maxKszsMoney = "0";
					boolean isOne=false;
					for (int j = 0; j < listKszs.size(); j++) {
						kszsIdList.add(listKszs.get(j).getKzid());
						if (!listKszs.get(j).getMoney().isEmpty() && Integer.valueOf(maxKszsMoney) < Integer.valueOf(listKszs.get(j).getMoney())) {
							maxKszsMoney = listKszs.get(j).getMoney();
							maxKszsIdInteger = listKszs.get(j).getKzid();
						}
					}

					kszs.setMoney(kszs.getMoney().isEmpty()?"0":kszs.getMoney());
					// 当前的奖励金额小于查询出来的最大值,实际的则不需要奖励,除最大奖励外的其他实际奖励制空为0
					if (Integer.valueOf(kszs.getMoney()) < Integer.valueOf(maxKszsMoney)) {	
						kszs.setMoney("0");
						kszs.setXf("0");
						// 排除最大的那个奖励
						kszsIdList.remove(maxKszsIdInteger);
						isOne=true;
												
					}
					if(kszsIdList.size()>0)
					{
						int result = session.createQuery("update Kszs set money=0, xf=0 where kzid in (:kzid) ").setParameterList("kzid", kszsIdList)
								.executeUpdate();	
						 if (result > 0) {
								Mess+="学生["+stu.getXm()+"] 存在多条奖励信息,已处理["+kszsIdList.size()+"]条数据.\n";
							}
					}
					else
					{
						if (isOne) {
							Mess+="学生["+stu.getXm()+"] 存在多条奖励信息,已处理[1]条数据.\n";
						}
					}
					
					
					
				}

				kszs.setQm(list.get(21));
				kszs.setRemark(list.get(22));
				kszs.setPdcj(list.get(23));
				kszs.setTimer(Tool.FData(new Date()));

				// session = this.sessionFactory.getCurrentSession();
				id = Integer.parseInt(session.save(kszs).toString());
				Tool.KSZS.put(SFZ + list.get(17) + list.get(18), id);
				session.clear();
				okcount++;
			} catch (Exception e) {
				Mess += "第" + i + "行数据导入失败！ \n";
				failcount++;
			}
			i++;
		}
		Mess += "总共" + lists.size() + "条数据!" + okcount + "条数据导入成功！" + failcount + "条数据导入失败！ \n";
	}

	private void setListToXWBeans() {
		if (lists == null) {
			Mess = "上传文件存在问题！";
			return;
		}
		if (lists.size() < 2) {
			Mess = "获取Excel数据为空！";
			return;
		}
		lists.remove(0);
		int i = 2;
		int okcount = 0;
		int failcount = 0;
		for (List<String> list : lists) {
			try {

				// 证书信息
				Zyzs zyzs = new Zyzs();
				if (!Tool.ZS.containsKey("校外证书")) {
					Mess += "系统不存在校外证书奖励！\n";
					i++;
					failcount++;
					return;
				} else {
					zyzs.setZsid(Tool.ZS.get("校外证书"));
				}

				String SFZ = "";
				if (list.get(1).equals("")) {
					Mess += "第" + i + "行数据未能导入！学号不能为空！\n";
					i++;
					failcount++;
					continue;
				} else {
					if (Tool.XHSF.containsKey(list.get(1)))
						SFZ = Tool.XHSF.get(list.get(1));
					else {
						Mess += "第" + i + "行数据导入未导入！未能找到学号对应的学生！\n";
						i++;
						failcount++;
						continue;
					}
				}
				if (list.get(2).equals("")) {
					Mess += "第" + i + "行数据未能导入！证书编号不能为空！\n";
					i++;
					failcount++;
					continue;
				}
				if (list.get(3).equals("")) {
					Mess += "第" + i + "行数据未能导入！身份证号不能为空！\n";
					i++;
					failcount++;
					continue;
				} else {
					SFZ = list.get(3);
				}
				if (list.get(4).equals("")) {
					Mess += "第" + i + "行数据未能导入！姓名不能为空！\n";
					i++;
					failcount++;
					continue;
				} else {
					if (!list.get(4).equals(Tool.SFXM.get(SFZ))) {
						Mess += "第" + i + "行数据导入未导入！学号或身份证号与姓名不匹配！\n";
						i++;
						failcount++;
						continue;
					}
				}
				if (list.get(5).equals("")) {
					Mess += "第" + i + "行数据未能导入！鉴定职业不能为空！\n";
					i++;
					failcount++;
					continue;
				}
				Kszs kszs = new Kszs();
				kszs.setZyzs(zyzs);

				Stu stu = (Stu) session.load(Stu.class, Tool.XS.get(SFZ));
				kszs.setStu(stu);
				if (!Tool.ZSSQ.containsKey(SFZ + list.get(5))) {
					Mess += "第" + i + "行数据未能导入！校外证书未进行申请或者申请未通过！\n";
					i++;
					failcount++;
					continue;
				}
				kszs.setKhh(stu.getKhh());
				kszs.setYhzh(stu.getYhzh());
				kszs.setZsfl("校外类");
				kszs.setZsbh(list.get(2).trim());
				kszs.setZsmc(list.get(5));
				kszs.setZsdj(list.get(6));
				kszs.setDjfl(list.get(7));
				if (Tool.ZSJE.containsKey(zyzs.getZsid()))
					kszs.setMoney(Tool.ZSJE.get(zyzs.getZsid()));
				else
					kszs.setMoney("0");
				if (Tool.ZSXF.containsKey(zyzs.getZsid()))
					kszs.setXf(Tool.ZSXF.get(zyzs.getZsid()));
				else
					kszs.setXf("0");
				kszs.setTimer(Tool.FData(new Date()));

				if (Tool.KSZS.containsKey(SFZ + list.get(5) + list.get(6))) {
					kszs.setKzid(Tool.KSZS.get(SFZ + list.get(5) + list.get(6)));
					session.merge(kszs);
				} else { // else do add
					id = Integer.parseInt(session.save(kszs).toString());
					Tool.KSZS.put(SFZ + list.get(5) + list.get(6), id);
				}
				okcount++;
			} catch (Exception e) {
				Mess += "第" + i + "行数据导入失败！ \n";
				failcount++;
			}
			i++;
		}
		Mess += "总共" + lists.size() + "条数据!" + okcount + "条数据导入成功！" + failcount + "条数据导入失败！ \n";
	}

}