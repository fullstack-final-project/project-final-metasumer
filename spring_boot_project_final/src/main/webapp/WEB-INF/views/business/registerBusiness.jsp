<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사업체 등록</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<script src="<c:url value='/js/businessRegister.js' />"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/registerBusiness.css'/>" />
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section id="register-business">
            <h1>사업체 등록</h1>
            <form id="registerForm" name="registerForm" enctype="multipart/form-data">
            
            		<input type="hidden" id="memId" name="memId" value="biz123" />
            		
                <div class="form-group">
                    <label for="businessName">사업체명:</label>
                    <input type="text" id="businessName" name="businessName" required>
                </div>
                <div class="form-group">
                    <label for="bizRegNumber">사업자 등록번호:</label>
                    <input type="text" id="bizRegNumber" name="bizRegNumber" required>
                </div>
                <div class="form-group">
                    <label for="authDetails">사업자 설명:</label>
                    <textarea id="authDetails" name="authDetails" rows="4"></textarea>
                </div>
                <div class="form-group">
                    <label for="businessType">사업자 유형:</label>
                    <select id="businessType" name="businessType" required>
                        <option value="sale">판매</option>
                        <option value="reservation">예약</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="bizRegImg">사업자 등록증 이미지:</label>
                    <input type="file" id="bizRegImg" name="bizRegImg" required>
                </div>
                <button id="registerBtn" type="submit" class="btn btn-primary">등록</button>
            </form>
        </section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
