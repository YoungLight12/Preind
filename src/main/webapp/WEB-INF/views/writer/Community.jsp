<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/resources/js/bootstrap.js"></script>

<script>
	function move(address) {
		location.href = "/writer/list.do?address=" + address;
	}
</script>

<style>
#wrapper {
	min-height: 75vh;
	position: relative;
	width: 100%;
}
body{
	background: url('/resources/images/background2.jpg');
}
#body{
	background: white;
}
</style>

</head>
<body>
	<header><%@include file="../include/menu2.jsp"%></header>

	<div class="wrapper">
		<div class="d-flex justify-content-around ">

			<div id="left" class="p-2" align="center">
				<%@include file="../include/left.jsp"%>
			</div>

			<div class="p-2 flex-grow-1 border border-top-0 border-bottom-0 border-dark" align="center" id="body">

				<div class="d-flex flex-column mb-3">

					<div>
						<%@ include file="../writer/mininotice.jsp"%>
					</div>

					<br>

					<div>
						<%@ include file="../writer/miniFAQs.jsp"%>
					</div>

					<br>

					<div>
						<%@ include file="../writer/miniQnA.jsp"%>
					</div>
				</div>
			</div>

			<div id="right" class="p-2">
				<%@include file="../include/right.jsp"%>
			</div>
		</div>
	</div>

	<footer>
		<%@include file="../include/foot.jsp"%>
	</footer>
</body>
</html>