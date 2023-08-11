<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.floating {
	position: sticky;
	top: 200px;
}

#box {
	padding: 5px;
	background: silver;
	width: 230px;
	height: 150px;
	border-radius: 5px;
}

#box2 {
	padding: 5px;
	background: silver;
	width: 230px;
	height: 100px;
	border-radius: 5px;
}
</style>

<div class="floating">
	<c:choose>
		<c:when test="${sessionScope.id == null}">
			<div id="box">
				<form method="post" action="/login/login.do">
					<div class="d-flex">
						<div class="d-flex flex-column mb-3 w-75">
							<input id="id" name="id" placeholder="아이디" style="margin: 3px;">
							<input type="password" id="pw" name="pw" placeholder="비밀번호" style="margin: 3px;">
						</div>
						<div>
							<button class="btn btn-primary flex-shrink-1 h-75 text-center">Login</button>
						</div>
					</div>
				</form>
				<a href="/login/join.do" class="btn btn-primary" role="button" id="menu">Sign-up</a>
			</div>
		</c:when>

		<c:otherwise>
			<div id="box2">
				<div style="padding-top: 10px;">${sessionScope.nickname}님 환영합니다.</div>
				<br>
				<div>
					<a href="/login/logout.do">로그아웃</a>&nbsp;
					<a href="/homepage/homepage.do">개인페이지</a>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</div>
