<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form method="post" name="form10">
<div class="form-floating">
	<textarea class="form-control" id="reply_update" name="reply_update"
		style="min-height: 100px; max-height: 100px; min-width: 95%; max-width: 95%;">${dto.reply_text}
	</textarea>
	<label for="reply_text">Comments</label>
</div>
</form>

<div class="btn-group" role="group" aria-label="btnGroup">
	<c:if test="${sessionScope.id == dto.id}">
		<input type="button" class="btn btn-outline-success btn-sm" value="수정"
			onclick="reply_update('${dto.idx}')">
		<input type="button" class="btn btn-outline-danger btn-sm" value="삭제"
			onclick="reply_delete('${dto.idx}')">
	</c:if>
	<button onclick="reply_close()" class="btn btn-outline-secondary btn-sm">닫기</button>
</div>
