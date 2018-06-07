<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	pageContext 영역에 data 설정<br/>
	<c:set var = "data" value = "1"/>
	${data } <br/>
	<c:set var = "data" value = "${data + 1 }" scope = "request"/>
	${requestScope.data } <br/>
	<c:remove var = "data" scope = "request"/>
	<c:remove var = "data"/>
	page : ${data }<br/>
	request : ${requestScope.data }
</body>
</html>