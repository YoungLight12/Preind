<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$("#btnUpdate").click(function() {
			var pw = $("#pw").val();
			var name = $("#name").val();

			if (pw == "") {
				alert("비밀번호를 입력하세요.");
				$("#pw").focus();
				return;
			}
			if (name == "") {
				alert("이름을 입력하세요.");
				$("#name").focus();
				return;
			}

			document.form1.action = "/member/update.do";
			document.form1.submit();
		});

		$("#btnDelete").click(function() {
			if (confirm("탈퇴하시겠습니까?")) {
				document.form2.action = "/member/delete.do";
				document.form2.submit();
			}
		});
	});

	function email_check() {
		location.href = "/email/check.do";
	}

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
.t-title {
	width: 7em;
	text-align: center;
}
</style>

	<h2 align="center">개인정보</h2>
	<br>
<form method="post" name="form1">
	<div class="d-flex justify-content-center">
		<table class="table table-striped-columns table-bordered w-auto">
			
				<tr>
					<td class="t-title">아이디</td>
					<td style="width: 20em">${dto.getId()}<input type="hidden"
						id="id" name="id" value="${dto.getId()}">
					</td>

					<td class="t-title">비밀번호</td>
					<td><input type="password" id="pw" name="pw"
						value="${dto.getPw()}"></td>
				</tr>

				<tr>
					<td class="t-title">이름</td>
					<td><input type="text" id="name" name="name" placeholder="이름"
						value="${dto.getName()}"></td>

					<td class="t-title">닉네임</td>
					<td><input type="text" id="nickname" name="nickname"
						placeholder="닉네임" value="${dto.getNickname()}"></td>
				</tr>

				<tr>
					<td class="t-title">이메일</td>
					<td colspan="3">
					<input type="hidden" value="${dto.getEmail()}">
						${dto.getEmail()}</td>
				</tr>

				<tr>
					<td class="t-title">우편번호</td>
					<td colspan="3"><input name="post_code" id="post_code"
						placeholder="우편번호" value="${dto.getPost_code()}" readonly>
						<input type="button" class="btn btn-secondary btn-sm"
						onclick="showPostcode()" value="우편번호 찾기"></td>
				</tr>

				<tr>
					<td class="t-title">주소</td>
					<td colspan="3"><input name="address1" id="address1"
						placeholder="주소" value="${dto.getAddress1()}" readonly
						style="width: 50em;"></td>
				</tr>

				<tr>
					<td class="t-title">상세주소</td>
					<td colspan="3"><input name="address2" id="address2"
						placeholder="상세주소" value="${dto.getAddress2()}"
						style="width: 50em;"></td>
				</tr>

				<tr>
					<td class="t-title">레벨</td>
					<td>${dto.getLv()}&nbsp;<c:if test="${dto.getLv() == 1}">
							<button type="button" class="btn btn-dark btn-sm"
								onclick="email_check()">이메일 인증</button>
						</c:if> <input type="hidden" id="lv" name="lv" value="${dto.getLv()}">
					</td>
					<td class="t-title">호감도</td>
					<td>${dto.getGrade()}<input type="hidden" id="grade"
						name="grade" value="${dto.getGrade()}"></td>
				</tr>

				<tr>
					<td colspan="4" align="center">
						<div class="d-grid gap-2">
							<input class="btn btn-info" type="button" id="btnUpdate"
								value="수정하기">
						</div>
				</tr>
			
		</table>
	</div>
</form>


	<form method="post" name="form2">
		<h6 align="center">
			<input type="hidden" id="id" name="id" value="${dto.getId()}">
			<button type="button" class="btn btn-outline-light btn-sm"
				id="btnDelete">탈퇴하기</button>
		</h6>
	</form>