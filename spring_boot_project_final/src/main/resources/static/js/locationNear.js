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
	    mapTypeId: naver.maps.MapTypeId.NORMAL
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
	
	let lati;
	let longi;
	
	function onSuccessGeolocation(position) {
		lati = position.coords.latitude;
		longi = position.coords.longitude;
		
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
	    
	     map.addListener('click', function(e) {
	        $("#send").show();
        	searchCoordinateToAddress(e.coord);
	    });
	
	    naver.maps.Event.addListener(map, 'mousedown', function(e) {
	        menuLayer.hide();
	    });
	}

	function onErrorGeolocation() {
	    var center = map.getCenter();
	
	    infowindow.setContent('<div style="padding:20px;">' +
	        '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'+ "latitude: "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');
	
	    infowindow.open(map, center);
	}
	
	function searchCoordinateToAddress(latlng) {

    infoWindow.close();

    naver.maps.Service.reverseGeocode({
        coords: latlng,
        orders: [
            naver.maps.Service.OrderType.ADDR,
            naver.maps.Service.OrderType.ROAD_ADDR
        ].join(',')
    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }
	
	        var items = response.v2.results,
	
	            htmlAddresses = [];
	
	        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
	            item = items[i];
	            address = makeAddress(item) || '';
	            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';
	
	            htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
	        }
	
	        infoWindow.setContent([
	            '<div class=infoWin style="background-color:#808080" >',
	            '<h4 style="margin-top:5px;">검색 좌표</h4>',
	            htmlAddresses.join('<br />'),
	            '</div>'
	        ].join('\n'));
	        infoWindow.open(map, latlng);
	
	        getData(address);
	        
	    });
	}
	
	/*카카오 검색 API 활용 : address에 해당하는 장소의 정보
	function getData(target){
    $.ajax({
        method: "GET",
        url: "https://dapi.kakao.com/v2/local/search/keyword.json?y=" + lati.toString() + "&x=" + longi.toString(),
        data: {query: target},
        headers: {Authorization: "KakaoAK c6d5e3c470f3b7c1de98371694a6fef7"}
    })
        .done(function (msg) {
            for (var i=0, ii=SearchMarkerList.length; i<ii; i++) {
                SearchMarkerList[i].setMap(null);
            }
            SearchMarkerList = [];

            console.log(msg);
            try {

                msg.documents.forEach(function (item){
                    var marker = new naver.maps.Marker({
                        map: map,
                        position: new naver.maps.LatLng(item.y, item.x), // la : y / lng : x
                    });

                    var infowindow = new naver.maps.InfoWindow({
                        anchorSkew: true
                    });

                    infowindow.setContent([
                        '<div class=infoWin style="background-color: #808080">' +
                        '<div style ="font-weight: bold;font-size:17px">'+item.place_name+'</div>'+
                        '</div>'

                    ].join(''));

                    naver.maps.Event.addListener(marker, 'mouseover', function(e) {
                        infoWindow.close();
                        infowindow.open(map, marker);
                    });

                    naver.maps.Event.addListener(marker, "click", function(e) {

                        $("#infoForm").hide();
                        $("#send").show();

                        $("#category_name").show();
                        $("#place_url").show();
                        $("#phone").show();
                        $("#distance").show();

                        $("#locationTitle").html(" <strong>" + item.place_name + "</strong>");
                        $("#category_name").val(item.category_name);
                        $("#place_url").val(item.place_url);
                        $("#distance").html("현위치로 부터 " + item.distance + "m 거리에 있습니다." );
                        $("#phone").val(item.phone);
                    });

                    SearchMarkerList.push(marker);
                });

                // 인포창 표시
                $("#latiVal").val(msg.documents[0].y);
                $("#longiVal").val(msg.documents[0].x);
                $("#locationTitle").html(" <strong>" + msg.documents[0].place_name + "</strong>");
                $("#category_name").html("<li>" + "category: " + msg.documents[0].category_name + "</li>");
                $("#place_url").html("<li>" + "url: " + msg.documents[0].place_url + "</li>");
                $("#phone").html("<li>" + "phone: " + msg.documents[0].phone + "</li>");
                $("#distance").html("<li>" + "현위치로 부터 " + msg.documents[0].distance + "m 거리에 있습니다." + "</li>");

                //화면크기에서 벗어난 장소일 때만 이동됨
                var moveLatLon = new naver.maps.LatLng(msg.documents[0].y, msg.documents[0].x);
                map.panTo(moveLatLon);
                map.setZoom(16);

            } catch (error) {
                $("#locationTitle").html(" <strong>정보가 없습니다.</strong>");
                $("#category_name").html("<li></li>");
                $("#place_url").html("<li></li>");
                $("#phone").html("<li></li>");
                $("#distance").html("<li></li>");
            }
        });
	} */
	
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


	const SearchFacility = (e)=>{ // 현재 위치를 기반으로 키워드 검색

		const {kakao}= window;
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		var ps = new kakao.maps.services.Places();  // 키워드로 검색 인스턴스 생성

		const where = e.target.value;
      
		const current = new kakao.maps.LatLng(location.x, location.y);
		ps.keywordSearch(where, (data, status, pagination)=>{  // 키워드로 검색한다. 
        
			if (status === kakao.maps.services.Status.OK) {
				facilityLocationStore.setLocationArr(data);  // 스토어에 좌표값들을 저장한다. 
				if(markerArr.length !==0){
					deleteMarker();
				}
				const tmpArr = [];
				for (var i=0; i<data.length; i++) {
					displayMarker(map,infowindow ,data[i], tmpArr, where);    
				}
				setMarkerArr(tmpArr);       
	        }
        
      	},{location : current});  
	  } // 현재 위치를 기반으로 키워드 검색 끝

	const NaverMap = observer(() =>{
	
	    const curPos = curLocation.getXY;  // 현재 위치를 스토어에서 가져온다.
	    const arr = facilityLocationStore.locationArr;  // 카카오 api 에서 얻은 키워드에 해당되는 좌표값
	    const [markArr, setMarkArr] = useState([]);
	    const [nMap, setNmap] = useState(null);
	
	    const createMarker = useCallback(()=>{ 
	        
	        const {naver} = window;
	        for (var i=0; i<arr.length; i++) {
	            console.log(nMap, arr[i].x, arr[i].y);
	            let cur = new naver.maps.LatLng(arr[i].y, arr[i].x); //각 좌표에 마커를 찍어준다. 
	            let marker = new naver.maps.Marker({
	                map: nMap,
	                position: cur,
	                
	            });
	           
	        }
	        
	    },[arr, nMap]);    
	   
	 	});
});