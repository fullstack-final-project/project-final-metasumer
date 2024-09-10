<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>나의 예약</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/reservationList.css'/>">
		<script src="/js/reservationList.js"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
			  <div id="resContainer">
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
			    <div id="resList">
			      <div id="resFilter">
			        <p>나의 예약</p><hr>	
			        <button data-period="3m" class="active">3개월</button>
			        <button data-period="6m">6개월</button>
			        <button data-period="1y">1년</button>
			        <button data-period="3y">3년</button>		        
			      </div>
			      <div id="resListView">
			        <c:if test="${empty reservationList}">
			          <div class="noOrderView">
			            <img src="<c:url value='/image/noOrder.png' />">
			            <p>주문 내역이 없습니다.</p>
			            <button>베스트 상품 보기</button>
			          </div>
			        </c:if>
			        <c:if test="${not empty reservationList}">			        
			          <c:forEach var="res" items="${reservationList}">	
			            <div class="resListInfo">		              
			              <h3><fmt:formatDate value="${res.resDate}" pattern="yyyy.MM.dd" /></h3><hr>
			              
			              <div class="resListDetail">
			                <img src="<c:url value='/project_images/${res.spotImage}' />">
			                <div class="resDescription">
			                  <table class="resNameInfo">
			                    <thead>
			                      <tr>							
							       <th>예약장소</th>
							       <th>예약자명</th>
							       <th>예약인원</th>
							       <th>예약시간</th>
							       <th>결제금액</th>							     
						          </tr>	
						        </thead>
						        <tbody>
						          <tr>
			                        <td><a href="#">${res.spotName}</a></td>
			                        <td>${res.memName}</td>
			                        <td>${res.resNum}</td>
			                        <td>${res.resStart}~${res.resEnd}</td>
			                        <td><fmt:formatNumber value="${res.resPrice}" pattern="#,###" />원</td>
			                      </tr>
						        </tbody>		                    			                   
			                  </table>			              
			                  
			                </div>
			                <button class="inquiryBtn" onclick="location.href='/freeboard/freeboardView/4'">1:1 문의</button>
			              </div>
			            </div>
			          </c:forEach>
			        </c:if>
			      </div>
			  </div>
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
