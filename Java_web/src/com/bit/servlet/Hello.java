package com.bit.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Hello
 */
@WebServlet("/Hello")
public class Hello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Hello() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//text/html: text를 인식하되 html 태그로 인식,
		//text/text: text를 인식하되 html 태그가 아닌 text로 인식
		response.setContentType("text/html; charset=UTF-8");
		String id = request.getParameter("id");
		String[] hobby = request.getParameterValues("hobby");
		PrintWriter out = response.getWriter();
		out.println("아이디: "+ id);
		out.println("ㅁㄴㅇㅁㄴㅇㅁㄴㅇ<br/>");
		for(String h : hobby) {
			out.println(" : "+ h + "<br/>");
		}
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		request.setCharacterEncoding("utf-8");
	}

}
