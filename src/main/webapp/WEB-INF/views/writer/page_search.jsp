<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script>
function list(page) {
	location.href = "/writer/list.do?curPage="
			+ page
			+ "&search_option=${search_option}&keyword=${keyword}&address=${address}";
}
</script>

<form method="post" name="form1" action="/writer/list.do">
	<input type="hidden" value="${address}" name="address">
	<nav class="navbar navbar-expand-lg">
		<select name="search_option">
			<option value="all"
				<c:out value="${search_option == 'all' ? 'selected' : ''}"/>>
				닉네임+내용+제목</option>

			<option value="nickname"
				<c:out value="${search_option == 'nickname' ? 'selected' : ''}"/>>
				닉네임</option>

			<option value="title"
				<c:out value="${search_option == 'title' ? 'selected' : ''}"/>>
				제목</option>

			<option value="text"
				<c:out value="${search_option == 'text' ? 'selected' : ''}"/>>
				내용</option>
		</select>

		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search" name="keyword" id="keyword" value="${keyword}">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</div>
		</div>
	</nav>
</form>