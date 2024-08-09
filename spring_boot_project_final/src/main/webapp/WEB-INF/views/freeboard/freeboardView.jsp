<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<c:import url="/WEB-INF/views/test.jsp"></c:import>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/freeboardView.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
    <meta charset="UTF-8">
    <title>자유게시판</title>
    <!-- head.jsp import -->
    <%-- <c:import url="/WEB-INF/views/layout/head.jsp"/> --%>
</head>
<body>
    <div id="wrap">
        <!-- top.jsp import -->
        <%-- <c:import url="/WEB-INF/views/layout/top.jsp"/> --%>
        <section>
            <h1>${fbList[0].boardCtgName}</h1>
            <h1>${boardCtgId}</h1>
            
        <div style="text-align: right; margin-bottom: 10px;">
        	<a class="btn" href="<c:url value='/freeboard/newfreeboardForm/${ boardCtgId }'/>">글쓰기</a>
    	</div>
				
			<c:if test="${empty fbList}">
                <p>데이터가 없습니다.</p>
            </c:if>	
	
	
			<c:if test="${not empty fbList}">
            <table border="1" width="70%">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>작성자</th>
                        <th>제목</th>
                        <th>작성 날짜</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="counter" value="${(currentPage - 1) * 10 + 1}" />
                    <c:forEach items="${fbList}" var="fb">
                        <tr onclick="location.href='<c:url value='/freeboard/detailViewFreeBoard/${ fb.boardPostNo}' />'" style="cursor: pointer;">
                            <td>${counter}</td>
                            <td>${fb.memNickname}</td>
                            <td>${fb.title}</td>
                            <td><fmt:formatDate value="${fb.createdDate}" pattern="yyyy년 MM월 dd일" /></td>
                        </tr>
                        <c:set var="counter" value="${counter + 1}" />
                    </c:forEach>
                </tbody>
            </table>

            <div class="pagination" style="text-align: center; margin-top: 10px;">
                <!-- 이전 페이지 링크 -->
                <c:if test="${currentPage > 1}">
                    <a href="?page=${currentPage - 1}">이전</a>
                </c:if>

                <!-- 페이지 번호 링크 -->
                <c:forEach begin="1" end="${totalPages}" var="page">
                    <c:choose>
                        <c:when test="${page == currentPage}">
                            <span>${page}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="?page=${page}">${page}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <!-- 다음 페이지 링크 -->
                <c:if test="${currentPage < totalPages}">
                    <a href="?page=${currentPage + 1}">다음</a>
                </c:if>
            </div>
            </c:if>
        </section>
        <!-- bottom.jsp import -->
        <%-- <c:import url="/WEB-INF/views/layout/bottom.jsp"/> --%>
    </div>
</body>
</html>
