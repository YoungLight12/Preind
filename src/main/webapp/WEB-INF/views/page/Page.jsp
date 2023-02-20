<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정/탈퇴</title>
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
	<header><%@ include file="../include/menu2.jsp"%></header>

	<br>

	<div class="wrapper">
		<div class="d-flex justify-content-around">
			<div id="left" class="p-2" align="center">
				<%@include file="../include/left.jsp"%>
			</div>

			<div class="flex-grow-1 border border-top-0 border-bottom-0 border-dark bg-light" >
				<div class="d-flex flex-column mb-3">
					<div align="center">
						
					</div>
					<br>
					<div>
						
					</div>
					<br>
				</div>
			</div>

			<div id="right" class="p-2" align="center">
				<%@include file="../include/right.jsp"%>
			</div>
		</div>
	</div>
	<footer><%@include file="../include/foot.jsp"%></footer>
</body>
</html>