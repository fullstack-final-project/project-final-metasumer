/**
 *  safety.js
 */
 
 $(document).ready(function() {
 	
 	/* (시작) 0. 탭 메뉴 선택 시 각 탭 사이트로 이동 */
 	const safetyCtgItem = document.querySelectorAll('.safetyCtg');
 	
 	safetyCtgItem.forEach( function(item, index) {
		item.addEventListener('click', function() {
			window.location.href = $(this).attr('data-tab');
		});
	});
	/* 0. 탭 메뉴 선택 시 각 탭 사이트로 이동 (끝) */
 
 
 	/* 1. (시작) 상단 위치 카테고리 클릭 시 해당 카테고리에 강조 표시 */
 	const safetyCtgList = document.querySelectorAll('.safetyCtgBar .safetyCtg');
 	
 	safetyCtgList.forEach( function(safetyCtg, index) {
 		safetyCtg.addEventListener('click', function() {
 			event.preventDefault();
 			
 			safetyCtgChange(index + 1);
 		});
 	});
 	/* 1. 상단 위치 카테고리 클릭 시 해당 카테고리에 강조 표시 (끝)  */
 	
 });