<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>어종 정보</title>
		<!-- head.jsp import -->
        <c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
        <script src="<c:url value='/js/fish.js'/>"></script>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/fishInfo.css'/>">
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
		    <c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
		    <br><br><br>
			<section>
			  <header>
			    <h2>어종 정보</h2>
			  </header>			  
			  <img src="/image/fishBanner2.jpg" class="fishBanner">
			  <div class="fishCtg">
			    <div id='fishCtgBtn'>
			      <button class='fishBtn' data-category='all'>전체 어종</button>
			      <button class='fishBtn' data-category='1'>인기 어종</button>
			      <button class='fishBtn' data-category='2'>희귀 어종</button>
			      <button class='fishBtn' data-category='3'>일반 어종</button>
			    </div>			    
			  </div>
			  <form class="fishSearch" method="get" action="">
			    <input class="searchText" type="text" name="keywords" placeholder="검색어를 입력하세요.">
			    <button class="searchBtn" type="submit">
			      <i class="fa-solid fa-magnifying-glass"></i>			    
			    </button>
			  </form>
			  <main>
			    <div class='fishBox'>
			      <c:forEach var="fish" items="${fishList}">	
			        <div class="fishData" data-category="${fish.fishCtgId}">
			          <div class="fishDetail">
			            <div>
			              <a href="<c:url value='/fish/detailViewFish/${fish.fishNo}' />">
			                <img src="<c:url value='/project_images/어종/${fish.fishImg}' />">
			              </a>
			            </div>			            
			            <p class="fishName">${fish.fishName}</p>			            
			          </div>
			        </div>
			      </c:forEach>
			    </div>
			  </main>
			  <div class="pagination">
                <c:forEach var="page" begin="1" end="${totalPages}">
                  <a href="?page=${page}" class="${currentPage == page ? 'active' : ''}">${page}</a>
                </c:forEach>
              </div>
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
