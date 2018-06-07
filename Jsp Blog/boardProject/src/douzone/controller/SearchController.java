package douzone.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import douzone.board.db.BoardDAO;
import douzone.board.db.BoardVO;

public class SearchController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		//request.setCharacterEncoding("utf-8");
		BoardDAO dao = new BoardDAO();
		List<BoardVO> list;
		
		String Theme = request.getParameter("Theme");
		String search = request.getParameter("search");
		System.out.println(search);

		list = dao.searchBoard(Theme,search);
		request.setAttribute("list", list);

		return "/jsp/board/list.jsp";
	}

}
