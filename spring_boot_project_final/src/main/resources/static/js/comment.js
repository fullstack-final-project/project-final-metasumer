/**
 * 		comment.js
 */

$(document).ready(function() {
    loadComments();
});


function confirmDelete() {
	    if (confirm("정말로 삭제하시겠습니까?")) {
	        document.getElementById('deleteForm').submit();
	    }
}


function addComment() {

	// 텍스트 영역의 값 가져오기
	let content = $('#commentContent').val().trim();
	    
    // 값이 비어있는지 확인
    if (content === '') {
        alert('댓글 내용을 입력하세요.');
        return; // 함수 종료
    }
    

    $.ajax({
        type: 'POST',
        url: '/board/addComment',
        data: $('#commentForm').serialize(),
        dataType: 'json', 
        success: function(response) {
            if (response.status === "success") {
                $('#commentForm')[0].reset();
                loadComments();
                
            } else {
                alert("댓글 실패");
            }
        },
        error: function() {
            alert("댓글 연결 실패");
        }
    });
}

function loadComments() {
    let recordNo = $('input[name="recordNo"]').val();
    let currentUserId = $('input[name="sid"]').val();
    
    $.getJSON('/board/getComments/' + recordNo, function(data) {
        let commentHtml = '';
        $.each(data, function(index, comment) {
            commentHtml += '<div class="comment">';
            commentHtml += '<div id="commentBox' + comment.commentNo + '">';
            commentHtml += '<strong>' + comment.memNickname + ':</strong> ' + comment.content + '&nbsp;&nbsp;';

            if (comment.memId === currentUserId) {
                commentHtml += '<button class="btn" type="button" onclick="showEditForm(' + comment.commentNo + ')">수정</button>';
                commentHtml += '<button class="btn" type="button" onclick="deleteComment(' + comment.commentNo + ')">삭제</button>';
            }
            commentHtml += '</div>';
            commentHtml += '<div id="editComment' + comment.commentNo + '" style="display:none;">';
            commentHtml += '<textarea id="editContent' + comment.commentNo + '">' + comment.content + '</textarea>';
            commentHtml += '<button class="btn" type="button" onclick="saveComment(' + comment.commentNo + ')">저장</button>';
            commentHtml += '<button class="btn" type="button" onclick="cancelEdit(' + comment.commentNo + ')">취소</button>';
            commentHtml += '</div>';
            
            commentHtml += '<p><small>' + new Date(comment.createdDate).toLocaleString() + '</small></p>';
            commentHtml += '</div>';
        });
        $('#commentList').html(commentHtml);
    });
}

// 댓글 수정 폼 표시
function showEditForm(commentNo) {
    $('#commentBox' + commentNo).hide();
    $('#editComment' + commentNo).show();
}

// 댓글 수정 저장
function saveComment(commentNo) {
    var content = document.getElementById('editContent' + commentNo).value;
    var recordNo = $('input[name="recordNo"]').val();

 $.ajax({
        url: '/board/updateComment',
        type: 'POST',
        data: {
            commentNo: commentNo,
            recordNo: recordNo,
            content: content
        },
        success: function(response) {
            if (response.status === "success") {
                loadComments();
            } else {
                alert("댓글 수정 실패: " + response.message);
            }
        },
        error: function() {
            alert('댓글 수정에 실패했습니다.');
        }
    });
}

// 댓글 수정 취소
function cancelEdit(commentNo) {
    $('#commentBox' + commentNo).show();
    $('#editComment' + commentNo).hide();
}

// 댓글 삭제
function deleteComment(commentNo) {
    var recordNo = $('input[name="recordNo"]').val();

    if (confirm("정말로 삭제하시겠습니까?")) {
        $.ajax({
            url: '/board/deleteComment',
            type: 'DELETE',
            data: {
                commentNo: commentNo,
                recordNo: recordNo
            },
            success: function() {
                loadComments();
                alert('댓글이 삭제되었습니다.');
            },
            error: function(xhr, status, error) {
                console.error('댓글 삭제 실패:', error);
                alert('댓글 삭제에 실패했습니다.');
            }
        });
    }
} 