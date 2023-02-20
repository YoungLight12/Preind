<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="/resources/js/bootstrap.js"></script>
<script>
	function pet_info(pet_code) {
		document.form3.action = "/pet/info.do?pet_code=" + pet_code;
		document.form3.submit();
	}

	function change_info() {
		location.href = "/member/change_info_page.do";
	}

	function add_pet() {
		location.href = "/pet/add.do"
	}

	function list(page) {
		location.href = "/homepage/homepage.do?id=${id}&curPage=" + page;
	}
</script>
<style>
#wrapper {
	min-height: 75vh;
	position: relative;
	width: 100%;
}

body {
	background: url("/resources/images/background2.jpg");
}

#page {
	width: 40em;
	height: 48em;
	background: silver;
	margin: 1em;
	border: black;
	border-radius: 5px
}

#card:hover {
	background: #B4B4B4;
}

#back {
	width: 80em;
	height: 50em;
	background: gray;
	margin: 3em;
	border: black;
	border-radius: 10px;
}
</style>
</head>
<header><%@ include file="../include/menu2.jsp"%></header>
<body>
	<div id="wrapper">
		<div class="d-flex justify-content-center">
			<div id="back">
				<div class="d-flex">
					<div id="page"></div>
					<div id="page" class="d-flex flex-column p-2">
						<div class="flex-grow-1">
							<form name="form3" method="post">
								<c:choose>
									<c:when test="${list.size() == 0}">
										<td>&nbsp;등록된 반려동물이 없습니다.</td>
									</c:when>
									<c:otherwise>
										<div class="row row-cols-md-3 g-4 ps-2">
											<c:forEach var="pet" items="${list}">
												<div class="col" onclick="pet_info('${pet.pet_code}')">
													<div class="card" id="card" style="height: 300px;">
														<input type="hidden" value="${pet.pet_code}">
														<c:choose>
															<c:when test="${pet.filename=='-'}">
																<img src="/resources/images/noimage.png"
																	class="card-img-top">
															</c:when>

															<c:otherwise>
																<img src="/resources/images/${pet.filename}"
																	class="card-img-top"
																	style="max-height: 200px; size: auto;">
															</c:otherwise>
														</c:choose>

														<div class="card-body">
															<h5 class="card-title">${pet.pet_name}</h5>
															<p class="card-text">
																${pet.pet_code} ${pet.type_name}
																<c:if test="${pet.gender == true}">Boy</c:if>
																<c:if test="${pet.gender == false}">Girl</c:if>
																<br>
																<fmt:formatDate value="${pet.birth}"
																	pattern="MM/dd/yyyy" />
															</p>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</c:otherwise>
								</c:choose>
							</form>
						</div>
						<hr>
						<div class="d-flex justify-content-center">
							<%@ include file="../writer/page_change.jsp"%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<footer><%@ include file="../include/foot.jsp"%></footer>
</html>