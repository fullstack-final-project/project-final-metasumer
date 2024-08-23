<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입 완료</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/joinComplete.css'/>">
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				
				<div class="completion-container">
					<h1>회원가입이 완료되었습니다!</h1>
					<p>회원가입이 성공적으로 완료되었습니다. 아래 버튼을 클릭하여 이동하세요.</p>
					<a href="<c:url value='/'/>" class="btn">홈으로 가기</a>
					<a href="<c:url value='/member/loginForm'/>" class="btn">로그인</a>
					<a href="<c:url value='/member/businessAuth'/>" class="btn">사업자 인증하기</a>
				</div>
				
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>