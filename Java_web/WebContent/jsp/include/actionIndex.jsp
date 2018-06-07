<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="commonJsp.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		다른 파일을 삽입함으로써,
		JSP를 Java로 변환 후 컴파일 시키는 방식 	
		Include directive (디렉티브)
	 --%>
	<h4>정적인 include</h4>
	<%= msg %><br/>
	
	<%--
		include 요청 시 실행흐름을 옮김으로,
		해당 파일의 결과를 현 위치에 포함시킨다.
		Include action (액션)
	 --%>
	<h4>동적인 include</h4>
	<h4>parameter 미설정 호출!</h4>
	<jsp:include page="dynamic.jsp"/>
	<h4>parameter 설정 후 호출!</h4>
	<jsp:include page="dynamic.jsp">
		<jsp:param value="Hello" name="id"/>
	</jsp:param>
</body>
</html>