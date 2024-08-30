<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	   	<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		<title>어사모: 위치 정보</title>
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/location.css'/>">
		 <script
		    defer
		    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCUEQpKhFKAnI8fDb2pB-cPDdiC6sdhhrI&callback=initMap"
		  ></script>
		<script src="<c:url value='/js/location.js'/>"></script></head>
		<script src="<c:url value='/js/locationIntl.js'/>"></script></head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			
			<section>
				<div class="locationWrap">
					<div id="locationCtgBox">
						<ul id="locationCtgList" class="locCtgBar">
							<li data-tab="/location/overview" class="locCtg1 locCtg" >현재 위치</li>
							<li data-tab="/location/nearFish" class="locCtg2 locCtg" >근처 낚시터</li>
							<li data-tab="/location/nearFood" class="locCtg3 locCtg" >주변 먹거리</li>
							<li data-tab="/location/nearPlay" class="locCtg4 locCtg" >주변 놀거리</li>
							<li data-tab="/location/nearHotel" class="locCtg5 locCtg" >주변 숙박시설</li>
							<li data-tab="/location/traffic" class="locCtg6 locCtg" >교통 상황</li>
							<li data-tab="/location/nationwide" class="locCtg7 locCtg" >전국 낚시터</li>
							<li data-tab="/location/intl" class="locCtg8 locCtg active" >해외 낚시터</li>	
						</ul>
					</div>
					<div class="mapBox">
					    <div id="map" style="height:700px; width:100%"></div>
					</div>
				</div>
			</section>
        
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>