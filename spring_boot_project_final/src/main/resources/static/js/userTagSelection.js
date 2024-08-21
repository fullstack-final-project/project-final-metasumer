$(document).ready(function() {
    $('#submitBtn').click(function() {
        var selectedTags = [];
        $('input[name="tags"]:checked').each(function() {
            selectedTags.push($(this).val());
        });

        var memId = $('input[name="memId"]').val();

        $.ajax({
            type: 'POST',
            url: '/member/submitInterest',
            contentType: 'application/json',
            data: JSON.stringify({	// json 변환
                memId: memId,
                tags: selectedTags
            }),
            success: function(response) {
                window.location.href = response.redirectUrl;
            },
            error: function(xhr, status, error) {
                console.log("XHR Response Text: ", xhr.responseText); // 응답 본문 로그
                console.log("XHR Status: ", xhr.status); // 상태 코드 로그
                alert('저장 실패: ' + error);
            }
        });
    });
});
