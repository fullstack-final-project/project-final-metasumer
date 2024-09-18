<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>낚시터 상품 관리</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" href="<c:url value='/css/fishingSpotAreaManagement.css'/>">
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				<div class="container">
	        <h1>${spotName}</h1>
	        <button onclick="location.href='/business/fishingSpotAreaRegister?spotId=${spotId}'">상품 등록</button>
	        <div id="fishingSpotAreaList">
            <c:forEach var="area" items="${areas}">
                <div class="fishingSpotAreaBox">
                    <h2>${area.areaName}</h2>
                    <p>가격: ${area.areaPrice}</p>
                    <p>최소 인원 ${area.minCapacity}명 / 최대 인원 ${area.maxCapacity}명</p>
                    <p>어종: ${area.fishType}</p>
                    <p><fmt:formatDate value="${area.startTime}" pattern="HH:mm" /> - <fmt:formatDate value="${area.endTime}" pattern="HH:mm" /></p>
                    <div class="btn-group">
	                    <button onclick="location.href='/business/fishingSpotAreaUpdate?areaId=${area.areaId}'" class="btn">수정</button>
	                    <button onclick="if(confirm('정말 삭제하시겠습니까?')) location.href='/business/deleteFishingSpotArea?areaId=${area.areaId}&spotId=${spotId}'" class="btn">삭제</button>
                		</div>
                </div>
            </c:forEach>
	   		 </div>
	   		</div>
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>