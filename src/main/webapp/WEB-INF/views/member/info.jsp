<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Information</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="/resources/js/bootstrap.js"></script>
<style>
.t-title {
	width: 7em;
	text-align: center;
}

#petlist {
	border: 1
}

#card:hover {
	background: #B4B4B4;
}

#wrapper {
	min-height: 75vh;
	position: relative;
	width: 100%;
}
body{
	background: url("/resources/images/background2.jpg");
}
</style>

<script>
	function pet_info(pet_code) {
		document.form3.action = "/pet/info.do?pet_code=" + pet_code;
		document.form3.submit();
	}

	function change_info() {
		location.href = "/member/change_info_page.do";
	}

	function add_pet() {
		location.href = "/pet/add.do"
	}
	
	function list(page) {
		location.href = "/member/info.do?curPage="+ page;
	}
</script>
</head>
<body>
	<%@include file="../include/menu2.jsp"%>
	<div class="wrapper">
		<div class="d-flex justify-content-around">
			<div id="left" class="p-2" align="center">
				<%@include file="../include/left.jsp"%>
			</div>
			
			<div class="flex-grow-1 border border-top-0 border-bottom-0 border-dark bg-light">
	<br>
	<h2 align="center">개인정보</h2>
	<br>
	<div class="d-flex justify-content-center">
		<table class="table table-striped-columns table-bordered mx-2 w-75">
			<tr>
				<td class="t-title">이름</td>
				<td style="width: 20em">${dto.getName()}</td>
				<td class="t-title">닉네임</td>
				<td>${dto.getNickname()}</td>
			</tr>

			<tr>
				<td class="t-title">이메일</td>
				<td colspan="3">${dto.getEmail()}</td>
			</tr>

			<tr>
				<td class="t-title">우편번호</td>
				<td colspan="3">${dto.getPost_code()}</td>
			</tr>

			<tr>
				<td class="t-title">주소</td>
				<td colspan="3">${dto.getAddress1()}</td>
			</tr>

			<tr>
				<td class="t-title">상세주소</td>
				<td colspan="3">${dto.getAddress2()}</td>
			</tr>

			<tr>
				<td class="t-title">레벨</td>
				<td>${dto.getLv()}</td>
				<td class="t-title">호감도</td>
				<td>${dto.getGrade()}</td>
			</tr>

			<tr>
				<td colspan="4" align="center">
					<div class="d-grid gap-2 col-6 mx-auto">
						<button onclick="change_info()" class="btn btn-secondary"
							type="button">수정하기</button>
						<input type="hidden" value="${dto}" id="dto" name="dto">
					</div>
				</td>
			</tr>
		</table>
		<!-- <br> 
		<br> -->
	</div>

	<br>
	<h2 align="center">반려동물</h2>
	<br>
	<form name="form3" method="post">
		<div class="d-flex justify-content-center" style="max-width: 1300px;">
			<!-- <table id="petlist"
				class="table table-striped-columns table-hover table-bordered mx-2 w-50"> -->

			<c:choose>
				<c:when test="${list.size() == 0}">
					<td>&nbsp;등록된 반려동물이 없습니다.</td>
				</c:when>
				<c:otherwise>					
					<div class="row row-cols-md-3 g-4 ps-2">
						<c:forEach var="pet" items="${pet}">
							<div class="col" onclick="pet_info('${pet.pet_code}')">
								<div class="card" id="card" style="height: 500px;">
								<input type="hidden" value="${pet.pet_code}">
									<c:choose>
										<c:when test="${pet.filename=='-'}">
											<img src="/resources/images/noimage.png" class="card-img-top">
										</c:when>

										<c:otherwise>
											<img src="/resources/images/${pet.filename}"
												class="card-img-top" style="max-height: 400px;">
										</c:otherwise>
									</c:choose>

									<div class="card-body">
										<h5 class="card-title">${pet.pet_name}</h5>
										<p class="card-text">
											${pet.pet_code} ${pet.type_name}
											<c:if test="${pet.gender == true}">Boy</c:if>
											<c:if test="${pet.gender == false}">Girl</c:if><br>
											<fmt:formatDate value="${pet.birth}" pattern="MM/dd/yyyy" />
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<br>
		<div class="d-grid gap-2 col-6 mx-auto">
			<button onclick="add_pet()" class="btn btn-secondary" type="button">추가하기</button>
		</div>
		<hr>
		<div class="d-flex justify-content-center"><%@ include file="../writer/page_change.jsp" %></div>
	</form>
	<br>
	</div>
	<div id="right" class="p-2" align="center">
				<%@include file="../include/right.jsp"%>
			</div>
		</div>
	</div>
	<footer><%@include file="../include/foot.jsp"%></footer>
</body>
</html>