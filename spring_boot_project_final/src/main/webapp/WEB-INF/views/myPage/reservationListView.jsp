<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>나의 예약</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/reservationList.css'/>">
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
			      <div id="resTitle">
			        <p>나의 예약</p><hr>			        
			      </div>
			  </div>
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
