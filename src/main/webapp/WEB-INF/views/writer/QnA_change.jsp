<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="/resources/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script src="/resources/ckeditor/ckeditor.js"></script>
<script>
$(function() {
	$("#description").summernote({
		minHeight : 500,
		maxHeight : 500
	});
});

	function move(address) {
		location.href = "/writer/list.do?address=" + address;
	}
/* 	function deleteD(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action = "/writer/delete.do";
			document.form1.submit();	
		}
	}

	function update() {
		var title = $("#title").val();
		var text = $("#description").val();

		if (title == "") {
			alert("제목을 입력하세요.");
			document.form1.title.focus();
			return;
		}
		if (text == "") {
			alert("내용을 입력하세요.");
			document.form1.text.focus();
			return;
		}

		document.form1.action = "/writer/update.do";
		document.form1.submit();
	} */
</script>
<style>
#wrapper {
	min-height: 100%;
	position: relative;
}
body {
	background: url('/resources/images/background2.jpg');
}
</style>
</head>
<body>
	<header><%@ include file="../include/menu2.jsp"%></header>

	<div class="wrapper">
		<div class="d-flex justify-content-around">

			<div id="left" class="p-2" align="center">
				<%@include file="../include/left.jsp"%>
			</div>

			<div class="p-2 flex-grow-1 border border-top-0 border-bottom-0 border-dark bg-light">
				<div class="d-flex flex-column mb-3 justify-content-center">
					<iframe src="/writer/summer_change.do?write_code=${dto.write_code}" width="100%" height="800px"></iframe>
					<%-- <form name="form1" method="post" enctype="multipart/form-data">
						<div class="d-flex">
							<div class="input-group mb-3 w-75">
								<span class="input-group-text" id="basic-addon1"> <c:choose>
										<c:when test="${dto.address == 0}">공지</c:when>
										<c:when test="${dto.address == 1}">자유게시판</c:when>
										<c:when test="${dto.address == 2}">QnA</c:when>
										<c:when test="${dto.address == 3}">FAQs</c:when>
										<c:when test="${dto.address == 4}">전문가 문의</c:when>
										<c:when test="${dto.address == 5}">의뢰게시판</c:when>
									</c:choose>
								</span> <input type="text" class="form-control" value="${dto.title}"
									placeholder="제목을 입력하세요." id="title" name="title">
							</div>

							<div>
								<select class="form-select" id="inputGroupSelect03"
									aria-label="Example select with button addon">
									<option selected>기타</option>
									<option>강아지</option>
									<option>고양이</option>
									<option>기타 동물</option>
								</select>
							</div>

							<div>
								<select class="form-select" id="pet_code" name="pet_code">
									<option id="pet_code" value="0" selected>기타</option>
									<c:forEach var="list" items="${list}">
										<option value="${list.getPet_code()}" id="pet_code"
									<c:if test="${list.pet_code == dto.pet_code }">selected</c:if>>
									${list.getPet_name()}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="d-flex justify-content-between"
							style="font-size: large;">
							<div>${dto.getNickname()}</div>
							<div></div>
							<div>${dto.getDate()}</div>
						</div>

						<!-- <textarea name="description" id="description"></textarea>
						<script>CKEDITOR.replace("description",{filebrowserUploadUrl : "/imageUpload.do"});</script> -->
						<textarea rows="5" cols="60" name="text" id="description">${dto.text}</textarea>

						<br>
						<div class="d-flex justify-content-center">
							<div class="btn-group col-6 mx-auto" role="group"
								aria-label="btnGroup">
								<c:if test="${sessionScope.id.equals(dto.getId())}">
									<input type="button" class="btn btn-success" value="수정"
										onclick="update(${dto.getWrite_code()})">
									<input type="button" class="btn btn-danger" value="삭제"
										onclick="deleteD()">
								</c:if>

								<input type="button" class="btn btn-secondary" value="목록"
									onclick="move('${dto.getAddress()}')">
							</div>
						</div>
						<input type="hidden" name="address" id="address"
							value="${dto.address}"> <input type="hidden"
							name="write_code" id="write_code" value="${dto.write_code}">
					</form> --%>
				</div>
			</div>

			<div id="right" class="p-2" align="center">
				<%@include file="../include/right.jsp"%>
			</div>
		</div>
	</div>

</body>
<footer><%@include file="../include/foot.jsp"%></footer>
</html>