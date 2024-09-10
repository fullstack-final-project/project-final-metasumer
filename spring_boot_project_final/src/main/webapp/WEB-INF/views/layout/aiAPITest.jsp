<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>CLOVA CSR 테스트 페이지</title>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/naverCSR.js'/>"></script>
	</head>
	<body>
		<div>
			<div>
				<h3>STT 작업</h3>
				<form id="sttForm">
					<input type="file" id="uploadFile" name="uploadFile">
					<input type="submit" value="결과 확인">
				</form>
			</div>
			<div>
				<h4 id="resultBox">텍스트 추출 결과</h4>
				<div id="audioBox"></div><br>
			</div>
		</div>
	</body>
</html>