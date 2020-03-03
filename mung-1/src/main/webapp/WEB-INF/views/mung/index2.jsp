<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=511ad37e23e2cc8925d6778ea7a8b0ba&libraries=services"></script>
<title>현재위치2</title>

</head>
<body>
	<input type="text" id="searchLoc">
	<button onclick="searchLocation();">검색</button>
	<div id="map" style="width: 800px; height: 400px;"></div>
</body>
<script type="text/javascript">
	var ps = new daum.maps.services.Places();
	//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new daum.maps.InfoWindow({
		zIndex : 1
	});

	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 래퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new daum.maps.LatLng(37.361149, 126.732352),
		level : 3
	};
	var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴

	function searchLocation() {
		// 장소 검색 객체를 생성합니다
		var loc = $("#searchLoc").val();
		ps.keywordSearch(loc, placesSearchCB);
	}

	//키워드 검색 완료 시 호출되는 콜백함수
	function placesSearchCB(data, status, pagination) {
		if (status == daum.maps.services.Status.OK) {
			//검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			//LatLngBounds 객체에 좌표를 추가
			var bounds = new daum.maps.LatLngBounds();

			for (var i = 0; i < data.length; i++) {
				displayMarker(data[i]);
				bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
			}

			//검색된 장소 위치를 기준으로 지도 범위 재설정
			map.setBounds(bounds);
		}
	}

	//지도에 마커를 표시하는 함수
	function displayMarker(place) {
		var marker = new daum.maps.Marker({
			map : map,
			position : new daum.maps.LatLng(place.y, place.x)
		});

		daum.maps.event.addListener(marker, 'click', function() {
			//마커를 클릭하면 장소명이 인포 윈도우에 표시된다
			infowindow.setContent('<div style="padding:5px;font-size:12px;">'
					+ place.place_name + '</div>');
			infowindow.open(map, marker);
		});
	}
</script>
</html>