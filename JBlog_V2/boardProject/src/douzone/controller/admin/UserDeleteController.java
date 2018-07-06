package douzone.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import douzone.controller.Controller;
import douzone.member.db.MemberDAO;
import douzone.member.db.MemberVO;

public class UserDeleteController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDAO dao = new MemberDAO();
		MemberDAO dao2 = new MemberDAO();
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		
		dao.DeleteMember(id);
		List<MemberVO> list = dao2.selectAllMember();
		request.setAttribute("list", list);
		
		return "/jsp/member/userList.jsp";
	}

}
