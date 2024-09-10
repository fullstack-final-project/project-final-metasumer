<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문 완료</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/orderComplete.css'/>">
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
			    <div id="orderComplete">
			      <img src="<c:url value='/image/order.png'/>" id="order">
			      <div id="orderDetail">
			        <h3>고객님의 주문이 완료되었습니다.</h3>		
				    <p>주문번호 : <span id="orderNumber">${ordNo}</span></p>
				    <p>주문일자 : <span id="orderDate">${ordDate}</span></p>		  
			      </div>				  
			    </div>
			    <div id="orderCompleteBtn">
			      <button id="continueBtn" onclick="location.href='/product/productList'">쇼핑 계속하기</button>
			      <button id="homeBtn" onclick="location.href='/'">홈으로</button>
			    </div>
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
