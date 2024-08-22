/**
 * weather.js
 */
 
 $(document).ready(function() {
 	
 	/* (시작) 0. 탭 메뉴 선택 시 각 탭 사이트로 이동 */
 	const weatherCtgItem = document.querySelectorAll('.weatherCtg');
 	
 	weatherCtgItem.forEach( function(item, index) {
		item.addEventListener('click', function() {
			window.weatheration.href = $(this).attr('data-tab');
		});
	});
	/* 0. 탭 메뉴 선택 시 각 탭 사이트로 이동 (끝) */
 
 
 	/* 1. (시작) 상단 위치 카테고리 클릭 시 해당 카테고리에 강조 표시 */
 	const weatherCtgList = document.querySelectorAll('.weatherCtgBar .weatherCtg');
 	
 	weatherCtgList.forEach( function(weatherCtg, index) {
 		weatherCtg.addEventListener('click', function() {
 			weatherCtgChange(index + 1);
 		});
 	});
 	
 	function weatherCtgChange(num) {
 		document.querySelector('.weatherCtg.active').classList.remove('active');
 		document.querySelector('.weatherCtg' + num).classList.add('active');
 	}
 	/* 1. 상단 위치 카테고리 클릭 시 해당 카테고리에 강조 표시 (끝) */


	/* 2. (시작) 현재 위치 데이터로 받아서 날씨로 알려줌 */
 	const getWeatherByCurrentLocation = async (lat, lon) => {
		let url = 'https://api.openweathermap.org/data/2.5/weather?lat=' + lat + '&lon=' + lon + '&lang=kr&appid=19d78b702ef255e0d5bb81968100e305&units=metric';
		let response = await fetch(url);
		let data = await response.json();
		let jsonString = JSON.stringify(data);
		let jsonData = JSON.parse(jsonString);
		
		$('.item1').text(jsonData.name);
		var sunriseTime = Unix_timestamp(jsonData.sys.sunrise);
		var sunsetTime = Unix_timestamp(jsonData.sys.sunset);
		$('.item4').text("일출 : " + sunriseTime + ", 일몰 : " + sunsetTime);
		
		$('.item5').text("현재 온도 : " + jsonData.main.temp + " ℃, 체감 온도 : " + jsonData.main.temp_max + " ℃");
		$('.item6').text(jsonData.weather[0].description);
		$('.item7').text(jsonData.main.humidity + " %");
		$('.item8').text(jsonData.wind.speed + " m/s");
			
 	};
 	
 	function getCurrentLocation() {
 		navigator.geolocation.getCurrentPosition( (position) => {
 			let lat = position.coords.latitude;
 			let lon = position.coords.longitude;
 			// console.log("현재 위치", lat, lon);
 			$('.item2').text(lat);
 			$('.item3').text(lon);
 			
 			getWeatherByCurrentLocation(lat, lon);
 		});
 	}
 	
 	// 타임스탬프 값을 년월일로 변환
	function Unix_timestamp(t){
	    var date = new Date(t*1000);
	    var year = date.getFullYear();
	    var month = "0" + (date.getMonth()+1);
	    var day = "0" + date.getDate();
	    var hour = "0" + date.getHours();
	    var minute = "0" + date.getMinutes();
	    var second = "0" + date.getSeconds();
	    return year + "-" + month.substr(-2) + "-" + day.substr(-2) + " " + hour.substr(-2) + ":" + minute.substr(-2) + ":" + second.substr(-2);
	}
	 	
 	getCurrentLocation();
 	
 	/* 2. 현재 위치 데이터로 받아서 날씨로 알려줌 (끝)  */
 });
