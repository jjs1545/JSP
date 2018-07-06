package douzone.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import douzone.board.db.BoardDAO;
import douzone.board.db.BoardVO;
import douzone.controller.Controller;

public class BoardWriteController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		System.out.println("id:"+id);
		BoardDAO dao = new BoardDAO();
		BoardVO board = new BoardVO();
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setWriter(id);
		
		dao.insertBoard(board);
		
		List<BoardVO> list = dao.selectAllBoard();
	
		request.setAttribute("list", list);
		return "/jsp/board/list.jsp";
	}

}
