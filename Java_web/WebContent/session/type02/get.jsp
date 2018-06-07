<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("id");
	String password = (String)session.getAttribute("password");
%>

설정된 세션 아이디 : <%= id %> <br/>
설정된 세션 아이디 : ${ id } <br/>
설정된 세션 패스워드 : <%= password %> <br/>
<a href="remove.jsp">설정된 세션 삭제</a>