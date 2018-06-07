<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  
		GET Method
		http://localhost:8080/Java_web/method?id=abc
		1. 파라미터가 URL에 표시되도 상관없는 경우 ex) 검색어, 페이지 넘버같은 일반적인 상황에 적합
		2. 4KB보다 적은 데이터를 보내는 경우
		
		
		POST Method
		http://localhost:8080/Java_web/method
		1. 파라미터가 URL 뒤에 표시되면 안되는 경우
			ex) 비밀번호, 계좌번호 등 개인정보에 적합
		2 4KB보다 많은 데이터를 보내는 경우
	-->
	<form action="/Java_web/method" method="get">
		id : <input type="text" size="10" name="id"/>
		<input type="submit" value="GET 호출"/> 
	</form>
	<form action="/Java_web/method" method="post">
		id : <input type="text" size="10" name="id"/>
		<input type="submit" value="POST 호출"/>
	</form>
</body>
</html>