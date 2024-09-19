/**
 * prdNoCheck.js
 */
 
 $(document).ready(function() {
 	// prdNoCheckBtn 버튼 클릭했을 때
 	$('#prdNoCheckBtn').on('click', function() {
 		event.preventDefault();
 		
 		let prdNo = $('#prdNo').val();
 		
 		if(prdNo == "") {
 			alert("도서번호를 입력하세요");
 			return false;
 		} else { 		
	 		$.ajax({
	 			type:"post",
	 			url:"/product/prdNoCheck", 
	 			data : {"prdNo": prdNo},
	 			dataType:'text',
	 			success:function(result) {
	 				if(result == "available") {
	 					alert("사용 가능한 번호입니다");
	 				} else {
	 					alert("사용할 수 없는 번호입니다.");
	 				}
	 			},
	 			error:function() {
	 				alert("실패");
	 			}
	 		});
 		
 		} // else 끝
 	
 	}); // click 끝
 
 });