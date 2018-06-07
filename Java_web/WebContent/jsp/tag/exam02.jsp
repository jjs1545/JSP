<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
	public int sum(int a, int b) {
	int temp = 0;
	for(int i=a; i<=b; i++) {
		temp+=i;
	}
	return temp;
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	1~10 까지의 총합: <%= sum(1,10) %> <br/>
</body>
</html>