<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	function write_info(write_code) {
		document.form0.action = "/writer/info.do?write_code=" + write_code;
		document.form0.submit();
	}

	function move(address) {
		location.href = "/writer/list.do?address=" + address;
	}
</script>
<br>
<h2>공지사항</h2>
<form method="post" name="form0">
	<table class="table table-bordered table-striped table-hover w-75">
		<thead class="table-dark">
			<tr align="center">
				<th></th>
				<th>닉네임</th>
				<th style="width: 50%;">제목</th>
				<th>파일</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>

		<tbody class="table-group-divider">
			<c:if test="${notice.size() == 0 }">
				<tr>
					<td colspan="6" align="center">등록된 공지가 없습니다.</td>
				</tr>
			</c:if>

			<c:forEach var="notice" items="${notice}">
				<input type="hidden" name="write_code" id="write_code"
					value="${notice.write_code}">
				<tr onclick="write_info('${notice.write_code}')" align="center">
					<th>${notice.write_code}</th>
					<td>${notice.nickname}</td>
					<td>${notice.title}</td>
					<td><c:choose>
							<c:when test="${notice.filecount == 0}">
							-
							</c:when>
							<c:otherwise>
								<img src="../resources/images/File.png" height="25px">
							</c:otherwise>
						</c:choose></td>
					<td>${notice.date}</td>
					<td>${notice.hit}</td>
				</tr>
			</c:forEach>
		</tbody>

		<tfoot class="table-group-divider">
			<tr>
				<td colspan="6">
					<div class="d-grid gap-2 col-6 mx-auto">
						<button class="btn btn-dark" type="button" onclick="move(0)">More...</button>
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
</form>
