/**
 * orderList.js
 */
 
 $(document).ready(function () {
 

            // 기간 필터 버튼 클릭 시 이벤트 처리
            $("#orderFilter button").click(function () {
                var period = $(this).data("period");

                $.ajax({
                    url: "/myPage/orderList",
                    type: 'GET',
                    data: { period: period },
                    success: function (data) {
                        // 서버에서 반환된 데이터를 orderListView div에 로드합니다.
                        $("#orderListView").html(data);
                    },
                    error: function () {
                        alert("주문 내역을 불러오는 데 실패했습니다.");
                    }
                });
            });
 });
 
 