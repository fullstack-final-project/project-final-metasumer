<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	   	<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		<title>어사모: 안전 정보</title>
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/safety.css'/>">
		<script src="<c:url value='/js/safety.js'/>"></script></head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			
			<section>
				<div class="safetyWrap">
					<div id="safetyCtgBox">
						<ul id="safetyCtgList" class="safetyCtgBar">
							<li data-tab="/safety/overview" class="safetyCtg1 safetyCtg" >안전 수칙</li>
							<li data-tab="/safety/ERinfo" class="safetyCtg2 safetyCtg active" >비상 연락처</li>
						</ul>
					</div>
					<div class="safetyBox">
						<div id="safetyTelBox">
							<table>
								<tr>
									<th>연락 대상</th><th>연락처</th><th>관련 사이트</th><th>참고</th>
								</tr>
								<c:forEach items="${telList}" var="telList">
									<tr>
										<td>${telList.telSubject}</td>
										<td>${telList.telContact}</td>
										<td><a href="${telList.telSite}" target="_blank">${telList.telSite}</a></td>
										<td>${telList.telEtc}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</section>
        
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>