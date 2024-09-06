/**
 * dashboard.js
 */

$(document).ready(function() {

    // 탭 클릭 이벤트 처리
    $('.tablinks').on('click', function(event) {
        event.preventDefault();
        var targetTab = $(this).attr('data-target');
        
        // 모든 탭 콘텐츠 숨기기
        $('.tabcontent').hide();
        
        // 클릭한 탭 콘텐츠만 표시
        $('#' + targetTab).show();
        
        // 모든 탭 버튼의 활성 상태 제거
        $('.tablinks').removeClass('active');
        
        // 클릭한 탭 버튼 활성화
        $(this).addClass('active');
        
        // 달력 탭이 선택된 경우, FullCalendar 강제 리렌더링
        if (targetTab === 'calendarTab') {
            $('#calendar').fullCalendar('render'); 
        }
    });

    // 초기 로드 시 첫 번째 탭 활성화
    $('.tablinks').first().click();

    // FullCalendar 설정
    $('#calendar').fullCalendar({
        header: {
            left: '',
            center: 'prev title next',
            right: ''
        },
        defaultView: 'month',
        editable: false,
        events: function(start, end, timezone, callback) {
            $.ajax({
                url: '/business/listAllReservations', // + bizId(사업자 로그인 후 사용)
                dataType: 'json',
                success: function(data) {
                    var events = [];
                    $.each(data, function(i, item) {
                        var start = moment(item.resStart, 'HH:mm:ss').format('HH:mm');
                        var end = moment(item.resEnd, 'HH:mm:ss').format('HH:mm');
                        
                        events.push({
                            id: item.resNo,
                            title: '예약 번호: ' + item.resNo + ' (' + item.resStatus + ')\n' + start + '~' + end,
                            start: moment(item.resDate).format(),
                            allDay: true,
                            status: item.resStatus // 상태 정보 추가
                        });
                    });
                    callback(events);
                }
            });
        },
        eventRender: function(event, element) {
            if (event.status === 'confirmed') {
                element.css('background-color', '#28a745'); // 확정 상태 (초록색)
            } else if (event.status === 'pending') {
                element.css('background-color', 'yellow'); // 승인 대기 상태 (노란색)
            } else if (event.status === 'cancelled') {
                element.css('background-color', 'red'); // 취소 상태 (빨간색)
            }
            
            element.attr('title', event.description);
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
        }
    });
});

function confirmReservation(resNo) {
    if (confirm("예약을 확정하시겠습니까?")) {
        $.post(`/business/confirmReservation/${resNo}`, function(response) {
            alert("예약이 확정되었습니다.");
            // 예약 상태 업데이트
            updateReservationStatus(resNo, 'confirmed');
        });
    }
}

function cancelReservation(resNo) {
    if (confirm("예약을 취소하시겠습니까?")) {
        $.post(`/business/cancelReservation/${resNo}`, function(response) {
            alert("예약이 취소되었습니다.");
            // 예약 상태 업데이트
            updateReservationStatus(resNo, 'cancelled');
        });
    }
}

function updateReservationStatus(resNo, status) {
    var row = $(`tr`).filter(function() {
        return $(this).find('td:first').text() == resNo;
    });

    // 예약 상태 셀을 업데이트합니다.
    row.find('td:nth-child(5)').text(status);

    // 버튼 활성화/비활성화
    if (status === 'confirmed') {
        row.find('.btn-success').prop('disabled', true); // '확정' 버튼 비활성화
        row.find('.btn-cancel').prop('disabled', false); // '취소' 버튼 활성화
    } else if (status === 'cancelled') {
        row.find('.btn-success').prop('disabled', false); // '확정' 버튼 활성화
        row.find('.btn-cancel').prop('disabled', true); // '취소' 버튼 비활성화
    }

    // 달력 이벤트 업데이트
    $('#calendar').fullCalendar('refetchEvents');
}