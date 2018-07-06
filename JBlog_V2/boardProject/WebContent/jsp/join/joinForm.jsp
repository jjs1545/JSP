<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
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
		var jForm = document.joinForm;
		
		if(isNull(jForm.id, '아이디를 입력해주세요!')) {
			return false;
		}
		if(isNull(jForm.name, '이름을(를) 입력해주세요!')) {
			return false;
		}
		if(isNull(jForm.password, '비밀번호를 입력해주세요!')) {
			return false
		}
		if(jForm.idDuplication.value != "idCheck") {
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
		if(jForm.password.value != jForm.passwordcheck.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
		if(isNaN(jForm.tel2.value)) {
			alert("전화번호는 숫자만 입력이 가능합니다!");
			return false;
		}
		if(isNaN(jForm.tel3.value)) {
			alert("전화번호는 숫자만 입력이 가능합니다!");
			return false;
		}
	}
	
	function openIdChk() {
		window.name="parentForm";
		window.open("jsp/join/idCheckForm.jsp","chkForm","width=500, height=300, resizable=no,scrollbars=no");
	}
	
	// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
    // 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때 다시 중복체크를 하도록
    function inputIdChk(){
        document.joinForm.idDuplication.value ="idUncheck";
    }
    


</script>
<style>
input, select, p{
	max-width:20%;
	float:left;
}
</style>
<jsp:include page="/jsp/include/header.jsp" />
</head>
<body>
	<div id="container1" class="container1">
		<div id="content" align="center">
			<hr>
			<h2>회원 가입</h2>
			<br />
	
			<form action="join.do" name="joinForm" method="post" onsubmit="return doAction()" >
				<table class="table table-bordered">
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" size="20" maxlength="15" name="id" class="form-control"/>
							<p> </p>
							<input type="button" value="중복 체크" class="btn btn-info" onclick="openIdChk()"/>
							<input type="hidden" name="idDuplication" value="idUncheck">
						</td>
					</tr>
					<tr>
						<th>이 름</th>
						<td><input type="text" size="10" maxlength="10" name="name" class="form-control"/>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" size="20" maxlength="15"name="password" class="form-control"/>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input type="password" size="20" maxlength="15"name="passwordcheck" class="form-control"/>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input type="text" size="20" maxlength="15" name="email_id" class="form-control">
							<select name="email_domain" class="form-control">
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
							</select>
						</td>
					</tr>
					<tr>
						<th width="25%">핸드폰</th>
							<td>
							<select name="tel1" class="form-control">
								<option value="010">010</option>
								<option value="010">011</option>
								<option value="010">016</option>
								<option value="010">019</option>
							</select>
							<input type="text" size="4" maxlength="4" name="tel2" class="form-control" />
							<input type="text" size="4" maxlength="4" name="tel3" class="form-control"/>
						<td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
						<textarea rows="2" cols="40" name="basic_addr" class="form-control">					
						</textarea>
						</td>
					</tr>
				</table>
				<br/>
				<button type="submit" class="btn btn-info">가입</button>
			</form>
		</div>
	</div>
</body>
</html>




