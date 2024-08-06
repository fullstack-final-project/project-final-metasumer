/**
 * uploadFile.js
 */

$(document).ready(function(){
    $('#uploadFileForm').on('submit', function(event) {
        event.preventDefault();
        
        let formData = new FormData($('#uploadFileForm')[0]);
        
        $.ajax({
            type: "post",
            url: "/freeboard/insertFreeBoard",
            processData: false,
            contentType: false,
            data: formData,
            success: function(response) {
                if (response.status === "success") {
                    alert("성공!!!!!");
                    window.location.href = response.redirectUrl;
                } else {
                    alert("파일 업로드 또는 게시글 등록에 실패했습니다.");
                }
            },
            error: function() {
                alert("서버와의 통신에 실패했습니다.");
            }
        });
    });
});

