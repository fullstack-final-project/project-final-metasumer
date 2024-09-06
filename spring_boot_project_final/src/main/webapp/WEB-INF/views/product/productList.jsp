<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>낚시용품 리스트</title>
		<!-- head.jsp import -->
		<c:import url="/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/productList.css'/>" />
		<script src="<c:url value='/js/productList.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url="/WEB-INF/views/layout/top.jsp"></c:import>
			<section id="productSection" class="container">
				<h1>BEST 상품</h1>
				<div class="slider-container">
					<div class="product-slider" id="bestProductsSlider">
						<div id="prevNextButtonBoxBest">
							<img id="prevButtonBest" src="/image/prevButton.png" alt="Previous">
							<img id="nextButtonBest" src="/image/nextButton.png" alt="Next">
						</div>
						<c:forEach var="product" items="${bestProducts}">
							<a href="<c:url value='/product/detailViewProduct/${product.prdNo}'/>" class="product-link">
                  <div class="product-card">
                      <img src="<c:url value='/project_images/${product.prdImage}'/>" alt="${product.prdName}">
                      <h3>${product.prdName}</h3>
                      <p>가격: ${product.prdPrice}원</p>
                      <p>제조사: ${product.prdMaker}</p>
                  </div>
              </a>
						</c:forEach>
					</div>
				</div>
	
				<h1>신상품</h1>
				<div class="slider-container">
					<div id="prevNextButtonBoxNew">
						<img id="prevButtonNew" src="/image/prevButton.png" alt="Previous">
						<img id="nextButtonNew" src="/image/nextButton.png" alt="Next">
					</div>
					<div class="product-slider" id="newProductsSlider">
						<c:forEach var="product" items="${newProducts}">
							<a href="<c:url value='/product/detailViewProduct/${product.prdNo}'/>" class="product-link">
	                <div class="product-card">
	                    <img src="<c:url value='/project_images/${product.prdImage}'/>" alt="${product.prdName}">
	                    <h3>${product.prdName}</h3>
	                    <p>가격: ${product.prdPrice}원</p>
	                    <p>제조사: ${product.prdMaker}</p>
	                </div>
	            </a>
						</c:forEach>
					</div>
				</div>
			</section>
			
			<!-- 카테고리 탭 섹션 -->
			<section id="categoryTabsSection" class="container">
				<h1>카테고리별 상품</h1>
				<div id="filterOptions">
					<label for="filterSelect">정렬:</label>
					<select id="filterSelect">
						<option value="default">기본</option>
						<option value="priceAsc">가격 오름차순</option>
						<option value="priceDesc">가격 내림차순</option>
						<option value="nameAsc">이름 오름차순</option>
						<option value="nameDesc">이름 내림차순</option>
					</select>
				</div>
				<ul id="categoryTabs">
					<li data-category="낚싯대" class="active">낚싯대</li>
					<li data-category="미끼">미끼</li>
					<li data-category="릴">릴</li>
					<li data-category="의류/장비">의류/장비</li>
					<li data-category="기타 액세서리">기타 액세서리</li>
				</ul>
				
				<div id="categoryProducts">
					<c:forEach var="entry" items="${categoryProducts}">
						<div class="category-container" data-category="${entry.key}" style="${entry.key eq '낚싯대' ? 'display: flex;' : 'display: none;'}">
							<c:forEach var="product" items="${entry.value}">
								<a href="<c:url value='/product/detailViewProduct/${product.prdNo}'/>" class="product-link">
                    <div class="product-card">
                        <img src="<c:url value='/project_images/${product.prdImage}'/>" alt="${product.prdName}">
                        <h3>${product.prdName}</h3>
                        <p>가격: ${product.prdPrice}원</p>
                        <p>제조사: ${product.prdMaker}</p>
                    </div>
                </a>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
			</section>
	
			<!-- bottom.jsp import -->
			<c:import url="/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	
	</body>
</html>