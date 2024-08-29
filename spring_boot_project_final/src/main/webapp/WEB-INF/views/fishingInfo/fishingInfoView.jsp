<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>낚시 정보</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/fishingInfo.css'/>">
        <script src="<c:url value='/js/fishing.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
			  <header>
			    <h2>낚시 정보</h2>
			  </header>
			  <img src="/image/fishingBanner2.jpg" class="fishingBanner">
			  <div class="fishingCtg">
			    <div id='fishingCtgBtn'>
			      <a href="/fishing/fishingCtgList/1/1001">
			        <button class='fishingBtn' data-category='1'>초보자 가이드</button>
			      </a>
			      <a href="/fishing/fishingCtgList/2/2001">
			        <button class='fishingBtn' data-category='2'>낚시 노하우</button>
			      </a>
			      <a href="/fishing/fishingCtgList/3/3001">
			        <button class='fishingBtn' data-category='3'>장비 사용법</button>
			      </a>
			      <a href="/fishing/fishingCtgList/4/4001">
			        <button class='fishingBtn' data-category='4'>실전 스킬</button>
			      </a>
			    </div>			    
			  </div>
			  <div id="fishingContainer">
			    <div id="fishingSub">
                  <ul>
                    <c:forEach var="sub" items="${fishingDetailList}">
                      <li>
                        <a href="/fishing/fishingCtgList/${sub.fishingCtgId}/${sub.fishingDetailCtgId}">
                          ${sub.fishingDetailCtgName}
                        </a>
                      </li>
                    </c:forEach>
                  </ul>
                </div>
                <div id="fishingBox">
                  <c:forEach var="fishing" items="${fishingList}">	
			          <div id="fishing" data-category="${fishing.fishingDetailCtgId}">
			            <div id="fishingDetail">
			              <div id="fishing-name">
			                <h1>${fishing.fishingDetailCtgName}</h1>
			                <img src="<c:url value='/project_images/FishingIcons/${fishing.fishingImg}'/>">
			              </div>
			              <hr>
			              <div id="fishing-content">			              			              
			                ${fishing.fishingDescription}			            
			                <c:choose>
			                  <c:when test="${fishing.fishingDetailCtgId == 2001}">
			                    <iframe width="750" height="415" src="https://www.youtube.com/embed/AnRNgGdbIe4?si=wbRs8lMiP6Snlcgk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
			                  </c:when>
			                  <c:when test="${fishing.fishingDetailCtgId == 2002}">
			                    <iframe width="750" height="415" src="https://www.youtube.com/embed/TGagjB5-f8w?si=j25bZZhRg68iok2j" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
			                  </c:when>
			                  <c:when test="${fishing.fishingDetailCtgId == 2003}">
			                    <iframe width="750" height="415" src="https://www.youtube.com/embed/jhts6mXIxM0?si=4KhSo_SdxVzW_6zm" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
			                  </c:when>
			                  <c:when test="${fishing.fishingDetailCtgId == 2004}">
			                    <iframe width="750" height="415" src="https://www.youtube.com/embed/sB6HUJliQrs?si=oBfATgTjn92ykAKm" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
			                  </c:when>
			                  <c:when test="${fishing.fishingCtgId == 3}">
			                    <br><br>
			                    <h3 id="h3Refer">추천 상품</h3>
			                    <div id="fishingPrdImg"> <!-- 그냥 예시임 -->
			                      <c:forEach var="cnt" begin="1" end="3" step="1">
			                        <a href="###">
			                          <img src="<c:url value='/project_images/상품/${fishing.fishingDetailCtgId}_${cnt}.jpg'/>">
			                        </a>
			                      </c:forEach>			                      
			                    </div>
			                  </c:when>			                  
			                </c:choose>			                
			              </div>			            			            
			            </div>
			          </div>
			        </c:forEach>
                </div>
			  </div>              
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
