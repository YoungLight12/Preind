<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="/resources/js/bootstrap.js"></script>

<script>
	$(function() {
		$("#btnJoin").click(function() {
			var id = $("#id").val();
			var pw = $("#pw").val();
			var pw_check = $("#pw_check").val();
			var name = $("#name").val();
			var nickname = $("#nickname").val();
			var post_code = $("#post_code").val();
			var id_check_count = $("#id_check_count").val();
			
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
			
			if (pw_check != pw){
				alert("비밀번호가 다릅니다.");
				$("#pw_check").focus();
				return;
			}
			if (name == ""){
				alert("이름을 입력하세요.");
				$("#name").focus();
				return;
			}
			if (id_check_count != 1){
				alert("아이디 검사를 해주세요.");
				return;
			}
			if (nickname == ""){
				nickname = $("#name").val();
			}
			
			document.form1.action = "/login/insert.do"
			document.form1.submit();
		});		
	});
	
	function btnId_check(){
		var id = $("#id").val();

		if (id == "") {
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return;
		}
		
		document.form1.action = "/login/checkid.do";
		document.form1.submit();
	};

	function showPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						let fullAddr = "";
						let extraAddr = "";

						if (data.userSelectedType === "R") {
							fullAddr = data.roadAddress;
						} else {
							fullAddr = data.jibunAddress;
						}

						if (data.userSelectedType === "R") {
							if (data.bname !== "") {
								extraAddr += data.bname;
							}

							if (data.buildingName !== "") {
								extraAddr += (extraAddr !== "" ? ", "
										+ data.buildingName : data.buildingName);
							}

							fullAddr += (extraAddr !== "" ? " (" + extraAddr
									+ ")" : "");
						}
						document.getElementById("post_code").value = data.zonecode;
						document.getElementById("address1").value = fullAddr;
						document.getElementById("address2").focus();
					}
				}).open();
	}
</script>
<style>
.btnJoin {
	font-size: 20px;
	background-color: #ECB601;
	height: 50px;
	width: 400px;
	border-radius: 20px;
	border: 0;
}

.btnJoin:hover {
	background: orange;
	font-size: 25px;
}

body {
	padding: 10px;
	background: url("/resources/images/background1.jpg");
}

.text {
	font-size: 20px;
	border-radius: 10px;
	width: 400px;
	height: 50px;
	padding-left: 15px;
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

li {
	padding-bottom: 10px;
}
</style>
</head>
<body>
	<div align="center">
	&nbsp;&nbsp;
		<a href="/"> <img src="/resources/images/home1-.png" width="400px" height="100px">
		</a>
	</div>

	<br>

	<div class="flex">
		<form method="post" name="form1">
			<ul style="list-style: none;">

				<li>아이디 &nbsp;
					<input class="btn btn-secondary" type="button" onclick="btnId_check()" value="아이디 검사">
					<input type="hidden" id="id_check_count" value="${id_check_count}">
				</li>
				
				<li><input id="id" name="id" placeholder="아이디" class="text" value="${dto.getId()}"></li>
				
				<li>
					<div>
						<c:if test="${result=='error'}">
							<div style="color: red">사용 중인 아이디입니다.</div>
							<input type="hidden" id="checkid" value="0">
						</c:if> 
						<c:if test="${result=='success'}">
							<div style="color: blue">사용 가능한 아이디입니다.</div>
							<input type="hidden" id="checkid" value="1">
						</c:if> 
					</div>
				</li>
				
				<li>비밀번호</li>
				<li><input type="password" id="pw" name="pw" placeholder="비밀번호" class="text" value="${dto.getPw()}"></li>

				<li>비밀번호 재입력</li>
				<li><input type="password" id="pw_check" placeholder="비밀번호 재입력" class="text"></li>

				<li>이름</li>
				<li><input id="name" name="name" placeholder="이름" class="text" value="${dto.getName()}"></li>

				<li>닉네임</li>
				<li><input id="nickname" name="nickname" placeholder="닉네임" class="text" value="${dto.getNickname()}"></li>

				<%-- <li>이메일</li>
				<li><input id="email" name="email" placeholder="이메일@email.com" class="text" value="${dto.getEmail()}"></li> --%>
					
					<br>

				<li>우편번호 &nbsp; 
					<input name="post_code" id="post_code" readonly placeholder=" 우편번호"
					style="border-radius: 5px; width: 150px; height: 25px"> 
					<input type="button" class="btn btn-secondary btn-sm" onclick="showPostcode()" value="우편번호 찾기">
				</li>
				
				<li><input name="address1" id="address1" readonly
					placeholder="주소" onchange=""
					style="border-radius: 7px; width: 400px; height: 30px; font-size: 16px"></li>
				<li><input name="address2" id="address2" placeholder=" 상세주소"
					style="border-radius: 7px; width: 400px; height: 30px; font-size: 16px"></li>

				<br>
				
				<li><input type="button" value="회원가입" class="btnJoin"
					id="btnJoin"></li>
			</ul>
			
		</form>
	</div>

	<br>

	<div align="center" class="bottom">
		<a href="/login/find_id_page.do">아이디 찾기</a> | <a
			href="/login/find_pw_page.do">비밀번호 찾기</a> | <a
			href="/login/login_page.do">로그인</a>
	</div>
</body>
</html>