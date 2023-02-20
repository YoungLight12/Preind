<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td{
	padding-left: 5px;
}
</style>
</head>
<body style="padding: 10px;">
	<table border="1" style="width: 700px;">
		<%		pageContext.setAttribute("newLineChar", "\n");		%>
		<c:choose>
			<c:when test="${list.size() == 0}">
				<td>&nbsp;댓글이 없습니다.</td>
			</c:when>
			
			<c:otherwise>
			댓글 ${count}
				<c:forEach var="row" items="${list}">
					<c:set var="str" value="${fn:replace(row.reply_text,' ','&nbsp;&nbsp;')}" />
					<c:set var="str" value="${fn:replace(str,newLineChar,'<br>') }" />

					<tr>
						<td>${row.name} 
						( <fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /> ) 
						<br>${str}	
						
						<c:if test="${sessionScope.userid == row.replyer }">
							<input type="button" value="Modify" onclick="showModify('${row.idx}')">
						</c:if>
						
							<!--댓글 수정 화면 영역-->
						<div id="modifyReply"></div>
						</td>
					</tr>
				</c:forEach>
				
				<tr>
					<td align="center">
						<c:if test="${page_info.curPage > 1 }">
							<a href="#" onclick="listReply('${page_info.prevPage}')">[이전]</a>&nbsp; 
						</c:if> 
						
						<c:forEach var="num" begin="${page_info.blockBegin}" end="${page_info.blockEnd}">
							<c:choose>
								<c:when test="${num == page_info.curPage}">( ${num} )&nbsp;</c:when>

								<c:otherwise>
									<a href="#" onclick="listReply('${num}')"> ( ${num} )&nbsp;</a>
								</c:otherwise>
							</c:choose>
						</c:forEach> 
						
						<c:if test="${page_info.curPage < page_info.totPage}">
							<a href="#" onclick="listReply('${page_info.nextPage}')">[다음]</a>&nbsp; 
						</c:if>
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>