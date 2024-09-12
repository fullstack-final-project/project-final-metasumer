/**
 * 	myFishRecordsTagEdit
 */
 
function toggleEditMode(enable) {
    document.querySelectorAll('.tag-item').forEach(item => {
        if (enable) {
            item.classList.add('editable');
            item.onclick = function() {
                const tagId = this.id.split('-')[1];
                deleteTag(tagId);
            };
        } else {
            item.classList.remove('editable');
            item.onclick = null;
        }
    });

    document.querySelectorAll('.delete-button').forEach(btn => {
        if (enable) {
            btn.classList.remove('hidden');
        } else {
            btn.classList.add('hidden');
        }
    });
}

function showTagEditOptions() {
    document.getElementById('tagEdit').classList.add('hidden');
    document.getElementById('tagEditOptions').classList.remove('hidden');
    toggleEditMode(true);
    document.getElementById('tagAddNew').classList.remove('hidden');
}

function tagCancelEdit() {
    document.getElementById('tagEditOptions').classList.add('hidden');
    document.getElementById('tagEdit').classList.remove('hidden');
    toggleEditMode(false);
    document.getElementById('tagAddNew').classList.add('hidden');
}

function deleteTag(tagId) {
    const tagElement = document.getElementById(`tag-${tagId}`);
    if (tagElement) {
        tagElement.remove();
    }
}

function addNewTag() {
    const newWindow = window.open('/myFishRecords/myFishRecordsUploadTag', 'newWindow', 'width=800,height=600');
    
    newWindow.addEventListener('load', function() {
        newWindow.addEventListener('message', function(event) {
            if (event.origin === window.location.origin) {
                if (event.data.type === 'selectedTags') {
                    updateSelectedTags(event.data.tags);
                }
            }
        });
    });
}

function updateSelectedTags(tags) {
    const selectedTagsDiv = document.getElementById('selectedTags');
    
    tags.forEach(tag => {
        let existingTag = document.getElementById(`tag-${tag.id}`);
        if (!existingTag) {
            const tagSpan = document.createElement('span');
            tagSpan.id = `tag-${tag.id}`;
            tagSpan.className = 'tag-item';
            tagSpan.innerHTML = `
                # ${tag.name}
                <button id="delete-${tag.id}" class="delete-button hidden" onclick="deleteTag('${tag.id}'); event.stopPropagation();">x</button>
                <input type="hidden" name="tags[]" value="${tag.id}">
            `;
            selectedTagsDiv.appendChild(tagSpan);
        }
    });

    if (document.getElementById('tagEditOptions').classList.contains('hidden') === false) {
        toggleEditMode(true);
    }
}
