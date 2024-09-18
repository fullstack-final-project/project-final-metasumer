<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/chatbot.js'/>"></script>
		<link rel="stylesheet"  type="text/css" href="/css/chatbot.css">
	</head>
	<body>
		<div id="wrap">
			<div id="chatBox"></div>
				<!-- 채팅 내용 출력 영역  -->
			<div id="chatSearchBox">
				<form id="chatForm" name="chatForm">
					<input type="text" id="message" name="message" size="30"  placeholder="질문을 입력하세요"/>
					<input type="submit" value="전송" id="btnSubmit"/>
				</form>
			</div>
			<div id="audioBox">
				<button id="stopBtn">완료</button>
				<button id="recordBtn">녹음</button>
			</div>
		</div>
		
	</body>
</html>