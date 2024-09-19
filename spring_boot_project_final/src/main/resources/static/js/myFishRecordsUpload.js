/**
 * myFishRecordsUpload.js
 */

$(document).ready(function(){

    hideDeleteButton();

    

	$("#uploadMyFishRecordsForm").submit(function(event) {
	    event.preventDefault();

	    updateTagsInput();
	    
	    
	    let formData = new FormData(this);

        let fishSize = $("#fishSize").val();
        if (fishSize) {
            formData.set("fishSize", `${fishSize}cm`);
    }
    
    
	    $.ajax({
	        type: "post",
	        url: "/myFishRecords/insertMyFishRecords",
	        data: formData,
	        processData: false,
	        contentType: false,
	        success: function(response) {
	                if (response.status === "success") {
	                    alert("성공!!!!!");
	                    window.location.href = response.redirectUrl;
	                } else {
	                    alert("파일 업로드 또는 게시글 등록에 실패했습니다.");
	                }
	            },
	        error: function() {
	                alert("서버와의 통신에 실패했습니다.");
	        }
	    });
	});

    
});

// 이미지 미리보기
function previewImage(event) {
    var input = event.target;
    var file = input.files[0];
    
    if (file) {
        var reader = new FileReader();
        reader.onload = function() {
            var img = document.createElement("img");
            img.src = reader.result;
            img.style.maxWidth = "300px";
            
            var imageBox = document.getElementById("imageBox");
            imageBox.innerHTML = "";
            imageBox.appendChild(img);
            
            showDeleteButton();
        };
        reader.readAsDataURL(file);
    }
}

// 이미지 값 삭제
function deleteImage() {
	event.preventDefault();
    var imageBox = document.getElementById("imageBox");
    imageBox.innerHTML = "";
    
    hideDeleteButton();
    
    var fileInput = document.getElementById("uploadImage");
    fileInput.value = "";
}

// 삭제 버튼 표시
function showDeleteButton() {
    var deleteButton = document.getElementById("deleteButton");
    deleteButton.style.display = "block";
}

// 삭제 버튼 숨기기
function hideDeleteButton() {
    var deleteButton = document.getElementById("deleteButton");
    deleteButton.style.display = "none";
}

// 검색창
function searchFish() {
    window.open('/myFishRecords/fishDetect', '_blank', 'width=800,height=600');
}



// 태그
var allTags = [];

function openInNewWindow() {
    window.open('/myFishRecords/myFishRecordsUploadTag', '_blank', 'width=800,height=600');
}

function updateSelectedTags(newTags) {
    newTags.forEach(function(tag) {
        if (!allTags.some(existingTag => existingTag.id === tag.id)) {
            allTags.push(tag);
        }
    });

    displayTags();
}

function displayTags() {
        var tagList = document.getElementById('selectedTags');
        tagList.innerHTML = '';

        allTags.forEach(function(tag) {
            var tagItem = document.createElement('div');
            tagItem.className = 'tag-item';
            tagItem.textContent = tag.name;
            
            tagItem.dataset.tagId = tag.id;
            
            var deleteButton = document.createElement('button');
            deleteButton.textContent = '×';
            deleteButton.onclick = function() {
                removeTag(tag.id);
            };

            tagItem.appendChild(deleteButton);
            tagList.appendChild(tagItem);
        });
    }

function removeTag(tagId) {
    allTags = allTags.filter(tag => tag.id !== tagId);
    displayTags();
}

function updateTagsInput() {
   	let tagsArray = Array.from(document.querySelectorAll('#selectedTags .tag-item'))
        .map(tagItem => tagItem.dataset.tagId)
        .filter(tagId => tagId)
        .join(',');
        
        console.log("Tags Array:", tagsArray);
        
    let tagsInput = document.getElementById('tagsInput');
    if (tagsInput) {
        tagsInput.value = tagsArray;
        console.log("Updated tagsInput value:", tagsInput.value);
    } else {
        console.error("tagsInput 요소를 찾을 수 없습니다.");
    }
}
