<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/resources/js/bootstrap.js"></script>
<script>
	$(function() {
		$("#btnFind_id").click(function() {
			var name = $("#name").val();
			var email = $("#email").val();

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
			console.log("button1:"+$("#button1").attr("data-bs-toggle"));
			//document.form1.submit();
			var params = {
				"name" : name,
				"email" : email
			};

			$.ajax({
				type : "post",
				url : "/member/find_id.do",
				data : params,
				success : function(message) {
					$("#result").html(message);
					if (message == "false1") { 
						if(alert("이메일 전송 성공. 이메일을 확인하세요.")){				
							location.href = "/login/login_page.do";							
						}		
					} 
					
					if (message == "false2") {
						$("#button1").attr("data-bs-toggle");
					} 
					
					if (message == "success"){
						if(alert("이메일 전송 성공. 이메일을 확인하세요.")){				
							location.href = "/login/login_page.do";							
						}
					}   
					
					/* $("#result").html($("#button1").attr("data-bs-toggle"));
					$("#result").html(message); */
					/* var html = "<a href='"+fileInfo.get_link+"'>"
					+ fileInfo.original_name
					+ "</a><br>";
					
					$("#uploadedList").append(html); 
					
					$("#result").html(message); */
				}
			}); 
		});
	});
	
	function modal(){
		data-bs-toggle="modal" 
		data-bs-target="#staticBackdrop"
	}
</script>

<style>
.flex {
	display: flex;
	justify-content: center;
}

table {
	width: 1000px;
	height: 500px;
	border-radius: 20px;
	padding: 80px;
}

.text {
	width: 400px;
	height: 50px;
	font-size: 20px;
	border-bottom: 1;
	border-top: 0;
	border-left: 0;
	border-right: 0;
	font-size: 20px;
}

td {
	border: 0;
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

#bottom {
	text-decoration: none;
	font-size: 14px;
	color: gray;
}
</style>

</head>
<body>

	<%@include file="../include/menu2.jsp"%>

	<br>
	<br>

	<h1 align="center">아이디 찾기</h1>

	<br>
	<div class="d-flex justify-content-center">
		<form method="post" action="/login/find_id.do" name="form1">
			<table border="1" style="border-radius: 20px">
				<tr>
					<td style="height: 20px"></td>
				</tr>
				<tr>
					<td align="center"><input id="name" name="name"
						placeholder="이름" class="text"></td>
				</tr>

				<tr>
					<td align="center"><input id="email" name="email"
						placeholder="이메일@email.com" class="text"></td>
				</tr>

				<tr>
					<td align="center">
						<button type="button" id="btnFind_id">아이디 찾기</button>
					</td>
				</tr>

				<tr>
					<td style="height: 30px"></td>
				</tr>
			</table>

			<br>

			<div align="center" id="bottom">
				<a href="/login/find_pw_page.do" id="bottom">비밀번호 찾기</a> | <a
					href="/login/join.do" id="bottom">회원가입</a>
			</div>
		</form>
	</div>

	<div class="p-4"></div>

	<%@include file="../include/foot.jsp" %>
</body>
</html>