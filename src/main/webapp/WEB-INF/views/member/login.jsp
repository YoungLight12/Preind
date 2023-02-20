<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function() {
		$("#id").focus();

		$("#btnLogin").click(function() {
			login();
		});
	});

	function enter() {
		if (window.event.keyCode == 13) {
			document.getElementById("btnLogin").click();
		}
	}

	function login() {
		var id = $("#id").val();
		var pw = $("#pw").val();

		if (id == "") {
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return;
		}
		if (pw == "") {
			alert("비밀번호를 입력하세요.");
			$("#pw").focus();
			return;
		}
		document.form1.submit();
	}
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

table {
	width: 1000px;
	height: 500px;
	border-radius: 20px;
	padding-top: 80px;
	background: white;
}

body {
	padding: 100px;
	background: url("/resources/images/background1.jpg");
}

.text {
	font-size: 20px;
	border-bottom: 1;
	border-top: 0;
	border-left: 0;
	border-right: 0;
	width: 400px;
	height: 50px;
}

.flex {
	display: flex;
	justify-content: center;
}

td {
	border: 0;
	height: 55px;
}

.bottom {
	font-size: 14px;
	color: gray;
}

a {
	color: gray;
	text-decoration: none;
}
</style>
</head>
<body>
	<div align="center">
		<a href="/"> <img src="/resources/images/home1-.png" width="600px" height="150px">
		</a>
	</div>

	<br>
	<br>

	<div class="flex">
		<form method="post" action="/login/login.do" name="form1">
			<table border="1">
				<tr>
					<td align="center"><input id="id" name="id" onkeydown="enter()" class="text"></td>
				</tr>

				<tr>
					<td align="center"><input type="password" id="pw" name="pw" onkeydown="enter()" class="text"></td>
				</tr>

				<tr>
					<td align="center">
					<input type="button" value="로그인" class="btnLogin" id="btnLogin">
					</td>
				</tr>

				<tr>
					<td align="center" style="height: 30px">
						<c:if test="${message=='error'}">
							<div style="color: red">아이디 또는 비밀번호가 일치하지 않습니다.</div>
						</c:if> <c:if test="${message=='logout'}">
							<div style="color: red">로그아웃 되었습니다.</div>
						</c:if> <c:if test="${param.message=='nologin'}">
							<div style="color: blue">로그인 하신 후 사용하세요.</div>
						</c:if>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<br>

	<div align="center" class="bottom">
		<a href="/login/find_id_page.do">아이디 찾기</a> | 
		<a href="/login/find_pw_page.do">비밀번호 찾기</a> | 
		<a href="/login/join.do">회원가입</a>
	</div>
</body>
</html>