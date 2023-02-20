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

<script>
	/* $(function() {
		$('#summer').on(load, function(){
			location.href = "/writer/summernote.do";
		});
	}); */

	function move(address) {
		location.href = "/writer/list.do?address=" + address;
	}

	/* function insert() {
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

		document.form1.action = "/writer/insert.do";
		document.form1.submit();
	} */
</script>
<style>
#wrapper {
	min-height: 100%;
	position: relative;
	width: 100%;
}
body{
	background: url('/resources/images/background2.jpg');
}
</style>
</head>
<body >
	<header><%@ include file="../include/menu2.jsp"%></header>

	<div class="wrapper">
		<div class="d-flex justify-content-around">

			<div id="left" class="p-2" align="center">
				<%@include file="../include/left.jsp"%>
			</div>

			<div class="p-2 flex-grow-1 border border-top-0 border-bottom-0 border-dark bg-light">
				<div class="d-flex flex-column mb-3 justify-content-center">
					
						
						<%-- <div class="input-group-text" id="basic-addon1"> <c:choose>
						<c:when test="${address == 0}">공지</c:when>
						<c:when test="${address == 1}">자유게시판</c:when>
						<c:when test="${address == 2}">QnA</c:when>
						<c:when test="${address == 3}">FAQs</c:when>
						<c:when test="${address == 4}">전문가 문의</c:when>
						<c:when test="${address == 5}">의뢰게시판</c:when>
					</c:choose> --%>
					
				<%-- <form name="form1" method="post" enctype="multipart/form-data">
							<div class="input-group mb-3 w-75">
								<span class="input-group-text" id="basic-addon1"> <c:choose>
										<c:when test="${address == 0}">공지</c:when>
										<c:when test="${address == 1}">자유게시판</c:when>
										<c:when test="${address == 2}">QnA</c:when>
										<c:when test="${address == 3}">FAQs</c:when>
										<c:when test="${address == 4}">전문가 문의</c:when>
										<c:when test="${address == 5}">의뢰게시판</c:when>
									</c:choose>
								</span> 
								
								<input type="text" class="form-control"
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
									<option value="0" id="pet_code" selected>기타</option>
									<c:forEach var="raw" items="${list}">
									<option value="${raw.pet_code}" id="pet_code">${raw.pet_name}</option>
									</c:forEach>
								</select>
							</div>
						</div> --%>

						<!-- <textarea rows="5" cols="60" name="text" id="description"></textarea> -->
						<%-- <%@ include file="../writer/summernote.jsp" %> --%>
						<iframe src="/writer/summer.do?address=${address}" width="100%" height="800px"></iframe>
						
				
						<%-- <br>
		
						<div class="border border-dark">
						
						<input type="file" name="file1" class="p-3" multiple="multiple">
						
						
						</div>
						<hr>
						<div class="d-flex justify-content-center">
							<div class="btn-group col-6 mx-auto" role="group"
								aria-label="btnGroup">
								<input type="button" class="btn btn-success" value="저장" onclick="insert	()"> 
									
								<input type="button"
									class="btn btn-secondary" value="목록"
									onclick="move('${address}')">
							</div>
						</div>
						<input type="hidden" name="address" id="address" value="${address}">
					</form>--%>
				</div>
			</div>

			<div id="right" class="p-2" align="center">
				<%@include file="../include/left.jsp"%>
			</div>
		</div>
	</div>

</body>
<footer><%@include file="../include/foot.jsp"%></footer>
</html>