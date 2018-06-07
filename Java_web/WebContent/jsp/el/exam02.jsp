<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String[] members = {"전효성","강다니엘", "송민호", "수지"};
	
	//pageContext 영역 등록
	//이름: "members", 값: 생성한 String 배열 객체
	pageContext.setAttribute("members", members);

	Map<String, String> emp = new HashMap<>();
	emp.put("1001","SMITH");
	emp.put("1002","Bale");
	

	//pageContext 영역 등록
	//이름: "employees", 값: 생성한 HashMap() 객체
	pageContext.setAttribute("employees", emp);
	
	List<String> names = new ArrayList<>();
	names.add("고길동");
	names.add("홍길동");
	names.add("정길동");
	
	pageContext.setAttribute("names",names);
%>

<%--
	setAttribute: 저장하고 관리하는 데이터를 등록
 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	JSP 표현식 활용<br/>
	<%-- JSP 표현식 활용 --%>
	첫번째 회원: <%= members[0] %> <br/>
	두번째 회원: <%= members[1] %> <br/>
	세번째 회원: <%= members[2] %> <br/>
	네번째 회원: <%= members[3] %> <br/>
	
	EL 활용<br/>
	<%-- EL 활용 --%>
	첫번째 회원: ${ members[0] } <br/>
	두번째 회원: ${ members[1] } <br/>
	세번째 회원: ${ members[2] } <br/>
	네번째 회원: ${ members[3] } <br/>
	
	Map 객체 표현<br/>
	<%-- Map 객체 표현 --%>
	empno(1001) : <%= emp.get("1001") %> <br/>
	empno(1002) : <%= emp.get("1002") %> <br/>
	empno(1001)	: ${employees.get("1001")} <br/>
	
	List 객체 표현<br/>
	<%-- List 객체 표현 --%>
	첫번째 이름: <%= names.get(0) %> <br/>
	두번째 이름: <%= names.get(1) %> <br/>
	세번째 이름: <%= names.get(2) %> <br/>
	
	첫번째 회원: ${ names[0] } <br/>
	두번째 회원: ${ names[1] } <br/>
	세번째 회원: ${ names[2] } <br/>
	
</body>
</html>