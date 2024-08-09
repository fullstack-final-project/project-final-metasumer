<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<c:import url="/WEB-INF/views/test.jsp"></c:import>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/myFishRecordsListView.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
		<!-- head.jsp import -->
		<%-- <c:import url = "/WEB-INF/views/layout/head.jsp"></c:import> --%>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<%-- <c:import url = "/WEB-INF/views/layout/top.jsp"></c:import> --%>
			<section>
			
        		<a class="btn btn-write" href="<c:url value='/myFishRecords/newMyFishRecordsForm/${ mfList[0].boardCtgId }'/>">글쓰기</a>
			
				<div class="fish-container">
				    <c:forEach items="${mfList}" var="mf">
				        <div class="fish-item" onclick="location.href='<c:url value='/myFishRecords/detailViewmyFishRecords/${ mf.recordNo }' />'" style="cursor: pointer;">
				            <div id="title">${mf.title}</div>
				           
							<c:choose>
							    <c:when test="${not empty mf.uploadImage}">
							        <img src="<c:url value='/images/${mf.uploadImage}'/>" width="100%" height="200"><br>
							    </c:when>
							    <c:otherwise>
							        <img src="<c:url value='/images/noImage.png'/>" width="100%" height="200"><br>
							    </c:otherwise>
							</c:choose>



				            ${mf.memNickname}<br>
				            ${mf.content}<br>
				            <fmt:formatDate value="${mf.createdDate}" pattern="yyyy년 MM월 dd일" /><br>
				        </div>
				    </c:forEach>
				</div>	
			</section>
			<!-- bottom.jsp import -->
			<%-- <c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>	 --%>	
		</div>
	</body>
</html>