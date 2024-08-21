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
		let url = 'https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&lang=kr&appid={19d78b702ef255e0d5bb81968100e305}&units=metric';
		let response = await fetch(url);
		let data = await response.json();
		console.log("현재 날씨", data);
		
		let jsonData = JSON.parse(data);
		$('.item1').text(jsonData.name);
		
		var sunriseTime = moment(jsonData.sys.sunrise).format("YYYY-MM-DD HH:mm:ss")
		var sunsetTime = moment(jsonData.sys.sunset).format("HH:mm:ss")
		$('.item4').text("일출 : " + sunriseTime + ", 일몰 : " + sunsetTime);
		
		$('.item5').text("현재 온도 : " + jsonData.main.temp + " ℃, 체감 온도 : " + jsonData.main.feels_like + " ℃");
		$('.item6').text(jsonData.weather[0].description);
		$('.item7').text(jsonData.main.humidity + " %");
		$('.item8').text(jsonData.wind.speed + " m/s");
			
 	};
 	
 	function getCurrentLocation() {
 		navigator.geolocation.getCurrentPosition( (position) => {
 			let lat = position.coords.latitude;
 			let lon = position.coords.longitude;
 			console.log("현재 위치", lat, lon);
 			$('.item2').text(lat);
 			$('.item3').text(lon);
 			
 			getWeatherByCurrentLocation(lat, lon);
 		});
 	}
 	
 	getCurrentLocation();
 	
 	/* 2. 현재 위치 데이터로 받아서 날씨로 알려줌 (끝)  */
 });
