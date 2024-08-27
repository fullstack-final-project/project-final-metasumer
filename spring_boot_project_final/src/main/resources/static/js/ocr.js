
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
        const radioButtons = document.getElementsByName('businessType');
        let isChecked = false;

        for (const radioButton of radioButtons) {
            if (radioButton.checked) {
                isChecked = true;
                break;
            }
        }

        if (!isChecked) {
            alert('업태를 선택해 주세요.');
            event.preventDefault();
        } else {
            // 업태가 선택되었을 때
            alert('신청이 완료되었습니다.');
        }
        
    });
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