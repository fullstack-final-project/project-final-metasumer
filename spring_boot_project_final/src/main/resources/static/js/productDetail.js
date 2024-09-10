/**
 * productDetail.js
 */
 
 document.addEventListener('DOMContentLoaded', function () {
    const priceElement = document.getElementById('prdPrice');
    const totalPriceElement = document.getElementById('productTotal');
    const quantityInput = document.getElementById('quantity');
    const deliveryCostElement = document.getElementById('deliveryCost');
    const finalTotalPriceElement = document.getElementById('finalTotalPrice');

    // 가격과 배송비 초기 설정
    const price = parseInt(priceElement.textContent.replace(/,/g, '').replace('원', ''), 10);

    function updateTotalPrice() {
        const quantity = parseInt(quantityInput.value, 10);
        const productTotal = price * quantity;
        
        let deliveryCost = 3000; // 기본 배송비
        if (productTotal >= 50000) {
            deliveryCost = 0; // 50,000원 이상일 때 무료
            deliveryCostElement.textContent = '무료';
        } else {
            deliveryCostElement.textContent = '3,000원';
        }

        const finalTotalPrice = productTotal + deliveryCost;

        totalPriceElement.textContent = productTotal.toLocaleString() + '원';
        finalTotalPriceElement.textContent = finalTotalPrice.toLocaleString() + '원';
    }

    // 수량 증가 버튼 클릭 이벤트
    document.querySelector('.quantity-selector button:first-of-type').addEventListener('click', function () {
        updateQuantity(-1); // 수량 감소
    });

    // 수량 감소 버튼 클릭 이벤트
    document.querySelector('.quantity-selector button:last-of-type').addEventListener('click', function () {
        updateQuantity(1); // 수량 증가
    });

    function updateQuantity(change) {
        let quantity = parseInt(quantityInput.value, 10) + change;
        const maxQuantity = parseInt(quantityInput.max, 10);

        if (quantity < 1) quantity = 1;
        if (quantity > maxQuantity) quantity = maxQuantity;

        quantityInput.value = quantity;
        updateTotalPrice();
    }

    // 초기 총 가격 및 배송비 설정
    updateTotalPrice();
});

document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('buy-button').addEventListener('click', buyNow);
});

function buyNow() {
    const quantity = document.getElementById('quantity').value;
    const prdNo = document.getElementById('prdNo').value; // 상품 ID
    const prdPrice = document.getElementById('prdPrice').textContent.replace(/,/g, ''); // 가격에서 쉼표 제거

    if (prdNo && quantity && prdPrice) { // 값이 있는지 확인
        window.location.href = `/order/productOrder?prdNo=${prdNo}&prdPrice=${prdPrice}&quantity=${quantity}`;
    } else {
        console.error('필수 값이 누락되었습니다.');
    }
}

function addToCart() {
    let prdNo = document.getElementById('prdNo').value; // 상품 번호
    let quantity = document.getElementById('quantity').value; // 선택한 수량
    
    $.ajax({
        url: '/myPage/insertCart',
        type: 'post',
        data: {
            prdNo: prdNo,
            cartQty: quantity
        },
        success: function(response) {
            alert("장바구니에 추가되었습니다.");
        },
        error: function() {
            alert("실패");
        }
    });
}

function addToWishlist() {
    alert("관심상품에 추가되었습니다.");
}
 