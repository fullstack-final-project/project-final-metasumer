/**
 * fishingSpotDetail.js
 */

 $(document).ready(function() {
    var modalButton = $("#productSelectionButton");
    var modal = $("#areaModal");
    var closeModal = $("#areaModal .close");
    var confirmSelectionButton = $("#confirmSelectionBtn");
    var selectedDate = '';
    var selectedValues = [];
    var weatherEvents = []; // 날씨 이벤트를 저장할 배열

    // JSP에서 서버 변수를 JavaScript로 전달
    var spotAddress1 = "<c:out value='${spot.spotAddress1}' />";
    var spotAddress2 = "<c:out value='${spot.spotAddress2}' />";
    
    // 모달 창 열기
    modalButton.on("click", function() {
        modal.show();
        updateConfirmButton(); // 버튼 상태 업데이트
    });

    // 모달 창 닫기
    closeModal.on("click", function() {
        modal.hide();
        resetSelectedAreas();
        updateConfirmButton();
    });

    // 선택 완료 버튼 클릭 시 모달 창 닫기 및 폼 데이터 준비
    confirmSelectionButton.on("click", function() {
        modal.hide();
        selectedValues = $('input[name="selectedAreas"]:checked').map(function() {
            return this.value;
        }).get();
        
        selectedValues = [...new Set(selectedValues)];
        
        var reservationQuantity = $('#resQuantity').val();
        var resNum = $('#resNum').val();

        // 폼에 데이터 추가
        $('#selectedAreas').val(selectedValues.join(','));
        $('#resQuantity').val(reservationQuantity);
        $('#resDate').val(selectedDate);
        
        // 폼 제출
        $('#areaSelectionForm').submit();
    });

    // 모달 창 외부 클릭 시 모달 창 닫기
    $(window).on("click", function(event) {
        if ($(event.target).is(modal)) {
            modal.hide();
            resetSelectedAreas();
            updateConfirmButton();
        }
    });

    // 모든 구역 항목에 클릭 이벤트 추가
    $('.area-item').on('click', function() {
        var checkboxId = $(this).data('checkbox-id');
        openModalWithSelection(checkboxId);
        updateConfirmButton();
    });

    // 체크박스 상태 토글
    window.toggleCheckbox = function(checkboxId) {
        var checkbox = $(`#${checkboxId}`);
        if (checkbox.length) {
            checkbox.prop('checked', !checkbox.prop('checked')); // 현재 체크 상태를 반전시킴
            updateConfirmButton();
        }
    };

    // 구역 클릭 시 모달 열기 및 체크박스 선택 상태 설정
    function openModalWithSelection(checkboxId) {
        var checkbox = $(`#${checkboxId}`);
        if (checkbox.length) {
            checkbox.prop('checked', true); // 체크박스 선택 상태로 설정
        }
        modal.show();
        updateConfirmButton(); // 버튼 상태 업데이트
    }

    // 체크박스 상태 초기화 함수
    function resetSelectedAreas() {
        $('input[name="selectedAreas"]:checked').prop('checked', false); // 모든 체크박스를 비선택 상태로 설정
        updateConfirmButton(); // 버튼 상태 업데이트
    }

    // 확인 버튼 상태 업데이트 함수
    function updateConfirmButton() {
        var selectedAreas = $('input[name="selectedAreas"]:checked');
        var confirmButton = $('#confirmSelectionBtn');
        var selectedCount = selectedAreas.length;

        if (selectedCount > 0 && selectedDate) {
            confirmButton.prop('disabled', false);
            confirmButton.css('background-color', '#09a4f7'); // 활성화 시 파란색
            confirmButton.text(`상품 바로 결제(${selectedCount})`); // 선택된 구역 수 표시
        } else {
            confirmButton.prop('disabled', true);
            confirmButton.css('background-color', '#ccc'); // 비활성화 시 회색
            confirmButton.text('상품 선택하기');
        }
    }

    // 페이지 로드 시 현재 날짜로 달력 초기화
    function initializeCalendar() {
        var currentDate = moment().format('YYYY-MM-DD');
        selectedDate = currentDate;
        $('#calendar').fullCalendar('gotoDate', currentDate);
        $('#calendar').fullCalendar('select', currentDate); // 현재 날짜 선택
        
        getSpotLocation(); // 낚시터 주소로 위치 정보를 가져와 날씨를 요청
    }

    // 낚시터 주소로 위치 정보를 가져오는 함수
    function getSpotLocation() {
        var fullAddress = `${spotAddress1} ${spotAddress2}`.trim(); 
        console.log('Full Address:', fullAddress); // 전체 주소 확인
        if (fullAddress) {
            geocodeAddress(fullAddress); // 주소를 위도와 경도로 변환
        } else {
            alert('주소를 찾을 수 없습니다.');
        }
    }

    // 주소를 위도와 경도로 변환하는 함수 (구글 Geocoding API 사용)
    function geocodeAddress(address) {
        var apiKey = 'AIzaSyCp5LcoJxmqP5HCq3P2BlobxQosmoxDlnE'; // 구글 API 키
        var encodedAddress = encodeURIComponent(address);
        var geocodeUrl = `https://maps.googleapis.com/maps/api/geocode/json?address=${encodedAddress}&key=${apiKey}`;
        
        $.ajax({
            url: geocodeUrl,
            dataType: 'json',
            success: function(data) {
                if (data.status === 'OK') {
                    var location = data.results[0].geometry.location;
                    var lat = location.lat;
                    var lon = location.lng;
                    console.log('위도:', lat, '경도:', lon);
                    fetchWeatherData(lat, lon); // 위도와 경도로 날씨 데이터 가져오기
                } else {
                    console.error('주소 변환 실패:', data.status);
                    alert('주소를 찾을 수 없습니다.');
                }
            },
            error: function(xhr, status, error) {
                console.error('API 호출 오류:', error);
                alert('주소 변환에 실패했습니다.');
            }
        });
    }

    // 날짜와 날씨를 업데이트하는 함수
    function updateDateAndWeather(date) {
	    $('#selectedDateDisplay').text(`${date}`);
	    
	    // 날씨 정보 가져오기
	    const selectedWeather = weatherEvents.find(event => event.start === date);
	    if (selectedWeather) {
	        // OpenWeatherMap에서 제공하는 아이콘
	        var iconUrl = `http://openweathermap.org/img/wn/${selectedWeather.icon}.png`;
	
	        // 아이콘과 날씨 정보 업데이트
	        $('#weatherDisplay').html(`
	            <div class="weather-display-container">
			        <img src="${iconUrl}" alt="날씨 아이콘" class="weather-icon">
			        <div class="weather-description">${selectedWeather.description} ${selectedWeather.temp}°C</div>
			    </div>
	        `);
	    } else {
	        $('#weatherDisplay').text('날씨 정보 없음');
	    }
	}

    

    // 날씨 데이터를 가져오는 함수
    function fetchWeatherData(lat, lon) {
        $.ajax({
            url: 'https://api.openweathermap.org/data/2.5/forecast',
            data: {
                lat: lat,
                lon: lon,
                units: 'metric', // 섭씨 온도
                lang: 'kr', // 한국어
                appid: 'be9293c13315be192e4cfe3bd8c023dd' // OpenWeatherMap API 키
            },
            success: function(response) {
                console.log('Weather API Response:', response); // 응답 데이터 확인
                if (response && response.list && response.list.length > 0) {
                    const events = [];
                    const dateMap = {};

                    // 데이터 집계
                    response.list.forEach(function(entry) {
                        const date = entry.dt_txt.split(' ')[0]; // 날짜만 추출 (YYYY-MM-DD)
                        const temp = entry.main.temp;
                        const description = entry.weather[0].description;
                        const icon = entry.weather[0].icon || null;

                        if (!dateMap[date]) {
                            dateMap[date] = {
                                temp: temp,
                                description: description,
                                icon: icon
                            };
                        } else {
                            dateMap[date].temp = temp;
                            dateMap[date].description = description;
                            dateMap[date].icon = icon;
                        }
                    });

                    // 이벤트 생성
                    for (const date in dateMap) {
                        if (dateMap.hasOwnProperty(date)) {
                            const { temp, description, icon } = dateMap[date];
                            events.push({
                                title: `날씨 정보`,
                                start: date,
                                description: `${description}`, // 날씨 설명
                                temp: temp, // 온도
                                icon: icon
                            });
                        }
                    }

                    weatherEvents = events; // 날씨 이벤트 배열에 저장
                    renderCalendar(events);
                    updateDateAndWeather(selectedDate); // 초기 날짜와 날씨 업데이트
                } else {
                    console.error("응답 데이터의 구조가 예상과 다릅니다.");
                    alert("날씨 정보를 가져오는 데 실패했습니다.");
                }
            },
            error: function(xhr) {
                console.error("API 호출 오류: " + xhr.responseText);
                alert("날씨 정보를 가져오는 데 실패했습니다.");
            }
        });
    }

    // FullCalendar를 초기화하고 날씨 정보를 이벤트로 추가하는 함수
	function renderCalendar(events) {
	    $('#calendar').fullCalendar({
	        locale: 'ko',
	        events: events,
	        editable: false, // 드래그 및 수정 비활성화
	        eventStartEditable: false, // 이벤트 시작 시간 수정 비활성화
	        eventDurationEditable: false, // 이벤트 기간 수정 비활성화
	        eventResizableFromStart: false, // 이벤트 크기 조절 비활성화
	        eventRender: function(event, element) {
	        	var iconUrl = event.icon ? `http://openweathermap.org/img/wn/${event.icon}.png` : '';
	        	element.html(`
	                <div class = "fc-div" style="text-align: center;">
	                    ${iconUrl ? `<img src="${iconUrl}" alt="날씨 아이콘" style="width: 50px; height: 50px;">` : ''}
	                    <div>${event.description}</div>
	                </div>
	            `);
	            
	            element.find('.fc-div').on('click', function() {
	                var date = event.start.format('YYYY-MM-DD');
	                selectDate(date);
	            });
	        },
	        header: {
	            left: '',
	            center: 'prev title next',
	            right: ''
	        },
	        defaultView: 'month',
	        editable: true,
	        selectable: true,
	        dayClick: function(date, jsEvent, view) {
	            if (date.isBefore(moment(), 'day')) {
	                // 현재 날짜 이전의 날들을 클릭할 수 없도록 막음
	                return;
	            }
	            var selectedDate = date.format('YYYY-MM-DD');
	            selectDate(selectedDate);  
	        },
	        viewRender: function(view) {
	            var currentMonth = view.intervalStart.month(); 
	            var today = moment().month(); 
	            
	            // 'prev' 버튼 비활성화
	            if (currentMonth === today) {
	                $('.fc-prev-button').hide();
	            } else {
	                $('.fc-prev-button').show();
	            }
	            
	            var year = view.intervalStart.format('YYYY');
	            var month = view.intervalStart.format('MM');
	            var formattedTitle = year + '년 ' + month + '월';
	            $('.fc-center h2').text(formattedTitle);
	            
	            // 선택된 날짜에 테두리 다시 설정
	            if (selectedDate) {
	                $('#calendar').find('.fc-day').removeClass('selected-date');
	                $('#calendar').find(`[data-date="${selectedDate}"]`).addClass('selected-date');
	            }
	            // 전날의 날짜 색과 배경색을 변경
	            $('#calendar').find('.fc-day').each(function() {
	                var cellDate = $(this).data('date');
	                if (cellDate && moment(cellDate).isBefore(moment(), 'day')) {
	                    $(this).css({
	                        'background-color': '#f0f0f0', // 배경색 회색
	                        'color': '#999999' // 글자색 회색(적용 X)
	                    });
	                }
	            });
	
	           
	        }
	    });

        // 페이지 로드 후 현재 날짜에 테두리 추가
        $('#calendar').find('.fc-day').each(function() {
            var cellDate = $(this).data('date');
            if (cellDate === selectedDate) {
                $('#calendar').find('.fc-day').removeClass('selected-date');
                $(this).addClass('selected-date');
            }
        });
    }
    
    // 날짜 선택 및 테두리 설정 함수
    function selectDate(date) {
        selectedDate = date;
        $('#calendar').find('.fc-day').removeClass('selected-date');
        $('#calendar').find(`[data-date="${selectedDate}"]`).addClass('selected-date');

        // 날씨 정보를 업데이트
        updateDateAndWeather(selectedDate);
    }

    // 페이지 로드 시 초기화 호출
    initializeCalendar(); // 페이지가 로드될 때 달력을 초기화하고 현재 날짜를 선택
});
