/**
 * chatbot.js
 */ 
 
$(function() { 

	callChatbot(); // 챗봇 모달창 열리고 바로 웰컴 메시지 띄우기
	
	/* (시작) 1. 음성 녹음 */
	const recordBtn = document.getElementById("recordBtn");
  	const stopBtn = document.getElementById("stopBtn");
  	
  	if(navigator.mediaDevices) {
  		var constraints = {
  			audio:true
  		};
  		
  		let chunks = []; // 녹음 데이터 저장하기 위한 변수
  		
  		navigator.mediaDevices.getUserMedia(constraints)
  			.then(stream => {
  				const mediaRecorder = new MediaRecorder(stream);
  				
  				// [녹음] 버튼 눌렀을 때
  				recordBtn.onclick = () => {  
  					mediaRecorder.start(); // 녹음 시작
  					recordBtn.style.background = "red"; // [녹음] 버튼 배경색
  					recordBtn.style.color = "black";
  				}
  				// [완료] 버튼 눌렀을 때
  				stopBtn.onclick = () => {
  					mediaRecorder.stop(); // 녹음 정지
  					recordBtn.style.background = ""; // [녹음] 버튼 배경색 설정한 것 삭제
  					recordBtn.style.color = "";
  				}
  				
  				// chunks에 저장된 녹음 데이터를 audio 양식으로 설정
  				// blob : 녹음 데이터
  				mediaRecorder.onstop = e => {
  					const blob = new Blob(chunks, {
  						'type':'audio/mp3 codecs=opus'
  					});
  				
  					chunks = []; // 초기화 : 초기화하지 않으면 녹음 내용이 누적됨
  				
					// 녹음 내용을 파일로 저장 시 파일명 랜덤 생성
					let rNum = new Date(); // 날짜를 getTime() 사용해서 숫자로 변환해서 사용
					const fileName = rNum.getTime() + "_voiceMsg"; // 파일 이름
				
					// 파일 업로드 하는 함수 호출
					fileUploadFn(blob, fileName); // 음성 데이터, 파일명 전달
		  				
  				}// mediaRcorder.onstop 끝
  			  
  			  // 녹음 시작시킨 상태가 되면 chunks에 녹음 데이터 저장
  			  mediaRecorder.ondataavailable = e => {
  			  		chunks.push(e.data);
  			  };
  			  
		  }).catch(err => {
		  		console.log("오류 발생 : " + err);
		  });
  	} 
	/* 1. 음성 녹음 (끝) */
	
	
	
	/* (시작) 2. 서버에 음성 파일 업로드 */
	function fileUploadFn(blob, fileName) {
	   	// 음성 파일을 폼에 추가
	   	let formData = new FormData();
	   	formData.append('uploadFile', blob, fileName + ".mp3");
	   	// name, 데이터, 파일명
	   	
	   	//녹음된 mp3 파일을 STT에게 전송하고 텍스트 받음 -> chatBox에 출력 -> 챗봇에게 전달
	   	$.ajax({
	 			type:"post",
	 			url:"/stt", 
	 			enctype:"multipart/form-data",
	 			processData:false,
	 			contentType:false,
	 			data : formData, 
	 			success:function(result) {
	 				// chatBox에 받은 메시지 추가
	 				$('#chatBox').append('<div class="msgBox send"><span id="in"><br><span>' +
 											result + '</span></span></div><br>');
 											
 					 // <input> 태그의 값을 받은 텍스트로 설정
 					 $('#message').val(result);
 					 // 챗봇 호출하면서 질문 전달
 					 callChatbot();
 					 
 					 $('#message').val().focus();
	 			},
	 			error:function() {
	 				alert("실패");
	 			}
	 		});
	}
	/* 2. 서버에 음성 파일 업로드 (끝) */
	
	
	
	/* (시작) 3. 챗봇 메시지 작성 -> 서버에서 답변 받아옴 */
 	$('#chatForm').on('submit', function() {
 		event.preventDefault();
 		
 		// 입력 내용 유효성 확인
 		if($('#message').val() == "") {
 			alert("질문을 입력하세요");
 			$('#message').focus();
 			return false;
 		}
 		
 		// (1) chatBox에 보낸 메시지 추가
 		$('#chatBox').append('<div class="msgBox send"><span id="in"><span>' +
 											$('#message').val() + '</span></span></div><br>');	
 		 		
		callChatbot();
		
		$('#message').val().focus();
		 	
	});	// chatForm 끝	
	
	function callChatbot() {
		$.ajax({
		 			type:"post",
		 			url:"/chatbot",		 			
					data:{"message": $('#message').val()}, 
		 			success:function(result){
		 				//$('#chatBox').text(result); 
		 				// (2) 수신한 메시지를 chatBox에 추가 
		 				$('#chatBox').append('<div class="msgBox receive"><span id="in"><span>' + result + '</span></span></div><br>');
		 				
		 				// (3) 스크롤 올리기
		 				$('#chatBox').scrollTop($('#chatBox').prop("scrollHeight")); 
		 				
		 				// 입력값 지우고 포커스
		 				$('#message').val("").focus();
					},
		 			error:function(){
		 				alert("실패");
		 			}
		 }); // ajax 끝
	} 
	/* 3. 챗봇 메시지 작성 -> 서버에서 답변 받아옴 (끝) */
});