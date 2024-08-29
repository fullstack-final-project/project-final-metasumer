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
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminPageList.css'/>">
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<section>
				
				<div id="menuContainer">
				    <ul>
				        <li><a href="<c:url value='/admin/adminPage'/>">통계</a></li>
				        <li><a href="<c:url value='/admin/memberManagement/general'/>">일반 회원 관리</a></li>
				        <li><a href="<c:url value='/admin/businessManagement'/>">사업자 회원 관리</a></li>
				        <li><a href="<c:url value='/admin/memberManagement/admin'/>">관리자 관리</a></li>
				        <li><a href="<c:url value='/admin/postOps'/>">게시물 관리</a></li>
				    </ul>
				</div>
			</section>
			<!-- bottom.jsp import -->
		</div>
	</body>
</html>