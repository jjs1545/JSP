<%@page import="douzone.member.db.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="douzone.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<script>
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
<jsp:include page="/jsp/include/header.jsp"></jsp:include>
</head>

<body>
	<div class="jumbotron" style="background-image: url(images/img_3.jpg); background-size:cover;">	
			<div class="content">
				<P></P>
				<h1>JOOSINJUNG</h1>
				<p></p>
				<p class="tlt">Admin Board Page</p>
				<p></p>
				<p> - 마이페이지 - </p>
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
			<hr width="80%">
			<h2>마이페이지</h2>
			<hr width="80%">
		</div>
		<table class="table table-bordered" >
		<tr>
			<th>회원 아이디:</th> 
			<td>${ member.id }</td>
		</tr>
		<tr>
			<th>회원 이름:</th> 
			<td>${ member.name}<td>
		</tr>
		<tr>
			<th>회원 전화번호:</th> 
			<td>${ member.tel1 }-${ member.tel2 }-${ member.tel3 }</td>
		</tr>
		<tr>
			<th>이메일:</th> 
			<td>${ member.email_id}@${member.email_domain}<td>
		</tr>
		<tr>
			<th>주소:</th> 
			<td>${ member.basic_addr}<td>
		</tr>
		</table>
		<center>
		<input type="button" value="수정하기" onclick="location.href='/boardProject/myPageUpdateForm.do?id=${userVO.id}'" class="btn btn-info"/>
		<input type="button" value="뒤로가기" onclick="location.href='/boardProject/board.do?no=${ board.no }'" class="btn btn-info"/>
		</center>
	</div>
</body>
</html>




