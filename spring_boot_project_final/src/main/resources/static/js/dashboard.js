/**
 *  dashboard.js
 */
 
 $(document).ready(function() {
 
 	var bizCtgId = $('#bizCtgId').val();
 	
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
                data: { "bizCtgId" : bizCtgId },
                dataType: 'json',
                success: function(data) {
                    var events = [];
                    $.each(data, function(i, item) {
	                    var start = moment(item.bizStart, 'HH:mm:ss').format('HH:mm');
	  					var end = moment(item.bizEnd, 'HH:mm:ss').format('HH:mm');
	  					
                        events.push({
                            id: item.resNo,
                            title: '예약 번호: ' + item.resNo + ' (' + item.resStatus 
                          		  + ')\n' + start + '~' + end,
                            start:  moment(item.bizDate).format(), // 타임존 문제 해결
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
        	var currentMonth = view.intervalStart.month(); // view.intervalStart: 현재 뷰
            var today = moment().month(); // moment(): 날짜 및 시간 처리 함수
            
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
            location.reload();
        });
    }
}

function cancelReservation(resNo, bizCtgId) {
    if (confirm("취소하시겠습니까?")) {
        $.post(`/business/cancelReservation/${resNo}?bizCtgId=${bizCtgId}`, function(response) {
            alert("취소되었습니다.");
            location.reload();
        });
    }
}
 