$(document).ready(function() {

    function initializeDateSelectors() {
        const currentYear = new Date().getFullYear();
        const yearSelect = $('#birthYear');
        const monthSelect = $('#birthMonth');
        const daySelect = $('#birthDay');

        for (let year = 1900; year <= currentYear; year++) {
            yearSelect.append(`<option value="${year}">${year}</option>`);
        }

        for (let month = 1; month <= 12; month++) {
            monthSelect.append(`<option value="${month < 10 ? '0' + month : month}">${month < 10 ? '0' + month : month}</option>`);
        }

        const today = new Date();
        const year = today.getFullYear();
        const month = today.getMonth() + 1;
        const day = today.getDate();

        yearSelect.val(year);
        monthSelect.val(month < 10 ? '0' + month : month);
        updateDays();
        daySelect.val(day < 10 ? '0' + day : day);
    }

    function updateDays() {
        const year = $('#birthYear').val();
        const month = $('#birthMonth').val();
        const daySelect = $('#birthDay');

        daySelect.empty().append('<option value="">일</option>');

        if (year && month) {
            const daysInMonth = new Date(year, month, 0).getDate();
            for (let day = 1; day <= daysInMonth; day++) {
                daySelect.append(`<option value="${day < 10 ? '0' + day : day}">${day < 10 ? '0' + day : day}</option>`);
            }
        }
    }

    initializeDateSelectors();

    $('#birthYear, #birthMonth').on('change', updateDays);


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