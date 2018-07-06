<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<title>ID 중복 체크 폼</title>
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
  <script type="text/javascript">
        // 회원가입창의 아이디 입력란의 값을 가져온다.
        function pValue(){
            document.getElementById("userId").value = opener.document.joinForm.id.value;
        }
        
        // 아이디 중복체크
        function idCheck(){
 
            var id = document.getElementById("userId").value;
 
            if (!id) {
                alert("아이디를 입력하지 않았습니다.");
                return false;
            } else{
	            	 $('#chkBtn').on('click',function() {
	        			 var param = $("#userId").val();
	        	      $.ajax({
	        	            url : "/boardProject/memberIdCheck.do",
	        	            type : "POST",
	        	            data : {"id":param},
	        	            error : function(){
	        	                alert('통신실패!!');
	        	            },
	        	            success : function(data){
	        	               	if(data[0] == 0){
	        	                    alert("사용할수없는 아이디입니다.");
	        	                    document.getElementById("cancelBtn").style.visibility='visible';
	        	                    document.getElementById("useBtn").style.visibility='hidden';
	        	                    document.getElementById("msg").innerHTML ="";
	        	                } 
	        	                else if(data[0] == 1){ 
	        	                    document.getElementById("cancelBtn").style.visibility='hidden';
	        	                    document.getElementById("useBtn").style.visibility='visible';
	        	                    document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
	        	                }
	        	            }
        	        });
        	    });
            }
        }
        
        
        
        // 사용하기 클릭 시 부모창으로 값 전달 
        function sendCheckValue(){
            // 중복체크 결과인 idCheck 값을 전달
            opener.document.joinForm.idDuplication.value ="idCheck";
            // 회원가입 화면의 ID입력란에 값을 전달
            opener.document.joinForm.id.value = document.getElementById("userId").value;
            
            if (opener != null) {
                opener.chkForm = null;
                self.close();
            }    
        }    
  </script>
</head>
<body onload="pValue">
	<div id="wrap">
		<br>
		<b><font size="4" color="gray">아이디 중복 체크</font></b>
		<hr size="1" width="460">
		<br>
		<div id="chk">
			<form id="checkForm">
				<input type="text" name="idInput" id="userId" class="form-control">
				<input type="button" id="chkBtn" value="중복확인" onclick="idCheck()" class="form-control">
			</form>
			<div id="msg"></div>
			<br/>
			<input id="cancelBtn" type="button" value="취소 " onclick="window.close()" class="form-control"><br/>
			<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()" class="form-control">
		</div>
	</div>
</body>
</html>