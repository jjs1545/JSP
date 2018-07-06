<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저 정보 수정</title>
<jsp:include page="/jsp/include/header.jsp"/>
</head>
<body>
	<div id="basic_profile" class="profile_container">
		<div id="content" align="center">
			<hr width="80%">
			<h2>회원 상세정보 수정</h2>
			<hr width="80%">
			<form action="userUpdate.do" name="userUpdate" method="post">
				<table border="1" class="table table-bordered">
				<tr>
					<th>회원 아이디:</th> 
					<td><strong>${ member.id }</strong></td>
				</tr>
				<tr>
					<th>회원 비밀번호:</th> 
					<td><input type="text" name="password" value=""/></td>
				</tr>
				<tr>
					<th>회원 이름:</th> 
					<td><strong>${ member.name }</strong></td>
				</tr>
				<tr>
					<th>전화번호:</th> 
					<td>
							<select name="tel1">
								<option value="010">010</option>
								<option value="02">02</option>
								<option value="031">031</option>
							</select>
							 - 
							<input type="text" size="4" maxlength="4" name="tel2" value="${member.tel2}"/>
							 - 
							<input type="text" size="4" maxlength="4" name="tel3" value="${member.tel3}"/>
						<td>
				</tr>
				<tr>
					<th>이메일:</th> 
					<td>
							<input type="text" size="20" maxlength="15" name="email_id" value="${member.email_id }"/>
							@
							<select name="eamail_domain" onchange="em">
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
							</select>
						</td>
				</tr>
				<tr>
					<th>주소:</th> 
					<td><input type="text" name="basic_addr" value="${ member.basic_addr}"/></td>
				</tr>
				</table>
				<center>
				<input type="hidden" name="id" value="${userVO.id}"/>
				<input type="hidden" name="id2" value="${member.id}"/>
				<input type="submit" value="수정" class="btn btn-info"/>
				<input type="button" value="뒤로가기" onclick="location.href='/boardProject/userList.do?id=${ member.id }'" class="btn btn-info"/>
				</center>
			</form>
		</div>
	</div>
</body>
</html>