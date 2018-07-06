package douzone.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import douzone.controller.Controller;
import douzone.member.db.MemberDAO;
import douzone.member.db.MemberVO;

public class UserUpdateFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		System.out.println("id:"+id);
		
		MemberDAO dao = new MemberDAO();
		MemberVO member = dao.selectIdMember(id);
		
		request.setAttribute("member", member);	
		
		return "/jsp/member/userUpdateForm.jsp";
	}

}
