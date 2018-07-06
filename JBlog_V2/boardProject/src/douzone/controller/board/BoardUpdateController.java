package douzone.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import douzone.board.db.BoardDAO;
import douzone.board.db.BoardVO;
import douzone.controller.Controller;

public class BoardUpdateController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String n = request.getParameter("no"); // 게시판 번호를 활용해서 수정하기 위한 parameter 받기
		
		int num = Integer.parseInt(n);
		System.out.println("num:"+n);
		BoardDAO dao = new BoardDAO();
		BoardVO board = new BoardVO();
		
		board.setNo(num);
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		
		dao.UpdateBoard(board);
		
		List<BoardVO> list = dao.selectAllBoard();
		request.setAttribute("list", list);
		
		return "/jsp/board/list.jsp";
	}

}
