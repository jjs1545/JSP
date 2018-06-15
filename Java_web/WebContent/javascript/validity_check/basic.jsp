<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function isNull(obj, msg) {
		if(obj.value == ""){
			alert(msg);
			obj.focus();
			return true;
		}
		return false
	}
	function doAction() {
		var d = document.validityForm;
		
		if(isNull(d.id, '아이디를 입력해주세요!')) {
			return false;
		}
		
		if(isNull(d.password, '비밀번호를 입력해주세요!')) {
			return false;
		}
	}
</script>
</head>
<body>
	<form name="validityForm" onsubmit="return doAction()">
		아이디   : <input type="text" id="id" name="name"/><br/>
		비밀번호: <input type="text" id="password" name="password"/><br/>
		<input type="submit" value="제출">
	</form>
</body>
</html>