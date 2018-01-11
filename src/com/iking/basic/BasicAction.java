package com.iking.basic;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext; 

import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
public class BasicAction extends ActionSupport{
	
	public String hql="";
	public Object [] parameters = null;
	public HttpServletResponse response =(HttpServletResponse)ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
	public HttpServletRequest request = (HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	public String [] WEEK ={"星期日","星期一","星期二","星期三","星期四","星期五","星期六"};
	public int pageSize =20;
}
