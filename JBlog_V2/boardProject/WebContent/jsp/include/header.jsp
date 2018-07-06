<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="utf-8">
<title>개인 홈페이지</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/hompage.css">
<link rel="stylesheet" media="(min-width:300px) and (max-width:700px)" href="css/homepage_mobile.css">
<script src="/boardProject/js/jqeury.1.9.js"></script>
<script src="/boardProject/js/bootstrap.js"></script>
<script src="/boardProject/js/jquery.fittext.js"></script>
<script src="/boardProject/js/jquery.lettering.js"></script>
<script src="/boardProject/js/jquery.textillate.js"></script>
<script src="/boardProject/js/function.js"></script>

<ul class="small-device-nav">
	<li><a href="#basic_profile">기본정보</a></li>
	<li><a href="#basic_introduce">프로필</a></li>
	<li><a href="#basic_activity">활동</a></li>
	<li><a href="#basic_self-introduce">자기소개</a></li>
</ul>
<nav id="scroll">
	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
	<ul class="nav">
			<li><a href="/boardProject/about.do">About</a></li>
			<li><a href="/boardProject/board.do">게시판</a></li>
			<li>
				<c:choose>
					<c:when test="${ not empty userVO && userVO.id eq 'admin' }">
						<a href="/boardProject/userList.do">회원목록</a>
					</c:when>
				</c:choose>
			</li>
			<c:choose>
				<c:when test="${ empty userVO }">
					<li><a href="/boardProject/joinForm.do" >회원가입</a></li>
					<li><a href="/boardProject/login.do">로그인</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/boardProject/myPage.do?id=${userVO.id}">마이페이지</a></li>
					<li><a href="#">${userVO.id}님 환영합니다.</a><li> 
					<li><a href="/boardProject/logout.do">로그아웃</a>
				</c:otherwise>
			</c:choose>				
			<!-- <li><a href="#basic_profile">기본정보</a></li>
			<li><a href="#basic_introduce">프로필</a></li>
			<li><a href="#basic_activity">활동</a></li>
			<li><a href="#basic_self-introduce">자기소개</a></li>
 -->
	</ul>
</nav>
		
<%-- <table border="1" width="100%">
	<tr>
		<td rowspan="2" style="width: 200px; height: 40px;" align="center">
			<c:choose>
				<c:when test="${ not empty userVO }">
					<strong>${userVO.id} 님이 로그인 했습니다.</strong>
				</c:when>
			</c:choose>
		</td>
	</tr>
	<tr align="center">
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
</table> --%>







