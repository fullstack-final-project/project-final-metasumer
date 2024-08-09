<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Business Dashboard</title>
		<!--head 임포트  -->
		<c:import url="/WEB-INF/views/layout/head.jsp" />
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/dashboard.css'/>" />
		<script src="<c:url value='/js/dashboard.js'/>"></script>
		
		<!-- FullCalendar CSS -->
		<link
			href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" rel="stylesheet" />
		
		<!-- FullCalendar JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/locale/ko.min.js"></script>
		
	</head>
	<body>
		<div id="wrap">
			<!-- top 임포트 -->
			<c:import url="/WEB-INF/views/layout/top.jsp" />
			<section id="dashboard">
				<!-- bizCtgId에 따라 제목 변경 -->
				<h1>
					<c:choose>
						<c:when test="${bizCtgId == 1}">
							바다 낚시 예약 현황
						</c:when>
						<c:when test="${bizCtgId == 2}">
							민물 낚시 예약 현황
						</c:when>
						<c:otherwise>
							예약 현황
						</c:otherwise>
					</c:choose>
				</h1>
					
					<!-- bizCtgId를 hidden input으로 추가 -->
					<input type="hidden" id="bizCtgId" value="${bizCtgId}" />
					
					<!-- 달력 부분 -->
					<div id="calendar"></div>
	
	
					<!-- 예약 목록 부분 -->
					<div id="reservations">
						<h2>예약 목록</h2>
						<table class="table resList">
							<thead>
								<tr>
									<th>예약 번호</th>
									<th>예약자명</th>
									<th>예약일</th>
									<th>시간</th>
									<th>상태</th>
									<th>확인</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="reservation" items="${reservations}">
									<tr>
										<td>${reservation.resNo}</td>
										<td>${reservation.memName}</td>
										<td><fmt:formatDate value="${reservation.bizDate}"
												pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${reservation.bizStart}" pattern="HH:mm" />
												 ~ 
               					<fmt:formatDate value="${reservation.bizEnd}" pattern="HH:mm" /></td>
										<td>${reservation.resStatus}</td>
										<td>
											<!-- 확정 및 취소 버튼에 bizCtgId 전달 -->
											<button class="btn btn-success"
												onclick="confirmReservation(${reservation.resNo}, ${bizCtgId})">확정</button>
											<button class="btn btn-cancel"
												onclick="cancelReservation(${reservation.resNo}, ${bizCtgId})">취소</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</section>
			<!-- bottom 임포트 -->
			<c:import url="/WEB-INF/views/layout/bottom.jsp" />
		</div>
	</body>
</html>