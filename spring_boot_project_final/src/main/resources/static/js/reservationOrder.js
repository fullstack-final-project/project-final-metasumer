/**
 *	reservationOrder.js 
 */
 
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
            });
        });
    }

    // 페이지가 로드되면 결제 방법을 초기화 및 리스너 설정
    initializePaymentMethod();
    setupPaymentOptionListeners();
});

function updateQuantity(button, change, price) {
    var quantityInput = $(button).siblings('.quantity-input');
    var currentQuantity = parseInt(quantityInput.val()) || 1;
    var newQuantity = currentQuantity + change;
    if (newQuantity < 1) newQuantity = 1; // 최소 수량 제한

    quantityInput.val(newQuantity);

    var totalPrice = newQuantity * price;
    $(button).closest('tr').find('.area-total').text(totalPrice + '원');

    // 숨겨진 수량 및 가격 필드 업데이트
    quantityInput.siblings('input[name="resQuantity[]"]').val(newQuantity);
    quantityInput.siblings('input[name="resPrice[]"]').val(totalPrice);
    
    updateTotalPrices();
}

function updateRowTotal(button, newQuantity) {
    // 현재 행의 가격 정보를 업데이트합니다.
    const container = button.parentElement;
    const priceElement = container.closest('tr').querySelector('.area-price');
    const totalElement = container.closest('tr').querySelector('.area-total');

    const price = parseInt(priceElement.textContent.replace(/[^0-9]/g, ''), 10);
    totalElement.textContent = `${(price * newQuantity).toLocaleString()}원`;
}

function updateTotalPrices() {
    let total = 0;

    // 모든 행의 총 금액을 합산합니다.
    document.querySelectorAll('.area-total').forEach(function(totalElement) {
        total += parseInt(totalElement.textContent.replace(/[^0-9]/g, ''), 10);
    });

    const productTotalElement = document.getElementById('productTotal');
    const finalTotalPriceElement = document.getElementById('finalTotalPrice');

    if (productTotalElement && finalTotalPriceElement) {
        productTotalElement.textContent = `${total.toLocaleString()}원`;
        finalTotalPriceElement.textContent = `${total.toLocaleString()}원`;
    } else {
        console.error("Total price elements not found.");
    }
}

function updateAreaIds() {
    var areaIds = [];
    $('input[name="areaId"]').each(function() {
        areaIds.push($(this).val());
    });

    // Create a hidden input field for areaIds
    if ($('#hiddenAreaIds').length === 0) {
        $('<input>', {
            type: 'hidden',
            id: 'hiddenAreaIds',
            name: 'areaId',
            value: areaIds.join(',')
        }).appendTo('form');
    } else {
        $('#hiddenAreaIds').val(areaIds.join(','));
    }
}

$('#submit-button').on('click', function() {
    updateAreaIds();
});
