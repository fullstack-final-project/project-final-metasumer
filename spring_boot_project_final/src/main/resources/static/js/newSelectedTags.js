$(document).ready(function() {
    $("#completeBtn").click(function() {
    	let selectedTags = [];
    	
         $('input[type="checkbox"]:checked').each(function() {
            let tagId = $(this).siblings('input[name="tagId"]').val();
            let tagName = $(this).val();
            
            selectedTags.push({
                tagId: tagId,
                tagName: tagName
            });
        });
        
         console.log("선택된 태그들:", selectedTags[0]);
        
        if (selectedTags.length === 0) {
            alert("체크박스를 선택하지 않았습니다. 취소합니다.");
            window.close();
            return;
        }

        if (window.opener && typeof window.opener.receiveSelectedValues === 'function') {
            window.opener.receiveSelectedValues(selectedTags);
        } else {
            console.error("처음부터 다시 해주세요.");
        }
    
        alert("선택한 관심사가 추가되었습니다.");
        window.close();
    });
});
