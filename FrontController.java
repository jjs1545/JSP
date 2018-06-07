package douzone.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HandlerMapping mappings = null;
	
	public void init(ServletConfig config) throws ServletException {
		String configName = config.getInitParameter("configName");
		mappings = new HandlerMapping(configName);
	}
	
	public void service(HttpServletRequest request,
						HttpServletResponse response
			) throws ServletException, IOException {
		try {
			String uri = request.getRequestURI();
			String context = request.getContextPath();
			uri = uri.substring(context.length());
			/*
			 *  /mvc_web_2/jsp/login.do
			 *  => /login.do
			 */
			System.out.println("log : " + uri);
			Controller controller = mappings.getController(uri);
			System.out.println(controller);
			String callPage = controller.handleRequest(request, response);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
}










