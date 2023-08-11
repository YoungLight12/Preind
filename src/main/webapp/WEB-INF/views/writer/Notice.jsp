<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/resources/js/bootstrap.js"></script>

<script>
	function write_info(write_code) {
		document.form3.action = "/writer/info.do?write_code=" + write_code;
		document.form3.submit();
	}

	function list(page) {
		location.href = "/writer/list.do?curPage="
				+ page
				+ "&search_option=${search_option}&keyword=${keyword}&address=0";
	}

	function W(address) {
		location.href = "/writer/write.do?address=" + address;
	}
</script>

<style>
#wrapper {
	min-height: 75vh;
	position: relative;
	width: 100%;
}
</style>
</head>
<body style="background: url('/resources/images/background2.jpg');">
	<header>
		<%@include file="../include/menu2.jsp"%>
	</header>

	<div id="wrapper">
		<h2 align="center" style="font-weight: bolder; font-size: 50px; color: orange;">NOTICE</h2>

		<div class="d-flex justify-content-around">
			<div id="left" class="p-2" align="center">
				<%@include file="../include/left.jsp"%>
			</div>

			<div class="p-2 flex-grow-1">
				<div align="center">
					<form method="post" id="form3" name="form3">
						<table class="table table-bordered table-striped table-hover w-75" style="background: white;">
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

							<tbody>

								<c:if test="${list.size() == 0 }">
									<tr>
										<td colspan="6" align="center">등록된 공지가 없습니다.</td>
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
												<c:when test="${list.filecount == 0}">-</c:when>
												<c:otherwise>
													<img src="../resources/images/File.png" height="25px">
												</c:otherwise>
											</c:choose></td>
										<td>${list.date}</td>
										<td>${list.hit}</td>
									</tr>
								</c:forEach>

							</tbody>

							<tfoot class="table-group-divider">
								<c:if test="${lv >= 10}">
									<tr align="center">
										<td colspan="6"><input class="btn btn-dark"
											onclick="W('${address}')" value="공지 작성"></td>
									</tr>
								</c:if>
							</tfoot>
						</table>
					</form>

					<div class="d-flex justify-content-center">
						<%@ include file="../writer/page_search.jsp"%>
					</div>

					<div class="d-flex justify-content-center">
						<%@ include file="../writer/page_change.jsp"%>
					</div>
				</div>
			</div>

			<div id="right" class="p-2" align="center">
				<%@include file="../include/right.jsp"%>
			</div>
		</div>
	</div>

	<footer><%@include file="../include/foot.jsp"%></footer>
</body>
</html>