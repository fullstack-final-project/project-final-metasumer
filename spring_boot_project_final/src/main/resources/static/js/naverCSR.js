/**
 *  naverCSR.js
 *	 : STT, TTS 적용
 */
 
 $(function() {
 	$('#sttForm').on('submit', function() {
 		event.preventDefault();
 		
 		let formData = new FormData($('#sttForm')[0]);
 		let fileName = $('#uploadFile').val().split("\\").pop();
 		
 		$.ajax({
 			type: "post",
 			url: "/stt",
 			enctype: "multipart/form-data",
 			processData: false,
 			contentType: false,
 			data: formData,
 			success: function(result) {
 				$('#resultBox').text(result);
 				$('#audioBox').empty();
 				$('#audioBox').append('<audio src="/stt_audio/' + fileName + '" controls></audio>');
 			},
 			error: function() {
 				alert("서버 통신에 오류가 발생했습니다.");
 			}
 		});
 	
 	});
 
 });