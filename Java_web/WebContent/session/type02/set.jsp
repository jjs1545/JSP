<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	//세션 등록
	session.setAttribute("id",id);
	session.setAttribute("password",password);
%>
	<h2>세션에 등록 완료</h2>
	<a href="get.jsp">세션 설정 확인</a>