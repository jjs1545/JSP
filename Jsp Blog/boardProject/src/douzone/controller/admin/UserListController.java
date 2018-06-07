package douzone.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import douzone.controller.Controller;
import douzone.member.db.MemberDAO;
import douzone.member.db.MemberVO;

public class UserListController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDAO dao = new MemberDAO();
		List<MemberVO> list = dao.selectAllMember();
		request.setAttribute("list", list);
		
		return "/jsp/member/userList.jsp";
	}

}
