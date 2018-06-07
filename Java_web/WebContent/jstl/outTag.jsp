<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
	JSTL (Jsp Standard Tag Library)
	 : Jsp 표준 태그 제공
	 : Jsp의 자신만의 기능을 가진 태그를 추가하여 사용 가능!
	 
	Core (prefix : "c", uri: uri = "http://java.sun.com/jsp/jstl/core")
	 : 일반 프로그래밍에서 사용하는 기능 제공
	 	(변수, 실행흐름의 컨트롤, 페이지 이동 등의 기능 제공!)
 --%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	value 속성만 지정 : <c:out value="JSTL"/> <br/>
	value 속성 값이 없는 경우 : 
	<c:out value= "${msg}" default="msg를 찾을 수 없음"/></br/>
	태그를 포함하는 경우:
	<c:out value="<hr/>"/><br/>
	태그를 포함하는 경우[escapeXml=false] :
	<c:out value="<hr/>" escapeXml="false"/><br/>
</html>