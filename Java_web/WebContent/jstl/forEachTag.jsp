<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String[] members = {"강다니엘", "아이유", "송민호"};
	pageContext.setAttribute("members", members);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="element" items="${members}">
		${ element }
	</c:forEach>
	<br/>
	
	<c:set var="cnt" value="1"/> <!-- int cnt = 1; -->
	<!--  for(String element : members) { -->	
	<c:forEach var="element" items="${ members }">
		<c:if test="${ cnt ne 1 }">, </c:if>
		${ element } <!-- print(element); -->
		<c:set var="cnt" value="${ cnt+1 }"/>	<!-- cnt++; -->
	</c:forEach> <!-- } -->
	<br/>
	
	<c:forEach var="element" items="${ members }" varStatus="Loop">	
		<c:if test="${ loop.count ne 1 }">, </c:if>
		${ element }
	</c:forEach>
	
	1 ~ 10 까지의 정수 출력<br/>
	<c:forEach var="i" begin="1" end="10">
		${ i }
	</c:forEach>
	
	1 ~ 100까지의 정수 합계 출력<br/>
	<c:set var="sum" value="0"/>
	<c:forEach var="i" begin="1" end="100">
		<c:set var="sum" value="${sum+i }"/>
	</c:forEach>
	합계 : ${sum } <br/>
	
	
	<select>
		<c:forEach var="year" begin="1970" end="2018">
			<option> ${year }</option>
		</c:forEach>
	</select>
</body>
</html>