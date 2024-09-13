<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>fish detect test</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/fish_detect.css'/>">
		<script src="<c:url value='/js/jquery-3.7.1.min.js' />"></script>
		<script src="<c:url value='/js/fish_detect.js' />"></script>
	</head>
	<body>
		
		<div class="container">
			<div class="title-container">
	           <h3>사진으로 물고기 이름 찾기</h3>
	        </div>
			
			<!-- 파일 업로드 -->
			 <form id="fishForm" >
				파일 : <input type="file" id="uploadFile" name="uploadFile">
				<input type="submit" value="결과 확인" class="btn"><br><br>
			</form>
		
			<!-- 결과 출력 -->	
			<h2>물고기 이름</h2>
			<div id="resultBox"></div>
			<br><br>			
			
			<div class="btn-box-center">
                <button class="cancel btn">취소</button>
                <button class="done btn">완료</button>
            </div>
		</div>
	</body>
</html>


