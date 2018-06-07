package douzone.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import douzone.board.db.BoardDAO;
import douzone.board.db.BoardVO;
import douzone.controller.Controller;

public class BoardDetailController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		
		String noStr = request.getParameter("no");
		String cntStr = request.getParameter("cnt");	//string으로 받고 
		System.out.println("noStr:"+noStr);
		System.out.println("cntStr:"+cntStr);
		
		int no= Integer.parseInt(noStr);				//테이블 no로 게시글 찾는다.
		int cnt = Integer.parseInt(cntStr);			//viewCnt 증가를 위한 cnt
		
		vo.setNo(no);
		dao.UpdateViewCnt(vo, cnt);
		
		BoardVO	board_detail = dao.selectDetailBoard(no);
		
		request.setAttribute("board_detail", board_detail);
		return "/jsp/board/boardDetail.jsp";
	}

}
