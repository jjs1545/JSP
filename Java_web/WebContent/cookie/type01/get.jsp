<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Cookie[] cookies = request.getCookies();

	StringBuilder sb = new StringBuilder();
	if(cookies != null) {
		for(Cookie c : cookies) {
			String cName = c.getName();
			String cValue = c.getValue();
			sb.append("쿠키 이름 : " + cName + "<br/>");
			sb.append("쿠키 값    :"  + cValue + "<br/>");
		}
	}	else{
		sb.append("설정된 쿠키 정보가 없습니다.");
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>설정된 쿠키 정보</h2>
	<%= sb.toString() %>
	<a href="indexForm.jsp">쿠키 설정화면 이동</a>
</body>
</html>