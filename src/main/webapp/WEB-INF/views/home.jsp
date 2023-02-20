<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="/resources/js/bootstrap.js"></script>

<!-- Development version -->
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>

<!-- Production version -->
<script src="https://unpkg.com/@popperjs/core@2"></script>
<script>
function write_info(write_code) {
	document.form3.action = "/writer/info.do?write_code=" + write_code;
	document.form3.submit();
}
</script>

<style>
#wrapper {
	min-height: 75vh;
	position: relative;
	width: 100%;
}
</style>
</head>
<body style="background: url('/resources/images/background2.jpg');">
	<%@ include file="include/menu2.jsp"%>

	<div class="d-flex justify-content-between" style="height: 500px; background: black;">
		<%@ include file="home/pic.jsp"%>
	</div>


	<div class="wrapper">
		<div class="d-flex justify-content-around">
			<div id="left" class="p-2" align="center">
				<%@include file="include/left.jsp"%>
			</div>

			<div class="p-2 flex-grow-1 border border-top-0 border-bottom-0 border-dark" style="background: white;">
				<div class="d-flex flex-column mb-3">
					<div align="center">
						<%@ include file="writer/mininotice.jsp"%>
					</div>
					<br>
					<div>
						<h2 align="center">지도</h2>
						<%@ include file="map/map2.jsp"%>
					</div>
					<br>
					<div align="center">
						<%@ include file="writer/miniFAQs.jsp"%>
					</div>
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