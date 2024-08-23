<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>바다 낚시터</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/fishingSpotList.css'/>" />
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section class="content-container">
				<h1>바다 낚시</h1>
	
				<!-- 전체 콘텐츠 컨테이너 -->
				<div class="main-content">
					<!-- 왼쪽 낚시터 리스트 영역 -->
					<div class="spots-list">
						<c:forEach var="spot" items="${spots}">
							<a href="<c:url value='/detailFishingSpot/${spot.spotId}'/>">
								<div class="spot-container">
									<img class="spot-image"
										src="<c:url value='/project_images/${spot.spotImage}'/>"
										alt="${spot.spotName}">
									<div class="spot-info">
										<div class="spot-name">${spot.spotName}</div>
										<div class="spot-location">${spot.spotAddress1}</div>
										<div class="spot-price">${spot.spotPrice}원</div>
									</div>
								</div>
							</a>
						</c:forEach>
					</div>
	
					<!-- 필터 옵션 추가 필요 -->
					<div class="filter-container">
						<div class="filter-section">
							<button class="filter-button">필터</button>
							<div class="distance-dropdown">
								<select>
									<option>500km</option>
									<option>300km</option>
									<option>100km</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</section>
		<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>