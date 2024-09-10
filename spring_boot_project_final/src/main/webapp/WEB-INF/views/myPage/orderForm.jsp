<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문서 작성</title>
		<c:import url="/WEB-INF/views/layout/head.jsp" />
		
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/productOrder.css'/>" />
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/searchZip.js'/>"></script>
		<script src="/js/cart.js"></script>
		<script src="<c:url value='/js/productOrder.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
        	<!--  top -->         
        	<c:import url="/WEB-INF/views/layout/top.jsp" />
        	
        	<section>
        		<form id="orderForm" method="post" action="<c:url value='/myPage/orderComplete'/>">	         		
        		  <div class="product-summary">
	                <h2>상품 정보</h2>
	                <table class="product-table">
	                    <tr>
	                        <th colspan="2">상품정보</th>
	                        <th>상품금액</th>
	                        <th>수량</th>
	                        <th>총 상품금액</th>
	                    </tr>
	                    <c:forEach var="prd" items="${cartList}">
	                    <tr>
	                      <td class="img">
	                      	<div style="padding: 10px 0;">
						         <img class="product-image" src="<c:url value='/project_images/${prd.prdImage}'/>" alt="${prd.prdName}">
				            </div>
				          </td>
				          <td class="product-name">
						     <span class="product-name">${prd.prdName}</span>
						  </td>
	                      <td class="product-price"><fmt:formatNumber value="${prd.prdPrice}" type="number"/>원</td>
	                      <td class="product-quantity">${prd.cartQty}</td>
	                      <td class="product-total"><fmt:formatNumber value="${prd.prdPrice * prd.cartQty}" type="number"/>원</td>
	                  </tr>
	                  <input type="hidden" name="cartNos" value="${prd.cartNo}" /> 
	                  </c:forEach>
	              </table>             
	         	 </div> 	
	         	 <!-- 창 좌측 -->
	        	<div class="area-left">
	              <!-- 주문자 정보 -->
	              <div class="orderer-details">
	                <h2>주문자 정보</h2>
	                <table class="order-ship-table">
	                    <tr>
	                        <th><label for="ordererName">이름</label></th>
	                        <td><input type="text" id="ordererName" name="ordererName" value="${memVo.memName}" required readonly>
	                            <input type="hidden" name="memId" value="${memVo.memId}">
	                        </td>
	                    </tr>
	                    <tr>
	                    		<th><label for="ordererPhone">휴대전화</label></th>
							            <td>
							                <input type="text" id="ordererHp1" name="ordererHp1" size="3" class="hp" 
							                       value="${hp1}" readonly required> 
							                - <input type="text" id="ordererHp2" name="ordererHp2" size="4" class="hp" 
							                         value="${hp2}" readonly required>
							                - <input type="text" id="ordererHp3" name="ordererHp3" size="4" class="hp" 
							                         value="${hp3}" readonly required>
							            </td>
	                    </tr>
	                    <tr>
	                        <th><label for="ordererEmail">이메일</label></th>
	                        <td><input type="email" id="ordererEmail" name="ordererEmail" value="${memVo.memEmail}" required readonly></td>
	                    </tr>
	                </table>
	              </div>
	              <!-- 배송지 정보 -->
	            <div class="shipping-details">
	                <h2>배송지 정보</h2>
	                <label>
	                    <input type="checkbox" id="sameAsOrderer" onclick="copyOrdererInfo()" > 주문자 정보와 동일
	                </label>
	                    <table class="order-ship-table">
	                        <tr>
	                            <th><label for="recipient">수령인</label></th>
	                            <td><input type="text" id="recipient" name="ordRcvReceiver" required></td>
	                        </tr>
	                        <tr>
							            	<th>주소</th>
							            	<td colspan="3">
							            		<input type="text" id="memZipcode" name="ordRcvZipcode" placeholder="우편번호" size="5" class="input_text" required readonly>
							            		<input type="button" id="searchZipBtn" name="searchZipBtn" class="btn" value="우편번호 찾기"><br>
							            		<input type="text" id="memAddress1" name="ordRcvAddress1" placeholder="주소" class="input_text" required readonly>
							            		<input type="text" id="memAddress2" name="ordRcvAddress2" placeholder="상세 주소 입력" class="input_text" required>
						            		</td>
						            	</tr>
	                        <tr>
	                            <th><label for="phone">휴대전화</label></th>
	                            <td>
							                <input type="text" id="memHp1" name="hp1" size="3" class="hp" 
							                       value="" required> 
							                - <input type="text" id="memHp2" name="hp2" size="4" class="hp" 
							                         value="" required>
							                - <input type="text" id="memHp3" name="hp3" size="4" class="hp" 
							                         value="" required>
							            		</td>
	                        </tr>
	                        <tr>
	                            <th><label for="memEmail">이메일</label></th>
	                            <td>
	                                <input type="text" id="memEmail" name="memEmail" placeholder="이메일 입력" autocomplete="off" required>
	                                @
	                                <select id="emailDomain" name="emailDomain">
	                                    <option value="">도메인 선택</option>
													            <option value="naver.com">naver.com</option>
													            <option value="daum.net">daum.net</option>
													            <option value="gmail.com">gmail.com</option>
													            <option value="nate.com">nate.com</option>
													            <option value="hanmail.net">hanmail.net</option>
													            <option value="kakao.com">kakao.com</option>
													            <option value="custom">직접 입력</option>
	                                </select>
	                            </td>
	                        </tr>
	                        <tr><th>배송 메시지</th>
	        		  		  <td><select id="ordRcvMsg" name="ordRcvMsg">
	        		  		 		<option value="배송 전 전화주세요">배송 전 전화주세요</option>
	        		  		 		<option value="부재시 경비실에 맡겨주세요">부재시 경비실에 맡겨주세요</option>
	        		  		 		<option value="부재시 문앞에 놓고 가세요">부재시 문앞에 놓고 가세요</option>       		  		 		
	        		  		      </select>
	        		  		  </td>
	        		  	    </tr>
	                    </table>
	           		 </div>
	              
	               	<!-- 결제 방법 -->
	               	<br>
	               	<h2>결제 방법</h2>
						<div class="payment">
						    <ul class="payment-methods">
							  <li class="payment-option" data-value="card" id="creditCardOption">
								<img src="/images/card.png" alt="신용카드">
								<span>신용카드</span>
							  </li>
							  <li class="payment-option" data-value="bank">
							    <img src="/images/bank.png" alt="무통장 입금">
								<span>무통장 입금</span>
							  </li>
							  <li class="payment-option" data-value="realtime">
								<img src="/images/realtime.png" alt="실시간계좌 이체">
								<span>실시간계좌 이체</span>
							  </li>
							  <li class="payment-option" data-value="mobile">
								<img src="/images/mobile.png" alt="휴대폰 결제">
								<span>휴대폰 결제</span>
							  </li>
							  <li class="payment-option" data-value="kakao">
								<img src="/images/kakao.png" alt="카카오페이">
								<span>카카오페이</span>
							  </li>
							  <li class="payment-option" data-value="naver">
								<img src="/images/naver.png" alt="네이버페이">
								<span>네이버페이</span>
							  </li>
							  <li class="payment-option" data-value="samsung">
								<img src="/images/samsung.png" alt="삼성페이">
								<span>삼성페이</span>
							  </li>
							  <li class="payment-option" data-value="payco">
								<img src="/images/payco.png" alt="페이코">
								<span>페이코</span>
							  </li>
							 </ul>
							 <input type="hidden" name="ordPay" id="ordPayInput">
					   </div>
	            </div>
	         	<!-- 창 우측 -->
	           <div class="area-right">
		            <!-- 주문 내역 -->
		           	<div class="order-summary">
		           	<c:set var="totalPrice" value="0" />                   
                        <c:set var="totalShipping" value="2500" />
                    
                        <c:forEach var="prd" items="${cartList}">
                        <span class="amount" data-amount="${prd.prdPrice * prd.cartQty}">
                            <c:set var="amount" value="${prd.prdPrice * prd.cartQty}" />
                            <c:set var="totalPrice" value="${totalPrice + amount}" />
                            <c:choose>
                              <c:when test="${totalPrice >= 50000}">
                                <c:set var="totalShipping" value="0" /> 
                              </c:when>
                            </c:choose>
                        </span>
                        </c:forEach>
						<!-- 정보 박스 -->
						<div class="info-box payment-info">
							<div>
							<h3>결제 정보</h3>
							<table class="summary-table">
							  <tr>
								<th>총 상품금액</th>
								<td><fmt:formatNumber value="${totalPrice}" type="number"/>원</td>
							  </tr>
							  <tr>
								<th>배송비</th>
								<td>
							    <c:choose>
								  <c:when test="${totalShipping == 0}">
									무료
								  </c:when>
								  <c:otherwise>
									 <fmt:formatNumber value="${totalShipping}" type="number"/>원
								  </c:otherwise>
								</c:choose>
								</td>
							  </tr>
							</table>
						</div>
									
						<div class="info-box total-info">
						<dl>
						  <dt>총 결제 금액</dt>
							<dd><fmt:formatNumber value="${totalPrice + totalShipping}" type="number"/>원</dd>
						</dl>
						</div>
					</div>
								    
					<!-- 버튼 그룹 -->
					<div class="button-group">
					  <button type="submit" id="submit-button" class="btn">결제하기</button>
					  <button type="submit" id="cancel-button" class="btn">취소</button>
					</div>
				</div> 
			</div> 		    
	         	 
	         	 
	         	 
	         	 <!-- 내꺼 -->	
	         
	        		<!-- (1) 주문자 정보 -->
	        		<!-- 
	        		<h3>주문하시는 분</h3>
	        		<table class="ordInfoTable" width="800">
	        			<tr><th>주문자</th>
	        					<td width="200">${memVo.memName}
	        						<input type="hidden" name="memId" value="${memVo.memId}"></td>
	        					<th>연락처</th>
	        					<td>${hp1} - ${hp2} - ${hp3}</td></tr>
	        		</table><br> -->
	        	
	        		<!-- (2) 수령인 정보 -->
	        		<!-- 
	        		<h3>받으시는 분</h3>
	        		<table class="ordInfoTable" width="800">
	        			<tr><th>수령인</th>
	        						<td width="200">
	        						  <input type="text" id="ordRcvReceiver" name="ordRcvReceiver" value="${memVo.memName}">
	        						</td>
	        					<th>연락처</th>
	        						<td>
	        							<input type="text" name="hp1" value="${hp1}" size="3"> - 
	        							<input type="text" name="hp2" value="${hp2}" size="4"> - 
	        							<input type="text" name="hp3" value="${hp3}" size="4"></td></tr>
	        			<tr><th>배송지 주소</th>
	        					<td colspan="3">
			        				<input type="text" id="memZipcode" name="ordRcvZipcode" size="5" 
			        					         value="${memVo.memZipcode}">
				            		<input type="button" id="searchZipBtn" name="searchZipBtn" value="우편번호 찾기"><br>
				            		<input type="text" id="memAddress1" name="ordRcvAddress1" placeholder="주소 입력" size="70" 
				            		             value="${memVo.memAddress1}"> <br>
				            		<input type="text" id="memAddress2" name="ordRcvAddress2" placeholder="상세 주소 입력" size="70"
				            		             value="${memVo.memAddress2}" >
	        					</td></tr>
	        		  <tr><th>배송 메시지</th>
	        		  		 <td colspan="3"><select name="ordRcvMsg">
	        		  		 		<option value="배송 전 전화주세요">배송 전 전화주세요</option>
	        		  		 		<option value="부재시 경비실에 맡겨주세요">부재시 경비실에 맡겨주세요</option>
	        		  		 		<option value="부재시 문앞에 놓고 가세요">부재시 문앞에 놓고 가세요</option>       		  		 		
	        		  		 		</select></td></tr>
	        		</table><br> -->
	                              
	        		<!-- (3) 주문 상품 목록-->
	        		<!-- 
	        		<table class="orderProductTable" width="800">						
						<tr>							
							<th>이미지</th>
							<th id="prdInfo">상품정보</th>
							<th id="prdAmount">수량</th>
							<th>상품구매금액</th>
							<th>적립금</th>
							<th>배송구분</th>
						</tr>		
										
						<c:set var="totalPrice" value="0" />                   
                        <c:set var="totalShipping" value="2500" />
                    
                        <c:forEach var="prd" items="${cartList}">
                        <span class="amount" data-amount="${prd.prdPrice * prd.cartQty}">
                            <c:set var="amount" value="${prd.prdPrice * prd.cartQty}" />
                            <c:set var="totalPrice" value="${totalPrice + amount}" />
                            <c:choose>
                              <c:when test="${totalPrice >= 50000}">
                                <c:set var="totalShipping" value="0" /> 
                              </c:when>
                            </c:choose>
                        </span>
                        </c:forEach>
                        
						<c:forEach var="prd" items="${cartList}">
							<tr>														
								<td><img src="<c:url value='/project_images/${prd.prdImage}' />"></td>
								<td class="name"><a href="#">${prd.prdName}</a><br>								
								<td class="quantityWrap">				
								  <input type="text" value="${prd.cartQty}" class="quantity" min="1" readonly>								                        
								</td>
								<td class="price" data-price="${prd.prdPrice}" data-amount="${prd.prdPrice * prd.cartQty}"> 
								   <fmt:formatNumber value="${prd.prdPrice * prd.cartQty}" pattern="#,###" /> 원
								</td>
								<td class="points" data-points="${prd.prdPrice * prd.cartQty * 0.01 }">
								   <fmt:formatNumber value="${prd.prdPrice * prd.cartQty * 0.01 }" pattern="#,###" /> 원
								</td>
								<td class="totalShipping">기본배송<br><fmt:formatNumber value="${totalShipping}" pattern="#,###" />원</td>																
							</tr>						
                            <input type="hidden" name="cartNos" value="${prd.cartNo}" />  	            
						</c:forEach>	
																	
					</table>					
						
              <div class="container">
                  <div class="left">    

				<h3>결제 정보</h3>
				<table class="orderTable2" id="domesticOrderTable" width="800">				   
					<tbody>
					    
						<tr>
							<td id="tableId">상품 합계 금액</td>
							<td class="totalPrice"><fmt:formatNumber value="${totalPrice}" pattern="#,###" />원</td>
						</tr>
						<tr>
							<td id="tableId">배송비</td>
							<td class="totalShipping"><fmt:formatNumber value="${totalShipping}" pattern="#,###" />원</td>
						</tr>
						<tr>
							<td id="tableId">최종 결제 금액</td>
							<td class="totalAmount"><fmt:formatNumber value="${totalPrice + totalShipping}" pattern="#,###" />원</td>
						</tr>
					</tbody>
				</table>
				<br> -->

				<!-- (4) 결제 수단 (결제 방법 선택) -->
				<!-- 
                <h3>결제 수단</h3>
				<table class="ordPayTable" width="800">				
					<tr>
						<td id="ordPays">결제 수단</td>
						<td><input type="radio" name="ordPay" value="card" style="vertical-align: middle">신용카드&nbsp;
							<input type="radio" name="ordPay" value="bank" style="vertical-align: middle">계좌이체&nbsp;
							<input type="radio" name="ordPay" value="phone" style="vertical-align: middle">휴대폰결제&nbsp; 
							<input type="radio" name="ordPay" value="kakaopay" style="vertical-align: middle">
							  <img src="<c:url value='/image/kakao.png'/>" id="kakao" style="vertical-align: middle">&nbsp; 
							<input type="radio" name="ordPay" value="payco" style="vertical-align: middle">
							  <img src="<c:url value='/image/payco.jpg'/>" id="payco" style="vertical-align: middle">
						</td>
					</tr>
				</table>
				</div>
				</div>
				<br>

				    <div class="orderBtn">
	        	      <input id="submit" type="submit" value="주문 완료">
	        		  <button id="cancelBtn" type="button" onclick="location.href='/myPage/cartList'">주문 취소</button>
	        	    </div>	   -->     		
        		</form><br>
        	</section>
        	
        	 <!--  bottom -->         
        	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
      </div>		
	</body>
</html>