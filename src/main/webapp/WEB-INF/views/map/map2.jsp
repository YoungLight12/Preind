<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="w-25">
	<select class="form-select form-select-sm" name="range" id="range">
		<option value="0.5">500m</option>
		<option value="1" selected>1km</option>
		<option value="3">3km</option>
		<c:if test="${sessionScope.lv == 10 }">
			<option value="1000">ALL</option>
		</c:if>
	</select>
</div>
<br>

<div id="map" style="width: 100%; height: 600px;"></div>

<!-- 다음지도 스크립트 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=964e52e0284b58f6512c03f2c8f4b143&libraries=services,clusterer,drawing"></script>
<script>
	var lv = 5;
	var position =  new kakao.maps.LatLng(${y}, ${x});
	var geocoder = new kakao.maps.services.Geocoder();
	var list = ${list};
	var circle;
	var marker;
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : position, // 지도의 중심좌표
		level : lv
	};

	var map = new kakao.maps.Map(mapContainer, mapOption);	// 지도를 생성합니다
	
	var imgS = new kakao.maps.Size(64, 69);
	
	if('${filename}' != 'home3.png'){
		imgS = new kakao.maps.Size(50, 50); // 마커이미지의 크기입니다
	} else {
		imgS = new kakao.maps.Size(110, 35); // 마커이미지의 크기입니다
	}

	var imageSrc = '../resources/images/${filename}', // 마커이미지의 주소입니다  
					imageSize = imgS,
    				imageOption = {offset: new kakao.maps.Point(25, 25)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
    
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
    				  markerPosition = position; // 마커가 표시될 위치입니다

	var a = new kakao.maps.Marker({
		position: position, // 마커를 표시할 위치
		image: markerImage,
		clickable: true
	});
	a.setMap(map);
	
	if (${sessionScope.nickname != null}){
	var iwContent = '<div style="width:150px;text-align:center;padding:6px;">${sessionScope.nickname}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	} else {
		var iwContent = '<div style="width:150px;text-align:center;padding:6px;">Preind</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwRemoveable = true;
	}
	
	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    content : iwContent,
	    removable : iwRemoveable
	});
	    
	// 마커에 클릭이벤트를 등록합니다
	kakao.maps.event.addListener(a, 'click', function() {
	      // 마커 위에 인포윈도우를 표시합니다
	      infowindow.open(map, a);  
	});
	
	function clear(){
		if (circle) {  
            circle.setMap(null);  
            circle = null;
        }
		
		if (marker) {  
            marker.setMap(null);  
            circle = null;
        }
	}

	function set(){
		if(${sessionScope.id != null} && ${addr != "서울 마포구 신촌로 94 그랜드마트"} || ${sessionScope.lv == 10}){
			circle = new kakao.maps.Circle({
				map : map,	
				center : new kakao.maps.LatLng(${y}, ${x}), // 원의 중심좌표 입니다 
				radius : $('#range').val()*1000, // 미터 단위의 원의 반지름입니다 
				strokeWeight : 5, // 선의 두께입니다 
				strokeColor : '#75B8FA', // 선의 색깔입니다
				strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				strokeStyle : 'dashed', // 선의 스타일 입니다
				fillColor : '#BFFFFF', // 채우기 색깔입니다
				fillOpacity : 0.35	// 채우기 불투명도 입니다   
			});
			
			circle.setMap(map);
			
			list.forEach(function(addr, index) {
		        geocoder.addressSearch(addr[0], function(result, status) {
		            if (status === daum.maps.services.Status.OK) {
		                var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		                
		                var a = 6371 
						 * Math.acos(Math.sin(${y}/180*Math.PI)
						 * Math.sin(coords.getLat()/180*Math.PI)
						 + Math.cos(${y}/180*Math.PI)
						 * Math.cos(coords.getLat()/180*Math.PI)
						 * Math.cos((${x}-coords.getLng())/180*Math.PI));
		    
						 if(a<$('#range').val() && a!=0){
							 var imgS = new kakao.maps.Size(64, 69);
								if(addr[3] != 'home3.png'){
									imgS = new kakao.maps.Size(50, 50); // 마커이미지의 크기입니다
								} else {
									imgS = new kakao.maps.Size(110, 35); // 마커이미지의 크기입니다
								}

								var imageSrc = '../resources/images/'+addr[3], // 마커이미지의 주소입니다  
												imageSize = imgS,
							    				imageOption = {offset: new kakao.maps.Point(25, 25)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
							    
								// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
								var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
							    				  markerPosition = position; // 마커가 표시될 위치입니다
								
								marker = new kakao.maps.Marker({
									position: coords, // 마커를 표시할 위치
									image: markerImage,
									clickable: true
								});
								marker.setMap(map);
									
		                // 인포윈도우를 생성합니다
		                var infowindow = new kakao.maps.InfoWindow({
		                    content: '<div style="width:150px;text-align:center;padding:6px 0;">' 
		                    + '<a href="/homepage/homepage.do?id='+addr[2]+'">'
		                    + addr[1] 
		                    + '</a>'
		                    + '</div>',
		                    removable : true
		                });
		                    
		                // 마커에 클릭이벤트를 등록합니다
		                kakao.maps.event.addListener(marker, 'click', function() {
		                      // 마커 위에 인포윈도우를 표시합니다
		                      infowindow.open(map, marker);  
		                });
						}
		            } 
		        });
		    });
		}
	}
	
	$(function(){
		set();
		
		$("#range").on("change", function(){
			clear();
			set();
		});
	});
</script>



