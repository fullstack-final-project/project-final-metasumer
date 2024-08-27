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
		<script src="<c:url value='/js/selectedTagsView.js'/>"></script>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				<input type="hidden" id="memId" value="${sessionScope.memId}"/>
				<div class="header-actions">
				    <h1>${sessionScope.memNickname}님의 관심사</h1>
				   	<button type="button" id="editBtn" class="btn">수정</button>
                	<button type="button" id="doneBtn" class="btn" style="display:none;">완료</button>
                	<button type="button" id="addBtn" class="btn" style="display:none;">추가</button>
				</div>
				
              	<ul id="userTagList">
                <c:forEach items="${usList}" var="us">
                    <li class="userItem" data-tag-id="${us.tagId}">${us.tagName}
                    <button class="delete-button" style="display:none;">삭제</button></li>
                </c:forEach>
            	</ul>
            	
            	 <div id="tagsContainer"></div>
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>