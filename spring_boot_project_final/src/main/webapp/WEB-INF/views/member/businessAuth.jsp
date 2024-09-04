<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/newfreeboardForm.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/businessAuth.css'/>">
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/ocr.js'/>"></script>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			
         <section>
         	<div id="ocrFormContainer">
	         	<p id="guide">*사업자 등록증을 첨부한 후 "작성" 버튼을 클릭하고, 기다려 주세요.</p>
	            <form id="ocrForm" action="/memberOcr/insertBusinessAuth" method="post" enctype="multipart/form-data">
	                <input type="file" id="uploadFile" name="uploadFile">
	                <input type="submit" class="btn" value="작성">
	            </form>
            </div>
            
            <form id="businessAuthForm" action="/memberOcr/insertBusinessAuth" method="post">
            <p id="guide">*내용을 검토한 후, 오류가 있는 부분을 수정해 주세요.</p>
            <div class="container">
                <div id="imageBox" class="image-box">
                </div>
                   <div id="resultsContainer" class="results-container">
                   		<input type="hidden" name="memId" value="${memId}">
                   		<input type="hidden" name="authStatus" value="pending">
               			<input type="hidden" id="bizRegImg" name="bizRegImg" value="">
                   		
                   
	                    <div class="result-item">
	                        <label for="businessName">업체명</label>
	                        <input type="text" id="businessName" name="businessName" required>
	                    </div>
	                    <div class="result-item">
	                        <label for="bizRegNumber">등록번호</label>
	                        <input type="text" id="bizRegNumber" name="bizRegNumber" required>
	                    </div>
	                    <div class="result-item">
	                        <label for="delegate">대표자</label>
	                        <input type="text" id="delegate" name="delegate" required>
	                    </div>
	                    
	                    <div class="result-item">
	                        <label for="businessAddress">사업장 소재지</label>
	                        <input type="text" id="businessAddress" name="businessAddress" required>
	                    </div>
	                    <div class="result-item">
	                        <label for="businessCategory">업태</label>
	                        <div class="input-radio-container">
						        <input type="text" id="businessCategory" name="businessCategory" required>
						        <div class="radio-buttons">
						            <label>
						                <input type="radio" name="businessType" value="sale">
						                판매 사업자
						            </label>
						            <label>
						                <input type="radio" name="businessType" value="reservation">
						                예약 사업자
						            </label>
						        </div>
						    </div>
	                    </div>
	                    <div class="result-item">
	                        <label for="issueDate">발행일</label>
	                        <input type="text" id="issueDate" name="issueDate" required>
	                    </div>
	                    <div id="btn_box">
	                    <input type="submit" class="btn" value="신청">
	                    <input type="button" class="btn" value="취소" onclick="window.location.href='/'">
	                    </div>
            		</div>
	            </div>
            </form>
	        </section>
        
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>
