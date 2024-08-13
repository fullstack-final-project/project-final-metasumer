<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>어사모: 위치 정보</title>
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/location.css'/>">
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			
			<section>
				<div class="locationWrap">
					<div id="locationCtgBox">
						<ul id="locationCtgList">
							<li class="locationItem"><a href="">현재 위치</a></li>
							<li class="locationItem"><a href="">근처 낚시터</a></li>
							<li class="locationItem"><a href="">주변 먹거리</a></li>
							<li class="locationItem"><a href="">주변 놀거리</a></li>
							<li class="locationItem"><a href="">주변 숙박시설</a></li>
							<li class="locationItem"><a href="">교통 상황</a></li>
							<li class="locationItem"><a href="">전국 낚시터</a></li>
							<li class="locationItem"><a href="/location/intl">해외 낚시터</a></li>
						</ul>
					</div>
					<div id="locationMainBox">
					
					</div>
				</div>
			</section>
        
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>