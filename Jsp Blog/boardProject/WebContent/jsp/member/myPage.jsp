<%@page import="douzone.member.db.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="douzone.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>마이 페이지</title>
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
			마이 페이지
		</div>
		<div id="header">
		<jsp:include page="/jsp/include/header.jsp"/>
		</div>
			
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable">
              <thead>
              	<tr>
					<th>회원 아이디:</th>
					<th>회원 이름:</th>
					<th>회원 전화번호:</th>
					<th>이메일:</th>
					<th>주소:</th>
					<th></th>
					<th></th>
				</tr>
              </thead>
              <tbody>
				<tr>
					<td>${ member.id }</td>
					<td>${ member.name}</td>
					<td>${ member.tel1 }-${ member.tel2 }-${ member.tel3 }</td>
					<td>${ member.email_id}@${member.email_domain}</td>
					<td>${ member.basic_addr}</td>
					<td><input type="button" value="수정" onclick="location.href='/boardProject/myPageUpdateForm.do?id=${userVO.id}'"/></td>
					<td><input type="button" value="홈으로" onclick="location.href='/boardProject/board.do?no=${ board.no }'"/></td>
				</tr>
              </tbody>
            </table>
            <br/>
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




