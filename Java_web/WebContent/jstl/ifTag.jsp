<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${empty param.type }">
		<h2>type Parameter가 전송되지 않았습니다.</h2>
	</c:if>
	<%--
		if(param.type이 비어있다면) {
			if(param.type이  S와 같다면) {
				println("관리자 입니다.");
			}
			if(param.type이 U와 같다면) {
				println("일반 사용자 입니다.");
			}
		}
		
	 --%> 
	<c:if test="${ not empty param.type }">
		<c:if test="${param.type=='S' }">
			<h2>관리자 입니다.</h2>
		</c:if>
		<c:if test="${param.type eq 'U' }">
			<h2>일반 사용자 입니다.</h2>
		</c:if>
	</c:if>
</body>
</html>