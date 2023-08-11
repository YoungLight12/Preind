<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>

<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="/resources/js/bootstrap.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
<link rel="stylesheet" type="text/css"
	href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
<link rel="stylesheet" type="text/css"
	href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
	$(document).ready(function() {
		$('.summernote').summernote({
			minHeight : 500,
			maxHeight : 500
		});
	});
	
	function move(address) {
		window.parent.move(address);
	}

	function insert() {
		var title = $("#title").val();
		var text = $('.summernote').summernote('code');
		
		if (title == "") {
			alert("제목을 입력하세요.");
			document.form1.title.focus();
			return;
		}
		if (text == "") {
			alert("내용을 입력하세요.");
			return;
		}
		
		document.form1.action = "/writer/insert.do?text="+text;
		document.form1.submit();
	
		window.parent.move('${address}');
	}
</script>
</head>
<body class="bg-light">
	<form name="form1" method="post" enctype="multipart/form-data">
		<div class="d-flex">
			<div class="input-group mb-3 w-75">
				<span class="input-group-addon" id="basic-addon1"> <c:choose>
						<c:when test="${address == 0}">공지</c:when>
						<c:when test="${address == 1}">자유게시판</c:when>
						<c:when test="${address == 2}">QnA</c:when>
						<c:when test="${address == 3}">FAQs</c:when>
						<c:when test="${address == 4}">전문가 문의</c:when>
						<c:when test="${address == 5}">의뢰게시판</c:when>
					</c:choose>
				</span> 
				
				<input type="text" class="form-control" placeholder="제목을 입력하세요." id="title" name="title">
			</div>
			<!-- /input-group -->
			<div>
				<select class="form-control" id="pet_code" name="pet_code">
					<option value="0" id="pet_code" selected>기타</option>
					<c:forEach var="raw" items="${list}">
						<option value="${raw.pet_code}" id="pet_code">${raw.pet_name}</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<div class="summernote"></div>
		<hr>
		<div class="border border-dark">
			<input type="file" name="files" class="p-3" multiple="multiple">
		</div>
		<hr>
		<div class="btn-group btn-group-justified" role="group">
			<div class="btn-group" role="group">
				<input type="button" class="btn btn-success" value="저장" onclick="insert	()">
			</div>
			<div class="btn-group" role="group">
				 <input type="button" class="btn btn-secondary" value="목록" onclick="move('${address}')">
			</div>
		</div>
		<input type="hidden" name="address" id="address" value="${address}">
	</form>
</body>
</html>