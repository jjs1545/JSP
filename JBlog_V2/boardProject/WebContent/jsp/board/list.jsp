<%@page import="java.util.ArrayList"%>
<%@page import="douzone.board.db.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="douzone.board.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<body>
	<div id="header">
		<jsp:include page="/jsp/include/header.jsp"></jsp:include>
	</div>
	
	<div id="content" align="center">
		<hr width="80%">
		<h2>게시판 목록</h2>
		<hr width="80%">
		<br/><br/>
	</div>
	<div id="board" align="center">
		<div id="search">
			<form action="/boardProject/search.do" name="search" method="post">
				<select name="Theme">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="id">아이디</option>
				</select>
				<input type="text" name="search" value="">
				<input type="submit" value="검색">
			</form>
		</div>
		<table width="60%" border="1">
			<tr>
				<th width="8%">번호</th>
				<th width="30%">제목</th>
				<th width="15%">작성자</th>
				<th width="8%">조회수</th>
				<th width="10%">비고</th>
			</tr>
			<c:forEach var="board" items="${ list }" varStatus="Loop">
				<tr>
					<td align="center">${ board.no }</td>
					<th align="center">
					<a href="/boardProject/boardDetail.do?no=${board.no}&cnt=${board.viewCnt}"> <!-- 게시글 no를 기본키로 게시글의 상세내용 표시 -->
						<c:out value="${ board.title }"/>
					</a>
					</th>
					<td align="center">${ board.writer }</td>
					<td align="center">${ board.viewCnt }</td>
					<td align="center">
						<c:if test="${not empty userVO && userVO.id eq board.writer && userVO.id ne 'admin'}">
							<input type="button" value="삭제" onclick="location.href='/boardProject/bDeleteForm.do?no=${ board.no }'"/>
						</c:if>
						<c:if test="${ userVO.id eq 'admin' }">
							<input type="button" value="삭제" onclick="location.href='/boardProject/bDeleteForm.do?no=${ board.no }'"/>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		<br/>
		<c:if test="${ not empty userVO }">
			<input type="button" value="글쓰기" onclick="location.href='/boardProject/writeForm.do?id=${userVO.id}'"/>
		</c:if>
	</div>

</body>
</html>
 --%>

<!DOCTYPE html>
<html>
	<head>
	<title>게시판</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	<jsp:include page="/jsp/include/header.jsp"></jsp:include>
<script>
	function isNull(obj, msg) {
		if(obj.value == "") {
			alert(msg);
			obj.focus();
			return true;
		}
		return false;
	}
	function doAction() {
		var s = document.search;
		
		if(isNull(s.search, '검색어를 입력해주세요!')) {
			return false;
		}
	}
	
	function fnMove(seq){
	        var offset = $("#div" + seq).offset();
	        $('html, body').animate({scrollTop : offset.top}, 400);
	}
</script>
<style>
p{
  font-family: Fantasy;
  font-size:20px;
}
</style>
</head>
<body>
	<div class="jumbotron" style="background-image: url(images/img_3.jpg); background-size:cover;">	
		<div class="content">
			<P></P>
			<h1>JOOSINJUNG</h1>
			<p></p>
			<p class="tlt">Admin Board Page</p>
			<p></p>
			<p> - 게시판 - </p>
			<p></p>
		</div>
		<div>
			<br/>
			<br/>
			<br/>
			<h3>click</h3>
        	<a href="#"> 
    	      <span class="glyphicon glyphicon-arrow-down" onclick="fnMove('1')"></span>
	        </a>
        </div>
	</div>

<div id="div1" class="profile_container">
	<div id="content" align="center">
		<hr width="80%">
		<h2>게시판 목록</h2>
		<hr width="80%">
		<br/><br/>
	</div>
	
	<div id="search" align="left">
		<form action="/boardProject/search.do" name="search" method="post" onsubmit="return doAction()">
			<select name="Theme" class="form-control" style="max-width:5%; float:left; margin-left:10%;">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="id">아이디</option>
			</select>
			<input type="text" name="search" value="" class="form-control" style="max-width:10%; float:left;">
			<input type="submit" value="검색" class="btn btn-info" style="float:left;">
		</form>
	</div>
	
	<br/>
	<br/>
	<br/>
	
	<div id="board" align="center">
		<table class="table table-bordered" style="max-width:80%;">
			<tr align="center">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>비고</th>
			</tr>
			<c:forEach var="board" items="${ list }" varStatus="Loop">
				<tr align="center">
					<td>${ board.no }</td>
					<th>
					<a href="/boardProject/boardDetail.do?no=${board.no}&cnt=${board.viewCnt}"> <!-- 게시글 no를 기본키로 게시글의 상세내용 표시 -->
						<c:out value="${ board.title }"/>
					</a>
					</th>
					<td>${ board.writer }</td>
					<td>${ board.viewCnt }</td>
					<td>
						<c:if test="${not empty userVO && userVO.id eq board.writer && userVO.id ne 'admin'}">
							<input type="button" value="삭제" onclick="location.href='/boardProject/bDeleteForm.do?no=${ board.no }'" class="btn btn-info"/>
						</c:if>
						<c:if test="${ userVO.id eq 'admin' }">
							<input type="button" value="삭제" onclick="location.href='/boardProject/bDeleteForm.do?no=${ board.no }'" class="btn btn-info"/>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		<br/>
		<c:if test="${ not empty userVO }">
			<input type="button" value="글쓰기" onclick="location.href='/boardProject/writeForm.do?id=${userVO.id}'" class="btn btn-info"/>
		</c:if>
	</div>

	</body>
</html>