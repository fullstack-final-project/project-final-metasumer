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
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/BannerManagement.js'/>"></script>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
			<h1>배너관리 페이지</h1>
				<c:import url = "/WEB-INF/views/admin/adminPageList.jsp"></c:import>
				
				<table border="1">
				    <thead>
				        <tr>
				            <th>관심사ID</th>
				            <th>관심사</th>
				            <th colspan="2">배너 이미지</th>
				        </tr>
				    </thead>
				    <tbody>
			        <c:forEach items="${itList}" var="it">
			            <tr>
			                <td>${it.interestId}</td>
			                <td>${it.categoryName}</td>
			                <td>
			                    <img src="<c:url value='/project_images/upload/${it.tagImage}'/>" alt="Banner Image" style="max-width: 100px; max-height: 100px;" />
			                </td>
			                <td>
			                    <input type="file" id="file-${it.interestId}" name="file" style="display: none;" onchange="UploadOnChangeForButton(event, ${it.interestId})"/>
								<button type="button" class="btn" onclick="document.getElementById('file-${it.interestId}').click();">이미지 변경</button>
			                </td>
			            </tr>
			        </c:forEach>
			    </tbody>
				</table>
				
				
								
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>