<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/fleamarketList.css'/>">
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
				<a class="btn" href="<c:url value='/freeboard/newfreeboardForm/${ boardCtgId }'/>">글쓰기</a>
				   <div class="container">
					    <c:forEach items="${fbList}" var="fb">
						    <a class="item-link" href="<c:url value='/freeboard/detailViewFreeBoard/${fb.boardPostNo}'/>">
						        <div class="item">
						            <img src="<c:url value='/project_images/${fb.uploadFile}'/>" alt="Item Image">
						            <div class="text-content">
						                <h2>${fb.title}</h2>
						                <p><fmt:formatNumber value="${fb.price}" type="number" maxFractionDigits="0"/> 원</p>
						                <p>${fb.memNickname}</p>
						                <p><fmt:formatDate value="${fb.createdDate}" pattern="yyyy년 MM월 dd일" /></p>
						            </div>
						        </div>
						    </a>
						</c:forEach>
					</div>
				    
				    
				
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>