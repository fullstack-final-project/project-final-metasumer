/**
 * 
 */
 
$(function() {
    // 초기값 설정
    let currentPage = 1; // 현재 페이지
    let totalPages = 1; // 총 페이지 수 
    const recordsPerPage = 4; // 페이지 당 나타낼 물고기 기록 수

    function fetchPageData(page) {
        $.ajax({
            url: '/member/myPageCountData', // Controller의 요청 경로
            method: 'get',
            data: { page: page },
            dataType: 'json',
            success: function(data) {
                const container = $('.fish-container');
                // 기존 물고기 기록 비우기
                container.empty(); 

                // 물고기 기록(item) 표시
                data.mfList.forEach(mf => {
                    const item = $('<div class="fish-item"></div>');
                    item.html(`
                        <div class="date">${formatDate(mf.createdDate)}</div>
                        <img src="${mf.uploadImage ? '/project_images/' + mf.uploadImage : '/project_images/noImage.png'}" width="100%" height="200"><br>
                        <div class="fish-title">${mf.title}</div>
                        <div class="fish-nickname">${mf.memNickname}</div>
                    `);
                    
                    // 상세 페이지 이동
                    item.on('click', function() {
                        location.href = `/myFishRecords/detailViewmyFishRecords/${mf.recordNo}`;
                    });
                    
                    // item 추가
                    container.append(item);
                });

                // 페이지 수 업데이트
                currentPage = data.currentPage;
                totalPages = data.totalPages;
                // 버튼 업데이트
                updatePageControls();
            },
            error: function() {
                alert("실패");
            }
        });
    }

    // 페이지 별 버튼
    function updatePageControls() {
        // 페이지 초과 시 disable
        $('#prevButton').prop('disabled', currentPage <= 1);
        $('#nextButton').prop('disabled', currentPage >= totalPages);
        // 처음과 마지막 페이지 0.5
        $('#prevButton').css('opacity', currentPage <= 1 ? 0.5 : 1);
        $('#nextButton').css('opacity', currentPage >= totalPages ? 0.5 : 1);
    }

    $('#prevButton').on('click', function() {
        if (currentPage > 1) {
            fetchPageData(currentPage - 1);
        }
    });

    $('#nextButton').on('click', function() {
        if (currentPage < totalPages) {
            fetchPageData(currentPage + 1);
        }
    });

    // 날짜 포맷 함수
    function formatDate(dateString) {
        const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
        return new Date(dateString).toLocaleDateString(undefined, options);
    }

    // 페이지 로드 시 초기 데이터 로드
    fetchPageData(currentPage);
});

