/**
 * dashboard.js
 */

$(document).ready(function() {

    var bizCtgId = $('#bizCtgId').val();
    
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
                url: '/business/listReservationByCategory',
                data: { "bizCtgId": bizCtgId },
                dataType: 'json',
                success: function(data) {
                    var events = [];
                    $.each(data, function(i, item) {
                        var start = moment(item.bizStart, 'HH:mm:ss').format('HH:mm');
                        var end = moment(item.bizEnd, 'HH:mm:ss').format('HH:mm');
                        
                        events.push({
                            id: item.resNo,
                            title: '예약 번호: ' + item.resNo + ' (' + item.resStatus + ')\n' + start + '~' + end,
                            start: moment(item.bizDate).format(),
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

function confirmReservation(resNo, bizCtgId) {
    if (confirm("예약을 확정하시겠습니까?")) {
        $.post(`/business/confirmReservation/${resNo}?bizCtgId=${bizCtgId}`, function(response) {
            alert("확정되었습니다.");
            $('#calendar').fullCalendar('refetchEvents'); // 예약 확정 후 달력 이벤트 새로고침
        });
    }
}

function cancelReservation(resNo, bizCtgId) {
    if (confirm("취소하시겠습니까?")) {
        $.post(`/business/cancelReservation/${resNo}?bizCtgId=${bizCtgId}`, function(response) {
            alert("취소되었습니다.");
            $('#calendar').fullCalendar('refetchEvents'); // 예약 취소 후 달력 이벤트 새로고침
        });
    }
}