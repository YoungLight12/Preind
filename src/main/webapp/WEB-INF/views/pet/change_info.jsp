<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Pet Info</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="/resources/js/bootstrap.js"></script>
<script src="https://github.com/wojtekmaj/react-calendar.git"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<script>
	$(function() {
		$("#btnUpdate").click(function() {
			var pet_name = $("#pet_name").val();
			var birth = $("#birth").val();
			
			if (pet_name == "") {
				alert("이름을 입력하세요.");
				$("#pet_name").focus();
				return;
			}
			
			if (birth == "") {
				alert("생일을 입력하세요.");
				$("#birth").focus();
				return;
			}

			document.form1.action = "/pet/update.do";
			document.form1.submit();
		});

		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "/pet/delete.do";
				document.form1.submit();
			}
		});
		
		$('#datetimepicker1').datetimepicker({
			format : 'L'
		});
		
		/* if(${original != null}){
			$('#uploadImgUser').val('${original}');
		} */
		
		$('#uploadImgUser').on('change', handleImgFileSelect);
		
	});
	
	function prev_img(input) {
		//console.log(input);
	
	    if(input.files && input.files[0]) {
	    	//console.log(input);
	        const reader = new FileReader();
	        reader.onload = e => {
	    
	        	///console.log(e.target.result);
	            const previewImage = document.getElementById("id_img_preview");
	            previewImage.src = e.target.result;
	        }
	        reader.readAsDataURL(input.files[0]);
	    }		
	}
	
	function handleImgFileSelect(e){
		//console.log(e);
		
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		var check = true;
		// filesArr.forEach(function(f){
		$.each(filesArr, function(index, f){
			//console.log(f.name);
			var file_type = f.name.split('.').pop().toLowerCase();
			
			if($.inArray(file_type, ["jpg", "jpeg", "JPG", "png"]) == -1){
				alert("이미지만 등록 가능합니다");
				//console.log($('#uploadImgUser').val());
				$('#uploadImgUser').val('');
				//<img src="/resources/images/noimage.png" id="id_img_preview" style="height: 10cm;"/>
				check = false;
				
				return;
			}
		});
		
		//console.log(check);
		if(check){
			 <!-- onchange="prev_img(this)"  -->
			$('#uploadImgUser').on('change', prev_img(this));
		}
	}
</script>

<style>
.t-title {
	width: 7em;
	text-align: center;
}

#wrapper {
	min-height: 75vh;
	position: relative;
	width: 100%;
}

body {
	background: url("/resources/images/background2.jpg");
}
</style>
</head>
<body>
	<header><%@include file="../include/menu2.jsp"%></header>

	<div class="wrapper">
		<div class="d-flex justify-content-around">
			<div id="left" class="p-2" align="center">
				<%@include file="../include/left.jsp"%>
			</div>
			<div
				class="flex-grow-1 border border-top-0 border-bottom-0 border-dark bg-light">
				<div class="d-flex flex-column mb-3">
					<div align="center">

						<br>
						<h2 align="center">펫 정보</h2>
						<br>
						<form method="post" name="form1" enctype="multipart/form-data">
							<div class="d-flex justify-content-center">
								<c:choose>
									<c:when test="${dto.getFilename()=='-'}">
										<img src="/resources/images/noimage.png" id="id_img_preview"
											style="height: 10cm;" />
									</c:when>

									<c:otherwise>
										<img src="/resources/images/${dto.getFilename()}"
											id="id_img_preview" style="height: 10cm;" />
									</c:otherwise>
								</c:choose>
							</div>
							<br>

							<div class="d-flex justify-content-center">
								<input type="file" id="uploadImgUser" name="file1"
									accept="image/*">
							</div>
							<br>
							<div class="d-flex justify-content-center">
								<table class="table table-striped-columns table-bordered w-auto">
									<tr>
										<td class="t-title">펫 코드</td>
										<td>${dto.getPet_code()} <input type="hidden"
											id="pet_code" name="pet_code" value="${dto.getPet_code()}">
										</td>

										<td class="t-title">주인</td>
										<td>${master}</td>
									</tr>

									<tr>
										<td class="t-title">이름</td>
										<td><input id="pet_name" name="pet_name" placeholder="이름"
											value="${dto.getPet_name()}"></td>

										<td class="t-title">종류</td>
										<td>
											<div class="btn-group" role="group" aria-label="Pet_type">
												<input type="radio" class="btn-check btn-sm" name="pet_type"
													id="pet_type1" value="1"
													<c:if test="${dto.getPet_type() == 1}">checked</c:if>>
												<label class="btn btn-outline-primary btn-sm"
													for="pet_type1">강아지</label> <input type="radio"
													class="btn-check btn-sm" name="pet_type" id="pet_type2"
													value="2"
													<c:if test="${dto.getPet_type() == 2}">checked</c:if>>
												<label class="btn btn-outline-primary btn-sm"
													for="pet_type2">고양이</label> <input type="radio"
													class="btn-check btn-sm" name="pet_type" id="pet_type3"
													value="3"
													<c:if test="${dto.getPet_type() == 3}">checked</c:if>>
												<label class="btn btn-outline-primary btn-sm"
													for="pet_type3">기타</label>
											</div>
										</td>
									</tr>

									<tr>
										<td class="t-title">사이즈</td>
										<td>
											<div class="btn-group" role="group" aria-label="Size">
												<input type="radio" class="btn-check btn-sm" name="size"
													id="size1" value="1"
													<c:if test="${dto.getSize() == 1}">checked</c:if>>
												<label class="btn btn-outline-primary btn-sm" for="size1">소형</label>

												<input type="radio" class="btn-check btn-sm" name="size"
													id="size2" value="2"
													<c:if test="${dto.getSize() == 2}">checked</c:if>>
												<label class="btn btn-outline-primary btn-sm" for="size2">중형</label>

												<input type="radio" class="btn-check btn-sm" name="size"
													id="size3" value="3"
													<c:if test="${dto.getSize() == 3}">checked</c:if>>
												<label class="btn btn-outline-primary btn-sm" for="size3">대형</label>
											</div>
										</td>

										<td class="t-title">몸무게</td>
										<td><input type="number" name="weight"
											value="${dto.getWeight()}" style="width: 50px;"> kg</td>
									</tr>

									<tr>
										<td class="t-title">성별</td>
										<td>
											<div class="btn-group" role="gender" aria-label="Gender">
												<input type="radio" class="btn-check btn-sm" name="gender"
													id="gender1"
													<c:if test="${dto.getGender() == true}">checked</c:if>
													value="true"> <label
													class="btn btn-outline-primary btn-sm" for="gender1">Boy</label>

												<input type="radio" class="btn-check btn-sm" name="gender"
													id="gender2"
													<c:if test="${dto.getGender() == false}">checked</c:if>
													value="false"> <label
													class="btn btn-outline-primary btn-sm" for="gender2">Girl</label>
											</div>
										</td>

										<td class="t-title">중성화</td>
										<td>
											<div class="btn-group" role="peanut" aria-label="Peanut">
												<input type="radio" class="btn-check btn-sm" name="peanut"
													id="peanut1"
													<c:if test="${dto.getPeanut() == true}"> checked</c:if>
													value="true"> <label
													class="btn btn-outline-primary btn-sm" for="peanut1">O</label>

												<input type="radio" class="btn-check btn-sm" name="peanut"
													id="peanut2"
													<c:if test="${dto.getPeanut() == false}"> checked</c:if>
													value="false"> <label
													class="btn btn-outline-primary btn-sm" for="peanut2">X</label>
											</div>
										</td>
									</tr>

									<tr>
										<td class="t-title">생일</td>
										<td>
											<div class="form-group">
												<div class="input-group date" id="datetimepicker1"
													data-target-input="nearest">
													<input
														class="form-control form-control-sm datetimepicker-input"
														data-target="#datetimepicker1"
														value=<fmt:formatDate value="${dto.getBirth()}" pattern="MM/dd/yyyy"/>
														name="birth" id="birth">

													<div class="input-group-append"
														data-target="#datetimepicker1"
														data-toggle="datetimepicker">
														<div class="input-group-text">
															<i class="fa fa-calendar"></i>
														</div>
													</div>
												</div>
											</div>
										</td>

										<td class="t-title">백신</td>
										<td>
											<div class="btn-group" role="group" aria-label="Vecine">
												<input type="checkbox" class="btn-check" id="maddog">
												<label class="btn btn-outline-primary btn-sm" for="maddog">광견병</label>

												<input type="checkbox" class="btn-check" id="heart">
												<label class="btn btn-outline-primary btn-sm" for="heart">심장사상충</label>

												<input type="checkbox" class="btn-check" id="covid">
												<label class="btn btn-outline-primary btn-sm" for="covid">코로나</label>
											</div>
										</td>
									</tr>

									<tr>
										<td class="t-title">짖기</td>
										<td>안 짖어요~
											<div class="btn-group" role="bark" aria-label="Bark">
												<input type="radio" class="btn-check btn-sm" name="bark"
													id="bark1"
													<c:if test="${dto.getBark() == 1}">checked</c:if> value="1">
												<label class="btn btn-outline-primary btn-sm" for="bark1">1</label>

												<input type="radio" class="btn-check btn-sm" name="bark"
													id="bark2"
													<c:if test="${dto.getBark() == 2}">checked</c:if> value="2">
												<label class="btn btn-outline-primary btn-sm" for="bark2">2</label>

												<input type="radio" class="btn-check btn-sm" name="bark"
													id="bark3"
													<c:if test="${dto.getBark() == 3}">checked</c:if> value="3">
												<label class="btn btn-outline-primary btn-sm" for="bark3">3</label>

												<input type="radio" class="btn-check btn-sm" name="bark"
													id="bark4"
													<c:if test="${dto.getBark() == 4}">checked</c:if> value="4">
												<label class="btn btn-outline-primary btn-sm" for="bark4">4</label>

												<input type="radio" class="btn-check btn-sm" name="bark"
													id="bark5"
													<c:if test="${dto.getBark() == 5}">checked</c:if> value="5">
												<label class="btn btn-outline-primary btn-sm" for="bark5">5</label>
											</div> &nbsp;짖어요!
										</td>
										<td class="t-title">물기</td>
										<td>안 물어요~
											<div class="btn-group" role="bite" aria-label="Bite">
												<input type="radio" class="btn-check btn-sm" name="bite"
													id="bite1"
													<c:if test="${dto.getBite() == 1}">checked</c:if> value="1">
												<label class="btn btn-outline-primary btn-sm" for="bite1">1</label>

												<input type="radio" class="btn-check btn-sm" name="bite"
													id="bite2"
													<c:if test="${dto.getBite() == 2}">checked</c:if> value="2">
												<label class="btn btn-outline-primary btn-sm" for="bite2">2</label>

												<input type="radio" class="btn-check btn-sm" name="bite"
													id="bite3"
													<c:if test="${dto.getBite() == 3}">checked</c:if> value="3">
												<label class="btn btn-outline-primary btn-sm" for="bite3">3</label>

												<input type="radio" class="btn-check btn-sm" name="bite"
													id="bite4"
													<c:if test="${dto.getBite() == 4}">checked</c:if> value="4">
												<label class="btn btn-outline-primary btn-sm" for="bite4">4</label>

												<input type="radio" class="btn-check btn-sm" name="bite"
													id="bite5"
													<c:if test="${dto.getBite() == 5}">checked</c:if> value="5">
												<label class="btn btn-outline-primary btn-sm" for="bite5">5</label>
											</div> &nbsp;물어요!
										</td>
									</tr>

									<tr>
										<td colspan="4" align="center">
											<div class="btn-group col-6 mx-auto" role="group"
												aria-label="btnGroup">
												<input class="btn btn-success" type="button" id="btnUpdate"
													value="수정하기"> <input class="btn btn-danger"
													type="button" id="btnDelete" value="삭제하기">
											</div> <input type="hidden" name="id" id="id"
											value="${dto.getId()}"> <input type="hidden"
											name="set" id="set" value="True">
										</td>
									</tr>
								</table>
							</div>
						</form>
					</div>
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