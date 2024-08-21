/**
 * fishingSpotDetail.js
 */

document.addEventListener("DOMContentLoaded", function() {
    // 모달 버튼과 모달 창 요소 선택
    var modalButton = document.getElementById("productSelectionButton");
    var modal = document.getElementById("areaModal");
    var closeModal = document.querySelector("#areaModal .close");
    var confirmSelectionButton = document.getElementById("confirmSelection");

    // 모달 창 열기
    if (modalButton) {
        modalButton.onclick = function() {
            if (modal) {
                modal.style.display = "block";
            } else {
                console.error("Modal element not found.");
            }
        };
    } else {
        console.error("Modal button element not found.");
    }

    // 모달 창 닫기
    if (closeModal) {
        closeModal.onclick = function() {
            if (modal) {
                modal.style.display = "none";
                resetSelectedAreas();
            }
        };
    }

    // 선택 완료 버튼 클릭 시 모달 창 닫기
    if (confirmSelectionButton) {
        confirmSelectionButton.onclick = function() {
            if (modal) {
                modal.style.display = "none";
            }
            // 선택한 구역 ID를 가져와서 처리할 수 있습니다.
            var selectedAreas = document.querySelectorAll('input[name="selectedAreas"]:checked');
            var selectedValues = Array.from(selectedAreas).map(function(checkbox) {
                return checkbox.value;
            });
            console.log("Selected areas:", selectedValues);
            // 여기서 선택된 구역 ID를 서버로 전송하거나 다른 처리를 할 수 있습니다.
        };
    }

    // 모달 창 외부 클릭 시 모달 창 닫기
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
            resetSelectedAreas();
        }
    };
    
    // 모든 구역 항목에 클릭 이벤트 추가
    document.querySelectorAll('.area-item').forEach(function(item) {
        item.addEventListener('click', function() {
            var checkboxId = item.getAttribute('data-checkbox-id');
            openModalWithSelection(checkboxId);
        });
    });
});

// 체크박스
function toggleCheckbox(checkboxId) {
    var checkbox = document.getElementById(checkboxId);
    if (checkbox) {
        checkbox.checked = !checkbox.checked; // 현재 체크 상태를 반전시킴
    }
}

// 구역 클릭 시 모달 열기 및 체크박스 선택 상태 설정
function openModalWithSelection(checkboxId) {
    var checkbox = document.getElementById(checkboxId);
    if (checkbox) {
        checkbox.checked = true; // 체크박스 선택 상태로 설정
    }
    var modal = document.getElementById("areaModal");
    if (modal) {
        modal.style.display = "block";
    }
}

// 체크박스 상태 초기화 함수
function resetSelectedAreas() {
    var selectedAreas = document.querySelectorAll('input[name="selectedAreas"]:checked');
    selectedAreas.forEach(function(checkbox) {
        checkbox.checked = false; // 모든 체크박스를 비선택 상태로 설정
    });
}

/////////////////////////////////////////////////////////////////////////////////////////

$(document).ready(function() {
    const openWeatherApiKey = 'be9293c13315be192e4cfe3bd8c023dd'; // OpenWeatherMap API 키

    // 현재 위치를 가져오는 함수
    function getCurrentLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                const lat = position.coords.latitude;
                const lon = position.coords.longitude;
                fetchWeatherData(lat, lon);
            }, function(error) {
                console.error("위치 정보를 가져오는 데 실패했습니다: " + error.message);
                alert("위치 정보를 가져오는 데 실패했습니다.");
            });
        } else {
            alert("Geolocation을 지원하지 않는 브라우저입니다.");
        }
    }

    // OpenWeatherMap의 Forecast API를 사용하여 날씨 정보를 가져오는 함수
    function fetchWeatherData(lat, lon) {
        $.ajax({
            url: 'https://api.openweathermap.org/data/2.5/forecast',
            data: {
                lat: lat,
                lon: lon,
                units: 'metric',
                lang: 'kr',
                appid: openWeatherApiKey
            },
            success: function(response) {
                // 응답 데이터의 구조를 확인합니다
                console.log(response);

                if (response && response.list && response.list.length > 0) {
                    const events = [];
                    // 현재 날씨 정보를 가져와서 이벤트로 추가 (3시간 간격의 첫 번째 데이터 사용)
                    const weatherData = response.list[0];
                    const iconCode = weatherData.weather[0].icon; // 날씨 아이콘 코드
                    const iconUrl = `http://openweathermap.org/img/wn/${iconCode}@2x.png`; // 아이콘 URL

                    events.push({
                        title: '', // 제목을 비워둡니다
                        start: moment().format('YYYY-MM-DD'),
                        icon: iconUrl // 현재 날씨 아이콘 URL
                    });
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
            eventContent: function(event) {
                if (event.icon) {
                    return {
                        html: `<div class="fc-icon">
                                <img src="${event.icon}" alt="Weather Icon" style="width: 30px; height: 30px;"/>
                            </div>`
                    };
                }
                return { html: '' };
            },
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            initialView: 'dayGridMonth',
            editable: true,
            selectable: true
        });
    }

    // 페이지가 로드되면 위치를 가져오고 캘린더를 초기화합니다.
    getCurrentLocation();
});
