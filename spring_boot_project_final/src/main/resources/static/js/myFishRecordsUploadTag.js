/**
 *  myFishRecordsUploadTag.js
 */
 
function sendSelectedTags() {
    var selectedTags = [];
    $("input[name='tagName']:checked").each(function() {
        var tag = {
            name: $(this).val(),
            id: $(this).siblings('input[name="tagId"]').val()
        };
        selectedTags.push(tag);
    });

    if (window.opener && !window.opener.closed) {
        window.opener.updateSelectedTags(selectedTags);
        window.close();
    }
}