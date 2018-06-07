<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
	String cName = request.getParameter("cName");
	String cValue = request.getParameter("cValue");
	
	//JSP의 또 다른 내장객체
	//쿠키 생성
	Cookie cookie = new Cookie(cName, cValue);
	
	//클라이언트 접속
	response.addCookie(cookie);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠키 설정 완료</h2>
	<a href="get.jsp">설정된 쿠키 완료</a>
</body>
</html>