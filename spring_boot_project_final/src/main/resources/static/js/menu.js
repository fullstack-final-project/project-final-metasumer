/**
 * menu.js
 	: top.jsp + bottom.jsp
 */
 
 $(function() {
 	
 	// 윈도우 화면 스크롤 시 메인 메뉴 고정
 	$(window).on('scroll', function() { 
 		if($(document).scrollTop() >= $('#headerBox').height()) { 
 			$('#headerBox').addClass('mainMenuFixed mainMenuShadow');
 		} else {
 			$('#headerBox').removeClass('mainMenuFixed mainMenuShadow');
 		}	
 	});
 	
 	// nav 메인 메뉴바 클릭 시 하단 서브 메뉴 노출
	const menuCtg = document.querySelectorAll('.menuCtgCheck');
	const subMenu = document.querySelectorAll('.subMainMenu')
	const ACTIVE = "active"
	
	menuCtg.forEach(function(menuCtgs){
	    menuCtgs.addEventListener("click",function(){
	
	        subMenu.forEach(function(subMenus){
	            subMenus.classList.remove(ACTIVE);
	        })
	        menuCtg.forEach(function(menuCtgs){
	            menuCtgs.classList.remove(ACTIVE);
	        });
	        menuCtgs.classList.add(ACTIVE);
	    })
	    menuCtgs.classList.remove(ACTIVE);
	});

	// 윈도우 스크롤 중 특정 위치 이상 내려가면 top 버튼 노출
	$(window).scroll(function(){
		if ($(this).scrollTop() > 500){
			$('#topBtn').show();
		} else{
			$('#topBtn').hide();
		}
	});
	
	// top 버튼 클릭 시 사이트 맨 위로 이동
	$('#topBtn').click(function(){
		$('html, body').animate({scrollTop:0},400);
		return false;
	});
	
	// chatbot 버튼(우하단 로봇 그림) 클릭 시 모달창 띄우기
	function modal(id) {
	    var zIndex = 9999;
	    var modal = $('#' + id);
	    modal.removeClass('noshow'); // 모달창 등장!
	
	    // 모달 div 뒤에 희끄무레한 레이어
	    var bg = $('<div>')
	        .css({
	            position: 'fixed',
	            zIndex: zIndex,
	            left: '0px',
	            top: '0px',
	            width: '100%',
	            height: '100%',
	            overflow: 'auto',
	            backgroundColor: 'rgba(0,0,0,0.4)'
	        })
	        .appendTo('body');
	
	    modal
	        .css({
	            position: 'fixed',
	            display: 'flex',
	            border: 'none',
	            // 회색 레이어 보다 한칸 위에 보이기
	            zIndex: zIndex + 1,

				// 위치 고정시키기
	            bottom: '25px',
	            right: '10px',
	        })
	        .show()
	        
	        // 닫기 버튼 처리, 회색 레이어와 모달창 div 지우기
	        .find('.modal_close_btn')
	        .on('click', function() {
	            bg.remove();
	            modal.hide();
	        });
	        
	}
	
	$('#chatbotBox').on('click', function() {
	    // 모달창 띄우기
	    modal('my_modal');
	});

 });