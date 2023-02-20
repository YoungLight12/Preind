<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div id="map" style="width: 100%; height: 600px;"></div>

<!-- 다음지도 스크립트 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=964e52e0284b58f6512c03f2c8f4b143&libraries=services,clusterer,drawing"></script>
<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.331601, 126.560967), // 지도의 중심좌표
			level : 4		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${addr}', function(result, status) {
			if (status === kakao.maps.services.Status.OK) {	// 정상적으로 검색이 완료됐으면 
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);	
				var imgS = new kakao.maps.Size(64, 69);
				
				if('${filename}' != 'home3.png'){
					imgS = new kakao.maps.Size(50, 50); // 마커이미지의 크기입니다
				} else {
					imgS = new kakao.maps.Size(110, 35); // 마커이미지의 크기입니다
				}
			
				var imageSrc = '/resources/images/'+'${filename}', // 마커이미지의 주소입니다  
								imageSize = imgS,
			    				imageOption = {offset: new kakao.maps.Point(25, 25)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			    
				// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
			    				  markerPosition = coords; // 마커가 표시될 위치입니다

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					position: markerPosition,
				  	image: markerImage, // 마커이미지 설정 
				  	clickable: true
				});
			
				/* var marker = new kakao.maps.Marker({
					map : map,
					position : coords
				});	// 결과값으로 받은 위치를 마커로 표시합니다 */
				
				if(${sessionScope.nickname != null}){
				var iwContent = '<div style="padding:5px; text-align:center;">${sessionScope.nickname}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
				} else {
					var iwContent = '<div style="padding:5px; text-align:center;">Priend!!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    iwRemoveable = true;
				}
				
			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    content : iwContent,
			    removable : iwRemoveable
			});
			    
			kakao.maps.event.addListener(marker, 'click', function() {
			      // 마커 위에 인포윈도우를 표시합니다
			      infowindow.open(map, marker);  
			});
				
				if(${sessionScope.id != null}){
					
				var circle = new kakao.maps.Circle({
					center : new kakao.maps.LatLng(result[0].y, result[0].x), // 원의 중심좌표 입니다 
					radius : 500, // 미터 단위의 원의 반지름입니다 
					strokeWeight : 5, // 선의 두께입니다 
					strokeColor : '#75B8FA', // 선의 색깔입니다
					strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					strokeStyle : 'dashed', // 선의 스타일 입니다
					fillColor : '#BFFFFF', // 채우기 색깔입니다
					fillOpacity : 0.35	// 채우기 불투명도 입니다   
				});
				
				circle.setMap(map);
				}
				
				marker.setMap(map);
				map.setCenter(coords);	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다			
				
				$.ajax({    
					url: '/map/test',
					data: {
						'lat': result[0].y, 
						'lng' : result[0].x						
					},
		
					success: function(){
						//console.log('ok');	
						var list = JSON.stringify('${list}');
						var list = list.split('|');
						
						//var arr=new Array();
						for (var i = 0; i < ${list.size()}; i ++) {
								geocoder.addressSearch( list[i], function(result, status) {						
									if (status === kakao.maps.services.Status.OK) {
										var latlng = new kakao.maps.LatLng(result[0].y, result[0].x);										
										
										if(${sessionScope.id != null}){
										 var a = 6371 
										 * Math.acos(Math.sin(${sessionScope.lat}/180*Math.PI)						
										 * Math.sin(latlng.getLat()/180*Math.PI)		
										 + Math.cos(${sessionScope.lat}/180*Math.PI)
										 * Math.cos(latlng.getLat()/180*Math.PI)		
										 * Math.cos((${sessionScope.lng}-latlng.getLng())/180*Math.PI));
										 
										// console.log(a);
										
										// 마커를 생성합니다
										if(a<1){
										var marker = new kakao.maps.Marker({
											position: latlng, // 마커를 표시할 위치
											clickable: true
										});
										marker.setMap(map);
										}
										//arr[i]=result[0].y;
										//console.log('arr:'+arr[i]);
										}
									}					
								});
							}
						}
					});
				}
			});
		
					
		//	console.log('arr:'+arr);
		//console.log(arr[0]);
		//console.log(arr[1]);
	</script>






