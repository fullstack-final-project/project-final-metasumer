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

    // 페이지 로드 시 현재 날짜로 달력 초기화
    function initializeCalendar() {
   		 getCurrentLocation();
        // 달력 초기화 로직
        var currentDate = moment().format('YYYY-MM-DD');
        selectedDate = currentDate;
        $('#calendar').fullCalendar('gotoDate', currentDate);
    }

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
                if (response && response.list && response.list.length > 0) {
                    const events = [];
                    const dateMap = {};

                    // 데이터 집계
                    response.list.forEach(function(entry) {
                        const date = entry.dt_txt.split(' ')[0]; // 날짜만 추출 (YYYY-MM-DD)
                        const temp = entry.main.temp;
                        const description = entry.weather[0].description;

                        if (!dateMap[date]) {
                            dateMap[date] = {
                                temp: temp,
                                description: description
                            };
                        } else {
                            dateMap[date].temp = temp;
                            dateMap[date].description = description;
                        }
                    });

                    // 이벤트 생성
                    for (const date in dateMap) {
                        if (dateMap.hasOwnProperty(date)) {
                            const { temp, description } = dateMap[date];
                            events.push({
                                title: `날씨 정보`,
                                start: date,
                                description: `${description}`, // 날씨 설명
                                temp: temp // 온도
                            });
                        }
                    }

                    renderCalendar(events);
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
            eventRender: function(event, element) {
                element.find('.fc-title').html(`${event.title}`);
                element.append(`<div class="fc-div">${event.description}</div>`);
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
                selectedDate = date.format('YYYY-MM-DD'); // 날짜 형식 지정
                console.log("Selected Date:", selectedDate);

                $('#calendar').find('.fc-day').css('border', ''); // 모든 테두리 초기화
                $(this).css('border', '2px solid blue'); // 클릭된 날짜의 테두리 변경
            }
        });

        // 페이지 로드 후 현재 날짜에 테두리 추가
        $('#calendar').find('.fc-day').each(function() {
            var cellDate = $(this).data('date');
            if (cellDate === selectedDate) {
                $(this).css('border', '2px solid blue'); // 선택된 날짜에 테두리 스타일 적용
            }
        });
    }

    // 위치를 가져오고 날씨 정보를 요청하는 함수
    function getCurrentLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(
                function(position) {
                    const lat = position.coords.latitude;
                    const lon = position.coords.longitude;
                    fetchWeatherData(lat, lon); // 위치를 이용해 날씨 정보를 가져옵니다.
                },
                function(error) {
                    console.error("위치 정보를 가져오는 데 실패했습니다: " + error.message);
                    alert("위치 정보를 가져오는 데 실패했습니다.");
                }
            );
        } else {
            alert("이 브라우저는 위치 정보를 지원하지 않습니다.");
        }
    }

    // 페이지 로드 시 초기화 호출
    initializeCalendar(); // 페이지가 로드될 때 달력을 초기화하고 현재 날짜를 선택
    
});
