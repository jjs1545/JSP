<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="douzone.member.db.MemberDAO" %>
<%@ page import="douzone.member.db.MemberVO" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>SB Admin - Start Bootstrap Template</title>
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
  
      <!-- Example DataTables Card-->
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i> 회원 목록 
          </div>
         <div id="header">
			<jsp:include page="/jsp/include/header.jsp"/>
		</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
             <thead>
              	<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>비밀번호</th>
				<th>전화번호</th>
				<th>등급</th>
				<th>비고</th>
				</tr>
              </thead>
              <tbody>
                <c:forEach var="member" items="${ list }">
				<tr>
					<td align="center">${ member.id }</td>
					<td align="center">
						<a href="userDetail.do?id=${ member.id }" style="color: black">
							<c:out value="${ member.name }"/>(Click)
						</a>
					</td>
					<td align="center">${ member.password }</td>
					<td align="center">${ member.tel1 }-${ member.tel2 }-${ member.tel3 }</td>
					<td align="center">${ member.type }</td>
				<c:if test="${userVO.id ne member.id}">
					<td align="center"><input type="button" value="삭제" onclick="location.href='/boardProject/userDelete.do?id=${member.id}'"/></td>
				</c:if>
					</tr>
				</c:forEach>
                
              </tbody>
            </table>
          </div>
        </div>

      </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
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
