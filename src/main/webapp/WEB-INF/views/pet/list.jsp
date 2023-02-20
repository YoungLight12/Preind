<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<h2 align="center">반려동물</h2>
	<br> -->


<c:choose>
	<c:when test="${list.size() == 0}">
		<td>&nbsp;등록된 반려동물이 없습니다.</td>
	</c:when>
	<c:otherwise>
		<!-- <table class="table table-bordered" style="width: "> -->
		<thead class="table-dark">
			<tr align="center">
				<th></th>
				<th>종류</th>
				<th>이름</th>
				<th>성별</th>
				<th>나이</th>
				<th>대표사진</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="row" items="${list}">
				<input type="hidden" value="${row.pet_code}">
				<tr align="center" style="height: 120px">
					<td style="padding-top: 50px">${row.pet_code}</td>
					<td style="padding-top: 50px">${row.type_name}</td>
					<td style="padding-top: 50px">${row.pet_name}</td>
					<td style="padding-top: 50px"><c:if
							test="${row.gender == true}">Boy</c:if> <c:if
							test="${row.gender == false}">Girl</c:if></td>
					<td style="padding-top: 50px">${row.birth}</td>

					<td><c:choose>
							<c:when test="${row.filename=='-'}">
								<img src="/resources/images/noimage.jpg" style="height: 100px">
							</c:when>

							<c:otherwise>
								<img src="/resources/images/${row.filename}.jpg" style="height: 100px">
							</c:otherwise>
						</c:choose></td>
				</tr>

			</c:forEach>
		</tbody>
		<!-- </table> -->
	</c:otherwise>
</c:choose>
<!-- </body>
</html> -->