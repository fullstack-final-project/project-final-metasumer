$(document).ready(function() {
    // 수정
        $('.edit-btn').on('click', function() {
        if (confirm('수정하시겠습니까?')) {
            var $row = $(this).closest('tr');
            
            var tagName = $row.find('input[name="tagName"]').val();
            var interestId = $row.find('input[name="interestId"]').val();
            var tagId = $row.find('input[name="tagId"]').val();
            
            $.ajax({
                url: '/admin/updateTag',
                type: 'POST',
                data: {
                    tagName: tagName,
                    interestId: interestId,
                    tagId: tagId
                },
                success: function(response) {
                    if (response === 'success') {
                        alert('수정이 완료되었습니다.');
                    } else {
                        alert('수정 실패');
                    }
                },
                error: function(xhr, status, error) {
                    alert('수정 중 오류가 발생했습니다: ' + error);
                }
            });
        }
    });
    
    
    // 추가 
    $('.add-btn').on('click', function() {
        var newTagName = $('#newTagName').val().trim();
        var interestId = $('#newInterestId').val();

        if (newTagName === '') {
            alert('태그 이름을 입력해 주세요.');
            return;
        }

        $.ajax({
            url: '/admin/insertTag',
            type: 'POST',
            data: {
                tagName: newTagName,
                interestId: interestId
            },
            success: function(response) {
                if (response === 'success') {
                    alert('태그가 추가되었습니다.');
                    location.reload(); 
                } else {
                    alert('추가 실패');
                }
            },
            error: function(xhr, status, error) {
                alert('추가 중 오류가 발생했습니다: ' + error);
            }
        });
    });
});
