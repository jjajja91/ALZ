package alz.user.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//컨트롤러에 들어오는 요청과 응답을 가로채는 역할
//Filter와 비슷한 역할이나,
//Filter는 DispatcherServlet이 실행되기 전 , Interceptor는 DispatcherServlet이 실행된 후에 작동
public class UserInterceptor extends HandlerInterceptorAdapter {
	
	//preHandle : Controller 작동 전에 해당 메서드를 실행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		HttpSession session = request.getSession(false);
		if(session != null) {
			Object obj = session.getAttribute("sessionUser");
			if(obj != null) 
				return true;
		}
		
		response.sendRedirect(request.getContextPath() + "/");
		return false;
	}

	//postHandle : Controller 작동 후 해당 메서드를 실행
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		super.postHandle(request, response, handler, modelAndView);
	}

	//afterCompletion : Controller와 View 까지 모두 작동한 후 실행
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

		super.afterCompletion(request, response, handler, ex);
	}
}
