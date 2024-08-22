/**
 * 	비밀번호 아이디 위주 정규화
 */
 
 $(document).ready(function() {
    
    // 비밀번호 강도 체크
    function checkPasswordStrength(password) {
        let strength = 0;
        
        if (password.length >= 8) {
            strength++; // 8자 이상
            if (/[A-Z]/.test(password)) strength++; // 대문자 포함
            if (/[a-z]/.test(password)) strength++; // 소문자 포함
            if (/\d/.test(password)) strength++; // 숫자 포함
            if (/[@$!%*?&]/.test(password)) strength++; // 특수문자 포함
        }
        
        return strength;
    }

    $('#memPwd').on('keyup', function() {
        let password = $(this).val();
        let strength = checkPasswordStrength(password);
        let message = '';
        
        if (password.length < 8) {
            message = '비밀번호는 8자 이상이어야 합니다.';
            $('#passwordAvailable1').val('false');
        } else if (strength <= 2) {
            message = '영문 대소문자, 숫자, 특수문자를 조합해 주세요.';
            $('#passwordAvailable1').val('false');
        } else {
            message = '적절한 비밀번호입니다.';
             $('#passwordAvailable1').val('true');
        }

        $('#passwordStrength').text(message);
    });

    // 비밀번호 확인
    $('#PwdCheck').on('keyup', function() {
        let password = $('#memPwd').val();
        let passwordCheck = $(this).val();

        if (password !== passwordCheck) {
            $('#PwdCheck').css('border-color', 'red');
            $('#passwordError').text('비밀번호가 일치하지 않습니다.');
            $('#passwordAvailable2').val('false');
        } else {
            $('#PwdCheck').css('border-color', '');
            $('#passwordError').text('');
            $('#passwordAvailable2').val('true');
        }
    });
    
    $('#idCheck').on('click', function() {
        var memId = $('#memId').val();
        
        if (memId.trim() === '') {
            alert('ID를 입력해주세요.');
            $('#memId').focus();
            return;
        }
        
        let validationMessage = validateUsername(memId);
        
        if (validationMessage) {
            alert(validationMessage);
            $('#memId').focus();
            return;
        }
        
        $.ajax({
            type: 'POST',
            url: '/member/checkId',
            data: { memId: memId },
            success: function(response) {
                if (response === 'true') {
                	$('#idAvailable').val('true');
                    alert('사용 가능한 ID입니다.');
                } else {
                    $('#idAvailable').val('false');
                    alert('이미 사용 중인 ID입니다.');
                    $('#memId').focus();
                }
            },
            error: function() {
                alert('서버와의 통신에 실패했습니다.');
            }
        });
    });
    
    function validateUsername(username) {
        let minLength = 5; // 최소 길이
        let maxLength = 20; // 최대 길이
        let validPattern = /^[a-zA-Z0-9_]+$/;

        if (username.length < minLength || username.length > maxLength) {
            return '아이디는 ' + minLength + '자 이상 ' + maxLength + '자 이하로 입력해주세요.';
        } else if (!validPattern.test(username)) {
            return '아이디는 영문 대소문자, 숫자, 특수문자(_)만 포함할 수 있습니다.';
        } else {
            return '';
        }
    }
    
    $('form').on('submit', function(event) {
        var idAvailable = $('#idAvailable').val();
        var nickAvailable = $('#nickAvailable').val();
        var passwordAvailable1 = $('#passwordAvailable1').val();
        var passwordAvailable2 = $('#passwordAvailable2').val();
        
        if (idAvailable === 'false') {
            alert('ID 중복 확인을 먼저 해주세요.');
            $('#memId').focus();
            event.preventDefault();
            return;
        }
        
        if (nickAvailable === 'false') {
            alert('닉네임 중복 확인을 먼저 해주세요.');
            $('#nickName').focus();
            event.preventDefault();
            return;
        }
        
        if (passwordAvailable1 === 'false') {
            alert('비밀번호를 형식에 맞춰 다시 작성해주세요.');
            $('#memPwd').focus();
            event.preventDefault();
            return;
        }
        
        if (passwordAvailable2 === 'false') {
            alert('비밀번호를 다시 확인 해주세요.');
            $('#PwdCheck').focus();
            event.preventDefault();
            return; 
        }
    });
    
    
});
 