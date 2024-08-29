/**
 * 	login.js
 */
  $(document).ready(function() {
  	$('#loginForm').on('submit', function(){
  	event.preventDefault();
	 	$.ajax({
	 			type:"post",
	 			url:"/member/login", 
	 			data : {"id":$('#id').val(),
	 						"pwd": $('#pwd').val()},
	 			dataType:'text',
	 			success:function(result) {
	 				 if (result === "inactive") {
				            alert("현재 계정이 비활성화되어 있습니다. 고객센터에 연락하셔서 지원을 받으시기 바랍니다.");
				     } else if (result === "success") {
	 						alert("로그인 성공");
	 					window.location.href = "/";
	 				 } else {
	 					alert("아이디 또는 비밀번호가 일치하지 않습니다");
	 					id.value = '';
	 					pwd.value = '';
            			id.focus();
	 				}
	 			},
	 			
	 			error:function() {
	 				alert("실패");
	 			}
	 		});
 		});
});