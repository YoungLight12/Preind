<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#header { 
	-bs-gutter-x: 1.5rem; 
	-bs-gutter-y: 0;
	width: 100%;
	margin-right: auto;
	margin-left: auto;
	background: #D0D0D0;
}

#menu {
	font-size: 16px;
}

#menu:hover {
	font-size: larger;
	font: bold;
}
</style>

<div id="header">
	<header
		class="d-flex flex-wrap flex-fill align-items-center justify-content-lg-between px-3 border-bottom">
		<!-- Home Btn -->
		<a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0">
			<img src="/resources/images/home1-.png" width="350px" height="100px">
		</a>
		
		<!-- Menu -->
		<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
			<li><a href="/" class="btn btn-outline-primary mx-3" id="menu">Home</a></li>
			<li><a href="/writer/list.do?address=5" class="nav-link px-2 link-dark mx-3" id="menu">산책 대행 서비스</a></li>
			<li><a href="/map/mymap.do" class="nav-link px-2 link-dark mx-3" id="menu">주변 Priend 찾기</a></li>
			<li><a href="/member/info.do" class="nav-link px-2 link-dark mx-3" id="menu">개인정보</a></li>
			<li><a href="/writer/community.do" class="nav-link px-2 link-dark mx-3" id="menu">커뮤니티</a></li>
			<li><a href="/homepage/homepage.do" class="nav-link px-2 link-dark mx-3" id="menu">About</a></li>
		</ul>

		<!-- Login -->
		<c:choose>
			<c:when test="${sessionScope.id ==null }">
				<div class="col-md-3 text-end">
					<a href="/login/login_page.do" class="btn btn-outline-primary" role="button" id="menu">Login</a> 
					<a href="/login/join.do" class="btn btn-primary" role="button" id="menu">Sign-up</a>
				</div>
			</c:when>

			<c:otherwise>
				<div class="col-md-3 text-end">
					<div class="d-flex justify-content-end align-items-center">
						<a class="nav-link text-black-50" href="/member/info.do" id="menu">
							${sessionScope.nickname}님 환영합니다.</a>&nbsp;&nbsp; 
						<a href="/login/logout.do" class="btn btn-danger" role="button" id="menu">
							로그아웃</a> 
						<input type="hidden" value="${sessionScope.id}" id="id" name="id">
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</header>
</div>



