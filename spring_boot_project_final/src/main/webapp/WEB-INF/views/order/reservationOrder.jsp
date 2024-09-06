<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>예약 확인 및 결제</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/reservationOrder.css' />" />
    <script src="<c:url value='/js/reservationOrder.js' />"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
				<section>
            <form id="order-form" action="<c:url value='/order/reservationComplete'/>" method="post">
                <!-- 상품 정보 -->
                <div class="product-summary">
                    <h2>상품 정보</h2>
                    <table class="product-table">
                        <tr>
                            <th>상품정보</th>
                            <th>상품금액</th>
                            <th>수량</th>
                            <th>총 상품금액</th>
                        </tr>
                        <c:forEach var="area" items="${areas}">
                            <tr>
                                <td class="area-name">
                                    <span class="product-name">${area.areaName}</span>
                                </td>
                                <td class="area-price">
                                    <fmt:formatNumber value="${area.areaPrice}" type="number"/>원
                                </td>
                                <td class="area-quantity">
												            <button type="button" onclick="updateQuantity(this, -1, ${area.areaPrice})">-</button>
												            <input type="number" name="resQuantity" class="quantity-input" value="${resQuantity}" min="1"/>
												            <button type="button" onclick="updateQuantity(this, 1, ${area.areaPrice})">+</button>
												        </td>
                                <td class="area-total">
                                    <fmt:formatNumber value="${area.areaPrice * resQuantity}" type="number"/>원
                                </td>
                            </tr>
                            <input type="hidden" name="areaId[]" value="${area.areaId}">
										        <input type="hidden" name="resQuantity[]" class="quantity-input" value="${resQuantity}">
										        <input type="hidden" name="resPrice[]" value="${area.areaPrice * resQuantity}">
                        </c:forEach>
                    </table>
                </div>

                <!-- 창 좌측 -->
                <div class="area-left">
                    <!-- 예약자 정보 -->
                    <div class="orderer-details">
                        <h2>예약자 정보</h2>
                        <table class="order-ship-table">
                            <tr>
                                <th><label for="ordererName">이름</label></th>
                                <td><input type="text" id="ordererName" name="ordererName" value="${member.memName}" required readonly></td>
                            </tr>
                            <tr>
                                <th><label for="ordererPhone">휴대전화</label></th>
                                <td>
                                    <input type="text" id="ordererHp1" name="ordererHp1" size="3" class="hp" 
                                        value="${fn:substring(member.memHP, 0, 3)}" required readonly> 
                                    - <input type="text" id="ordererHp2" name="ordererHp2" size="4" class="hp" 
                                        value="${fn:substring(member.memHP, 4, 8)}" required>
                                    - <input type="text" id="ordererHp3" name="ordererHp3" size="4" class="hp" 
                                        value="${fn:substring(member.memHP, 9, 13)}" required>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="ordererEmail">이메일</label></th>
                                <td><input type="email" id="ordererEmail" name="ordererEmail" value="${member.memEmail}" required readonly></td>
                            </tr>
                        </table>
                    </div>
                    
                    <!-- 결제 방법 -->
                    <h2>결제 방법</h2>
                    <div class="payment">
                        <ul class="payment-methods">
                            <li class="payment-option" data-value="creditCard" id="creditCardOption">
                                <img src="<c:url value='/images/card.png'/>" alt="신용카드">
                                <span>신용카드</span>
                            </li>
                            <li class="payment-option" data-value="bankTransfer">
                                <img src="<c:url value='/images/bank.png'/>" alt="무통장 입금">
                                <span>무통장 입금</span>
                            </li>
                            <li class="payment-option" data-value="realtimeTransfer">
                                <img src="<c:url value='/images/realtime.png'/>" alt="실시간계좌 이체">
                                <span>실시간계좌 이체</span>
                            </li>
                            <li class="payment-option" data-value="mobilePayment">
                                <img src="<c:url value='/images/mobile.png'/>" alt="휴대폰 결제">
                                <span>휴대폰 결제</span>
                            </li>
                            <li class="payment-option" data-value="kakaoPay">
                                <img src="<c:url value='/images/kakao.png'/>" alt="카카오페이">
                                <span>카카오페이</span>
                            </li>
                            <li class="payment-option" data-value="naverPay">
                                <img src="<c:url value='/images/naver.png'/>" alt="네이버페이">
                                <span>네이버페이</span>
                            </li>
                            <li class="payment-option" data-value="samsungPay">
                                <img src="<c:url value='/images/samsung.png'/>" alt="삼성페이">
                                <span>삼성페이</span>
                            </li>
                            <li class="payment-option" data-value="payco">
                                <img src="<c:url value='/images/payco.png'/>" alt="페이코">
                                <span>페이코</span>
                            </li>
                        </ul>
                    </div>
                </div>    
                
                <!-- 창 우측 -->
                <div class="area-right">
                    <!-- 주문 내역 -->
                    <div class="order-summary">
                    		<!-- 결제 박스 -->
                        <div class="info-box payment-info">
                            <div>
                                <h3>결제 정보</h3>
                                <table class="summary-table">
                                    <tr>
                                        <th>총 상품금액</th>
                                        <td id="productTotal"><fmt:formatNumber value="${productTotal}" type="number"/>원</td>
                                    </tr>
                                </table>
                            </div>
                        
                            <div class="info-box total-info">
                                <dl>
                                    <dt>결제 금액</dt>
                                    <dd id="finalTotalPrice"><fmt:formatNumber value="${finalTotalPrice}" type="number"/>원</dd>
                                </dl>
                            </div>
                        </div>
                    		<!-- 기본정보 -->
                    		<div class ="basic-info">
		                    		<div class="step-box">
		                    			<p><img src="<c:url value='/images/check-credit.png'/>">
		                    					<br>결제완료</p>
		                    			<p><img src="<c:url value='/images/email.png'/>">
		                    					<br>알림발송</p>
		                    			<p><img src="<c:url value='/images/calendar.png'/>">
		                    					<br>예약확정</p>
		                    		</div>
		                    		<dl class="info-notice">
		                    			<dt>3시간 이내에 예약확정 알림을 드립니다.</dt>
		                    			<dd>확정/불가 알림은 운영시간 기준(09~18시) 내에 이메일 또는 휴대폰 메시지로 발송됩니다.
		                    					<br>
		                    					예약대기 중에 예약 취소 시 취소 및 환불규정에 따라 적용됩니다.
		                    					</dd>
		                    		</dl>
	                    	</div>	
	                    	<div class="notic-area">
			                    	<div class="company-box">
				                    		<div class="company-img">
				                    			<img src="<c:url value='/project_images/${spot.spotImage}'/>" alt="${spot.spotName}">
				                    		</div>
				                    		<p>${spot.spotName}</p>
				                    		<p>${resDate}</p>
				                    </div>
				                    <div class="notice-box">
				                    	<dl>
				                    		<dt>필수공지</dt>
				                    		<dd>업체의 상품정보가 수시로 변경될 수 있으며, 이로 인한 불이익은 어사모가 책임지지 않습니다.</dd>
				                    		<dd>업체사진의 경우 일부 대표사진으로 실제 이용하는 상품 이미지와 상이할 수 있습니다.</dd>
				                    	</dl>
				                    </div>
	                    	</div>
	                    	
	                    	<input type="hidden" name="spotId" value="${spot.spotId}">
										    <input type="hidden" name="resDate" value="${resDate}">
										    <input type="hidden" name="resNum" value="${resNum}">
										    <input type="hidden" name="bizId" value="${bizId}">
										    <input type="hidden" name="finalTotalPrice" value="${finalTotalPrice}">
                        
                        <!-- 버튼 그룹 -->
                        <div class="button-group">
                            <button type="submit" id="submit-button" class="btn">결제하기</button>
                            <button type="button" id="cancel-button" class="btn" onclick="window.history.back()">취소</button>
                        </div>
                    </div> 
                </div>
            </form>
            
        </section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>