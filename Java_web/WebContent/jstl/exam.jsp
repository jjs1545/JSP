<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--
		functions : fn
		EL에서 사용할 수 있는 함수를 제공 
	 -->
	<c:set var="msg" value="hello jstl"/>
	fn:length{"hello jstl" : ${fn:length(msg)} <br/>
	fn:subString(("hello jstl", 1, 4))
	${ fn: substring(msg,1,4) }<br/>
</body>
</html>