<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 결제</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/productOrder.css'/>" />
    
    <script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
    <script src="<c:url value='/js/productOrder.js'/>"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/searchZip.js'/>"></script>
    <!-- head.jsp import -->
    <c:import url="/WEB-INF/views/layout/head.jsp"></c:import>
</head>
<body>
    <div id="wrap">
        <c:import url="/WEB-INF/views/layout/top.jsp"></c:import>

        <section>
        	<form id="order-form" action="<c:url value='/order/productCompletes'/>" method="post">
        		<input type="hidden" id="prdNo" name="prdNo" value="${product.prdNo}">
        		<input type="hidden" id="bizId" name="bizId" value="${bizId}">
        		<input type="hidden" name="prdPrice" value="${product.prdPrice}" />
				    <input type="hidden" name="quantity" value="${quantity}" />
				    <input type="hidden" name="deliveryCost" value="${deliveryCost}" />
				    <input type="hidden" name="finalTotalPrice" value="${finalTotalPrice}" />
	        	<!-- 상품 정보 -->
	          <div class="product-summary">
	              <h2>상품 정보</h2>
	              <table class="product-table">
	                  <tr>
	                      <th colspan="2">상품정보</th>
	                      <th>상품금액</th>
	                      <th>수량</th>
	                      <th>총 상품금액</th>
	                  </tr>
	                  <tr>
	                      <td class="img">
	                      	<div style="padding: 10px 0;">
						                <img class="product-image" src="<c:url value='/project_images/${product.prdImage}'/>" alt="${product.prdName}">
				                	</div>
				                </td>
				                <td class="product-name">
						                <span class="product-name">${product.prdName}</span>
						            </td>
	                      <td class="product-price"><fmt:formatNumber value="${product.prdPrice}" type="number"/>원</td>
	                      <td class="product-quantity">${quantity}</td>
	                      <td class="product-total"><fmt:formatNumber value="${productTotal}" type="number"/>원</td>
	                  </tr>
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
	                        <td><input type="text" id="ordererName" name="ordererName" value="${member.memName}" required readonly></td>
	                    </tr>
	                    <tr>
	                    		<th><label for="ordererPhone">휴대전화</label></th>
							            <td>
							                <input type="text" id="ordererHp1" name="ordererHp1" size="3" class="hp" 
							                       value="${fn:substring(member.memHP, 0, 3)}" readonly required> 
							                - <input type="text" id="ordererHp2" name="ordererHp2" size="4" class="hp" 
							                         value="${fn:substring(member.memHP, 4, 8)}" readonly required>
							                - <input type="text" id="ordererHp3" name="ordererHp3" size="4" class="hp" 
							                         value="${fn:substring(member.memHP, 9, 13)}" readonly required>
							            </td>
	                    </tr>
	                    <tr>
	                        <th><label for="ordererEmail">이메일</label></th>
	                        <td><input type="email" id="ordererEmail" name="ordererEmail" value="${member.memEmail}" required readonly></td>
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
	                            <td><input type="text" id="recipient" name="ordRcvReceiver" required>
	                                <input type="hidden" name="memId" value="${member.memId}">
	                            </td>
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
	           		 </div><br>
	              
	               	<!-- 결제 방법 -->
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
								    <!-- 정보 박스 -->
								    <div class="info-box payment-info">
									    <div>
									        <h3>결제 정보</h3>
									        <table class="summary-table">
									            <tr>
									                <th>총 상품금액</th>
									                <td><fmt:formatNumber value="${productTotal}" type="number"/>원</td>
									            </tr>
									            <tr>
									                <th>배송비</th>
									                <td>
									                    <c:choose>
									                        <c:when test="${deliveryCost == 0}">
									                            무료
									                        </c:when>
									                        <c:otherwise>
									                            <fmt:formatNumber value="${deliveryCost}" type="number"/>원
									                        </c:otherwise>
									                    </c:choose>
									                </td>
									            </tr>
									        </table>
									    </div>
									
									    <div class="info-box total-info">
									        <dl>
									            <dt>총 결제 금액</dt>
									            <dd><fmt:formatNumber value="${finalTotalPrice}" type="number"/>원</dd>
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
					</form>
				
        </section>

        <c:import url="/WEB-INF/views/layout/bottom.jsp"></c:import>
    </div>
</body>
</html>
