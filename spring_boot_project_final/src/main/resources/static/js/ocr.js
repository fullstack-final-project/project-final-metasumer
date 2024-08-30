
 $(function() { 
 	$('#ocrForm').on('submit', function() {
 		event.preventDefault();
 		
 		let formData = new FormData($('#ocrForm')[0]);
 		
 		// 업로드된 파일명 알아오기
 		let fileName = $('#uploadFile').val().split("\\").pop();
 		
 			$.ajax({
	 			type:"post",
	 			url:"/memberOcr/ocr",
	 			enctype:"multipart/form-data",
 				processData:false,
 				contentType:false,
 				data : formData, 
	 			success:function(result){
    
    			let lines = result.split('\n');
    
                $('#businessName').val(getFieldValue(lines, '업체명'));
                $('#bizRegNumber').val(getFieldValue(lines, '등록번호'));
                $('#delegate').val(getFieldValue(lines, '대표자'));
                $('#businessAddress').val(getFieldValue(lines, '사업장소재지'));
                $('#businessCategory').val(getFieldValue(lines, '업태'));
                $('#issueDate').val(getFieldValue(lines, '발행일'));


                $('#imageBox').empty();
                $('#imageBox').append('<img src="/ocr_image/' + fileName + '" class="ocrImage">');
                
                $('#bizRegImg').val(fileName);
                
            },
            error: function() {
                alert("실패");
            }
        });
    });
    
        
     $('#businessAuthForm').on('submit', function(event) {
        event.preventDefault();

        let memId = $('input[name="memId"]').val();

        $.ajax({
            type: "post",
            url: "/memberOcr/checkMemId",
            data: { memId: memId },
            success: function(response) {
                if (response === 'success') {
                    validateAndSubmitForm();
                } else {
                    alert('검토 중인 아이디가 있습니다. 신청할 수 없습니다.');
                    resetForm();
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX Error: ", status, error);
                alert('서버 오류가 발생했습니다.');
            }
        });
    });

    function validateAndSubmitForm() {
        const radioButtons = document.getElementsByName('businessType');
        let isChecked = false;

        for (const radioButton of radioButtons) {
            if (radioButton.checked) {
                isChecked = true;
                break;
            }
        }

        let bizRegImg = $('#bizRegImg').val();
        if (bizRegImg === '') {
            alert('사업자 등록증 이미지를 첨부해 주세요.');
            return;
        }

        if (!isChecked) {
            alert('업태를 선택해 주세요.');
            return;
        }

        $('#businessAuthForm').off('submit').submit();
        alert('신청이 완료되었습니다.');
    }
    
    function resetForm() {
        $('#businessAuthForm')[0].reset();
        $('#imageBox').empty();
        $('#bizRegImg').val('');
    }
});

// 필드 값을 추출
function getFieldValue(lines, fieldName) {
    for (let line of lines) {
        if (line.includes(fieldName)) {
            return line.replace(fieldName + ':', '').trim();
        }
    }
    return '';
}