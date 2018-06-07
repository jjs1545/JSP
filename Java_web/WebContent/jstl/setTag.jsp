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
		EL의 Scope 인식 범위
		pageContext -> request -> session -> application
		
		{$ msg}
		pageContext가 존재하면
			page 영역의 msg를 참조
		pageContext가 존재하지 않고
			request에 msg가 존재한다면 request 영역의 msg를 참조
	 --%>
	<!-- 1 값을 가지는 변수 cnt를 pageContext에 설정<br/> -->

	<c:set var="cnt" value="1"/>
	
	<%-- pageContext에 설정된 변수 cnt 출력 : 
	
	${ cnt }<br/>
	변수 cnt의 값 1 증가 :
	<c:set var="cnt" value="${cnt+1}" scope="request"/> --%>
	
	pageContext 영역 : ${ cnt } <br/>
	request 영역 : ${ requestScope.cnt } <br/>
	
	<%-- EL 인식 범위에 따른 값 변화를 확인! --%>
</body>
</html>