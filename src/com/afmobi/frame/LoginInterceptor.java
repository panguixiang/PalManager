package com.afmobi.frame;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	/**
	 * 请求到达action之前进行拦截校验session是否有效
	 */
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		String url = request.getRequestURI();
		if(url.indexOf("body")>-1) {
			return true;
		}
		Object obj = request.getSession()
				.getAttribute(ContentObject.LOGIN_SESSION);
		if (obj == null) {
            PrintWriter out = response.getWriter();  
            StringBuilder builder = new StringBuilder();  
            builder.append("<script type=\"text/javascript\" charset=\"UTF-8\">");  
            builder.append("location.href='/PalmplayManager/body/initLogin'");  
            builder.append("</script>");  
            out.print(builder.toString());  
            out.close();
			return false;
		}
		return true;
	}

	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}