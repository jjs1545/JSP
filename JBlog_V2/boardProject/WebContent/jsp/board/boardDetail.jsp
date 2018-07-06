<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
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
			var u = document.updateForm;
			
			if(isNull(u.title, '제목을(를) 입력해주세요!')) {
				return false;
			}
		}
	</script>
</head>
<body>
	<!-- <div class="jumbotron" style="background-image: url(images/img_3.jpg); background-size:cover;">	
			<div class="content">
				<P></P>
				<h1>JOOSINJUNG</h1>
				<p></p>
				<p class="tlt">Admin Board Page</p>
				<p></p>
				<p> - Scroll Down - </p>
				<p></p>
			</div>
		</div> -->
	<div id="basic_profile" class="profile_container">
		<div id="content" align="center">
			<hr width="80%">
			<h2>게시판 목록</h2>
			<hr width="80%">
			<br/><br/>
		</div>
		
		<div id="board" align="center">
			<form action="/boardProject/updateBoard.do?" name="updateForm" method="post" onsubmit="return doAction()">
			<table class="table table-bordered" >
					<tr>
						<th>글 번호</th>
						<td>${ board_detail.no }</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>${ board_detail.viewCnt }</td>
					</tr>				
					<tr>
						<th>작성자</th>
						<td>${ board_detail.writer }</td>
					</tr>	
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" value="${ board_detail.title }"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="4" cols="50" name="content">${ board_detail.content }</textarea></td>
					</tr>
			</table>
			<c:if test="${ not empty userVO && userVO.id eq board_detail.writer}">
				<input type="submit" value="수정" class="btn btn-info" />
			</c:if>
			<input type="button" value="뒤로가기" onclick="location.href='/boardProject/board.do?no=${ board.no }'" class="btn btn-info" />
				<input type="hidden" name="no" value="${ board_detail.no }"/>
			</form>
		</div>
	</div>
</body>
</html>
