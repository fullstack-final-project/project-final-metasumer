/**
 * checkPwd.js
 */
 
 $(document).ready(function() {
   pwd.focus();
   let memId = $('#userInfo').data('memid');
   
   // URL에서 actionType 가져오기 위한 함수
   function getParameterByName(name) {
       let url = new URL(window.location.href);
       return url.searchParams.get(name);
   }

   let actionType = getParameterByName('actionType'); // actionType 설정 
   
   $('#pwdCheckForm').on('submit', function(){
        event.preventDefault();
	 	$.ajax({
	 			type:"post",
	 			url:"/myPage/checkPwd", 
	 			data : { "id": memId,
	 			         "pwd": $('#pwd').val(),
	 			         "actionType": actionType},
	 			dataType:'text',
	 			success:function(result) {
	 				if(result == "success") {	 					
	 					if (actionType == 'updateInfo') {
                            window.location.href = "/myPage/updateMemberForm";
                        } else if (actionType == 'changePwd') {
                            window.location.href = "/myPage/changePwdForm";
                        }	 			
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