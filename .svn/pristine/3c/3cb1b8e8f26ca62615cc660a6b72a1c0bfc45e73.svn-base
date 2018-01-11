package com.iking.login.action;

import java.util.List;

import javax.annotation.Resource;

import com.iking.beans.Timelock;
import com.iking.inter.UserLoginInter;

public class Job1 {  

	@Resource
	public UserLoginInter userLoginServer;
	
	public void setUserLoginServer(UserLoginInter userLoginServer) {
		this.userLoginServer = userLoginServer;
	}
	
	
	public void doJob1() {  
		String hql = "from Timelock";
		List list = userLoginServer.executeQuery(hql, null);
//		if(list.isEmpty()){
//			Timelock t= new Timelock();
//			t.setBegintime("1000");
//			t.setEndtime("1365");
//			t.setRuntime("1000");
//			userLoginServer.add(t);
//		}else{
			Timelock t = (Timelock) list.get(0);
			int i = Integer.parseInt(t.getRuntime())-1;//每天减去1
			t.setRuntime(Integer.toString(i));
			userLoginServer.update(t);
			System.out.print("执行定时器");
		}
	}  

