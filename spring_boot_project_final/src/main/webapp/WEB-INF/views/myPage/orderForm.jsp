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
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/orderForm.css'/>">
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/searchZip.js'/>"></script>
		<script src="/js/cart.js"></script>
	</head>
	<body>
		<div id="wrap">
        	<!--  top -->         
        	<c:import url="/WEB-INF/views/layout/top.jsp" />
        	
        	<section>
        		<br>
        		<form id="orderForm" method="post" action="<c:url value='/myPage/orderComplete'/>">	 
        		   		
	        		<!-- (1) 주문자 정보 -->
	        		<h3>주문하시는 분</h3>
	        		<table class="ordInfoTable" width="800">
	        			<tr><th>주문자</th>
	        					<td width="200">${memVo.memName}
	        						<input type="hidden" name="memId" value="${memVo.memId}"></td>
	        					<th>연락처</th>
	        					<td>${hp1} - ${hp2} - ${hp3}</td></tr>
	        		</table><br>
	        	
	        		<!-- (2) 수령인 정보 -->
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
	        		</table><br>
	                              
	        		<!-- (3) 주문 상품 목록-->
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
				<br>

				<!-- (4) 결제 수단 (결제 방법 선택) -->
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
	        	    </div>	        		
        		</form><br>
        	</section>
        	
        	 <!--  bottom -->         
        	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
      </div>
		
	</body>
</html>