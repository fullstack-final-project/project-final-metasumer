/**
 * productManagement.js
 */
 
 function deleteCheck(prdNo, bizId) {
    // 주문 내역 테이블에서 제품 번호를 모두 가져옴
    const orderProducts = document.querySelectorAll('#order-history .orderList tbody tr td:nth-child(3)');
    let isInOrder = false;

    // 주문 내역에 있는 제품 번호와 비교
    orderProducts.forEach(function(item) {
      if (item.textContent === prdNo) {
        isInOrder = true;
      }
    });

    // 주문 내역에 있으면 알림창을 띄우고 삭제를 막음
    if (isInOrder) {
      alert('주문 목록에 있는 제품은 삭제하실 수 없습니다.');
    } else {
      // 주문 내역에 없으면 삭제 확인 후 삭제 요청 진행
      if (confirm('정말로 이 제품을 삭제하시겠습니까?')) {
        location.href = "/product/deleteProduct/" + encodeURIComponent(prdNo) + "?bizId=" + encodeURIComponent(bizId);
      }
    }
  }