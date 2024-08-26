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
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/newSelectedTags.css'/>">
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/newSelectedTags.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			<section>
				<h1>관심사 추가</h1>
				 <c:forEach items="${caList}" var="ca">
			        <h3>${ca.categoryName}</h3>
			        <c:set var="caInterestId" value="${ca.interestId}" />
			
			        <c:forEach items="${tagList}" var="t">
			            <c:if test="${t.interestId eq caInterestId}">
			                <c:set var="isInNewList" value="false" />
			                
			                <c:forEach items="${newList}" var="n">
			                    <c:if test="${n.tagId eq t.tagId}">
			                        <c:set var="isInNewList" value="true" />
			                    </c:if>
			                </c:forEach>
			
			                <c:choose>
			                    <c:when test="${not isInNewList}">
			                        <input type="checkbox" disabled />${t.tagName}
			                    </c:when>
			                    <c:otherwise>
			                        <label>
									    <input type="checkbox" id="tag_${t.tagId}" name="tagName" value="${t.tagName}" />
									    ${t.tagName}
									<input type="hidden" name="tagId" value="${t.tagId}" />
									</label>
			                    </c:otherwise>
			                </c:choose>
			            </c:if>
			        </c:forEach>
			    </c:forEach>
			    <div class="btn_box_center">
                	<button id="completeBtn" class="btn">완료</button>
                </div>
			</section>
		</div>
	</body>
</html>