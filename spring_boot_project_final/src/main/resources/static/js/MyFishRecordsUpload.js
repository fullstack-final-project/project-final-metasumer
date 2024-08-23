/**
 * MyFishRecordsUpload.js
 */

$(document).ready(function(){

    hideDeleteButton();

	$("#uploadMyFishRecordsForm").submit(function(event) {
	    event.preventDefault();
	    
	    let formData = new FormData(this);

        let fishSize = $("#fishSize").val();
        if (fishSize) {
            formData.set("fishSize", `${fishSize}cm`);
        }
	    
	    $.ajax({
	        type: "post",
	        url: "/myFishRecords/insertMyFishRecords",
	        data: formData,
	        processData: false,
	        contentType: false,
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

// 이미지 미리보기
function previewImage(event) {
    var input = event.target;
    var file = input.files[0];
    
    if (file) {
        var reader = new FileReader();
        reader.onload = function() {
            var img = document.createElement("img");
            img.src = reader.result;
            img.style.maxWidth = "300px";
            
            var imageBox = document.getElementById("imageBox");
            imageBox.innerHTML = "";
            imageBox.appendChild(img);
            
            showDeleteButton();
        };
        reader.readAsDataURL(file);
    }
}

// 이미지 값 삭제
function deleteImage() {
	event.preventDefault();
    var imageBox = document.getElementById("imageBox");
    imageBox.innerHTML = "";
    
    hideDeleteButton();
    
    var fileInput = document.getElementById("uploadImage");
    fileInput.value = "";
}

// 삭제 버튼 표시
function showDeleteButton() {
    var deleteButton = document.getElementById("deleteButton");
    deleteButton.style.display = "block";
}

// 삭제 버튼 숨기기
function hideDeleteButton() {
    var deleteButton = document.getElementById("deleteButton");
    deleteButton.style.display = "none";
}
