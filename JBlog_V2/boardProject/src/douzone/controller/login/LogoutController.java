package douzone.controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import douzone.controller.Controller;

public class LogoutController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request,
								HttpServletResponse response
								) throws Exception {
		
		HttpSession session = request.getSession();
		// 로그인 중인 세션을 얻어와서
		
		session.invalidate(); //삭제해라.
		
		return "/jsp/login/logout.jsp";
	}
	
}
