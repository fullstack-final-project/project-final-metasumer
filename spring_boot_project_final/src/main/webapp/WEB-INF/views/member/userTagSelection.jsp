<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/userTagSelection.css'/>">
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/userTagSelection.js'/>"></script>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				
				<h1>${sessionScope.memNickname}님 관심 있는 태그를 선택하세요</h1>
				
		        <form action="#" method="post">
		        	<input type="hidden" name="memId" value="${memId}">
				     <c:forEach items="${caList}" var="ca">
				    	<div class="container">
				            <div class="category-header">
				                <h3>${ca.categoryName}</h3>
				            </div>
				            
				            <c:set var="caInterestId" value="${ca.interestId}" />
				            
				            <div class="tags-container">
				                <c:forEach items="${tagList}" var="tl">
				                    <c:if test="${tl.interestId eq caInterestId}">
				                        <div class="tag-item">
				                            <label><input type="checkbox" name="tags" value="${tl.tagId}" />${tl.tagName}</label>
				                        </div>
				                    </c:if>
				                </c:forEach>
				            </div>
				    	</div>
				     </c:forEach>
				     <button type="button" class="btn" id="submitBtn">저장</button>
				     <button type="button" class="btn" onclick="window.location.href='/'">취소</button>
				</form>
				
				
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>