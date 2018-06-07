<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
	JSP 내장 영역 (Scope)
	pageContext, request, session, application
	
	pageContext
		: 하나의 페이지에서 공유되는 영역
		
	request
		: 하나의 요청에 대해 같은 요청을 공유하는 페이지가 대응된다.
		  forward와 include를 통한 연결이 같은 request 영역이 된다. 
		  
	JSP 내장 객체 
	out			: JSP 내의 출력 스트림 객체 
	page		: JSP 내의 자바 클래스 객체
	pageContext : JSP 페이지의 정보를 저장하는 객체
	request 	: 요청 정보를 저장하는 객체
	response 	: 응답 정보를 저장하는 객체
	session		: 웹 브라우저의 정보를 유지하기 위한 세션 정보를 저장하는 객체
	application : 웹 어플리케이션 Context 정보를 저장하는 객체
	exception	: JSP 내의 예외가 발생하는 경우 사용하는 객체
	config		: JSP의 설정 정보를 저장하는 객체
	
 --%>
<%
	pageContext.setAttribute("msg", "page 영역에 등록");
	// request 영역에 id 이름으로 HelloJSP를 등록 
	request.setAttribute("id","HelloJSP");
	request.setAttribute("msg", "request 영역에 등록");
	
	String pageMsg = (String)pageContext.getAttribute("msg");
	String reqMsg = (String)request.getAttribute("msg");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	empty msg : ${empty msg } <br/>
	msg request msg s: ${msg } <br/>
	id: ${id } <br/>
	request msg : ${requestScope.msg } <br/>
	
	<%--
		JSP 표현식 : 해당 영역에 있는 Attribute를 간접적으로 가져온다
		EL: 해당 영역의 Attribute를 직접 가져온다. 
	 --%>
	
	msg:<%= pageMsg %><br/>
	request msg : <%= reqMsg %>
	request msg : <%= request.getAttribute("msg") %>
</body>
</html>