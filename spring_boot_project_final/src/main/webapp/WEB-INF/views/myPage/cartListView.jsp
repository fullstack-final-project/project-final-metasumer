<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>장바구니</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/cart2.css'/>">
		<script src="/js/cart.js"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
			  <header>
			    <h2>장바구니</h2>
			  </header>
			  <div id="cartContainer">
			    <div id="cartList">			      
			      <c:if test="${empty cartList}">
			        <div id="emptyBox">
			          <img src="<c:url value='/image/noOrder.png' />">
			          <p id='emptyMessage'>장바구니가 비어있습니다.</p>
			          <button onclick="location.href='/product/productList'">베스트 상품 보기</button>
			        </div>				        	        			                           
			      </c:if>
			      <c:if test="${not empty cartList}">			       
			        <div id="selectionActions">
                      <input type="checkbox" id="selectAll" checked> 전체선택
                      <button id="deleteSelected" type="button">선택삭제</button>
                    </div>
				  <form id="cartForm" method="post" action="<c:url value='/myPage/orderForm'/>"> 				  				                    
				    <div class="cartItem">				 
				      <div class="prdInfo">				      
				        <div class="shippingType">
				          <p>일반배송(${prdCount})</p><hr>
				        </div>
				        <c:forEach var="prd" items="${cartList}">						        			        		          
				          <div class="prdName">
				            <input type="checkbox" class="itemCheckbox" name="cartNo" value="${prd.cartNo}" checked>					          
				            <div class="prdOption">		          
				              <a href="#">${prd.prdName}<p>사용자가 선택한 상품 옵션</p></a>
				            </div>					            			            
				            <img src="<c:url value='/image/close2.png' />" class="closeBtn" data-cartNo="${prd.cartNo}">				           
				          </div>					          			          
				          <div class="prdDetail">
				            <img src="<c:url value='/project_images/${prd.prdImage}' />">					            		            
				            <div class="price" data-price="${prd.prdPrice}" data-amount="${prd.prdPrice * prd.cartQty}"> 
							  <fmt:formatNumber value="${prd.prdPrice * prd.cartQty}" pattern="#,###" /> 원								  						  	
						    </div>						  
						  </div>
						  <div class="quantityWrap">
							<input type="number" name="cartQty[]" value="${prd.cartQty}" class="quantity" min="1">
                            <input type="hidden" name="cartNo[]" value="${prd.cartNo}">									                      			                         
							<button class="qtyUpdate" type="button">변경</button>
					      </div>					  
				        </c:forEach>
				        
				        <c:set var="totalPrice" value="0" />
                        <c:set var="totalShipping" value="0" />
                        <c:forEach var="prd" items="${cartList}">
                          <span class="amount" data-amount="${prd.prdPrice * prd.cartQty}">
                            <c:set var="amount" value="${prd.prdPrice * prd.cartQty}"/>
                            <c:set var="totalPrice" value="${totalPrice + amount}" />                            
                          </span> 
                        </c:forEach>
                        
				        <div class="priceShow">
						    상품 <span class="totalPrice"><fmt:formatNumber value="${totalPrice}" pattern="#,###" />원</span> 
						    + 배송비 <span class="totalShipping"><fmt:formatNumber value="${totalShipping}" pattern="#,###" />원</span>
						    <p><span class="totalAmount"><fmt:formatNumber value="${totalPrice + totalShipping}" pattern="#,###" />원</span></p>
						</div>
				      </div>
				      	
				    </div>	
				   			  					    				    				    
                    <div id="fixedSummary">
					   <div id="deliveryInfo">
							<h3><img src="<c:url value='/image/location.png' />" class="locationLogo" style="vertical-align: middle"> 배송지(기본)</h3>
							<p>${memVo.memAddress1} ${memVo.memAddress2}</p>										           
						</div>
						<div id="paymentSummary">
							<h3>결제금액</h3>
							<p>
							  상품금액 <span class="totalPrice"><fmt:formatNumber value="${totalPrice}" pattern="#,###" />원</span>
							</p>							
							<p>
							  배송비 <span class="totalShipping"><fmt:formatNumber value="${totalShipping}" pattern="#,###" />원</span>
						    </p>
						    <hr>
							<div class="pay">
							  결제예정금액 <span class="totalAmount"><fmt:formatNumber value="${totalPrice + totalShipping}" pattern="#,###" />원</span>
							</div>
							<button id="orderAll">
						      <span class="totalAmountOrder"><fmt:formatNumber value="${totalPrice + totalShipping}" pattern="#,###" />원 주문하기</span>
						    </button>
						</div>												    
					</div>													    
				  </form>
			     </c:if>
			   </div>		  
			  </div>			
			</section>					
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
