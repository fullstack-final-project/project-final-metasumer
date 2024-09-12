<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문내역</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/orderList.css'/>">
	    <script src="/js/orderList.js"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
			  <div id="orderContainer">
			    <div id="hiMemInfo">
			      <span class="hiMessage">반가워요!</span><span> ${memVo.memName}님</span>
			      <p>최초 1회 무료배송</p>
			      <div id="pointsInfo">
			        <p>적립금</p>
			        <div id="pointsSum">0원</div>
			        <div id="eventGoWrapper">
                      <div id="eventGo">
                       <span>이벤트 확인하러 가기</span><span id="mark">></span>
                      </div>
                    </div>                    
			      </div>
			    </div>
			    <div id="orderList">
			      <div id="orderFilter">
			        <p>주문 내역</p><hr>
			        <button data-period="3m" class="active">3개월</button>
			        <button data-period="6m">6개월</button>
			        <button data-period="1y">1년</button>
			        <button data-period="3y">3년</button>
			      </div>
			      <div id="orderListView">
			        <c:if test="${empty orderList}">
			          <div class="noOrderView">
			            <img src="<c:url value='/image/noOrder.png' />">
			            <p>주문 내역이 없습니다.</p>
			            <button>베스트 상품 보기</button>
			          </div>
			        </c:if>
			        <c:if test="${not empty orderList}">
			          <c:set var="prevOrdNo" value="" />
			          <c:set var="totalPrice" value="0" />
			          <c:forEach var="ord" items="${orderList}">				           
			            <div class="ordListInfo">
			              <!-- 주문번호에서 날짜 부분을 추출 -->
                          <c:set var="currentDate" value="${ord.ordNo.substring(0, 8)}" />
                          <!-- 주문번호 저장 -->
                          <c:set var="currentOrdNo" value="${ord.ordNo}" />

                          <!-- 이전 주문번호와 현재 주문번호가 다를 때만 출력 -->
                          <c:if test="${prevOrdNo != currentOrdNo}">
                            <!-- 날짜 출력 -->
                            <h3>${currentDate.substring(0, 4)}.${currentDate.substring(4, 6)}.${currentDate.substring(6, 8)}</h3><hr>                                                
                          </c:if>		                          				         
			              <div class="ordListDetail">
			                <img src="<c:url value='/project_images/${ord.prdImage}' />">
			                <div class="ordDescription">
			                  <table class="ordNameInfo">
			                    <thead>
			                      <tr>							
							       <th>상품명</th>
							       <th>주문번호</th>
							       <th>구매수량</th>
							       <th>결제금액</th>							     
						          </tr>	
						        </thead>
						        <tbody>
						          <tr>
			                        <td><a href="#">${ord.prdName}</a></td>
			                        <td>${ord.ordNo}</td>
			                        <td>${ord.ordQty}</td>                                                                       
			                        <td><fmt:formatNumber value="${ord.prdPrice * ord.ordQty}" pattern="#,###" />원</td>
			                      </tr>
						        </tbody>		                    			                   
			                  </table>			              
			                  
			                </div>
			                <button class="inquiryBtn" onclick="location.href='/freeboard/freeboardView/4'">1:1 문의</button>
			              </div>
			            </div>
			            <c:set var="prevOrdNo" value="${currentOrdNo}" />
			          </c:forEach>				         
			        </c:if>			       				        			        		          				         
			      </div>			      
			    </div>
			  </div>
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
