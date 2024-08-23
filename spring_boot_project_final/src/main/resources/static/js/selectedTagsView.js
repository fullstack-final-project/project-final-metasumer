$(document).ready(function() {
    $('.delete-button').on('click', function() {
        $(this).closest('li').remove();
    });

    $('#editBtn').on('click', function() {
        $(this).hide();
        $('#doneBtn').show();
        $('#addBtn').show();
        $('.delete-button').show();
    });

    $('#doneBtn').on('click', function() {
        $(this).hide();
        $('#editBtn').show();
        $('.delete-button').hide();
        $('.addBtn').hide();
    });

    $('#doneBtn').hide();
    
   $('#addBtn').click(function() {
   	let memId = $('#memId').val();
    window.open("/member/newSelectedTags/" + memId, 'newWindow', 'width=800,height=600');
	});

});
