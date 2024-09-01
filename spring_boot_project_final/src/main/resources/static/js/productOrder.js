/**
 * productOrder.js
 */
 
 // 주문자 정보 불러오기
 function copyOrdererInfo() {
    const sameAsOrderer = document.getElementById('sameAsOrderer').checked;

    // 주문자 정보
    const ordererName = document.getElementById('ordererName').value;
    const ordererHp1 = document.getElementById('ordererHp1').value;
    const ordererHp2 = document.getElementById('ordererHp2').value;
    const ordererHp3 = document.getElementById('ordererHp3').value;
    const ordererEmail = document.getElementById('ordererEmail').value;

    // 배송지 정보
    const recipient = document.getElementById('recipient');
    const memHp1 = document.getElementById('memHp1');
    const memHp2 = document.getElementById('memHp2');
    const memHp3 = document.getElementById('memHp3');
    const memEmail = document.getElementById('memEmail');
    const emailDomain = document.getElementById('emailDomain');

    if (sameAsOrderer) {
        recipient.value = ordererName;
        memHp1.value = ordererHp1;
        memHp2.value = ordererHp2;
        memHp3.value = ordererHp3;

        const emailParts = ordererEmail.split('@');
        if (emailParts.length === 2) {
            memEmail.value = emailParts[0];
            emailDomain.value = emailParts[1];
        }
    } else {
        recipient.value = '';
        memHp1.value = '';
        memHp2.value = '';
        memHp3.value = '';
        memEmail.value = '';
        emailDomain.value = '';
    }
}

//////////////////////////////////////////////////////////////////////////////////////////

// 결제 방법 선택
document.addEventListener('DOMContentLoaded', function() {
    const options = document.querySelectorAll('.payment-option');

    options.forEach(option => {
        option.addEventListener('click', function() {
            // 모든 옵션에서 active 클래스 제거
            options.forEach(opt => opt.classList.remove('active'));

            // 클릭한 옵션에 active 클래스 추가
            this.classList.add('active');

            // 선택된 결제 방법의 값을 저장 (예: hidden input에 저장)
            const selectedValue = this.getAttribute('data-value');
            console.log('선택된 결제 방법:', selectedValue);

            // hidden input에 선택된 값을 저장 (폼 데이터로 전달하기 위해)
            document.getElementById('selectedPaymentMethod').value = selectedValue;
        });
    });
});

// 페이지 렌더링 시 "신용카드" 선택
document.addEventListener('DOMContentLoaded', function() {
    const options = document.querySelectorAll('.payment-option');

    function setInitialSelection() {
        const defaultOption = document.querySelector('.payment-option[data-value="card"]');

        if (defaultOption) {
            defaultOption.classList.add('active');
            document.getElementById('selectedPaymentMethod').value = 'card';
        }
    }

    setInitialSelection();

    options.forEach(option => {
        option.addEventListener('click', function() {
            options.forEach(opt => opt.classList.remove('active'));
           
            this.classList.add('active');

            const selectedValue = this.getAttribute('data-value');
            document.getElementById('selectedPaymentMethod').value = selectedValue;
        });
    });
});

///////////////////////////////////////////////////////////////////////////////////////////////
// 주문




