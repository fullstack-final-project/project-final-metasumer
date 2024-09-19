<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>낚시터 관리</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" href="<c:url value='/css/fishingSpotManagement.css'/>">
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				<div class="container">
	        <h1>${business.businessName}</h1>
	        <button onclick="location.href='/business/fishingSpotRegister?bizId=${bizId}'" id="reg-btn">낚시터 등록</button>
	        <div class="spots-list">
                <c:forEach var="spot" items="${fishingSpots}">
                      <div class="spot-container" onclick="location.href='/business/fishingSpotAreaManagement?spotId=${spot.spotId}'">
                           <img class="spot-image"
                               src="<c:url value='/project_images/${spot.spotImage}'/>"
                               alt="${spot.spotName}">
                           <div class="spot-info">
                               <div class="spot-name">${spot.spotName}</div>
                               <div class="spot-location">${spot.spotAddress1}</div>
                               <div class="spot-price">${spot.spotPrice}원~</div>
                           </div>
                           <div class="spot-btn">
													    <button onclick="event.stopPropagation(); location.href='/business/fishingSpotUpdate?spotId=${spot.spotId}&bizId=${bizId}'"
													    				class="spot-btn btn">수정</button>
               								<button onclick="event.stopPropagation(); deleteSpot(${spot.spotId}, ${bizId})"
               												class="spot-btn btn">삭제</button>
													</div>
                        </div>
                </c:forEach>
            </div>
            <script>
						    // 삭제 기능을 처리하는 함수
						    function deleteSpot(spotId, bizId) {
						        if (confirm("정말로 이 낚시터를 삭제하시겠습니까?")) {
						            location.href = `/business/deleteFishingSpot?spotId=` + encodeURIComponent(spotId) + "&bizId=" + encodeURIComponent(bizId);
						        }
						    }
						</script>
        </div>
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>