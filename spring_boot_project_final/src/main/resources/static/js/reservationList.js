/**
 * orderList.js
 */
 
 $(document).ready(function(){
    // 3개월 주문내역이 default로 나오도록
    $.ajax({
        url: '/myPage/reservation',
        type: 'get',
        data: {period: '3m'},
        success: function(data) {
            let periodList = $(data).find('#resListView').html(); // orderListView 추출
                
            $('#resListView').html(periodList); // 추출한 데이터로 변경(덮어쓰기)
        },
        error: function() {
            alert('실패');
        }
    });
    
    // 필터링 버튼 눌렀을때
    $('button[data-period]').click(function(){
        let period = $(this).data('period');
        
        // 모든 버튼에서 active 제거
        $('button[data-period]').removeClass('active');
        // 클릭된 버튼에 active 추가
        $(this).addClass('active');
        
        $.ajax({
            url: '/myPage/reservation',
            type: 'get',
            data: {period: period},
            success: function(data) {
                let periodList = $(data).find('#resListView').html(); // resListView 추출
                
                $('#resListView').html(periodList); // 추출한 데이터로 변경(덮어쓰기)
            },
            error: function() {
                 alert('실패');
             }
        });
    });
});

 
 