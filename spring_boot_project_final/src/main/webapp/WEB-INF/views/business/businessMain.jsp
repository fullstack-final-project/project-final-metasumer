<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사업자 메인 페이지</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/businessMain.css'/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>" />
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				<header>
			    <h2>사업자 페이지</h2>
			  </header>
			  <div class="businessAuth-btn">
			  	<a href="<c:url value='/memberOcr/businessAuth'/>" class="btn">사업자등록</a>
			  </div>
				<div class="bizPageCtg">
							
              <!-- 예약 사업체 카드 -->
              <c:forEach var="business" items="${businesses}">
                  <c:choose>
                      <c:when test="${business.businessType == 'reservation'}">
                          <div class="bizCard">
                          		<h5>예약</h5>
                              <h3>${business.businessName}</h3>
                              <button onclick="location.href='/business/fishingSpotManagement?bizId=${business.bizId}'" class="btn">낚시터 관리</button>
                              <button onclick="location.href='/business/dashboard?bizId=${business.bizId}'" class="btn">예약확인</button>
                          </div>
                      </c:when>
                      <c:otherwise>
                          <!-- 판매 사업체 카드 -->
                          <div class="bizCard">
                          		<h5>판매</h5>
                              <h3>${business.businessName}</h3>
                              <button onclick="location.href='/product/productManagement?bizId=${business.bizId}'" class="btn">상품판매 관리</button>
                          </div>
                      </c:otherwise>
                  </c:choose>
              </c:forEach>
          </div>
        </section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>