<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	   	<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		<title>어사모: 날씨 정보: 기상 특보</title>
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
							<li data-tab="/weather/tidetable" class="weatherCtg1 weatherCtg active" >물때</li>
							<li data-tab="/weather/current" class="weatherCtg2 weatherCtg" >현재 위치 날씨</li>
							<li data-tab="/weather/warning" class="weatherCtg3 weatherCtg" >기상 특보</li>
							<li data-tab="/weather/nationwide" class="weatherCtg4 weatherCtg" >전국 낚시</li>
							<li data-tab="/weather/overseas" class="weatherCtg5 weatherCtg" >해외 낚시</li>
							<li data-tab="/weather/factor" class="weatherCtg6 weatherCtg" >바다 낚시 지수</li>
						</ul>
					</div>
					<div id="weatherMainBox">
						<div id="tidetableBox">
							<div id="tidetableInfo">
								<h3>물때 보는 법</h3>
								<div>
									<table>
										<tr><th>물때</th><th>조석</th><th>만조</th><th>간조</th></tr>
										<tr>
											<td>조석이 규칙적으로 음력 보름(15일)을 주기로 되풀이되는 것. 하루에 두 번씩 밀물과 썰물이 들어오고 나가고 하는 물의 흐름.</td>
											<td>밀물과 썰물을 통틀어 일컬으며, 해수면이 주기적으로 높아지고 낮아지는 시간</td>
											<td>밀물이 가장 높은 해수면까지 꽉 차게 들어오는 때</td>
											<td>바다에서 조수가 빠져나가 해수면이 가장 낮아진 때</td>
										</tr>
										<tr><th>사리</th><th>조금</th><th>사리물때</th><th>조금물때</th></tr>
										<tr>
											<td>음력 15일, 음력 30일</td><td>음력 8일, 음력 23일</td>
											<td>사리, 사리 이후 2~3일</td><td>조금, 조금 이후 2~3일</td>
										</tr>
										<tr>
											<td>해와 달의 인력이 해수면을 가장 많이 잡아당기는 날</td>
											<td>해와 달의 인력이 해수면을 가장 적게 잡아당기는 날</td>
											<td>유속이 가장 빠르고 간조와 만조의 차이가 가장 큰 날</td>
											<td>유속이 가장 빠르고 간조와 만조의 차이가 가장 큰 날</td>
										</tr>
										<tr><th>사리물때</th><th>죽는물때</th><th>사는물때</th><th>조금물때</th></tr>
										<tr>
											<td>사리, 7물, 8물, 9물</td><td>10물, 11물, 12물, 13물</td>
											<td>3물, 4물, 5물</td><td>조금, 무시, 1물, 2물</td>
										</tr>
										<tr>
											<td>유속이 빨물이 가장 흐리고 어군(떼고기)가 가장 많이 이동하는 날. 대박 노리기 좋은 날</td>
											<td>유속이 안정적이고 흐린 물색이 오래 유지되기에 안정적으로 조황 가능</td>
											<td>물이 흐린 해역(뻘물이 자주 생기는 남해안, 서해안)에서 선택하기 최적</td>
											<td>유속이 가장 빠르고 간조와 만조의 차이가 가장 큰 날</td>
										</tr>
										<tr>
											<td>조류가 너무 낚시 가능한 포인트나 시간이 제한적임. 평균해수면이 높은 여름에 해일 발생 위험성 증가</td>
											<td>해와 달의 인력이 해수면을 가장 적게 잡아당기는 날</td>
											<td>유속이 가장 빠르고 간조와 만조의 차이가 가장 큰 날</td>
											<td>유속이 가장 빠르고 간조와 만조의 차이가 가장 큰 날</td>
										</tr>
									</table>
								</div>
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