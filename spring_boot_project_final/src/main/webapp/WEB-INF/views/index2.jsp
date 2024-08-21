<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>어사모(물고기를 사랑하는 모임)</title>
		<script src="<c:url value='/js/login.js'/>"></script>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/index.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/all.css'/>">
		<script src="<c:url value='/js/index.js'/>"></script>
		<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		<script src="https://apis.google.com/js/api.js"></script>
		<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=sio4q1ij5f"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			
			<section>
				<div id="eventAdBox" class="indexSection">
					<div data-slider-id="vtqsjd"></div>
					<div id="eventBannerBox"><script async src="https://sliderui.com/sliders/vtqsjd.js"></script></div>
					<!-- https://sliderui.com/dashboard/sliders/vtqsjd -->
				</div> <!-- eventAdBox 종료 : 1. 추천 광고, 이벤트 베너 (슬라이드쇼) -->
				
				<div id="hotKeywordBox" class="indexSection">
					<div class="sectionTitle">실시간 HOT 키워드/검색어 🔥</div>
					<div class="keywordListWrap"> 
						<div id="youtubeKeyword" class="keywordListItem">
							<div class="keywordListTitle">유튜브</div>
						</div>
						<div id="instagramKeyword" class="keywordListItem">
							<div class="keywordListTitle">인스타그램</div>
						</div>
						<div id="naverKeyword" class="keywordListItem">
							<div class="keywordListTitle">네이버</div>
						</div>
					</div>
				</div> <!-- hotKeywordBox 종료 : 2. 실시간 HOT 키워드 -->
				
				<div id="nowFishingBox" class="indexSection">
					<div class="sectionTitle">실시간 낚시 조황 정보 🗺️</div>
					<div class="nowFishingWrap">
						<div id="nowFishingInfo" class="nowFishingItem"></div>
						<div id="nowFishingMap" class="nowFishingItem"></div>
					</div>
				</div> <!-- nowFishingBox 종료 : 3. 실시간 낚시터 상황 -->
				
				<div id="fishRecordRankBox" class="indexSection fishRecordSeries">
					<div class="sectionTitle">베스트 낚시 기록 - 사이즈 순위 🎣</div>
					<div class="menber_slick2">	
						<c:forEach items="${mfList}" var="mfList">
					        <div class="fishRecordList slider-contents" onclick="location.href='<c:url value='/myFishRecords/detailViewmyFishRecords/${ mfList.recordNo }' />'" style="cursor: pointer;">
								<div id="fishRrdImgWrap">
									<img src="<c:url value='/image/fish/${mfList.uploadImage}'/>" width="100%" height="200"></div><br>
								<div class="fishRecordInfo">
									<span id="fishRecordName" class="eachSectionEmphasisText">${mfList.fishName}</span>
									<span id="fishRecordSize">${mfList.fishSize}cm</span></div>
								<div class="fishRecordLoc">${mfList.location}</div>
								<div class="fishRecordDate">
									<fmt:formatDate value="${mfList.createdDate}" pattern="yyyy년 MM월 dd일" /></div>
	    						<div class="fishRcdNickname">${mfList.memNickname}</div>
					        </div>
				    	</c:forEach>
	            	</div>
				</div> <!-- fishRecordRankBox 종료 : 4. 베스트 낚시 기록 (전체 회원 대상) -->
				
				<div id="bestBusinessBox" class="indexSection">
					<div class="sectionTitle">이달의 베스트 업체 🈺</div>
					<div class="bestBizCtgBar">
						<button class="bestBiz bestBiz1 active"><span>전체</span></button>
						<button class="bestBiz bestBiz2"><span>낚시터</span></button>
						<button class="bestBiz bestBiz3"><span>낚시용품</span></button>
					</div>
					<div class="bestBusinessList">
						<c:forEach var="bizList" items="${bizList}" varStatus="bizListNum" begin="1" end="5">
							<div class="bestBizItem">
								<div>
									<img src="<c:url value='/image/fish/${bizList.bizRegImg}'/>" width="100%" height="200"></div><br>
								<div><span class="eachSectionEmphasisText">${bizListNum.count}</span>위</div>
								<div>${bizList.bizName}</div>
							</div>
						</c:forEach>
					</div>
				</div> <!-- bestBusinessBox 종료 : 5. 베스트 업체 리스트 -->
				
				<div id="newFishRecordBox" class="indexSection">
					<div class="sectionTitle">최신 낚시 기록 📸</div>
					<div class="menber_slick2">	
						<c:forEach items="${newMfList}" var="newMfList">
					        <div class="fishRecordList slider-contents" onclick="location.href='<c:url value='/myFishRecords/detailViewmyFishRecords/${newMfList.recordNo}' />'" style="cursor: pointer;">
								<div id="fishRrdImgWrap">
									<img src="<c:url value='/image/fish/${newMfList.uploadImage}'/>"></div><br>
								<div class="fishRecordTitle eachSectionEmphasisText">
									<span>${newMfList.title}</span></div>
								<div class="fishRecordLoc">${newMfList.location}</div>
								<div class="fishRecordDate">
									<fmt:formatDate value="${newMfList.createdDate}" pattern="yyyy년 MM월 dd일" /></div>
	    						<div class="fishRcdNickname">${newMfList.memNickname}</div>
					        </div>
				    	</c:forEach>
	            	</div>
				</div> <!-- newFishRecordBox 종료 : 6. 최신 낚시 기록 (전체 회원 대상) -->
				
				<div id="newProductBox" class="indexSection">
					<div class="sectionTitle">신상 낚시 용품 입고 🛍️</div>
					<div class="newProductList">
						<c:forEach var="newPrdList" items="${newPrdList}">
							<div class="newPrdItem">
								<img src="<c:url value='/image/fish/${newPrdList.prdImage}'/>"><br>
								<div class="eachSectionEmphasisText">${newPrdList.prdName}</div>
								<div>${newPrdList.prdMaker}</div>
								<div>
									<fmt:formatNumber type="number" maxFractionDigits="0" value="${newPrdList.prdPrice}" />원</div>
							</div>
						</c:forEach>
					</div>
				</div> <!-- newProductBox 종료 : 7. 새로 나온 상품 -->
				
				<div id="userRecPrdBox" class="indexSection">
					<div class="sectionTitle">사용자 추천 아이템 🛒</div>
					<div class="userRecPrdList">
						<c:if test="${empty sessionScope.sid }">
							<div class="userRecPrdItem">
								회원가입 시 입력한 나의 관심사를 기반으로, 고객님 취향에 맞는 아이템을 추천해드립니다!
							</div>
						</c:if>
						<c:if test="${not empty sessionScope.sid }">
							<c:forEach var="recPrdList" items="${recPrdList}">
								<div class="userRecPrdItem">
									<img src="<c:url value='/image/fish/${recPrdList.prdImage}'/>"><br>
									<div class="eachSectionEmphasisText">${recPrdList.prdName}</div>
									<div>${recPrdList.prdMaker}</div>
									<div>
										<fmt:formatNumber type="number" maxFractionDigits="0" value="${recPrdList.prdPrice}" />원</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>	 <!-- userRecPrdBox 종료 : 8. 사용자 기반 추천 상품 -->	
			
        	</section>
        
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>