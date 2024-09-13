<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사업자 메인 페이지</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/businessMain.css'/>" />
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				<header>
			    <h2>사업자 페이지</h2>
			  </header>
				<div class="bizPageCtg">
			    <div id='bizPageCtgBtn'>
			      <button class='bizPageBtn' onclick="location.href='/business/fishingSpotManagement?bizId=${bizId}'">낚시터 관리</button>
			      <button class='bizPageBtn' onclick="location.href='/business/dashboard?bizId=${bizId}'">예약확인</button>
			      <button class='bizPageBtn' onclick="location.href='/product/productManagement?bizId=${bizId}'">상품판매 관리</button>
			      <button class='bizPageBtn' onclick="location.href='/memberOcr/businessAuth'">업체 등록</button>
			    </div>
			  </div>
        </section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>