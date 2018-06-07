package douzone.controller.join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import douzone.controller.Controller;

public class JoinFormController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/jsp/join/joinForm.jsp";
	}

}
