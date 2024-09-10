<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/fleamarketList.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/pagination.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">	
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				
				<h1>벼룩시장</h1>
				<div id="btn_container">
					<c:if test="${not empty sessionScope.sid}">
					    <a class="btn" href="<c:url value='/freeboard/newfreeboardForm/${fbList[0].boardCtgId}'/>">글쓰기</a>
					</c:if>
					<div class="right-buttons">
						<a class="btn" href="<c:url value='/freeboard/fleamarketList/0'/>">거래가능</a>
						<a class="btn" href="<c:url value='/freeboard/fleamarketList/1'/>">거래완료</a>
					</div>
				</div>
			    <div class="container">
				    <c:forEach items="${fbList}" var="fb">
				        <div class="item">
						    <a class="item-link" href="<c:url value='/freeboard/detailViewFreeBoard/${fb.boardPostNo}/${sessionScope.sid}'/>">
						    
						    <c:choose>
								    <c:when test="${not empty fb.uploadFile}">
						            	<img src="<c:url value='/project_images/${fb.uploadFile}'/>" alt="Item Image" width="100%"> 
								    </c:when>
								     <c:otherwise>
								        <img src="<c:url value='/project_images/noImage.png'/>" width="70%" height="100">
								    </c:otherwise>
								</c:choose>	

					            <div class="text-content">
					                <h2>${fb.title}</h2>
					                
					                <c:choose>
									    <c:when test="${not empty sessionScope.sid}">
									        <p><fmt:formatNumber value="${fb.price}" type="number" maxFractionDigits="0"/> 원</p>
									    </c:when>
									    <c:otherwise>
									        <p>로그인이 필요합니다.</p>
									    </c:otherwise>
									</c:choose>
					                
					                <div class="nick">
						                <p>${fb.memNickname}</p>
						                <c:if test="${sessionScope.sid eq fb.memId and fb.completed == 0}">
					                		<form action="<c:url value='/freeboard/fleamarketListcompleted/0'/>" method="post">
										        <input type="hidden" id="boardPostNo" name="boardPostNo" value="${ fb.boardPostNo }" />
										        <input class="btn com" type="submit" value="거래완료" />
										    </form>
	                                	</c:if>
	                                	<c:if test="${sessionScope.sid eq fb.memId and fb.completed == 1}">
	                                    	<form action="<c:url value='/freeboard/fleamarketListcompleted/1'/>" method="post">
										        <input type="hidden" id="boardPostNo" name="boardPostNo" value="${ fb.boardPostNo }" />
										        <input class="btn com" type="submit" value="거래취소" />
										    </form>
	                                	</c:if>
	                                </div>
					                <p><fmt:formatDate value="${fb.createdDate}" pattern="yyyy년 MM월 dd일" /></p>
									<p class="viewsP">조회수 ${fb.views }</p>
					            </div>
					        </a>
				        </div>
					</c:forEach>
				 </div>
				 
				 <div class="pagination">
				    <c:if test="${currentPage > 10}">
				        <a href="<c:url value='/freeboard/fleamarketList/0?page=${startPage - 10}'/>" class="page-link">이전</a>
				    </c:if>
				
				    <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="status">
				        <a href="<c:url value='/freeboard/fleamarketList/0?page=${i}'/>"
				           class="page-link ${i == currentPage ? 'current' : ''}">
				           ${i}
				        </a>
				    </c:forEach>
				
				    <c:if test="${endPage < totalPages}">
				        <a href="<c:url value='/freeboard/fleamarketList/0?page=${endPage + 1}'/>" class="page-link">다음</a>
				    </c:if>
				</div>
				    
				    
				
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>