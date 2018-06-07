<%@page import="java.util.ArrayList"%>
<%@page import="douzone.board.db.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="douzone.board.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>게시판</title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i> 
			게시판 목록
		</div>
		<div id="header">
			<jsp:include page="/jsp/include/header.jsp"></jsp:include>
		</div>
		<form action="/boardProject/search.do" name="search" method="post">
				<select name="Theme">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="id">아이디</option>
				</select>
				<input type="text" name="search" value="">
				<input type="submit" value="검색">
		</form>
			
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable">
              <thead>
              	<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>비고</th>
				</tr>
              </thead>
              <tbody>
                <c:forEach var="board" items="${ list }" varStatus="Loop">
				<tr>
					<td>${ board.no }</td>
					<th>
					<a href="/boardProject/boardDetail.do?no=${board.no}&cnt=${board.viewCnt} " style="color: black"> <!-- 게시글 no를 기본키로 게시글의 상세내용 표시 -->
						<c:out value="${ board.title }"/>
					</a>
					</th>
					<td>${ board.writer }</td>
					<td>${ board.viewCnt }</td>
					<td>
						<c:if test="${not empty userVO && userVO.id eq board.writer && userVO.id ne 'admin'}">
							<input type="button" value="삭제" onclick="location.href='/boardProject/bDeleteForm.do?no=${ board.no }'"/>
						</c:if>
						<c:if test="${ userVO.id eq 'admin' }">
							<input type="button" value="삭제" onclick="location.href='/boardProject/bDeleteForm.do?no=${ board.no }'"/>
						</c:if>
					</td>
				</tr>
				</c:forEach>
              </tbody>
            </table>
            <br/>
			<c:if test="${ not empty userVO }">
				<input type="button" value="글쓰기" onclick="location.href='/boardProject/writeForm.do?id=${userVO.id}'"/>
			</c:if>
          </div>
        </div>
      </div>
     <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright © Jusin Website 2018</small>
        </div>
      </div>
    </footer>


    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <script src="js/sb-admin-datatables.min.js"></script>
</body>

</html>
