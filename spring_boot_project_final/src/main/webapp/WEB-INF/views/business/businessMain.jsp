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
			<section class="cards">
         <div id="seaFishing" class="card">
         		<div class="card-content">
	             <h2>바다낚시</h2>
	             <p>바다낚시 관련 상품과 판매 내역을 관리하세요.</p>
	             <a href="<c:url value='/business/dashboard'/>" class="btn">자세히 보기</a>
            </div>
         </div>
         <div id="freshWaterFishing" class="card">
         		<div class="card-content">
	             <h2>민물낚시</h2>
	             <p>민물낚시 관련 상품과 판매 내역을 관리하세요.</p>
	             <a href="<c:url value='/business/dashboard'/>" class="btn">자세히 보기</a>
	           </div>  
         </div>
         <div id="sale" class="card">
        		 <div class="card-content">
	             <h2>상품 판매</h2>
	             <p>상품 판매 관련 관리 및 분석을 진행하세요.</p>
	             <%-- <c:set var="bizId" value="${loggedInUser.bizId}" />
	             <a href="<c:url value='/product/productManagement?bizId=${bizId}'/>" class="btn">자세히 보기</a> --%>
	             <a href="<c:url value='/product/productManagement'/>" class="btn">자세히 보기</a>
	           </div> 
         </div>
        </section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>