package douzone.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import douzone.board.db.BoardDAO;
import douzone.board.db.BoardVO;
import douzone.controller.Controller;

public class BoardController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BoardDAO dao = new BoardDAO();
		List<BoardVO> list = dao.selectAllBoard();
	
		request.setAttribute("list", list);
		
		return "/jsp/board/list.jsp";
	}

}

