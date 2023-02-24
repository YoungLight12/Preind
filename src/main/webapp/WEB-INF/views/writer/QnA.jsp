<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><c:choose>
								<c:when test="${address==1}">자유게시판</c:when>
								<c:when test="${address==2}">QnA</c:when>
								<c:when test="${address==3}">FAQs</c:when>
								<c:when test="${address==4}">전문가 게시판</c:when>
								<c:when test="${address==5}">의뢰 게시판</c:when>
							</c:choose></title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/resources/js/bootstrap.js"></script>

<script>
	function write_info(write_code) {
		document.form3.action = "/writer/info.do?write_code=" + write_code;
		document.form3.submit();
	}
	
	function W(address) {
		location.href = "/writer/write.do?address=" + address;
	}
</script>

<style>
#wrapper {
	/* height: auto;
	min-height: 100%;
	padding-bottom: 150px; */
	min-height: 75vh;
	position: relative;
	width: 100%;
}
body{
	background: url('/resources/images/background2.jpg');
}
#body{
	min-height: 75vh;
}
</style>

</head>
<body>
	<header>
		<%@include file="../include/menu2.jsp"%>
	</header>

	<div id="wrapper">

		<div class="d-flex justify-content-around">

			<div id="left" class="p-2" align="center">
				<%@include file="../include/left.jsp"%>
			</div>

			<div class="p-2 flex-grow-1 border border-top-0 border-bottom-0 border-dark bg-light" align="center" id="body">
				<div class="d-flex flex-column mb-3">
					<div>
						<%@ include file="../writer/mininotice.jsp"%>
					</div>

					<div>
						<h2 align="center">
							<c:choose>
								<c:when test="${address==1}">자유게시판</c:when>
								<c:when test="${address==2}">QnA</c:when>
								<c:when test="${address==3}">FAQs</c:when>
								<c:when test="${address==4}">전문가 게시판</c:when>
								<c:when test="${address==5}">의뢰 게시판</c:when>
							</c:choose>
						</h2>
					</div>

					<div>
						<form method="post" id="form3" name="form3">
							<table class="table table-bordered table-striped table-hover w-75">
								<thead class="table-dark">
									<tr align="center">
										<th></th>
										<th>닉네임</th>
										<th class="w-50">제목</th>
										<th>파일</th>
										<th>날짜</th>
										<th>조회수</th>
									</tr>
								</thead>

								<c:if test="${list.size() == 0 }">
									<tr>
										<td colspan="8" align="center">등록된 QnA가 없습니다.</td>
									</tr>
								</c:if>

								<c:forEach var="list" items="${list}">
									<input type="hidden" name="write_code" id="write_code"
										value="${list.write_code}">
									<tr onclick="write_info('${list.write_code}')" align="center">
										<td>${list.write_code}</td>
										<td>${list.nickname}</td>
										<td>${list.title}</td>
										<td><c:choose>
												<c:when test="${list.filename == null}">
												-
												</c:when>
												<c:otherwise>
													<img src="../resources/images/File.png" height="25px">
												</c:otherwise>
											</c:choose></td>
										<td>${list.date}</td>
										<td>${list.hit}</td>
									</tr>
								</c:forEach>
								
								<tfoot class="table-group-divider">
								<c:choose>
								<c:when test="${address == 3 }">
								<c:if test="${lv >= 10}">
									<tr align="center">
										<td colspan="6"><input class="btn btn-dark"
											onclick="W('${address}')" value="글쓰기"></td>
									</tr>
								</c:if>
								</c:when>
								<c:otherwise>
								<c:if test="${lv >= 1}">
									<tr align="center">
										<td colspan="6"><input class="btn btn-dark"
											onclick="W('${address}')" value="글쓰기"></td>
									</tr>
								</c:if>
								</c:otherwise>
								</c:choose>
							</tfoot>
							</table>
						</form>
					</div>
				</div>

				<div class="d-flex justify-content-center">
					<%@ include file="../writer/page_search.jsp"%>
				</div>

				<div class="d-flex justify-content-center">
					<%@ include file="../writer/page_change.jsp"%>
				</div>
			</div>

			<div id="right" class="p-2" align="center">
				<%@include file="../include/right.jsp"%>
			</div>
		</div>
	</div>
</body>

<footer>
	<%@include file="../include/foot.jsp"%>
</footer>

</html>