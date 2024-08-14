/**
 * businessRegister.js
 */
 
 $(document).ready(function() {
    $("#registerForm").submit(function(event) {
        event.preventDefault();
        
        let formData = new FormData(this);
        
        $.ajax({
            type: "POST",
            url: "/business/register",
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                if (response.status === "success") {
                    alert("업로드 되었습니다.");
                    window.location.href = response.redirectUrl;
                } else {
                    alert("실패했습니다.");
                }
            },
            error: function() {
                alert("실패..");
            }
        });
    });
});