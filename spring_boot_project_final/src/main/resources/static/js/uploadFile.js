$(document).ready(function(){
    $('#uploadFile').on('change', function() {
        toggleDeleteButton();
    });

    $('#deleteButton').on('click', function() {
        $('#uploadFile').val(''); 
        toggleDeleteButton();
        return false;
    });

    $('#uploadFileForm').on('submit', function(event) {
        event.preventDefault();

        let formData = new FormData(this);

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

// 삭제 버튼 표시 및 숨김 함수
function toggleDeleteButton() {
    let fileInput = document.getElementById('uploadFile');
    let deleteButton = document.getElementById('deleteButton');

    if (fileInput.files.length > 0) {
        $(deleteButton).show();
    } else {
        $(deleteButton).hide();
    }
}
