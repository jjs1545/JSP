package douzone.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import douzone.board.db.BoardDAO;
import douzone.board.db.BoardVO;
import douzone.controller.Controller;

public class BoardDeleteController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String n = request.getParameter("no");
		
		int num = Integer.parseInt(n);
		System.out.println("num:"+n);
		BoardDAO dao = new BoardDAO();
		BoardVO board = new BoardVO();
		
		board.setNo(num);
		dao.DeleteBoard(board);
		
		List<BoardVO> list = dao.selectAllBoard();
		
		request.setAttribute("list", list);
		return "/jsp/board/list.jsp";
	}

}
