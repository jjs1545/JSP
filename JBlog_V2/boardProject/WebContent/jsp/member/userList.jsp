<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="douzone.member.db.MemberDAO" %>
<%@ page import="douzone.member.db.MemberVO" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 관리자 페이지 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
<jsp:include page="/jsp/include/header.jsp"/>
<script>
	function fnMove(seq){
	        var offset = $("#div" + seq).offset();
	        $('html, body').animate({scrollTop : offset.top}, 400);
	}
</script>
<style>
.mySlides {display:none;}

p{
  font-family: Fantasy;
  font-size:20px;
}
</style>
</head>
<body>
	<div class="jumbotron" style="background-image: url(images/img_6.jpg); background-size:cover;">	
			<div class="content">
				<P></P>
				<h1>JOOSINJUNG</h1>
				<p></p>
				<p class="tlt">Admin Board Page</p>
				<p></p>
				<p> - 회원목록 - </p>
				<p></p>
			</div>
			<div>
			<br/>
			<br/>
			<br/>
			<p>click</p>
        	<a href="#"> 
    	      <span class="glyphicon glyphicon-arrow-down" onclick="fnMove('1')"></span>
	        </a>
        </div>
	</div>
	<div id="div1" class="profile_container">
		<div id="content" align="center">
			<hr width="80%">
			<h2>회원 목록</h2>
			<hr width="80%">
			
			<table class="table table-bordered" style="max-width:80%;">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>비밀번호</th>
					<th>전화번호</th>
					<th>등급</th>
					<th>비고</th>
				</tr>
				<c:forEach var="member" items="${ list }">
					<tr align="center">
						<td>${ member.id }</td>
						<td>
							<a href="userDetail.do?id=${ member.id }">
								<c:out value="${ member.name }"/>
							</a>
						</td>
						<td>${ member.password }</td>
						<td>${ member.tel1 }-${ member.tel2 }-${ member.tel3 }</td>
						<td>${ member.type }</td>
				<c:if test="${userVO.id ne member.id}">
					<td align="center"><input type="button" value="삭제" onclick="location.href='/boardProject/userDelete.do?id=${member.id}'" class="btn btn-info"/></td>
				</c:if>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>




