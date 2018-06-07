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
	<%--
		<c:choose> 태그
			: if~else 혹은 switch~case문과 비슷하다.
		<c:when>
			: if else나 case 유사하게 내부 조건을 비교
		<c:otherwise>
			: defalut와 유사하게 조건이 만족하지 않은 경우
	 --%>
	<c:choose>
		<c:when test="${param.type eq 'S' }">
			<h2>관리자 입니다.</h2>
		</c:when>
		<c:when test="${param.type eq 'U' }">
			<h2>일반 사용자 입니다.</h2>
		</c:when>
		<c:otherwise>
			<h2>type parameter가 전송되지 않았습니다.</h2>
		</c:otherwise>
	</c:choose>
</html>