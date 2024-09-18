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

document.addEventListener("DOMContentLoaded", function() {
    // 결제 방법 선택을 초기화
    function initializePaymentMethod() {
        // 모든 결제 옵션을 비활성화 상태로 설정
        var paymentOptions = document.querySelectorAll('.payment-option');
        paymentOptions.forEach(function(option) {
            option.classList.remove('active');
        });

        // 신용카드 옵션을 활성화 상태로 설정
        var creditCardOption = document.getElementById('creditCardOption');
        if (creditCardOption) {
            creditCardOption.classList.add('active');
            document.getElementById('ordPayInput').value = creditCardOption.getAttribute('data-value'); // 초기값 설정
        }
    }

    // 결제 방법을 클릭할 때 활성화 상태를 변경
    function setupPaymentOptionListeners() {
        var paymentOptions = document.querySelectorAll('.payment-option');
        paymentOptions.forEach(function(option) {
            option.addEventListener('click', function() {
                // 모든 결제 옵션의 active 클래스를 제거
                paymentOptions.forEach(function(opt) {
                    opt.classList.remove('active');
                });
                
                // 클릭된 결제 옵션에 active 클래스를 추가
                this.classList.add('active');
                
                // hidden input 설정
                document.getElementById('ordPayInput').value = this.getAttribute('data-value');
            });
        });
    }

    // 페이지가 로드되면 결제 방법을 초기화 및 리스너 설정
    initializePaymentMethod();
    setupPaymentOptionListeners();
});

///////////////////////////////////////////////////////////////////////////////////////////////
// 주문




