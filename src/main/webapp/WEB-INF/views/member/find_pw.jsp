<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/resources/js/bootstrap.js"></script>
<script>
	$(function() {
		$("#btnFind_pw").click(function() {
			var name = $("#name").val();
			var email = $("#email").val();
			var id = $("#id").val();


			if (id == "") {
				alert("아이디를 입력하세요.");
				$("#id").focus();
				return;
			}
			if (name == "") {
				alert("이름을 입력하세요.");
				$("#name").focus();
				return;
			}
			if (email == "") {
				alert("이메일을 입력하세요.");
				$("#email").focus();
				return;
			}
			document.form1.submit();
		});
	});
</script>

<style>
.flex {
	display: flex;
	justify-content: center;
}

table{
	width: 1000px;
	height: 500px;
	border-radius: 20px;
	padding: 80px;
}


.text{
	width: 400px;
	height: 50px; font-size : 20px;
	border-bottom: 1;
	border-top: 0;
	border-left: 0;
	border-right: 0;
	font-size: 20px;
}

td {
	border:0;
	height: 55px;
}

#btnFind_id {
	font-size: 20px;
	background-color: #ECB601;
	height: 50px;
	width: 490px;
	border-radius: 20px;
	border: 0;
}

#btnFind_id:hover {
	background: orange;
	font: bold;
	font-size: 25px;
}

#bottom{
	text-decoration: none;
	font-size: 14px;
	color: gray;
}
</style>

</head>
<body>

	<%@include file="../include/menu2.jsp" %>

	<br><br>
	
	<h1 align="center">비밀번호 찾기</h1>
	
	<br>
	
	<div class="flex">
		<form method="post" action="/login/find_pw.do" name="form1">
			<table border="1">
				<tr>
					<td style="height: 20px"></td>
				</tr>
			
				<tr>
					<td align="center">
						<input id="id" name="id" placeholder="아이디" class="text">
					</td>
				</tr> 
				
				<tr>
					<td align="center">
						<input id="name" name="name" placeholder="이름" class="text">
					</td>
				</tr>
				
				<tr>
					<td align="center">
						<input id="email" name="email" placeholder="이메일@email.com" class="text">
					</td>
				</tr>
				
				<tr>
					<td align="center">
						<button type="button" id="btnFind_pw">비밀번호 찾기</button>
					</td>
				</tr>
				
				<tr>
					<td style="height: 30px"></td>
				</tr>
			</table>
			
			<br>
			
			<div align="center" id="bottom">
				<a href="/login/find_id_page.do" id="bottom">아이디 찾기</a> | 
				<a href="/login/join.do" id="bottom">회원가입</a>
			</div>
		</form>
	</div>
	
	<div class="p-4"></div>
	
	<%@include file="../include/foot.jsp" %>
</body>
</html>