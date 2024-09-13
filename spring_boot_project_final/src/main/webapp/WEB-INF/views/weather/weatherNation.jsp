<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	   	<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		<title>어사모: 날씨 정보: 전국 날씨</title>
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/weather.css'/>">
		<script src="<c:url value='/js/weather.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			
			<section>
				<div class="weatherWrap">
					<div id="weatherCtgBox">
						<ul id="weatherCtgList" class="weatherCtgBar">
							<li data-tab="/weather/tidetable" class="weatherCtg1 weatherCtg" >물때</li>
							<li data-tab="/weather/current" class="weatherCtg2 weatherCtg" >현재 위치 날씨</li>
							<li data-tab="/weather/warning" class="weatherCtg3 weatherCtg" >기상 특보</li>
							<li data-tab="/weather/nationwide" class="weatherCtg4 weatherCtg active" >전국 날씨</li>
							<li data-tab="/weather/overseas" class="weatherCtg5 weatherCtg" >해외 날씨</li>
							<li data-tab="/weather/factor" class="weatherCtg6 weatherCtg" >바다 낚시 지수</li>
						</ul>
					</div>
					<div id="weatherMainBox">
						<div id="warningBox">
							<div class="warningImg">
								
							</div>
							<div class="vis-weather">
								<h1>전국 날씨</h1>
									<ul class="list-group list-group-flush weather" style="font-weight: 600;">
					                    <!-- <li class="list-group-item weather"></li> -->
								</ul>
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