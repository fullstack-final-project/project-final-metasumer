/**
 * insertProduct.js
 */
 
 $(document).ready(function() {
    $("#insertForm").submit(function(event) {
        event.preventDefault();
        
        let formData = new FormData(this);
        
        $.ajax({
            type: "POST",
            url: "/product/insertProduct",
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                if (response.status === "success") {
                    alert("등록이 완료되었습니다.");
                    window.location.href = response.redirectUrl;
                } else {
                    alert("등록에 실패했습니다.");
                }
            },
            error: function() {
                alert("서버 오류가 발생했습니다.");
            }
        });
    });
});