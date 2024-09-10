<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	   	<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		<title>어사모: 이벤트: 크기 겨루기</title>
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/event.css'/>">
		<script src="<c:url value='/js/event.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			
			<section>
				<div class="eventWrap">
					<div id="eventCtgBox">
						<ul id="eventCtgList" class="eventCtgBar">
							<li data-tab="/event/myFish" class="eventCtg1 eventCtg" >크기 겨루기</li>
							<li data-tab="/event/business" class="eventCtg2 eventCtg" >선주 주최</li>
							<li data-tab="/event/site" class="eventCtg3 eventCtg active" >사이트 주최</li>
							<li data-tab="/event/review" class="eventCtg4 eventCtg" >리뷰 이벤트</li>
						</ul>
					</div>
					<div id="eventMainBox">
						<div id="warningBox">
						</div>
					</div>
				</div>
			</section>
        
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>