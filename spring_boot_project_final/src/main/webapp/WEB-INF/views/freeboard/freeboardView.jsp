<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/freeboardView.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/pagination.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
    <meta charset="UTF-8">
    <title>자유게시판</title>
    <!-- head.jsp import -->
    <c:import url="/WEB-INF/views/layout/head.jsp"/>
</head>
<body>
    <div id="wrap">
        <!-- top.jsp import -->
        <c:import url="/WEB-INF/views/layout/top.jsp"/>
        <section>
            <h1>${fbList[0].boardCtgName}</h1>
         <div class="board-container">
         <c:choose>
		    <c:when test="${sessionScope.sid != null}">
		        <c:choose>
		        
		            <c:when test="${boardCtgId == 2 || boardCtgId == 3 || boardCtgId == 4}">
		                <div class="button-container2">
		                    <a class="btn" href="<c:url value='/freeboard/newfreeboardForm/${boardCtgId}'/>">글쓰기</a>
		                </div>
		            </c:when>
		            <c:otherwise>
		                <c:choose>
		                    <c:when test="${sessionScope.memType == 'admin' || sessionScope.memType == 'business'}">
		                        <div class="button-container2">
		                            <a class="btn" href="<c:url value='/freeboard/newfreeboardForm/${boardCtgId}'/>">글쓰기</a>
		                        </div>
		                    </c:when>
		                </c:choose>
		            </c:otherwise>
		        </c:choose>
		    </c:when>
		</c:choose>
         
         
			<c:if test="${empty fbList}">
                <p>데이터가 없습니다.</p>
            </c:if>	
	
	
			<c:if test="${not empty fbList}">
            <table border="1">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>작성자</th>
                        <th>제목</th>
                        <th>작성 날짜</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="counter" value="${(currentPage - 1) * 10 + 1}" />
                    <c:forEach items="${fbList}" var="fb">
                    
                        <c:choose>
				            <c:when test="${not empty sessionScope.sid}">
				                <tr onclick="location.href='<c:url value='/freeboard/detailViewFreeBoard/${fb.boardPostNo}/${sessionScope.sid}' />'" style="cursor: pointer;">
				                    <td>${counter}</td>
				                    <td>${fb.memNickname}</td>
				                    <td>${fb.title}</td>
				                    <td><fmt:formatDate value="${fb.createdDate}" pattern="yyyy년 MM월 dd일" /></td>
				                    <td>${fb.views}</td>
				                </tr>
				            </c:when>
				            <c:otherwise>
				                <tr onclick="alert('로그인 하세요');">
                    				<td>${counter}</td>
				                    <td>${fb.memNickname}</td>
				                    <td>${fb.title}</td>
				                    <td><fmt:formatDate value="${fb.createdDate}" pattern="yyyy년 MM월 dd일" /></td>
				                    <td>${fb.views}</td>
				                </tr>
				            </c:otherwise>
				        </c:choose>	
                        
                        <c:set var="counter" value="${counter + 1}" />
                    </c:forEach>
                </tbody>
            </table>
            </c:if>
			</div>
			
             <div class="pagination">
				    <c:if test="${currentPage > 10}">
				        <a href="<c:url value='/freeboard/freeboardView/${boardCtgId}?page=${startPage - 10}'/>" class="page-link">이전</a>
				    </c:if>
				
				    <c:forEach var="i" begin="${startPage}" end="${endPage}" varStatus="status">
				        <a href="<c:url value='/freeboard/freeboardView/${boardCtgId}?page=${i}'/>"
				           class="page-link ${i == currentPage ? 'current' : ''}">
				           ${i}
				        </a>
				    </c:forEach>
				
				    <c:if test="${endPage < totalPages}">
				        <a href="<c:url value='/freeboard/freeboardView/${boardCtgId}?page=${endPage + 1}'/>" class="page-link">다음</a>
				    </c:if>
				</div>
        </section>
        <!-- bottom.jsp import -->
        <c:import url="/WEB-INF/views/layout/bottom.jsp"/>
    </div>
</body>
</html>
