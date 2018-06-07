<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/Java_web/hello" method="GET">
		아이디: <input type="text" size="10" name="id"/><br/>
		취미: ㄱㄱㄱㄱㄱ
		독서: <input type="checkbox" name="hobby" value="reading"/>
		음악: <input type="checkbox" name="hobby" value="music"/>
		코딩: <input type="checkbox" name="hobby" value="coding"/><br/>
		<input type="submit" value="전송"/>
	</form>
</body>
</html>