<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%
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
		<jsp:forward page="admin.jsp"/>
	</c:if>
	
	<%-- 영역을 공유하는지 확인하기 위해 관리자로 조건! --%>
	<%-- index에서 admin이 아닌 다른 id를 전송해보겠다. --%>
	<c:if test="${param.id ne 'admin' }">
		<jsp:forward page="user.jsp">
			<jsp:param name="id" value="${param.id}"/>
		</jsp:forward>
	</c:if>
	
	<%-- <c:if test="${param.id ne 'admin' }">
		<jsp:forward page="user.jsp">
			<jsp:param name="id" value="${param.id}"/>
		</jsp:forward>
	</c:if> --%>
</body>
</html>