function UploadOnChangeForButton(event, interestId) {
    const file = event.target.files[0];
    if (file) {
        const formData = new FormData();
        formData.append('file', file);
        formData.append('interestId', interestId);

        $.ajax({
            type: "post",
            url: "/admin/tagUploadImage",
            enctype: "multipart/form-data",
            processData: false,
            contentType: false,
            data: formData,
            success: function(result) {
                if (result === "success") {
                    alert('이미지가 성공적으로 업로드되었습니다.');
                    location.reload();
                } else {
                    alert("파일 업로드에 실패했습니다.");
                }
            },
            error: function(xhr, status, error) {
                console.error("파일 업로드 중 오류 발생:", error);
                alert("서버 오류가 발생했습니다.");
            }
        });
    } else {
        alert('파일을 선택하지 않았습니다.');
    }
}