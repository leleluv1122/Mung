<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=511ad37e23e2cc8925d6778ea7a8b0ba"></script>
<title>현재위치1</title>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
		function getLocation(position) {

			var latitud = position.coords.latitude;
			var longitude = position.coords.longitude;

			var mapContainer = document.getElementById("map") // 지도를 표시할 DIV
			var mapOption = {
				center : new daum.maps.LatLng(latitud, longitude) // 지도의 중심좌표
				,
				level : 3
			// 지도의 확대레벨
			};

			// 지도를 생성
			var map = new daum.maps.Map(mapContainer, mapOption);

			// 마커가 표시될 위치
			var markerPosition = new daum.maps.LatLng(latitud, longitude);

			// 마커를 생성
			var marker = new daum.maps.Marker({
				position : markerPosition
			});

			marker.setMap(map);
		}

		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(getLocation, function(
					error) {
				consol.log(error.message);
			});
		} else {
			consol.log("Geolocation을 지원하지 않는 브라우저 입니다.");
		}
	});
</script>
</head>
<body>
	<div id="map" style="width: 800px; height: 400px;"></div>
</body>
<!-- </head>
<body>
	<div id="map" style="width: 500px; height: 400px;"></div>
	<script>
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			level : 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</body> -->
</html>