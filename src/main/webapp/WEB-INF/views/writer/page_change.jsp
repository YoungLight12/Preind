<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav aria-label="Page navigation example">
	<ul class="pagination">
		<c:choose>
			<c:when test="${page_info.curPage>1}">
				<li class="page-item"><a class="page-link"
					href="javascript:list('1')" aria-label="Previous"> <span
						aria-hidden="true">&laquo;</span>
				</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled"><a class="page-link">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${page_info.curBlock>1}">
				<li class="page-item"><a class="page-link"
					href="javascript:list('${page_info.prevPage}')"
					aria-label="Previous"> <span aria-hidden="true">&lt;</span>
				</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled"><a class="page-link">&lt;</a></li>
			</c:otherwise>
		</c:choose>

		<c:forEach var="num" begin="${page_info.blockBegin}"
			end="${page_info.blockEnd}">
			<c:choose>
				<c:when test="${num == page_info.curPage}">
					<li class="page-item active"><a class="page-link" href="#">${num}</a></li>
				</c:when>

				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="javascript:list('${num}')">${num}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${page_info.curBlock <= page_info.totBlock}">
				<li class="page-item"><a class="page-link"
					href="javascript:list('${page_info.nextPage}')"
					aria-label="Previous"> <span aria-hidden="true">&gt;</span>
				</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled"><a class="page-link">&gt;</a></li>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${page_info.curPage < page_info.totPage}">
				<li class="page-item"><a class="page-link"
					href="javascript:list('${page_info.totPage}')"
					aria-label="Previous"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled"><a class="page-link">&raquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
</nav>

