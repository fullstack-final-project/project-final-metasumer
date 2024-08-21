/**
 * fishSuccess.js
 */

 $(document).ready(function() {
    $("#successForm").submit(function(e) {
        e.preventDefault(); 
        
        // 선택된 값들 가져오기
        let fishName = $("#fishSuccessName").val();
        let tide = $("input[name='tide']:checked").val();
        let location = $("input[name='location']:checked").val();
        let weather = $("input[name='weather']:checked").val();
        let skill = $("input[name='skill']:checked").val();
        let fortune = $("input[name='fortune']:checked").val();
         
        $.ajax({
            url: '/myPage/successCalc', 
            type: 'post',
            data: $(this).serialize(), 
            success: function(response) {
                // 결과 테이블 삽입
                let fishingResTable = `
                    <table id="fishingResTable">
                      <tr>
                        <th>${response}%</th>
                          <td>
			                <ul>
			                  <li><b>잡으려는 어종 : </b>\u00A0${fishName}</li>
			                  <li><b>현재 위치 물때 : </b>\u00A0${tide}</li>
			                  <li><b>현재 위치 : </b>\u00A0${location}</li>
			                  <li><b>오늘의 날씨 : </b>\u00A0${weather}</li>
			                  <li><b>나의 낚시 수준 : </b>\u00A0${skill}</li>
			                  <li><b>오늘의 운세 : </b>\u00A0${fortune}</li>
                            </ul>
                          </td>
                        </tr>
                    </table>
                `;
                $("#resultSuccessTable").html(fishingResTable);
            },
            error: function() {
                alert("낚시 성공률 계산 실패");
            }
        });
    });
    
    // 초기화 버튼 눌렀을 때
    $('#cancelBtn').on('click', function() {
        $('#resultSuccessTable').hide(); 
    });

    // 확인 버튼 눌렀을 때
    $('#submitBtn').on('click', function() {
        $('#resultSuccessTable').show(); 
    });
});