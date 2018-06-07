<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저 상세 정보</title>
</head>
<body>
<div id="header">
		<jsp:include page="/jsp/include/header.jsp"/>
	</div>
	<div id="content" align="center">
		<hr width="80%">
		<h2>회원 상세 정보</h2>
		<hr width="80%">
		<table border="1">
		<tr>
			<th>회원 아이디:</th> 
			<td>${ member.id }</td>
		</tr>
		<tr>
			<th>회원 비밀번호:</th> 
			<td>${ member.password}<td>
		</tr>
		<tr>
			<th>회원 이름:</th> 
			<td>${ member.name}<td>
		</tr>
		<tr>
			<th>회원 전화번호:</th> 
			<td>${ member.tel1 }-${ member.tel2 }-${ member.tel3 }</td>
		</tr>
		<tr>
			<th>이메일:</th> 
			<td>${ member.email_id}@${member.email_domain}<td>
		</tr>
		<tr>
			<th>주소:</th> 
			<td>${ member.basic_addr}<td>
		</tr>
		</table>
	</div>
	<center>
	<input type="button" value="수정화면" onclick="location.href='/boardProject/userUpdateForm.do?id=${member.id}'"/>
	<input type="button" value="뒤로가기" onclick="location.href='/boardProject/userList.do?no=${ member.id }'"/>
	</center>
</body>
</html>