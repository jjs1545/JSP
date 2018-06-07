<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%
	//request.setAttribute("id", request.getParameter("id"));
	//영역을 공유하지 않으므로,
	//parameter를 받아서 user 영역에 등록!
	request.setAttribute("id", request.getParameter("id"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${param.id eq 'admin' }">
		<% response.sendRedirect("admin.jps"); %>
	</c:if>
	
	<c:if test="${param.id ne 'admin' }">
		<%
			response.sendRedirect("user.jsp");
		%>
	</c:if>
</body>
</html>