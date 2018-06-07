<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
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
		var f = document.writeForm;
		
		if(isNull(f.title, '제목을 입력해주세요!')) {
			return false;
		}
	}
  </script>
</head>
<body>


	<div id="header">
		<jsp:include page="/jsp/include/header.jsp"/>
	</div>
	
	<div id="content" align="center">
		<hr width="80%">
		<h2> 글쓰기 </h2>
		<hr width="80%">
		<br/>
	</div>
	<div id="write" align="center">
		<form action="/boardProject/write.do" method="post" name="writeForm" onsubmit="return doAction()">
			<table width="80%" border="1">
				<tr>
					<th width="25%"> 아이디  </th>
					<td>${ member.id }</td>
				</tr>
				<tr>
					<th width="25%"> 이 름  </th>
					<td>${ member.name }</td>
				</tr>
				<tr>
					<th width="25%"> 제목  </th>
					<td>
						<input type="text"  name="title"/>
					</td>
				</tr>
				<tr>
					<th width="25%"> 내용 </th>
					<td>
						<textarea rows="4" cols="50" name="content">
						</textarea>
					</td>
				</tr>
			</table>
			<input type="hidden" name="id" value="${ userVO.id }">
			<input type="button" value="뒤로가기" onclick="location.href='/boardProject/board.do?no=${ board.no }'"/>
			<input type="submit" value="제출"/>
 		</form>
	</div>

</body>
</html>