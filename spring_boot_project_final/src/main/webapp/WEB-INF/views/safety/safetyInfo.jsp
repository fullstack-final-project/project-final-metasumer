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
							<li data-tab="/safety/overview" class="safetyCtg1 safetyCtg active" >안전 수칙</li>
							<li data-tab="/safety/ERinfo" class="safetyCtg2 safetyCtg" >비상 연락처</li>
						</ul>
					</div>
					<div class="safetyBox">
						<div id="safetyGifBox">
							<c:forEach items="${safetyList}" var="safetyList">
								<div class="safetyGifItem">
									<div class="gifBox"><img src="/image/${safetyList.safetyImg}" loop=infinite alt="${safetyList.safetyTitle}" /></div>
									<div class="gifTitleBox">${safetyList.safetyTitle}</div>
									<div class="gifBriefBox">${safetyList.safetyBrief}</div>
								</div>
							</c:forEach>
							<div id="copyrightBox">
								<span>본 저작물은 중앙해양안전심판원에서 24년 작성하여 공공누리 제1유형으로 개방한 '인명사고 예방 정보' 이용하였으며, 해당 저작물은 '중앙해양안전심판원, <a href="https://www.kmst.go.kr/web/board.do?menuIdx=129#none" target="_blank">https://www.kmst.go.kr/web/board.do?menuIdx=129#none</a>'에서 무료로 다운받으실 수 있습니다.</span>
							</div>
						</div>
						<div id="safetyYoutubeBox">
							<p align="middle"><iframe width="800px" height="450px" src="https://www.youtube.com/embed/cIRxCw4er68?si=iWVnI_xqwdFDhnoJ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe></p>
							<p align="middle"><iframe width="800px" height="450px" src="https://www.youtube.com/embed/RSO5VYnqXuk?si=CGcnZvpTXdktdi75" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe></p>
							<p align="middle"><iframe width="800px" height="450px" src="https://www.youtube.com/embed/lj0QaY4o81k?si=Uqb7VaGd35Ivqqup" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe></p>
						</div>
					</div>
				</div>
			</section>
        
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>