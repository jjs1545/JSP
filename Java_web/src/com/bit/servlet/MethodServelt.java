package com.bit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ref.ReferenceQueue;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MethodServelt")
public class MethodServelt extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	
	public MethodServelt() {
		super();
	}
	
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		response.getWriter().append("Served at: ")
							.append(request.getContextPath());
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doGet(request, response);
	}
}
