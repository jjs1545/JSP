package douzone.controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import douzone.controller.Controller;
import douzone.login.db.LoginDAO;
import douzone.login.db.LoginVO;

public class LoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String context = request.getContextPath();	
		
		// 1. login.jsp 넘겨준 정보 파라미터 얻어오기
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		// 2. LoginVO 객체에 파라미터 값 설정
		LoginVO loginVO = new LoginVO();
		loginVO.setId(id);
		loginVO.setPassword(password);
		
		// 3. 데이터베이스의 로그인 과정 수행
		LoginDAO dao = new LoginDAO();
		LoginVO userVO = dao.login(loginVO);
		
		// 4. 성공 시 세션 등록
		String msg = "";
		String url = "";
		if( userVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);
			
			msg = userVO.getName() + "님 환영합니다.";			
			url = context;
		} else {
			msg = "ID 또는 PASSWORD가 잘못 되었습니다.";
			url = "/boardProject/login.do";
			//유저 화면에 프로그램 위치를 감추기 위해
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/jsp/login/loginProcess.jsp";
	}	
}









