<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 페이지</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/memberManagement.css'/>">
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<style>
        
    </style>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				<h2>게시물 관리</h2>
				<c:import url = "/WEB-INF/views/admin/adminPageList.jsp"></c:import>
				
				<form action="/admin/postOps" method="get">
				    <label for="startDate">시작 날짜:</label>
				    <input type="date" id="startDate" name="startDate" value="${startDate}">
				    
				    <label for="endDate">종료 날짜:</label>
				    <input type="date" id="endDate" name="endDate" value="${endDate}">
				    
				    <button type="submit">조회</button>
				</form>
				
			    
			     <h3>게시물 목록</h3>
			    
			    <table border="1">
			        <thead>
			            <tr>
			            	<th>순번</th>
			            	<th>게시판</th>
			            	<th>작성자</th>
			            	<th>작성자ID</th>
			                <th>제목</th>
			                <th>작성 날짜</th>
			            </tr>
			        </thead>
			        <tbody>
			            <c:forEach items="${poList}" var="po" varStatus="status">
			                <tr>
			                	<td>${(currentPage - 1) * size + status.index + 1}</td>
			                    <td>
			                    	<c:choose>
								        <c:when test="${po.boardCtgId == 1}">공지사항</c:when>
								        <c:when test="${po.boardCtgId == 2}">자유게시판</c:when>
								        <c:when test="${po.boardCtgId == 3}">자주 묻는 질문</c:when>
								        <c:when test="${po.boardCtgId == 4}">고객센터</c:when>
								        <c:when test="${po.boardCtgId == 5}">벼룩시장</c:when>
								        <c:when test="${po.boardCtgId == 6}">낚시갤러리</c:when>
								    </c:choose>
			                    </td>
			                    <td>${po.memNickname}</td>
			                    <td>${po.memId}</td>
			                    <td>
								    <c:choose>
									    <c:when test="${po.boardCtgId == 6}">
									        <a href="<c:url value='/myFishRecords/detailViewmyFishRecords/${po.postId}' />">${po.title}</a>
									    </c:when>
									    <c:when test="${po.boardCtgId == 3}">
									        <a href="<c:url value='/freeboard/freeboardView/3' />">${po.title}</a>
									    </c:when>
									    <c:otherwise>
									        <a href="<c:url value='/freeboard/detailViewFreeBoard/${po.postId}' />">${po.title}</a>
									    </c:otherwise>
									</c:choose>
			                    </td>
			                    <td><fmt:formatDate value="${po.createdDate}" pattern="yyyy-MM-dd"/></td>
			                </tr>
			            </c:forEach>
			        </tbody>
			    </table>
				 <div class="pagination">
	                <c:if test="${currentPage > 1}">
	                    <a href="/admin/postOps?startDate=${startDate}&endDate=${endDate}&page=${currentPage - 1}&size=${size}">이전</a>
	                </c:if>
	
	                <c:forEach begin="1" end="${totalPages}" var="i">
	                    <a href="/admin/postOps?startDate=${startDate}&endDate=${endDate}&page=${i}&size=${size}" 
	                       class="${i == currentPage ? 'active' : ''}">
	                       ${i}
	                    </a>
	                </c:forEach>
	
	                <c:if test="${currentPage < totalPages}">
	                    <a href="/admin/postOps?startDate=${startDate}&endDate=${endDate}&page=${currentPage + 1}&size=${size}">다음</a>
	                </c:if>
	            </div>
				
				
				
				
				
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>