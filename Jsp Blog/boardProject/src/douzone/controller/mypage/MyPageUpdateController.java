package douzone.controller.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import douzone.controller.Controller;
import douzone.member.db.MemberDAO;
import douzone.member.db.MemberVO;

public class MyPageUpdateController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		String id = request.getParameter("id");
		System.out.println("id:"+id);
		vo.setId(id);
		vo.setPassword(request.getParameter("password"));
		vo.setTel1(request.getParameter("tel1"));
		vo.setTel2(request.getParameter("tel2"));
		
		System.out.println("tel2:"+vo.getTel2());
		
		vo.setTel3(request.getParameter("tel3"));
		vo.setEmail_id(request.getParameter("email_id"));
		vo.setEmail_domain(request.getParameter("email_domain"));
		vo.setBasic_addr(request.getParameter("basic_addr"));
		
		dao.UpdateMember(vo);
		
		MemberDAO dao2 = new MemberDAO();
		MemberVO member = dao2.selectIdMember(id);
		request.setAttribute("member", member);
		
		return "/jsp/member/myPage.jsp";
	}

}
