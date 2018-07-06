package douzone.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import douzone.controller.Controller;
import douzone.member.db.MemberDAO;
import douzone.member.db.MemberVO;

public class UserUpdateController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		String id = request.getParameter("id2");
		System.out.println("id:"+id);
		vo.setId(id);
		vo.setPassword(request.getParameter("password"));
		/*vo.setTel1(request.getParameter("tel1"));
		vo.setTel2(request.getParameter("tel2"));
		System.out.println("tel2:"+vo.getTel2());
		vo.setTel3(request.getParameter("tel3"));
		vo.setEmail_id("email_id");
		vo.setEmail_domain("email_domain");
		vo.setBasic_addr("basic_addr");*/
		
		dao.UpdateMember(vo);
		
		MemberDAO dao2 = new MemberDAO();
		MemberVO member = dao2.selectIdMember(id);
		request.setAttribute("member", member);
		
		
		return "/jsp/member/userDetailForm.jsp";
	}

}
