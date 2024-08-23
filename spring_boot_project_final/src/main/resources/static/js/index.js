/**
 * index.js
 */
 
 $(function() {
 
 
 	// 2. 실시간 HOT 키워드 - 유튜브 검색 결과 가져오기
	function authenticate() {
		return gapi.auth2.getAuthInstance()
			.signIn({scope: "https://www.googleapis.com/auth/youtube.readonly"})
	        .then(function() { console.log("Sign-in successful"); },
	              function(err) { console.error("Error signing in", err); });
	  }
	  
	  function loadClient() {
	    gapi.client.setApiKey("AIzaSyDPfjeBY9xnb2Wg19QEFOkYYX8DY0LBNUY");
	    return gapi.client.load("https://www.googleapis.com/discovery/v1/apis/youtube/v3/rest")
	        .then(function() { console.log("GAPI client loaded for API"); },
	              function(err) { console.error("Error loading GAPI client for API", err); });
	  }
	  
	  function execute() {
	    return gapi.client.youtube.search.list({
	      "part": [
	        "snippet"
	      ],
	      "maxResults": 5,
	      "order": "viewCount",
	      "publishedAfter": "2024-02-01T17:00:15Z",
	      "q": "낚시"
	    })
	        .then(function(response) {
	                // Handle the results here (response.result has the parsed body).
	                console.log("Response", response);
	              },
	              function(err) { console.error("Execute error", err); });
	  }
	  gapi.load("client:auth2", function() {
	    gapi.auth2.init({client_id: "340002655622-d8sjj83icmt5t60i1f65ctra8p73l3al.apps.googleusercontent.com"});
	  }); 
	// 2. 실시간 HOT 키워드 - 유튜브 검색 결과 가져오기 (끝)
	
	
	// (시작) 3. 실시간 조황
	var mapOptions = {
		center: new naver.maps.LatLng(37.5666103, 126.9783882), /* 사용자 현재 위치 반영 필요 */
	    zoom: 10,
	    mapTypeControl: true,
	    mapTypeControlOptions: {
	        style: naver.maps.MapTypeControlStyle.BUTTON,
	        position: naver.maps.Position.TOP_RIGHT
	    },
	    zoomControl: true,
	    zoomControlOptions: {
	        style: naver.maps.ZoomControlStyle.SMALL,
	        position: naver.maps.Position.TOP_RIGHT
	    },
	    scaleControl: true,
	    scaleControlOptions: {
	        position: naver.maps.Position.RIGHT_CENTER
	    },
	    logoControl: true,
	    logoControlOptions: {
	        position: naver.maps.Position.TOP_LEFT
	    },
	    mapDataControl: true,
	    mapDataControlOptions: {
	        position: naver.maps.Position.BOTTOM_LEFT
	    }
	};
	
	var map = new naver.maps.Map('nowFishingMap', mapOptions);
	
	window.navermap_authFailure = function () {
	    // 인증 실패 시 처리 코드 작성
	   alert("네이버 지도가 연결되지 않았습니다.");
	}
	// 3. 실시간 조황 (끝)


	// 4. 베스트 낚시 기록 (전체 회원 대상) / 6. 최신 낚시 기록 (전체 회원 대상)
	$('.menber_slick2').slick({
        slidesToShow: 5,
        SlidesToScroll: 1,
        dots: false,
        arrows: true,
        infinite: true,
        speed: 1000,
        autoplay: true,
        autoplaySpeed: 3000,
        pauseOnHover: true,
        centerMode: true
    });
    // 4. 베스트 낚시 기록 (전체 회원 대상) / 6. 최신 낚시 기록 (전체 회원 대상) : 끝
    
    
    // (시작) 5. 베스트 업체
    
    /* 업체 카테고리 선택 */
    const bestBizCtgList = document.querySelectorAll('.bestBizCtgBar .bestBiz');

 	bestBizCtgList.forEach( function(bestBiz, index) {
 		bestBiz.addEventListener('click', function() {
 			bestBizChange(index + 1);
 		});
 	});
 	
 	function bestBizChange(num) {
 		document.querySelector('.bestBiz.active').classList.remove('active');
 		document.querySelector('.bestBiz' + num).classList.add('active');
 	}
    
    // 5. 베스트 업체 (끝)
  

    


    
	 
 	
 	

 
 });
 
 document.addEventListener('DOMContentLoaded', function() {
 	 // (시작) 7. 신상 낚시 용품 입고
 	/* 업체 카테고리 선택 */
 	const newPrdCtgList = document.querySelectorAll('.newPrdCtgBar .newPrd');
    const newPrdList = document.querySelectorAll('.newPrdItem');

 	newPrdCtgList.forEach( function(newPrdCtg, index) {
 		newPrdCtg.addEventListener('click', function() {
 			
 			const prdCtg = this.getAttribute('data-tab');
 			
 			newPrdChange(index + 1);
 			
 			newPrdList.forEach( function(newPrd) {	
 				const itemPrdCtg = document.getElementById('prdCtgIdItem');
 				
 				if (newPrd.getAttribute('data-category') == prdCtg) {
 					newPrd.setAttribute('display', 'inline-block');
 				} else {
 					newPrd.setAttribute('display', 'none');
 				}
 			});
 		});
 	});
 	
 	function newPrdChange(num) {
 		document.querySelector('.newPrd.active').classList.remove('active');
 		document.querySelector('.newPrd' + num).classList.add('active');
 	}
     // 7. 신상 낚시 용품 입고 (끝)
 });