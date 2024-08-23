/**
 * updateMember.js
 */
 
 $(document).ready(function() {
    $('#updateMemForm').on('submit', function(){
        event.preventDefault();	 	
        
        let formData = $(this).serialize();
        
        $.ajax({
	 			type:"post",
	 			url:"/myPage/updateComplete", 
	 			data : formData,
	 			dataType:'text',
	 			success:function(result) {
	 				if(result == "success") {	 					
	 					window.location.href = "/myPage/updateCompleteForm";
	 				} else {
	 					alert("회원 정보 수정에 실패하였습니다. 다시 시도해주세요.");
	 				}
	 			},	 			
	 			error:function() {
	 				alert("실패");
	 			}
	 	});
   
   });
    
    $('#cancelUpdateBtn').on('click', function() {
       location.href = "/member/myPage"; 
    }); 
 });
 