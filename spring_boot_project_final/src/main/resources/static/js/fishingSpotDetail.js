/**
 * fishingSpotDetail.js
 */

document.addEventListener("DOMContentLoaded", function() {
    // 모달 버튼과 모달 창 요소 선택
    var modalButton = document.getElementById("productSelectionButton");
    var modal = document.getElementById("areaModal");
    var closeModal = document.querySelector("#areaModal .close");
    var confirmSelectionButton = document.getElementById("confirmSelectionBtn");

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
                updateConfirmButton();
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
            updateConfirmButton();
        }
    };
    
    // 모든 구역 항목에 클릭 이벤트 추가
    document.querySelectorAll('.area-item').forEach(function(item) {
        item.addEventListener('click', function() {
            var checkboxId = item.getAttribute('data-checkbox-id');
            openModalWithSelection(checkboxId);
            updateConfirmButton();
        });
    });
});

// 체크박스
function toggleCheckbox(checkboxId) {
    var checkbox = document.getElementById(checkboxId);
    if (checkbox) {
        checkbox.checked = !checkbox.checked; // 현재 체크 상태를 반전시킴
        updateConfirmButton();
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
    updateConfirmButton();
}

// 체크박스 상태 초기화 함수
function resetSelectedAreas() {
    var selectedAreas = document.querySelectorAll('input[name="selectedAreas"]:checked');
    selectedAreas.forEach(function(checkbox) {
        checkbox.checked = false; // 모든 체크박스를 비선택 상태로 설정
    });
    updateConfirmButton();
}

// 확인 버튼 상태 업데이트 함수
function updateConfirmButton() {
    var selectedAreas = document.querySelectorAll('input[name="selectedAreas"]:checked');
    var confirmButton = document.getElementById('confirmSelectionBtn');
    
    if (selectedAreas.length > 0) {
        confirmButton.disabled = false;
        confirmButton.style.backgroundColor = '#09a4f7'; // 활성화 시 녹색
        confirmButton.textContent = `상품 바로 결제(${selectedAreas.length})`;
    } else {
        confirmButton.disabled = true;
        confirmButton.style.backgroundColor = '#ccc'; // 비활성화 시 회색
        confirmButton.textContent = '상품 선택하기';
    }
}

/////////////////////////////////////////////////////////////////////////////////////////

// 달력

const apiKey = 'be9293c13315be192e4cfe3bd8c023dd'; // OpenWeatherMap API 키를 여기에 입력하세요

// 7일간의 날씨 데이터를 가져오는 함수
function fetchWeatherData(lat, lon) {
    $.ajax({
        url: 'https://api.openweathermap.org/data/2.5/forecast',
        data: {
            lat: lat,
            lon: lon,
            units: 'metric', // 섭씨 온도
            lang: 'kr', // 한국어
            appid: apiKey
        },
        success: function(response) {
            console.log(response); // 응답 데이터의 구조를 확인합니다

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
                        // 온도와 설명을 집계하여 평균값을 사용할 수도 있습니다
                        // 이 예제에서는 최신 데이터를 사용하고 있습니다
                        dateMap[date].temp = temp;
                        dateMap[date].description = description;
                    }
                });

                // 이벤트 생성
                for (const date in dateMap) {
                    if (dateMap.hasOwnProperty(date)) {
                        const { temp, description } = dateMap[date];
                        events.push({
                            title: ``,
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
            // 이벤트 제목 설정
            element.find('.fc-title').html(`${event.title}`);

            // 이벤트 내용 추가
            element.append(`<div class="fc-div">${event.description}</div>`);
        },
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        defaultView: 'month',
        editable: true,
        selectable: true
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

// 페이지가 로드되면 위치를 가져오고 캘린더을 초기화합니다.
$(document).ready(function() {
    getCurrentLocation();
});
