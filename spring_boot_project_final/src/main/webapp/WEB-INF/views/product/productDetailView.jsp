<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${product.prdName} - 상품 상세</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/productDetail.css'/>" />
		<script src="<c:url value='/js/productDetail.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				<div id="productDetail">
	        
            <img class="product-image" src="<c:url value='/project_images/${product.prdImage}'/>" alt="${product.prdName}">
            <!-- 추가 이미지가 있으면 슬라이더로 표시 -->
            
	        	
	        	<div class="product-info">
	        		<hr class="section-divider">
					    <h1 id="prdName">${product.prdName}</h1>
					    
					    <table>
					        <tbody>
					            <tr>
					                <th>가격</th>
					                <td><span id="prdPrice"><fmt:formatNumber value="${product.prdPrice}" type="number"/></span>원</td>
					            </tr>
					            <tr>
					                <th>카테고리</th>
					                <td>${product.prdCtgName}</td>
					            </tr>
					            <tr>
					                <th>제조사</th>
					                <td>${product.prdMaker}</td>
					            </tr>
					            <tr>
					                <th>재고</th>
					                <td><span id="prdStock">${product.prdStock}</span></td>
					            </tr>
					            <tr>
					                <th>설명</th>
					                <td>${product.prdDescript}</td>
					            </tr>
					            
					        </tbody>
					    </table>
					
					    <div class="info-row">
				        <h1 class="product-name">${product.prdName}</h1>
				        <!-- 수량 선택 -->
				        <div class="quantity-selector">
				            <button type="button" onclick="updateQuantity(-1)">-</button>
				            <input type="number" id="quantity" name="quantity" value="1" min="1" max="${product.prdStock}" readonly>
				            <button type="button" onclick="updateQuantity(1)">+</button>
				        </div>
				        <!-- 총 상품 금액 -->
				        <p class="price"><span id="productTotal">${product.prdPrice}원</span></p>
				   	 	</div>
					
					    <!-- 금액 및 배송비 표시 -->
							<div class="total-info">
							    <div class="total-item">
							        <span>배송비 (5만원 이상 구매시 무료)</span>
							        <span id="deliveryCost">3,000원</span>
							    </div>
							    <hr class="section-divider">
							    <div class="total-item">
							        <span>총 구매 금액</span>
							        <span id="finalTotalPrice">${product.prdPrice + 3000}원</span>
							    </div>
							</div>
					    
					    <!-- 구매 및 장바구니 버튼 -->
					    <div class="buttons">
					    
    					<input type="hidden" id="prdNo" value="${product.prdNo}" />
					        <button class="buy-button" onclick="buyNow()">구매하기</button>
					        <button class="cart-button" onclick="addToCart()">장바구니</button>
					        <button class="wishlist-button" onclick="addToWishlist()">관심상품</button>
					    </div>
					</div>
				</div>
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>