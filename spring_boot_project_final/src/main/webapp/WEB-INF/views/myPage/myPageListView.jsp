<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>		
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
		<script src="/js/myPageChart.js"></script>		
		<script src="/js/myPagePagination.js"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
			  <header>
			    <h2>마이페이지</h2>
			  </header>
			  <div class="myPageCtg">
			    <div id='myPageCtgBtn'>
			      <button class='myPageBtn' data-category='1' onclick="location.href='/myPage/checkPwdForm'">회원 정보 수정</button>
			      <button class='myPageBtn' data-category='2' onclick="location.href='/myPage/cartList'">장바구니</button>
			      <button class='myPageBtn' data-category='3' onclick="location.href='/myPage/reservation'">나의 예약</button>
			    </div>
			    <div id='myPageCtgBtn'>
			      <button class='myPageBtn' data-category='4' onclick="location.href='/myPage/orderList'">주문 내역</button>
			      <button class='myPageBtn' data-category='5'>나의 이벤트 참여 현황</button>			      
			      <button class='myPageBtn' data-category='6' onclick="location.href='/myPage/myFishingSuccess'">나의 낚시 성공률</button>
			    </div>			    
			  </div>
			  <div id="graph-container">
			    <div id="myPageGraphTitle">
			      <p>나의 물고기 그래프</p>
			    </div>			    
                <button id="countGraph">월간 낚시 총합</button>
                <button id="sizeGraph">물고기 크기</button>
			  </div>			  			  
			  <div id="myPageGraph">
			    <canvas id="myChart1" width="100%" height="40%" style="display:none;"></canvas>
			    <canvas id="myChart2" width="100%" height="40%"></canvas>
			  </div>
			  <div id="myPageSub">
			    <p>나의 물고기 기록</p>
			    
			  </div>					  			  
			    <div id="myPageSlide-container">
			      <div id="prevButtonBox">
			        <img id="prevButton" src="/image/prevButton2.png">			                  
                  </div>
                
			      <div id="myPageSlide-panel">
			        <div class="fish-container">	
			          <!-- ajax -->
				    </div>
			      </div>
			      <div id="nextButtonBox">
			        <img id="nextButton" src="/image/nextButton2.png">			              
                  </div>
			 	</div>	
			 	<div id="showAll">
			 	  <a class="showBtn" href="<c:url value='/myFishRecords/myFishRecordsList'/>">나의 물고기 기록 모두보기 ></a>	  
			    </div>
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
