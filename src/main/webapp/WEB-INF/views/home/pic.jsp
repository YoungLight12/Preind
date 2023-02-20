<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#pic {
	max-height: 500px;
}

#move {
	background: black;
}
</style>

<script>
function pet(pet_code){
	location.href='/pet/info.do?pet_code='+pet_code;
}
</script>

<div class="px-5">
	<button class="h-100" type="button" id="move"
		data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
		<span class="visually-hidden">Previous</span>
	</button>
</div>

<div id="carouselExampleInterval" class="carousel slide"
	data-bs-ride="carousel">
	<div class="carousel-inner mh-100">
		<div class="carousel-item active" data-bs-interval="5000" style="padding-top: 85px">
			<img src="/resources/images/home3.png" class="d-block" id="pic">
		</div>
		<c:forEach var="dto" items="${all}">
			<div class="carousel-item" data-bs-interval="5000" onclick="pet(${dto.pet_code})">
				<img src="/resources/images/${dto.filename}" class="d-block" id="pic">
				<%-- <%@ include file="../pet/info_only.jsp" %> --%>
			</div>
		</c:forEach>
	</div>
</div>

<div class="px-5">
	<button class="h-100" type="button"
		data-bs-target="#carouselExampleInterval" data-bs-slide="next" id="move">
		<span class="carousel-control-next-icon" aria-hidden="true"></span> 
		<span class="visually-hidden">Next</span>
	</button>
</div>

