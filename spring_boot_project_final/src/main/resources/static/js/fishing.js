/**
 * fishing.js
 */
 
$(function(){
    // 초기 페이지 : 초보자 가이드(메인), 낚시란?(서브)
    function selectFirstSubCategory() {
        const firstSub = $("#fishingSub ul li:first-child a");
        firstSub.addClass('selectedSub');
    }

    let currentPath = location.pathname;
    let subCategorySelected = false;

    if (currentPath.includes('/fishing/fishingCtgList/1')) {
        $(".fishingBtn[data-category='1']").addClass('selectedItem');
    } else if (currentPath.includes('/fishing/fishingCtgList/2')) {
        $(".fishingBtn[data-category='2']").addClass('selectedItem');
    } else if (currentPath.includes('/fishing/fishingCtgList/3')) {
        $(".fishingBtn[data-category='3']").addClass('selectedItem');
    } else if (currentPath.includes('/fishing/fishingCtgList/4')) {
        $(".fishingBtn[data-category='4']").addClass('selectedItem');
    }

    // 메인 카테고리 버튼 클릭
    $('.fishingBtn').on('click', function() {
        let category = $(this).attr('data-category');

        // btn 클래스 제거
        $('.fishingBtn').removeClass('selectedItem');
        // 추가
        $(this).addClass('selectedItem');

        // 서브 카테고리 클래스 제거(초기화)
        $('#fishingSub a').removeClass('selectedSub');

        // URL 변경 및 페이지 이동
        location.href = '/fishing/fishingCtgList/' + category;
    });
    
    // 서브 카테고리 클릭하면 class 추가
    $('#fishingSub a').on('click', function() {
        $('#fishingSub a').removeClass('selectedSub');
        $(this).addClass('selectedSub');
    });

    // 서브 카테고리가 이미 선택 되었으면 true
    $("#fishingSub a").each(function() {
        if (currentPath.includes($(this).attr('href'))) {
            $(this).addClass('selectedSub');
            subCategorySelected = true;
        }
    });

    // 서브 카테고리가 선택되지 않은 경우 첫 번째 서브 카테고리 선택
    if (!subCategorySelected) {
        selectFirstSubCategory();
    }
    
});