<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 페이지</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminPage.css'/>">
		
		<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/adminChart.js'/>"></script>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			
			<section>
				<h2>관리자 페이지</h2>
					<c:import url = "/WEB-INF/views/admin/adminPageList.jsp"></c:import>
				
				<div>
					<h1>★ 추후 판매, 예약 부분 추가 ★</h1>
				</div>
				
			<h3>2주 동안 게시판별 활동량</h3>
            <canvas id="postStats" width="600" height="200"></canvas>
            
            <h3>2주 동안 게시된 글 TOP5(조회수+댓글)</h3>
            <canvas id="mergedStats" width="600" height="200"></canvas>
            
            <h3>회원 사이트 활동량 TOP10</h3>
            <canvas id="loginTop" width="600" height="200"></canvas>
            

				
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>