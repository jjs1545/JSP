<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<%--
		HTTP의 단점 
		Connectionless: 클라이언트의 request를 서버에 보내면, 
						서버는 클라이언트에게 response를 보낸다.
		Stateless: 접속을 끊는 순간 서버와의 통신 유지가 사라지는 특징
		
		
				
		쿠키 (Cookie)
			1. 클라이언트 저장되는 데이터
			2. HTTP의 일종으로 클라이언트에 데이터를 저장하는 파일
			3. Login, HOST 정보등을 저장
			
		세션 (Session)
			1. 서버에 저장되는 임시 데이터
	 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="set.jsp" method="post">
		쿠키 이름: <input type="text" name="cName" size="20"/> <br/>
		쿠키 값   : <input type="text" name="cValue" size="20"/> <br/>
		<input type="submit" value="쿠키 설정"/>
	</form>
</body>
</html>