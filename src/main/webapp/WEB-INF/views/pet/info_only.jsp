<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<div class="d-flex justify-content-around">
	<div class="pt-5 align-self-center">
			<table class="table table-borderless">
				<tr>
					<td>
						<c:choose>
							<c:when test="${dto.filename =='-'}">
								<img src="/resources/images/noimage.jpg" style="height: 5cm">
							</c:when>

							<c:otherwise>
								<img src="/resources/images/${dto.filename}" style="height: 5cm;">
							</c:otherwise>
						</c:choose>
					</td>
					
					<td>
						<table class="table table-striped-columns table-bordered bg-light">
							<tr>
								<td class="t-title">이름</td>
								<td style="width: 20em">${dto.pet_name}</td>

								<td class="t-title">성별</td>
								<td style="width: 20em">
									<c:if test="${dto.gender == true}">Boy</c:if> 
									<c:if test="${dto.gender == false}">Girl</c:if>
								</td>
							</tr>
							
							<tr>
								<td class="t-title">종류</td>
								<td>${dto.type_name}</td>

								<td class="t-title">크기</td>
								<td>
									<c:choose>
										<c:when test="${dto.size == 1}">소형</c:when>
										<c:when test="${dto.size == 2}">중형</c:when>
										<c:when test="${dto.size == 3}">대형</c:when>
									</c:choose>
								</td>
							</tr>

							<tr>
								<td class="t-title">생일</td>
								<td><fmt:formatDate value="${dto.birth}" pattern="yyyy/MM/dd"/></td>

								<td class="t-title">몸무게</td>
								<td>
									<c:if test="${dto.weight == 0}">?</c:if> 
									<c:if test="${dto.weight != 0}">${dto.weight} kg</c:if>
								</td>
							</tr>

							<tr>
								<td colspan="2" align="center">안 짖어요~&nbsp;
									<div class="btn-group">
										<a class="btn btn-primary <c:if test="${dto.bark == 1}">active</c:if>">1</a>
										<a class="btn btn-primary <c:if test="${dto.bark == 2}">active</c:if>">2</a>
										<a class="btn btn-primary <c:if test="${dto.bark == 3}">active</c:if>">3</a>
										<a class="btn btn-primary <c:if test="${dto.bark == 4}">active</c:if>">4</a>
										<a class="btn btn-primary <c:if test="${dto.bark == 5}">active</c:if>">5</a>
									</div> &nbsp;짖어요!
								</td>

								<td colspan="2" align="center">안 물어요~&nbsp;
									<div class="btn-group">
										<a class="btn btn-primary <c:if test="${dto.bite == 1}">active</c:if>">1</a>
										<a class="btn btn-primary <c:if test="${dto.bite == 2}">active</c:if>">2</a>
										<a class="btn btn-primary <c:if test="${dto.bite == 3}">active</c:if>">3</a>
										<a class="btn btn-primary <c:if test="${dto.bite == 4}">active</c:if>">4</a>
										<a class="btn btn-primary <c:if test="${dto.bite == 5}">active</c:if>">5</a>
									</div> &nbsp;물어요!
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</div>
