<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${spot.spotName} - 상세 정보</title>
    <!-- head.jsp import -->
    <c:import url="/WEB-INF/views/layout/head.jsp" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/fishingSpotDetail.css'/>" />
    <script src="<c:url value='/js/fishingSpotDetail.js'/>"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=FjQe56N5sRMOtvgcvWwMTodvHGPmJqNJpMxNRbOS"></script>
    
    <!-- FullCalendar 관련 CSS와 JS 로드 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/locale/ko.min.js"></script>
</head>
<body>
    <div id="wrap">
        <!-- top.jsp import -->
        <c:import url="/WEB-INF/views/layout/top.jsp"></c:import>
        <form id="areaSelectionForm" method="post" action="/order/reservationOrder">
	        <main class="content-container">
	            <!-- 낚시터 기본 정보 섹션 -->
	            <section class="spot-basic-info">
	                <div class="spot-image">
	                    <img src="<c:url value='/project_images/${spot.spotImage}'/>" alt="${spot.spotName}">
	                </div>
	                <div class="spot-details">
	                    <h1>${spot.spotName}</h1>
	                    <p class="address">${spot.spotAddress1} ${spot.spotAddress2}</p>
	                    <p class="price">가격: ${spot.spotPrice}원~</p>
	                    <p class="hours"><fmt:formatDate value="${spot.openingTime}" pattern="HH:mm" />
	                        - 
	                        <fmt:formatDate value="${spot.closingTime}" pattern="HH:mm" /></p>
	                </div>
	            </section>
	            
	            <!-- 달력 부분 -->
	            <div>
	                <div id="calendar"></div>
	            </div>
	            
	            <!-- 인원 선택 -->
	            <section class="reservation-info">
	                <h3>예약 인원 선택</h3>
	                <label for="resNum">인원 수:</label>
	                <input type="number" id="resNum" name="resNum" min="1" max="10" value="1">
	            </section>
	            
	            <!-- 낚시터 구역 정보 섹션 -->
	            <section class="spot-areas">
	                <h2>상품 정보</h2>
	                <c:forEach var="area" items="${areas}">
	                    <div class="area-item" data-checkbox-id="area_${area.areaId}">
	                        <h3>${area.areaName}</h3>
	                        <p>가격: ${area.areaPrice}원</p>
	                        <p>최소 인원 ${area.minCapacity}명 / 최대 인원 ${area.maxCapacity}명</p>
	                        <p>어종: ${area.fishType}</p>
	                        <p><fmt:formatDate value="${area.startTime}" pattern="HH:mm" /> - <fmt:formatDate value="${area.endTime}" pattern="HH:mm" /></p>
	                    </div>
	                </c:forEach>
	            </section>
	            
	            <!-- 낚시터 설명 섹션 -->
	            <section class="spot-description">
	                <h2>낚시터 설명</h2>
	                <p>${spot.spotDescription}</p>
	            </section>
	
	            <!-- 시설 정보 섹션 -->
	            <section class="spot-facilities">
	                <h2>시설 정보</h2>
	                <p>${spot.spotFacility}</p>
	            </section>
	        </main>
        
        <section class="bottom-section">
            <!-- 모달 버튼 -->
            <button type="button" id="productSelectionButton" class="modal-button">상품 선택</button>
        </section>
        
        <!-- 모달 창 -->
        <div id="areaModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <div class="modal-body">
                    <h2>상품 선택</h2>
                        <!-- 상품 목록 표시 -->
                        <c:forEach var="area" items="${areas}">
												  <div class="area-item-modal" onclick="toggleCheckbox('area_${area.areaId}')">
												      <input type="checkbox" id="area_${area.areaId}" name="selectedAreas" value="${area.areaId}">
												      <label for="area_${area.areaId}">
												          <strong>${area.areaName}</strong><br>
												          가격: ${area.areaPrice}원<br>
												          최소 인원: ${area.minCapacity}명<br>
												          최대 인원: ${area.maxCapacity}명<br>
												          어종: ${area.fishType}<br>
												          시간: <fmt:formatDate value="${area.startTime}" pattern="HH:mm" /> - <fmt:formatDate value="${area.endTime}" pattern="HH:mm" />
												      </label>
												  </div>
												</c:forEach>
                </div>
	                <input type="hidden" name="spotId" value="${spot.spotId}">
									<input type="hidden" id="selectedAreas" name="" />
									<input type="hidden" id="resQuantity" name="resQuantity" />
									<input type="hidden" id="resDate" name="resDate" />
									<input type="hidden" id="resNum" name="resNum" />
									<input type="hidden" name="bizId" value="${bizId}">
                <div class="confirmSelection">
                    <button type="button" id="confirmSelectionBtn">상품 선택</button>
                </div>
            </div>
        	</div>
        	
        </form>
    </div>
</body>
</html>
