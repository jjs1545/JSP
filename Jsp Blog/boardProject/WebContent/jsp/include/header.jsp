<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table border="1" width="100%">
	<tr>
		<td rowspan="2" style="width: 400px; height: 40px;" align="center">
			<c:choose>
				<c:when test="${ not empty userVO }">
					<strong>${userVO.id} 님이 로그인 했습니다.</strong>
				</c:when>
			</c:choose>
		</td>
	</tr>
	<tr align="right">
		<th>
			<a href="/boardProject/board.do" style="color: black">게시판</a> 
			<c:choose>
				<c:when test="${ not empty userVO && userVO.id eq 'admin' }">
					<a href="/boardProject/userList.do" style="color: black">회원목록</a>
				</c:when>
			</c:choose>		
			<c:choose>
				<c:when test="${ empty userVO }">
					<a href="/boardProject/joinForm.do" style="color: black">회원가입</a>
					<a href="/boardProject/login.do" style="color: black">로그인</a>
				</c:when>
				<c:otherwise>
					<a href="/boardProject/myPage.do?id=${userVO.id}" style="color: black">마이페이지</a>
					<a href="/boardProject/logout.do" style="color: black">로그아웃</a>
				</c:otherwise>
			</c:choose>			
		</th>
	</tr>
</table>







