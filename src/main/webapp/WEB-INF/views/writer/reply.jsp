<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<hr>
<form method="post" name="form1" action="/reply/insert.do">
	<input type="hidden" value="${dto.write_code}" name="write_code"
		id="write_code"> <input type="hidden"
		value="${sessionScope.id}" name="id" id="id">
	<div class="d-flex">
		<div class="form-floating flex-fill">
			<textarea class="form-control" placeholder="Leave a comment here"
				id="reply_text" name="reply_text"
				style="min-height: 100px; max-height: 100px; min-width: 95%; max-width: 95%;"></textarea>
			<label for="reply_text">Comments</label>
		</div>
		<div>
			<input type="button" onclick="reply_input()"
				class="btn btn-secondary" value="등록"
				style="height: 100px; width: 100px;">
		</div>
	</div>
</form>

<hr>
<c:choose>
	<c:when test="${list.size() == 0}">
		<td>&nbsp;댓글이 없습니다.</td>
	</c:when>

	<c:otherwise>
			댓글 ${count}
			<hr>
		<c:forEach var="row" items="${list}">
			<c:set var="str"
				value="${fn:replace(row.reply_text,' ','&nbsp;&nbsp;')}" />
			<c:set var="str" value="${fn:replace(str,newLineChar,'<br>') }" />
				
				${row.nickname}( <fmt:formatDate value="${row.date}"
				pattern="yyyy-MM-dd" /> ) 
				&nbsp;
				<c:if test="${sessionScope.id == row.id }">
				<div class="btn-group" role="group" aria-label="btnGroup">
					<input type="button" class="btn btn-success btn-sm" value="수정"
						onclick="showModify('${row.idx}')"> <input type="button"
						class="btn btn-danger btn-sm" value="삭제"
						onclick="reply_delete('${row.idx}')">
				</div>
			</c:if>
			<br>
				<textarea class="form-control" readonly
					style="min-height: 50px; max-height: 150px; min-width: 95%; max-width: 95%;">${str}</textarea>
			<br>
			<div id="modifyReply"></div>
			<hr>
		</c:forEach>
	</c:otherwise>
</c:choose>
<hr>
<div class="d-flex justify-content-center"><%@ include
		file="../writer/page_change.jsp"%></div>
