<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글보기</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>

<!-- Development version -->
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>

<!-- Production version -->
<script src="https://unpkg.com/@popperjs/core@2"></script>

<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="/resources/js/bootstrap.js"></script>

<script>
	$(function() {		
		pet_info();
		reply();
	});

	function move(address) {
		location.href = "/writer/list.do?address=" + address;
	}
	
	function update(write_code){
		location.href = "/writer/update_page.do?write_code="+write_code;
	}
	
	function de(){
		if(confirm("삭제하시겠습니까?")){
			document.a.action = "/writer/de.do";
			document.a.submit();
		}
	}

function pet_info(){
	if(${dto.pet_code != 0}){
	$.ajax({
		type : "post",
		url : "/pet/info_only.do?pet_code="+${dto.getPet_code()},
		
		success : function(result) {
			$("#div1").html(result);
		}
	});
	}
}

function reply(){
	$.ajax({
		type : "post",
		url : "/reply/list.do?write_code="+${dto.getWrite_code()},
		
		success : function(result) {
			$("#div2").html(result);
		}
	});
}

function reply_input(){
	var reply_text = $("#reply_text").val();
	var write_code = $("#write_code").val();
	var id = $("#id").val();
	var params = {
		"reply_text" : reply_text,
		"write_code" : write_code,
		"id" : id
	};

	$.ajax({
		type : "post",
		url : "/reply/insert.do",
		data : params,
		success : function() {
			$("#reply_text").val("");
			alert("댓글이 등록되었습니다.");
			list("1");
		}
	});
}

	function list(page) {
		$.ajax({
			url : "/reply/list.do?write_code=${dto.write_code}&curPage=" + page,
			success : function(result) {
				$("#div2").html(result);
			}
		});
	}
	
	function showModify(idx) {
		$.ajax({
			url : "/reply/detail/" + idx,
			success : function(result) {
				$("#modifyReply").html(result);
				$("#modifyReply").css("visibility", "visible");
			}
		});
	}
	
	function reply_delete(idx){
		if(confirm("삭제하시겠습니까?")){
		$.ajax({
			type : "post",
			url : "/reply/delete/"+idx,
			data : idx,
			success : function() {
				$("#reply_text").val("");
				alert("삭제되었습니다.");
				list("1");
			}
		});
		}
	}
	
	function reply_update(idx){
		var reply_text = $("#reply_update").val();
		var params = {
				"idx" : idx,
				"reply_text" : reply_text,
			};

		$.ajax({
			type : "post",
			url : "/reply/update/"+idx,
			data : params,
			success : function(result) {
				if (result == "success") {
				$("#modifyReply").css("visibility", "hidden");
				list("1");
				}
			}
		});
	}
	
	function reply_close(){
		$.ajax({
			success : function() {
				$("#modifyReply").css("visibility", "hidden");
				list("1");
			}
		});
	}
</script>

<style>
#wrapper {
	min-height: 100%;
	position: relative;
	width: 100%;
}

body {
	background: url('/resources/images/background2.jpg');
}

#body {
	background: white;
	min-height: 75vh;
}
</style>
</head>
<body>
	<header><%@ include file="../include/menu2.jsp"%></header>


	<div class="wrapper">
		<div class="d-flex justify-content-around">

			<div id="left" align="center">
				<%@include file="../include/left.jsp"%>
			</div>

			<div class="flex-grow-1 px-3 border border-top-0 border-bottom-0 border-dark" id="body">
				<br>
				<h2 align="center">
					<c:choose>
						<c:when test="${dto.getAddress() == 0}">공 지 사 항</c:when>
						<c:when test="${dto.getAddress() == 1}">자유게시판</c:when>
						<c:when test="${dto.getAddress() == 2}">QnA</c:when>
						<c:when test="${dto.getAddress() == 3}">FAQs</c:when>
						<c:when test="${dto.getAddress() == 4}">전문가 문의</c:when>
						<c:when test="${dto.getAddress() == 5}">의뢰게시판</c:when>
					</c:choose>
				</h2>

				<c:if test="${dto.getAddress() != 0}">
					<div id="div1"></div>
				</c:if>

				<div class="d-flex flex-column mb-3 justify-content-center">
						<div class="d-flex">
							<div class="input-group mb-3 w-75">
								<span class="input-group-text" id="basic-addon1"> <c:choose>
										<c:when test="${dto.getAddress() == 0}">공지</c:when>
										<c:when test="${dto.getAddress() == 1}">자유게시판</c:when>
										<c:when test="${dto.getAddress() == 2}">QnA</c:when>
										<c:when test="${dto.getAddress() == 3}">FAQs</c:when>
										<c:when test="${dto.getAddress() == 4}">전문가 문의</c:when>
										<c:when test="${dto.getAddress() == 5}">의뢰게시판</c:when>
									</c:choose>
								</span> <input type="text" class="form-control"
									placeholder="제목을 입력하세요." id="title" name="title"
									value="${dto.getTitle()}" readonly>
							</div>
				
							<div>
								<c:choose>
									<c:when test="${pet_name != '-'}">
										<input value="${pet_name}" type="button"
											class="btn btn-light disabled">
									</c:when>
									<c:otherwise>-</c:otherwise>
								</c:choose>
							</div>
						</div>

						<div class="d-flex" style="font-size: large;">
							<div class="flex-grow-1">
								${dto.getNickname()} <span style="color: red;">( ${dto.hit} )</span>
							</div>

							<div>
								<div class="dropdown">
									<button class="btn btn-outline-info dropdown-toggle btn-sm" type="button"
										data-bs-toggle="dropdown" aria-expanded="false">
										다운로드</button>
									<ul class="dropdown-menu">
									<c:choose>
										<c:when test="${dto.getFilename() == null }">
										<li class="px-2">파일 없음</li>
										</c:when>
										<c:otherwise>
										<li><a class="dropdown-item" 
										href="/writer/display_file.do?filename="${dto.getFilename()}>
										${dto.getFilename()}</a></li>
										</c:otherwise>
										</c:choose>
									</ul>
								</div>
							</div>
							
							<div class="px-3">${dto.getDate()}</div>
						</div>

						<hr>
						<div style="min-height: 500px;">${dto.getText() }</div>
						<hr>

						<br>
						<div class="d-flex justify-content-center">
							<div class="btn-group col-6 mx-auto" role="group"
								aria-label="btnGroup">
								<c:if test="${sessionScope.id.equals(dto.getId())}">
									<input type="button" class="btn btn-success" value="수정"
										onclick="update(${dto.getWrite_code()})">
								</c:if>
							<c:if
								test="${sessionScope.id.equals(dto.getId()) || sessionScope.lv eq '10' }">
								<input type="button" class="btn btn-danger" value="삭제"
									onclick="de()">
							</c:if>

							<input type="button" class="btn btn-secondary" value="목록"
									onclick="move('${dto.getAddress()}')">
							</div>
						</div>
					<form name="a" method="post">
						<input type="hidden" name="address" id="address" value="${dto.getAddress()}"> 
						<input type="hidden" name="write_code" id="write_code" value="${dto.getWrite_code()}">
					</form>
				</div>

				<div id="div2"></div>
				<hr>
				<div id="div3"></div>
			</div>

			<div id="right" class="p-2" align="center">
				<%@include file="../include/right.jsp"%>
			</div>
		</div>
	</div>
	<footer><%@include file="../include/foot.jsp"%></footer>
</body>
</html>