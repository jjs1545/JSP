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
		JSP: HTML문서 내에 부분적으로 Java 코드를 작성!
			 Java코드를 작성하기 위한 Scriptlet 사용
	-->
	<h3>1 ~ 10 까지의 합계</h3>
	<%	//스키립플릿 작성
		int sum = 0;
		for(int i=1; i<10; i++) {
			sum += i;
		}
	%>

	<%
		out.print("1~10까지의 총합: " + sum + "<br/>");
	%>
	결과는:  <%=sum %> <br/>
	<!--  -->
</body>
</html>