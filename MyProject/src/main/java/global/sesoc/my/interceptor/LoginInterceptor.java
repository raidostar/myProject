package global.sesoc.my.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			
			HttpSession session = request.getSession();
			
			String loginId = (String)session.getAttribute("loginId");
			
			if(loginId == null) {
				String contextPath = request.getContextPath();
				response.sendRedirect(contextPath+"/loginForm");
				return false;	
			}			
			return true;
		}
}
