<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
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
		var f = document.updateForm;
		
		if(isNull(f.title, '제목을 입력해주세요!')) {
			return false;
		}
	}
  </script>
</head>
<body>
	<div id="content" align="center">
		<hr width="80%">
		<h2>게시판 목록</h2>
		<hr width="80%">
		<br/><br/>
	</div>
	<div id="board" align="center">
		<form action="/boardProject/updateBoard.do?" name="updateForm" method="post">
		<table width="80%" border="1" >
				<tr>
					<th width="25%"> 글 번호 </th>
					<td>${ board_detail.no }</td>
				</tr>
				<tr>
					<th width="25%">작성자</th>
					<td>${ board_detail.writer }</td>
				</tr>
				<tr>
					<th width="25%">조회수</th>
					<td>${ board_detail.viewCnt }</td>
				</tr>
				<tr>
					<th width="25%">제목</th>
					<td><input type="text" name="title" value="${ board_detail.title }"></td>
				</tr>					
				<tr>
					<th width="25%">내용</th>
					<td><textarea rows="4" cols="100%" name="content">${ board_detail.content }</textarea></td>
				</tr>
		</table>
		<input type="button" value="뒤로가기" style="position: absolute; right: 20%;" onclick="location.href='/boardProject/board.do?no=${ board.no }'"/>
		<c:if test="${ not empty userVO && userVO.id eq board_detail.writer}">
			<input type="submit" value="수정" />
		</c:if>
			<input type="hidden" name="no" value="${ board_detail.no }"/>
		</form>
	</div>
</body>
</html>
