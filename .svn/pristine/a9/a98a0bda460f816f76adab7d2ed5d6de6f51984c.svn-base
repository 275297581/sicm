package com.iking.basic;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthorityFilter implements Filter {

	@Override
	public void destroy() {

	}
	
	private String filters[] = new String[]{"/index.jsp","/querynotice","/image","/login","/validate.jsp","/pub","/css","/js","/pages/sessionout"}; 
	@Override
	public void doFilter(ServletRequest sRequest, ServletResponse sResponse,
			FilterChain filterChain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) sRequest;
		HttpServletResponse response = (HttpServletResponse) sResponse;
		HttpSession session = request.getSession();
		String url = request.getServletPath();
		String contextPath = request.getContextPath();
		if (url.equals(""))
			url += "/";
		
   // 若访问后台资源过滤到/index.jsp+/querynotice+/image.jsp+/validate.jsp+/login
		Boolean bol = true;
		for(String s : filters){
			bol =bol&&(url.startsWith("/") && !url.startsWith(s));
		}
//		-------------------------->注销后进行开始过滤
//		-------------------------->注销后进行开始过滤
//		bol = false;//-------------------------->注销后进行开始过滤
//		-------------------------->注销后进行开始过滤
//		-------------------------->注销后进行开始过滤
		if (bol){
			String userName = (String) session.getAttribute("userName");
			if (userName == null) {// 转入管理员登陆页面
				response.sendRedirect(contextPath + "/pages/sessionout.jsp");
				return;
			}
		}
		filterChain.doFilter(sRequest, sResponse);
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
