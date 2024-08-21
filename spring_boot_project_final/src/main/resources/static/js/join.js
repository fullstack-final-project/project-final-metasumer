$(document).ready(function() {

    let memEmail = $('#memEmail');
    let emailDomain = $('#emailDomain');
    let custom = 'custom';

    function updateEmail() {
    
        let selectedDomain = emailDomain.val();
        let baseEmail = memEmail.val().split('@')[0];
        
        if (selectedDomain === custom) {
            memEmail.val(baseEmail + '@');
            memEmail.focus();
        } else if (selectedDomain) {
            memEmail.val(baseEmail + '@' + selectedDomain);
        }
    }

    emailDomain.on('change', updateEmail);

    if (emailDomain.val() === custom) {
        let baseEmail = memEmail.val().split('@')[0];
        memEmail.val(baseEmail + '@');
        memEmail.focus();
    }
    
    
    
    $('#nicknamCheck').on('click', function() {
    
        var memNickname = $('#memNickname').val();
        
        if (memNickname.trim() === '') {
            alert('닉네임을 입력해주세요.');
            $('#memNickname').focus();
            return;
        }

        $.ajax({
            type: 'POST',
            url: '/member/checknicknamCheck',
            data: { memNickname : memNickname },
            success: function(response) {
                if (response === 'true') {
                	$('#nickAvailable').val('true');
                    alert('사용 가능한 닉네임 입니다.');
                } else {
                	$('#nickAvailable').val('false');
                    alert('이미 사용 중인 닉네임 입니다.');
                    $('#memNickname').focus();
                }
            },
            error: function() {
                alert('서버와의 통신에 실패했습니다.');
            }
        });
    });
      
    $('#cancelButton').on('click', function() {
            window.location.href = '/';
	});
    
    
});