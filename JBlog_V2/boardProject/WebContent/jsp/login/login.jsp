<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
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
		var f = document.loginForm;
		
		if(isNull(f.id, '아이디를 입력해주세요!')) {
			return false;
		}
		if(isNull(f.password, '비밀번호를 입력해주세요!')) {
			return false
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
<jsp:include page="/jsp/include/header.jsp"/>
</head>
<body>
	<div class="jumbotron" style="background-image: url(images/img_4.jpg); background-size:cover;">	
			<div class="content">
				<P></P>
				<h1>JOOSINJUNG</h1>
				<p></p>
				<p class="tlt">Admin Board Page</p>
				<p></p>
				<p> - 로그인 - </p>
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
			<hr width="80%"/>
			<h2>로그인</h2>
			<hr width="80%"/>
			<br/><br/>
			<form action="/boardProject/loginProcess.do" method="post" name="loginForm" onsubmit="return doAction()">
				<table width="40%">
					<tr>
						<th>ID</th>
						<td><input type="text" name="id" size="20" placeholder="아이디를 입력하세요." class="form-control"/></td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td><input type="password" name="password" placeholder="비밀번호를 입력하세요." size="20" class="form-control"/></td>
					</tr>
				</table>
				<br/>
				<input type="submit" value="로그인" class="btn btn-info" style="float:light"/>
				<input type="button" value="회원가입" onclick="location.href='/boardProject/joinForm.do'" class="btn btn-info" style="float:light";/>
			</form>
		</div>
	</div>
</body>
</html>




