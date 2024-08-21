/**
 * locationTraffic.js
 */
 
 $(document).ready(function() {
 	
 	/*  0. (시작) 탭 메뉴 선택 시 각 탭 사이트로 이동 */
 	const locCtgItem = document.querySelectorAll('.locCtg');
 	
 	locCtgItem.forEach( function(item, index) {
		item.addEventListener('click', function() {
			window.location.href = $(this).attr('data-tab');
		});
	});
	/* 0. 탭 메뉴 선택 시 각 탭 사이트로 이동 (끝) */
 
 
 	/* 1. (시작) 상단 위치 카테고리 클릭 시 해당 카테고리에 강조 표시 */
 	const locCtgList = document.querySelectorAll('.locCtgBar .locCtg');
 	
 	locCtgList.forEach( function(locCtg, index) {
 		locCtg.addEventListener('click', function() {
 			locCtgChange(index + 1);
 		});
 	});
 	
 	function locCtgChange(num) {
 		document.querySelector('.locCtg.active').classList.remove('active');
 		document.querySelector('.locCtg' + num).classList.add('active');
 	}
 	/* 1. 상단 위치 카테고리 클릭 시 해당 카테고리에 강조 표시 (끝) */
 	
 	
 	/* 2. (시작) 네이버 지도 API 호출 관련 : 지도 설정 값 및 호출 함수 */
	let defaultPos = new naver.maps.LatLng(37.5666103, 126.9783882); // 지도의 초기 좌표
	
 	let mapOptions = { // map setting 설정값 저장 변수
	    center: defaultPos.destinationPoint(0, 500),
	    zoom: 13, // 지도의 초기 줌 레벨
    	minZoom: 6, // 지도의 최소 줌 레벨
    	draggable: true,
    	pinchZoom: true,
    	scrollWheel: true,
    	disableKineticPan: false, // 관성 드래깅
	    mapTypeControl: true, // 맵 타입 컨르롤러 (일반, 위성) (사용자 조작용)
	    mapTypeControlOptions: {
	        style: naver.maps.MapTypeControlStyle.BUTTON,
	        position: naver.maps.Position.TOP_RIGHT
	    },
	    zoomControl: true, // 줌 컨트롤러 (사용자 조작용)
	    zoomControlOptions: {
	        position: naver.maps.Position.TOP_LEFT
	    },
	    scaleControl: true, // 스케일 컨트롤러 (정보 제공용 : 줌에 따라서 스케일 간격 자동 변경됨)
	    scaleControlOptions: {
	        position: naver.maps.Position.BOTTOM_RIGHT
	    },
	    logoControl: true, // 로고 컨트롤러 (정보 제공용 : 클릭 시 저작권 관련 탭으로 이동)
	    logoControlOptions: {
	        position: naver.maps.Position.BOTTOM_RIGHT
	    },
	    mapDataControl: true, // 네이버 회사 로고 컨트롤러 (정보 제공용)
	    mapDataControlOptions: {
	        position: naver.maps.Position.BOTTOM_LEFT
	    },
	    mapTypeId: naver.maps.MapTypeId.NORMAL,
	    mapTypes: new naver.maps.MapTypeRegistry({
        	'normal': naver.maps.NaverStyleMapTypeOptions.getNormalMap({
            	overlayType: 'bg.ol.ts.ctt.lko'
			})
        })
	};
	
	let map = new naver.maps.Map('locationMapBox', mapOptions);
	map.setCursor('pointer');
	
	let marker = new naver.maps.Marker({ // 위치 권한 주지 않았을 때 기본 마커
		map: map,
		position: defaultPos,
        anchorSize: new naver.maps.Size(25, 5),
       	pixelOffset: new naver.maps.Point(0, -10)
	}); 
	
	let infowindow = new naver.maps.InfoWindow({ // 현재 위치 표시
	    anchorSkew: true
	});
	
	window.navermap_authFailure = function () {
	   alert("네이버 지도가 연결되지 않았습니다.");
	}
	
	let location; // onSuccessGeolocation, coordinateToAddress 에서 사용
	
	function onSuccessGeolocation(position) {
		location = new naver.maps.LatLng(position.coords.latitude,
	                                         position.coords.longitude);
	
	    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
	    map.setZoom(15); // 지도의 줌 레벨을 변경합니다.
	    
		let contentString = [ // 현재 위치 표시하는 마커의 설정값
			'<div style="padding:10px; font-weight:bold"><h3 style="color:#39A7FF; text-align:center letter-spacing: -1px;">현재 위치</h3></div>'
		].join();
		    
	    infowindow.setContent(contentString); // geolocation.getCurrentPosition() 위치
	
	    infowindow.open(map, location);
	   // console.log('Coordinates: ' + location.toString()); // 현재 위치 좌표
	    // naver.maps.onJSContentLoaded = coordinateToAddress;
	}

	function onErrorGeolocation() {
	    var center = map.getCenter();
	
	    infowindow.setContent('<div style="padding:20px;">' +
	        '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'+ "latitude: "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');
	
	    infowindow.open(map, center);
	}
	
	if (navigator.geolocation) {
	        /**
	         * navigator.geolocation 은 Chrome 50 버젼 이후로 HTTP 환경에서 사용이 Deprecate 되어 HTTPS 환경에서만 사용 가능 합니다.
	         * http://localhost 에서는 사용이 가능하며, 테스트 목적으로, Chrome 의 바로가기를 만들어서 아래와 같이 설정하면 접속은 가능합니다.
	         * chrome.exe --unsafely-treat-insecure-origin-as-secure="http://example.com"
	         */
	         
	        navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
	        
    } else {
        var center = map.getCenter();
        infowindow.setContent('<div style="padding:20px; color:#39A7FF; font-weight:bold">' +
        								   '<h5 style="margin-bottom:5px;">Geolocation not supported</h5></div>');
        infowindow.open(map, center);
    }

 	/* 2. 네이버 지도 API 호출 관련 : 지도 설정 값 및 호출 함수 (끝) */

 	
 });
