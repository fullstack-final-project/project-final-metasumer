$(document).ready(function() {
    $('.delete-button').on('click', function() {
        $(this).closest('li').remove();
    });

    $('#editBtn').on('click', function() {
        $(this).hide();
        $('#cancelBtn').hide();
        $('#doneBtn').show();
        $('#addBtn').show();
        $('.delete-button').show();
    });

    $('#doneBtn').hide();
    
   $('#addBtn').click(function() {
   	let memId = $('#memId').val();
    window.open("/member/newSelectedTags/" + memId, 'newWindow', 'width=800,height=600');
	});
	
	
	
	
	 $("#doneBtn").on("click", function() {
	 	$(this).hide();
        $('#editBtn').show();
        $('#addBtn').hide();
        $('.delete-button').hide();
	 
	 
        let userTags = [];
        
	    $("#userTagList .userItem").each(function() {
	        var tagId = $(this).data('tag-id');
	        userTags.push(tagId);
	    });
	
	    let additionalTags = [];
	    $("#tagsContainer .userNewItem").each(function() {
	        var tagId = $(this).data('tag-id');
	        additionalTags.push(tagId);
	    });

        console.log("userTags:", userTags);
        console.log("additionalTags:", additionalTags);
        
        let memId = $('#memId').val();
        
         $.ajax({
            url: '/member/tagsEdit',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                memId: memId,
       			tags: userTags,
        		newTags: additionalTags
            }),
            success: function(response) {
				        if (response.redirectUrl) {
				            window.location.href = response.redirectUrl;
				        }
		    },
            error: function(xhr, status, error) {
                // 서버 응답 실패 시 처리
                console.error("AJAX 요청 오류:", status, error);
            }
        });
        
        
    });
    
   
	
	
	
	
	
});

function receiveSelectedValues(values) {
console.log("받은 값들:", values);

    let tagsContainer = document.getElementById('tagsContainer');
    let ul = tagsContainer.querySelector('ul');
    
    // 없으면 추가
    if (!tagsContainer.querySelector('h2')) {
        let heading = document.createElement('h2');
        heading.textContent = '새로 선택된 관심사';
        heading.style.textAlign = 'center';
        tagsContainer.insertBefore(heading, tagsContainer.firstChild);
    }
    
    // 없으면 추가
    if (!ul) {
        ul = document.createElement('ul');
        tagsContainer.appendChild(ul);
    }
    
    // 존재 여부 확인 함수
    function isItemExists(tagId) {
        return Array.from(ul.querySelectorAll('li')).some(li => li.dataset.tagId === tagId);
    }

    values.forEach(function(tag) {
        let tagId = tag.tagId;
        let tagName = tag.tagName;
        
        if (!isItemExists(tagId)) {
            let li = document.createElement('li');
            li.className = 'userItem';
            li.classList.add('userNewItem');
            li.dataset.tagId = tagId;
            li.innerHTML = `${tagName}<button class="delete-button">취소</button>`;
            ul.appendChild(li);
        }
    });

    // 삭제 버튼 클릭 이벤트 핸들러
    tagsContainer.addEventListener('click', function(event) {
        if (event.target && event.target.classList.contains('delete-button')) {
            event.target.closest('li').remove();
        }
    });
}