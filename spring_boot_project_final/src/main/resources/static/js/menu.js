/**
 * menu.js
 	: top.jsp + bottom.jsp
 */
 
 $(function() {
 	
 	// 윈도우 화면 스크롤 시 메인 메뉴 고정
 	$(window).on('scroll', function() {
 		if($(document).scrollTop() >= $('#headerBox').height()) {
 			$('mainMenuBox').addClass('mainMenuFixed mainMenuShadow');
 		} else {
 			$('mainMenuBox').removeClass('mainMenuFixed mainMenuShadow');
 		}	
 	});
 	
 	// nav 메인 메뉴바 hover 시 하단 서브 메뉴 노출
	$('.mainMenuList').hover(
		function() {
			$('.subMainMenu').css('display', 'block');
		},
		function() {
			$(this).on('click', function() {
				$('.subMainMenu').css('display', 'none');
			});
		}
	);


 });//  $(function() { }) 끝