/**
 * checkPwd.js
 */
 
 $(document).ready(function() {
   pwd.focus();
   let memId = $('#userInfo').data('memid');
   
   $('#pwdCheckForm').on('submit', function(){
        event.preventDefault();
	 	$.ajax({
	 			type:"post",
	 			url:"/myPage/checkPwd", 
	 			data : { "id": memId,
	 			         "pwd": $('#pwd').val()},
	 			dataType:'text',
	 			success:function(result) {
	 				if(result == "success") {	 					
	 					window.location.href = "/myPage/updateMemberForm";
	 				} else {
	 					alert("비밀번호가 일치하지 않습니다");	 					
	 					pwd.value = '';
            			pwd.focus();
	 				}
	 			},	 			
	 			error:function() {
	 				alert("실패");
	 			}
	 		});
   
   });
   
    // 취소 버튼 눌렀을 때
    $('#cancelChkBtn').on('click', function() {
       location.href = "/member/myPage"; 
    });    
 });