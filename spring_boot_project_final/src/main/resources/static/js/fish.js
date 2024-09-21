/**
 * fish.js
 */
 
$(function(){
    // 초기 페이지 : ALL
    let currentPath = location.pathname;

    if (currentPath === '/fish') {
        $(".fishBtn[data-category='all']").addClass('selectedItem');
    } else if (currentPath.includes('/fish/fishCtgList/1')) {
        $(".fishBtn[data-category='1']").addClass('selectedItem');
    } else if (currentPath.includes('/fish/fishCtgList/2')) {
        $(".fishBtn[data-category='2']").addClass('selectedItem');
    } else if (currentPath.includes('/fish/fishCtgList/3')) {
        $(".fishBtn[data-category='3']").addClass('selectedItem');
    } else if (currentPath.includes('/fish/fishCtgList/4')) {
        $(".fishBtn[data-category='4']").addClass('selectedItem');
    }
    
    // 버튼 클릭 시 이벤트 처리
    $('.fishBtn').on('click', function() {
        let category = $(this).attr('data-category');

        // btn 클래스 제거
        $('.fishBtn').removeClass('selectedItem');
        // 추가
        $(this).addClass('selectedItem');            
               
        // URL 변경
        if (category === 'all') {
            location.href = '/fish';
        } else {
            location.href = '/fish/fishCtgList/' + category;
        }       
    });
    
    // search 폼 제출 시
    $('.fishSearch').on('submit', function() {
        event.preventDefault();
        
        let searchText = $('.searchText').val();
        //let formData = $(this).serialize();
        //let keyword = $('.searchText').val();
        //let type = $('#type').val();
        
        $.ajax({
            type:'get',
            url:'/fish/fishSearch',
            data:{ 
                "keyword":searchText, 
                "type":'fishName'
            },
            success:function(result) {                           
                updateFishList(result);                                                      
            },
            error:function() {
                alert('실패');
            }
        });
    });  
    
    function updateFishList(fishList) {
        let fishBox = $('.fishBox');
        fishBox.empty(); // 비우기
        
        let pagination = $('.pagination');

        if(fishList == ""){
            fishBox.append('<p id="emptyFishMsg">일치하는 항목이 없습니다.</p>');
            pagination.hide();
        }else{
            fishList.forEach(function(fish) {
                let fishInfo = `
                    <div id="fish" data-category="${fish.fishCtgId}">
                        <div id="fishDetail">
                            <div>
                                <a href="/fish/detailViewFish/${fish.fishNo}">
                                    <img src="/project_images/어종/${fish.fishImg}">
                                </a>
                            </div>
                            <p id="fishName">${fish.fishName}</p>
                        </div>
                    </div>`;
                pagination.hide();
                fishBox.append(fishInfo); // 정보 넣어주기
            });
        }
    }
    
    // 페이지 이동
    $('.pagination a').on('click', function(e) {
         e.preventDefault();
       
         let page = $(this).text();
         
         location.href = '/fish?page=' + page;
    });
});