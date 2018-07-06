package douzone.controller.join;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import douzone.board.db.BoardDAO;
import douzone.board.db.BoardVO;
import douzone.controller.Controller;
import douzone.member.db.MemberDAO;
import douzone.member.db.MemberVO;

public class JoinController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		MemberDAO dao = new MemberDAO();
		MemberVO member = new MemberVO();
		
		member.setId(request.getParameter("id"));
		member.setName(request.getParameter("name"));
		member.setPassword(request.getParameter("password"));
		member.setEmail_id(request.getParameter("email_id"));
		member.setEmail_domain(request.getParameter("email_domain"));
		member.setTel1(request.getParameter("tel1"));
		member.setTel2(request.getParameter("tel2"));
		member.setTel3(request.getParameter("tel3"));
		member.setBasic_addr(request.getParameter("basic_addr"));
		//member.setDetail_addr(request.getParameter("detail_addr"));

		dao.InsertMember(member);
		System.out.println("삽입완료");
		BoardDAO bDao = new BoardDAO();
		List<BoardVO> list = bDao.selectAllBoard();
		request.setAttribute("list", list);
		
		return "/jsp/board/list.jsp";
	}

}
