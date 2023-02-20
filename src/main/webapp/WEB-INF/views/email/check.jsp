<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Email Check</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/resources/js/bootstrap.js"></script>
<script>
	$(function() {
		$("#send").click(function() {
			document.form1.action = "/email/send.do";
			document.form1.submit();
		});

		$("#checking").click(function() {
			document.form1.action = "/email/checking.do";
			document.form1.submit();
		});
	});
</script>

<style>
.btnLogin {
	font-size: 20px;
	background-color: #ECB601;
	height: 50px;
	width: 490px;
	border-radius: 20px;
	border: 0;
}

.btnLogin:hover {
	background: orange;
	font-size: 25px;
}
</style>

</head>
<body>
	<%@ include file="../include/menu2.jsp"%>
	<h2 align="center">이메일 검사</h2>
	<br>
	<br>
	<br>
	<br>
	<h3 align="center">받는 이메일 주소</h3>
	<br>
	<div class="d-flex justify-content-center">
		<div class="flex-column mb-3">
			<form method="post" name="form1">
				<div class="p-3">
					<input type="hidden" name="senderName" value="Priend"> 
					<input type="hidden" name="senderMail" value="okhg98@gmail.com">
					<input type="hidden" name="subject" value="Priend 이메일 검사">
					<input type="hidden" name="message" value="Priend 이메일 검사입니다. 번호를 잘 입력하세요."> 
						
					<input type="text" name="receiveMail" id="receiveMail" value="${receiveMail}"
							style="width: 300px; height: 35px" 
							<c:if test="${message=='success'}">readonly</c:if>>&nbsp;
					<input class="btn btn-light" type="button" id="send" value="전송">
					<!-- </form> -->
				</div>

				<div class="p-3">
					<span style="color: red;">
					<c:if test="${message=='success'}">이메일 전송 성공! 이메일을 확인해 주세요.</c:if>
					<c:if test="${message=='fail'}">이메일 전송 실패...</c:if>
					</span>
				</div>

				<div class="p-3">
					<!-- <form method="post" name="form2" action="/email/checking.do"> -->
					번호를 입력하세요<br> <input type="text" name="answer" id="answer">
					<input type="button" id="checking" value="확인">
					<span style="color: red;">${check}</span>
				</div>
			</form>
		</div>
	</div>
</body>
</html>