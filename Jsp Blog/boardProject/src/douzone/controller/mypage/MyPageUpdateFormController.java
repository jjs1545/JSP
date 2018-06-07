package douzone.controller.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import douzone.controller.Controller;
import douzone.member.db.MemberDAO;
import douzone.member.db.MemberVO;

public class MyPageUpdateFormController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String id = (String)request.getParameter("id");
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.selectIdMember(id);
		
		request.setAttribute("member", vo);
		return "/jsp/member/myPageUpdateForm.jsp";
	}

}
