<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/myFishRecordsListView.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/pagination.css'/>">
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				<c:if test="${not empty sessionScope.sid}">
				<div class="button-container">
	        		<a class="btn" href="<c:url value='/myFishRecords/myFishRecordsList'/>">내가 쓴 기록보기</a>
	        		<a class="btn btn-write" href="<c:url value='/myFishRecords/newMyFishRecordsForm/6'/>">글쓰기</a>
				</div>
				</c:if>
				<div class="fish-container">
				
				    <c:forEach items="${mfList}" var="mf">
				        <div class="fish-item" onclick="location.href='<c:url value='/myFishRecords/detailViewmyFishRecords/${ mf.recordNo }/${ sessionScope.sid }' />'" style="cursor: pointer;">
				            <div class="date">
							    <fmt:formatDate value="${mf.createdDate}" pattern="yyyy년 MM월 dd일" />
							</div>
							<c:choose>
							    <c:when test="${not empty mf.uploadImage}">
							        <img src="<c:url value='/project_images/${mf.uploadImage}'/>" width="100%" height="200"><br>
							    </c:when>
							    <c:otherwise>
							        <img src="<c:url value='/project_images/noImage.png'/>" width="100%" height="200"><br>
							    </c:otherwise>
							</c:choose>

							<div class="fish-title">${mf.title}</div>
    						<div class="fish-nickname">${mf.memNickname}<br>조회수 ${mf.views} </div>
				            
				        </div>
				    </c:forEach>
				</div>
				
	            <div class="pagination">
				    <c:if test="${currentPage > 10}">
				        <a href="<c:url value='/myFishRecords/myFishRecordsListView?page=${startPage - 10}'/>" class="page-link">이전</a>
				    </c:if>
				
				    <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="status">
				        <a href="<c:url value='/myFishRecords/myFishRecordsListView?page=${i}'/>"
				           class="page-link ${i == currentPage ? 'current' : ''}">
				           ${i}
				        </a>
				    </c:forEach>
				
				    <c:if test="${endPage < totalPages}">
				        <a href="<c:url value='/myFishRecords/myFishRecordsListView?page=${endPage + 1}'/>" class="page-link">다음</a>
				    </c:if>
				</div>
				
				
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>