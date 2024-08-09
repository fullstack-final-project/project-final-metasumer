/**
 *  update.js
 */
 
$(document).ready(function() {
    let deleteButton = $('#deleteButton');
    let uploadFileInput = $('#uploadFile');
    let uploadedFileInput = $('#uploadedFile');

    function clearFile(event) {
        event.preventDefault();

        uploadFileInput.val('');

        deleteButton.hide();
        uploadedFileInput.hide();

        uploadedFileInput.val('');
    }

    function UploadOnChange(event) {
        if (event.target.files.length > 0) {
            let fileName = event.target.files[0].name;
            deleteButton.show();
            uploadedFileInput.show();
            uploadedFileInput.val(fileName);
        } else {
            deleteButton.hide();
            uploadedFileInput.hide();
        }
    }

    function setInitialDeleteButtonVisibility() {
        let uploadedFileValue = uploadedFileInput.val();
        if (uploadedFileValue) {
            deleteButton.show();
            uploadedFileInput.show();
        } else {
            deleteButton.hide();
            uploadedFileInput.hide();
        }
    }

    deleteButton.on('click', clearFile);
    uploadFileInput.on('change', UploadOnChange);

    setInitialDeleteButtonVisibility();
});
