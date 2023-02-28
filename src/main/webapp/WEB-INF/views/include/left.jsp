<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
#lg:hover {
	background: #808080;
	color: black;
}
#left {
  position: sticky; 
  top: 100px; 
} 
</style>

<script>
function move(address) {
	location.href = "/writer/list.do?address=" + address;
}
</script>
<c:set value="<%=request.getRequestURI()%>" var="filepath"></c:set>
	 <%-- ${filepath} --%>
<div id="left">
<div class="list-group w-50 mt-5" style="min-width: 30px;">
	<input class="list-group-item list-group-item-action" 
	style="background: #282828; color: white; text-align: center; font-size: 20px" value="MENU">
		
	<button type="button" class="list-group-item list-group-item-action 
	<c:if test="${address == 5}"> active </c:if>"
	onclick="location.href='/writer/list.do?address=5'">의뢰 게시판</button>	
	
	<button type="button" class="list-group-item list-group-item-action
	<c:if test="${filepath =='/WEB-INF/views/map/Page2.jsp'}"> active </c:if>"
	onclick="location.href='/map/mymap.do'">Priend 찾기</button>
	
	<button type="button" class="list-group-item list-group-item-action 
	<c:if test="${address < 5}"> active </c:if>" role="button"
		data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-details="true"
		 aria-controls="collapseExample">커뮤니티</button>
		<!-- 시작할때 열려있는지 -->
	
	<div class="accordion-collapse collapse <c:if test="${address < 5}">show</c:if>" id="collapseExample" >
		<div class="list-group bg-secondary">
			<button id="lg" type="button" onclick="move(0)" 
			class="list-group-item list-group-item-secondary list-group-item-action 
			<c:if test="${address == 0}">active</c:if>">공지사항</button>
			<button id="lg" type="button" onclick="move(2)"
			class="list-group-item list-group-item-secondary list-group-item-action 
			<c:if test="${address == 2}">active</c:if>">QnA</button>
			<button id="lg" type="button" onclick="move(3)" 
			class="list-group-item list-group-item-secondary list-group-item-action
			<c:if test="${address == 3}">active</c:if>">FAQs</button>
			<button id="lg" type="button" onclick="move(4)" 
			class="list-group-item list-group-item-secondary list-group-item-action 
			<c:if test="${address == 4}">active</c:if>">전문가에게 질문하기</button>
			<button id="lg" type="button" onclick="move(1)" 
			class="list-group-item list-group-item-secondary list-group-item-action 
			<c:if test="${address == 1}">active</c:if>">자유게시판</button>
		</div>
	</div>
	
	<button type="button" class="list-group-item list-group-item-action
	<c:if test="${fn : contains(filepath, '/WEB-INF/views/member')}">active</c:if>"
		data-bs-toggle="collapse" data-bs-target="#myinfo" 
		aria-expanded="false" aria-controls="myinfo">내 정보</button>
		
	<div class="collapse <c:if test="${fn : contains(filepath, '/WEB-INF/views/member')}">show</c:if>" id="myinfo">
		<div class="list-group bg-secondary">
			<!-- <button id="lg" type="button" onclick="location.href='/map/maptest2'"
			class="list-group-item list-group-item-secondary list-group-item-action">발자국</button> -->
			<button id="lg" type="button" 
			class="list-group-item list-group-item-secondary list-group-item-action">다이어리</button>
			<button id="lg" type="button" onclick="location.href='/homepage/homepage.do'"
			class="list-group-item list-group-item-secondary list-group-item-action">블로그</button>
			<button id="lg" type="button" onclick="location.href='/member/info.do'"
			class="list-group-item list-group-item-secondary list-group-item-action
			<c:if test="${filepath =='/WEB-INF/views/member/info.jsp'}"> active </c:if>
			">개인정보</button>
		</div>
	</div>
	
	<button type="button" class="list-group-item list-group-item-action">사이트 정보</button>
</div>
<!-- <br><br>
	<div>
		<img src="/resources/images/dog.jpg" width="280px">
	</div> -->
</div>



