<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<h2>이메일 보내기</h2>
	<form method="post" action="/email/send.do">
		<table>
			<tr>
				<td>발신자 이름</td>
				<td><input name="senderName"></td>
			</tr>

			<tr>
				<td>발신자 이메일 주소</td>
				<td><input name="senderMail"></td>
			</tr>

			<tr>
				<td>수신자 이메일 주소</td>
				<td><input name="receiveMail"></td>
			</tr>

			<tr>
				<td>제목</td>
				<td><input name="subject"></td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<textarea rows="5" cols="80" name="message" contextmenu="내용"></textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="전송">
	</form>
	<span style="color: red;">${message}</span>
</body>
</html>