<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><c:choose>
        <c:when test="${type == 'freshwater'}">민물 낚시터</c:when>
        <c:when test="${type == 'saltwater'}">바다 낚시터</c:when>
    </c:choose></title>
    <!-- head.jsp import -->
    <c:import url="/WEB-INF/views/layout/head.jsp"></c:import>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCp5LcoJxmqP5HCq3P2BlobxQosmoxDlnE"></script>
    <script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=FjQe56N5sRMOtvgcvWwMTodvHGPmJqNJpMxNRbOS"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/fishingSpotList.css'/>" />
    <script src="<c:url value='/js/fishingSpotList.js'/>"></script>
</head>
<body>
    <div id="wrap">
        <!-- top.jsp import -->
        <c:import url="/WEB-INF/views/layout/top.jsp"></c:import>
        <section class="content-container">
            <h1><c:choose>
                <c:when test="${type == 'freshwater'}">민물 낚시터</c:when>
                <c:when test="${type == 'saltwater'}">바다 낚시터</c:when>
            </c:choose></h1>

            <!-- 전체 콘텐츠 컨테이너 -->
            <div class="main-content">
                <!-- 왼쪽 낚시터 리스트 영역 -->
                <div class="spots-list">
                    <c:forEach var="spot" items="${spots}">
                            <div class="spot-container" data-spotId="${spot.spotId}">
                       				 <a href="<c:url value='/detailFishingSpot/${spot.spotId}?bizId=${spot.bizId}'/>">
	                                <img class="spot-image"
	                                    src="<c:url value='/project_images/${spot.spotImage}'/>"
	                                    alt="${spot.spotName}">
	                                <div class="spot-info">
	                                    <div class="spot-name">${spot.spotName}</div>
	                                    <div class="spot-location">${spot.spotAddress1}</div>
	                                    <div class="spot-price">${spot.spotPrice}원~</div>
	                                </div>
                        				</a>
                            </div>
                    </c:forEach>
                </div>
                
								
                <!-- 필터 옵션 -->
                <div class="filter-container">
                    <div class="filter-section">
				                <button id="open-map-modal" class="btn btn-primary">위치 설정</button>
                        <div class="filter-dropdown">
                            <select id="filter-options">
                            		<option value="default">기본순</option>
								                <option value="distance">거리순</option>
								                <option value="price-desc">높은 가격순</option>
								                <option value="price-asc">낮은 가격순</option>
								            </select>
                        </div>
                    </div>
                </div>
                
                <!-- 위치 설정 모달 -->
								<div id="locationModal" class="modal" style="display:none;">
							    <div class="modal-content">
							        <span class="close">&times;</span>
							        <h2>위치 설정</h2>
							        
							        <!-- 검색 입력 창 -->
							        <div class="modal-controls">
							            <input id="modal-searchBox" type="text" placeholder="위치 검색">
							            <button id="modal-searchButton">검색</button>
							        </div>
							
							        <!-- 나의 위치 버튼 -->
							        <button id="set-current-location" class="btn btn-secondary">나의 위치</button>
							        
							        <!-- 지도 표시 -->
							        <div id="map" style="height: 400px; width: 100%; margin-top: 10px;"></div>
							
							        <!-- 저장 버튼 -->
							        <button id="saveLocation" class="btn btn-primary">위치 설정</button>
							    </div>
							</div>
            </div>
        </section>
        <!-- bottom.jsp import -->
        <c:import url="/WEB-INF/views/layout/bottom.jsp"></c:import>		
    </div>
</body>
</html>
