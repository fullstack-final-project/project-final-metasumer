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

 });