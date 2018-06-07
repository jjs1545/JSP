<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>회원 가입</title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">회원 가입</div>
      <div class="card-body">
        <form action="join.do" method="post">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputName">아이디</label>
                <input class="form-control" name="id" id="id" type="text" aria-describedby="nameHelp" placeholder="Enter first name">
              </div>
              <div class="col-md-6">
                <label for="exampleInputLastName">이름</label>
                <input class="form-control" name="name" id="name" type="text" aria-describedby="nameHelp" placeholder="Enter last name">
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">비밀번호</label>
            <input class="form-control" name="password" id="password" type="password" aria-describedby="emailHelp" placeholder="Enter email">
          </div>
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputPassword1">이메일</label>
                <input class="form-control" name="email_id" id="exampleInputPassword1" type="text" placeholder="Password">
              </div>
              <div class="col-md-6">
                <label for="exampleConfirmPassword">도메인</label>
                <select class=" form-control" name="email_domain" id="exampleConfirmPassword" >
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
				</select>
              </div>
              <div class="form-group">
             <br/>
            <label for="exampleInputEmail1">회원</label>
            	<select name="tel1" class="form-control" >
							<option value="010">010</option>
							<option value="010">011</option>
							<option value="010">016</option>
							<option value="010">019</option>
				</select>
          	</div>
          	
          	
          <div class="form-group">
             <br/>
            <label for="exampleInputEmail1">전화</label>
            	<input class="form-control" name="tel2" id="password" type="text" aria-describedby="emailHelp" placeholder="Enter tel">
          	</div>
          	<div class="form-group">
             <br/>
            <label for="exampleInputEmail1">번호</label>
            	<input class="form-control" name="tel3" id="password" type="text" aria-describedby="emailHelp" placeholder="Enter tel">
          	</div>
          	<div class="form-group">
            <br/>
         
            <label for="exampleInputEmail1">주소</label>
            	<input class="form-control" name="basic_addr" id="password" type="text" aria-describedby="emailHelp" placeholder="Enter Address">
          	</div>
          </div>
          <input type="submit" class="btn btn-primary btn-block" value="register">
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="login.html">Login Page</a>
          <a class="d-block small" href="forgot-password.html">Forgot Password?</a>
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
</body>
</html>

