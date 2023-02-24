<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet Information</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/resources/js/bootstrap.js"></script>

<script>
$(function(){
	if("${sessionScope.id}" == "${dto.id}"){
		$("#update").css("visibility", "visible");
		$("#homepage").css("visibility", "hidden");
	} else {
		$("#update").css("visibility", "hidden");
		$("#homepage").css("visibility", "visible");
	}
});

	function change_info() {
		document.form1.action = "/pet/change_info_page.do";
		document.form1.submit();
	}
	
	function down(pet_code) {
		var pet_code = $("#pet_code").val();
		location.href = "/pet/down.do?pet_code="+pet_code;
	}
	
	function up(pet_code) {
		var pet_code = $("#pet_code").val();
		location.href = "/pet/up.do?pet_code="+pet_code;
	}
	
	function homepage(id){
		location.href = "/homepage/homepage.do?id="+id;
	}
</script>

<style>
.t-title {
	width: 7em;
	text-align: center;
}

#arrow {
	color: #E2E2E2;
	height: 10cm;
	width: 5cm;
	background: white;
	border: 0;
	font-size: 5cm;
}

#arrow:hover {
	color: gray;
}
</style>
</head>

<body>
	<%@include file="../include/menu2.jsp"%>

	<h2 align="center">반려동물 정보</h2>
	<br>

	<div class="d-flex justify-content-around">
		<div class="p-2 align-self-center">
			<button id="arrow" onclick="down(${dto.getPet_code()})">◀</button>
		</div>

		<div class="p-2 align-self-center">
			<div class="d-flex flex-column-reverse">
				<div class="p-2 align-self-center">
					<c:choose>
						<c:when test="${dto.getFilename()=='-'}">
							<img src="/resources/images/noimage.png" style="height: 10cm">
						</c:when>

						<c:otherwise>
							<img src="/resources/images/${dto.getFilename()}"
								style="height: 10cm;">
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<div class="p-2">

				<table class="table table-striped-columns table-bordered">
					<tr>
						<td class="t-title">이름</td>
						<td style="width: 20em">${dto.getPet_name()}</td>

						<td class="t-title">성별</td>
						<td style="width: 20em"><c:if
								test="${dto.getGender() == true}">Boy</c:if> <c:if
								test="${dto.getGender() == false}">Girl</c:if></td>
					</tr>
					<tr>
						<td class="t-title">종류</td>
						<td>${dto.getType_name()}</td>

						<td class="t-title">크기</td>
						<td><c:choose>
								<c:when test="${dto.getSize() == 1}">소형</c:when>
								<c:when test="${dto.getSize() == 2}">중형</c:when>
								<c:when test="${dto.getSize() == 3}">대형</c:when>
							</c:choose></td>
					</tr>

					<tr>
						<td class="t-title">생일</td>
						<td><fmt:formatDate value="${dto.getBirth()}"
								pattern="yyyy/MM/dd" /></td>

						<td class="t-title">몸무게</td>
						<td><c:if test="${dto.getWeight() == 0}">?</c:if> <c:if
								test="${dto.getWeight() != 0}">${dto.getWeight()} kg</c:if></td>
					</tr>

					<tr>

						<td colspan="2" align="center">안 짖어요~&nbsp;
							<div class="btn-group">
								<a
									class="btn btn-primary <c:if test="${dto.getBark() == 1}">active</c:if>">1</a>
								<a
									class="btn btn-primary <c:if test="${dto.getBark() == 2}">active</c:if>">2</a>
								<a
									class="btn btn-primary <c:if test="${dto.getBark() == 3}">active</c:if>">3</a>
								<a
									class="btn btn-primary <c:if test="${dto.getBark() == 4}">active</c:if>">4</a>
								<a
									class="btn btn-primary <c:if test="${dto.getBark() == 5}">active</c:if>">5</a>
							</div> &nbsp;짖어요!
						</td>

						<td colspan="2" align="center">안 물어요~&nbsp;
							<div class="btn-group">
								<a class="btn btn-primary <c:if test="${dto.getBite() == 1}">active</c:if>">1</a>
								<a class="btn btn-primary <c:if test="${dto.getBite() == 2}">active</c:if>">2</a>
								<a class="btn btn-primary <c:if test="${dto.getBite() == 3}">active</c:if>">3</a>
								<a class="btn btn-primary <c:if test="${dto.getBite() == 4}">active</c:if>">4</a>
								<a class="btn btn-primary <c:if test="${dto.getBite() == 5}">active</c:if>">5</a>
							</div> &nbsp;물어요!
						</td>
					</tr>

					<tr>
						<td colspan="4" align="center">
							<div class="d-grid gap-2">
								<form name="form1" method="post" action="/pet/change_info_page.do">
									<input type="hidden" value="${dto.getPet_code()}" id="pet_code" name="pet_code">
									<div class="d-grid gap-2 col-6 mx-auto">
										<input type="submit" value="수정하기" class="btn btn-info" id="update">
										<input type="button" value="홈페이지" class="btn btn-info" id="homepage" 
										onclick="location.href='/homepage/homepage.do?id=${dto.id}'">
									</div>
								</form>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="p-2 align-self-center">
			<button id="arrow" onclick="up(${dto.getPet_code()})">▶</button>
		</div>
	</div>
</body>
<footer><%@ include file="../include/foot.jsp" %></footer>
</html>