<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 정보</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="/resources/js/bootstrap.js"></script>
<style>
#wrapper {
	min-height: 75vh;
	position: relative;
	width: 100%;
}
body{
	background: url("/resources/images/background2.jpg");
}
</style>
</head>
<body>
	<header><%@ include file="include/menu2.jsp"%></header>

	<div class="wrapper">
		<div class="d-flex justify-content-around">
			<div id="left" class="p-2" align="center">
				<%@include file="include/left.jsp"%>
			</div>

			<div class="flex-grow-1 border border-top-0 border-bottom-0 border-dark bg-light" style="min-height: 700px;">
				<div class="d-flex flex-column mb-3">
					<br>
					<h2 align="center">홈페이지 소개</h2><br>
					<div style="font-size: 18px;">
						현재, 반려동물을 키우는 가구는 꾸준히 늘어나고 있으며, 관련 산업 또한 커지고 있습니다. <br>
						만약, 주변 이웃들의 반려동물을 알고 교류한다면 이웃과의 연결점이 생기고 사회성 또한 길러질 수 있습니다. <br>
						동물병원이나 호텔도 주변 이웃의 도움을 받아 비교적 저렴한 가격에 맡길 수 있고 반려동물도 자주 본 이웃에서 맡겨질 때 정서적으로 안정적일 것 입니다. <br>
						또한 꾸준한 산택을 요구하는 반려견의 상황과는 다르게 산책이 어려울 때, 운동하시는 분이나 산책 나가시는 분에게 반려견 산책을 요청할 수 있는 서비스를 기획했습니다. <br>
					</div>
					<br>
					<div>
						
					</div>
					<br>
				</div>
			</div>

			<div id="right" class="p-2" align="center">
				<%@include file="include/right.jsp"%>
			</div>
		</div>
	</div>
	<footer><%@include file="include/foot.jsp"%></footer>
</body>
</html>