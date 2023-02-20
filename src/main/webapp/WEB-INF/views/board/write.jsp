<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function() {
		$(".fileDrop").on("dragenter dragover", function(e) {
			e.preventDefault(); //기본 효과 막음
		});
		$(".fileDrop").on("drop",function(e) {
			e.preventDefault();
			var files = e.originalEvent.dataTransfer.files; //파일
			var file = files[0]; //첫번째
			var form_data = new FormData();//폼 객체
			form_data.append("file", file);//폼에 첨부파일 추가
			$.ajax({
				url : "/upload/ajax_upload",
				data : form_data,
				processData : false,
				contentType : false,
				type : "post",
				success : function(data) { //첨부파일이름
					var fileInfo = getFileInfo(data);
					var html = "<a href='"+fileInfo.get_link+"'>"
								+ fileInfo.original_name
								+ "</a><br>";
					html += "<input type='hidden' name='file' value='"+fileInfo.file_name+"'>";
					$("#uploadedList").append(html);
				}
			});
		});
		$("#btnSave").click(function() {
			var title = document.form1.title.value;
			if (title == "") {
				alert("제목을 입력하세요.");
				document.form1.title.focus();
				return;
			}
				document.form1.submit();
		});
	});

	function getFileInfo(file_name) {
		var get_link = "/upload/display_file?file_name=" + file_name;
		original_name = file_name.substr(file_name.indexOf("_") + 1);
		return {
			original_name : original_name,
			get_link : get_link,
			file_name : file_name
		};
	}
</script>
<style>
.fileDrop {
	width: 600px;
	height: 100px;
	border: 1px dotted gray;
	background-color: gray;
}
</style>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<h2>게시물 작성</h2>

	<form id="form1" name="form1" method="post" action="/board/insert.do">
		<div>
			<input name="title" id="title" size="80" placeholder="제목을 입력하세요.">
		</div>
		<div style="width: 800px">
			<textarea rows="5" cols="80" id="contents" name="contents"
				placeholder="내용을 입력하세요"></textarea>
		</div>
		<div>
			첨부파일 등록
			<div class="fileDrop"></div>
			<div id="uploadedList"></div>
		</div>
		<div style="width: 700px; text-align: center;">
			<button style="button" id="btnSave">확인</button>
		</div>
	</form>
</body>
</html>
