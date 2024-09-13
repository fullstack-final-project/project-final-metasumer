/**
 * 	myFishRecordsTagEdit
 */
 $(document).ready(function() {
    function toggleEditMode(enable) {
        $('.tag-item').each(function() {
            if (enable) {
                $(this).addClass('editable').off('click').on('click', function() {
                    const tagId = this.id.split('-')[1];
                    deleteTag(tagId);
                });
            } else {
                $(this).removeClass('editable').off('click');
            }
        });

        $('.delete-button').toggleClass('hidden', !enable);
    }

    function showTagEditOptions() {
        $('#tagEdit').addClass('hidden');
        $('#tagEditOptions').removeClass('hidden');
        toggleEditMode(true);
        $('#tagAddNew').removeClass('hidden');
    }

    function tagCancelEdit() {
        $('#tagEditOptions').addClass('hidden');
        $('#tagEdit').removeClass('hidden');
        toggleEditMode(false);
        $('#tagAddNew').addClass('hidden');
    }

    function deleteTag(tagId) {
        $(`#tag-${tagId}`).remove();
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
        const selectedTagsDiv = $('#selectedTags');
        
        tags.forEach(tag => {
            let existingTag = $(`#tag-${tag.id}`);
            if (existingTag.length === 0) {
                const tagSpan = $(`
                    <span id="tag-${tag.id}" class="tag-item">
                        # ${tag.name}
                        <button id="delete-${tag.id}" class="delete-button hidden" onclick="deleteTag('${tag.id}'); event.stopPropagation();">x</button>
                        <input type="hidden" name="tags" value="${tag.id}">
                    </span>
                `);
                selectedTagsDiv.append(tagSpan);
            }
        });

        if (!$('#tagEditOptions').hasClass('hidden')) {
            toggleEditMode(true);
        }
    }

    $('#tagEdit').on('click', showTagEditOptions);
    $('#tagCancelEdit').on('click', tagCancelEdit);
    $('#tagAddNew').on('click', addNewTag);
    
    window.updateSelectedTags = updateSelectedTags;
});
