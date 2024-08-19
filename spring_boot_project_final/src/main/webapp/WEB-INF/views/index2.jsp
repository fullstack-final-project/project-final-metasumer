<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>어사모(물고기를 사랑하는 모임)</title>
		<script src="<c:url value='/js/login.js'/>"></script>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/index.css'/>">
		<script src="<c:url value='/js/index.js'/>"></script>
		<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			
			<section>
				<div id="indexAdBox" class="indexSection">
				  <!-- Full-width images with number text -->
				  <div class="mySlides">
				    <div class="numbertext">1 / 6</div>
				      <img src="img_woods_wide.jpg" style="width:100%">
				  </div>
				
				  <div class="mySlides">
				    <div class="numbertext">2 / 6</div>
				      <img src="img_5terre_wide.jpg" style="width:100%">
				  </div>
				
				  <div class="mySlides">
				    <div class="numbertext">3 / 6</div>
				      <img src="img_mountains_wide.jpg" style="width:100%">
				  </div>
				
				  <div class="mySlides">
				    <div class="numbertext">4 / 6</div>
				      <img src="img_lights_wide.jpg" style="width:100%">
				  </div>
				
				  <div class="mySlides">
				    <div class="numbertext">5 / 6</div>
				      <img src="img_nature_wide.jpg" style="width:100%">
				  </div>
				
				  <div class="mySlides">
				    <div class="numbertext">6 / 6</div>
				      <img src="img_snow_wide.jpg" style="width:100%">
				  </div>
				
				  <!-- Next and previous buttons -->
				  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
				  <a class="next" onclick="plusSlides(1)">&#10095;</a>
				
				  <!-- Image text -->
				  <div class="caption-container">
				    <p id="caption"></p>
				  </div>
				
				  <!-- Thumbnail images -->
				  <div class="row">
				    <div class="column">
				      <img class="demo cursor" src="img_woods.jpg" style="width:100%" onclick="currentSlide(1)" alt="The Woods">
				    </div>
				    <div class="column">
				      <img class="demo cursor" src="img_5terre.jpg" style="width:100%" onclick="currentSlide(2)" alt="Cinque Terre">
				    </div>
				    <div class="column">
				      <img class="demo cursor" src="img_mountains.jpg" style="width:100%" onclick="currentSlide(3)" alt="Mountains and fjords">
				    </div>
				    <div class="column">
				      <img class="demo cursor" src="img_lights.jpg" style="width:100%" onclick="currentSlide(4)" alt="Northern Lights">
				    </div>
				    <div class="column">
				      <img class="demo cursor" src="img_nature.jpg" style="width:100%" onclick="currentSlide(5)" alt="Nature and sunrise">
				    </div>
				    <div class="column">
				      <img class="demo cursor" src="img_snow.jpg" style="width:100%" onclick="currentSlide(6)" alt="Snowy Mountains">
				    </div>
				  </div>
				</div>
				
				<div id="hotKeywordBox">
				</div> <!-- hotKeywordBox 종료 -->
				
				<div id="nowFishingBox">
				</div> <!-- nowFishingBox 종료 -->
				
				<div id="fishRecordRankBox" class="center">
					<div class="menber_slick2">
						<c:forEach var="mfList" items="${mfList}" varStatus="mfListNum" >
							<div class="item s${mfListNum.count}">
			                    <a href="<c:url value='/myFishRecords/detailViewmyFishRecords/${mfList.recordNo}' />">
			                        <div class="thumb" style="background-image:url('${mfList.uploadImage}');"></div>
			                    </a>
							</div>
						</c:forEach>
	            	</div>
				</div> <!-- fishRecordRankBox 종료 -->
				
				<div id="bestBusinessBox">
					<div class="bestBusinessList">
						<c:forEach var="bizList" items="${bizList}" varStatus="bizListNum">
							<div class="bestBizItem">
								<span>${bizListNum.count}위</span>
								<div>${bizList.bizName}</div>
								<div>${bizList.bizCtgId}</div>
								<div>${bizList.bizCtgImg}</div>
							</table>
						</c:forEach>
					</div>
				</div> <!-- bestBusinessBox 종료 -->
				
				<div id="newFishRecordBox" class="center">
					<div class="menber_slick2">
						<c:forEach var="mfList" items="${mfList}" varStatus="mfListNum" >
							<div class="item s${mfListNum.count}">
			                    <a href="<c:url value='/myFishRecords/detailViewmyFishRecords/${mfList.recordNo}' />">
			                        <div class="thumb" style="background-image:url('${mfList.uploadImage}');"></div>
			                    </a>
							</div>
						</c:forEach>
	            	</div>
				</div> <!-- newFishRecordBox 종료 -->
				
				<div id="newProductBox">
				</div> <!-- newProductBox 종료 -->
				
				<div id="userRecPrdBox">
				</div>	 <!-- userRecPrdBox 종료 -->	
			
        	</section>
        
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>