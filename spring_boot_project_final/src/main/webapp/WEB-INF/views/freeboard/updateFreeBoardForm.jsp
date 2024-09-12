<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		 <link rel="stylesheet" type="text/css" href="<c:url value='/css/newfreeboardForm.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/update.js'/>"></script>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
			<form method="post" action="<c:url value='/freeboard/updateFreeBoard'/>" enctype="multipart/form-data">
				<input type="hidden" name="boardPostNo" value="${fb.boardPostNo}">
				<input type="hidden" name="boardCtgId" value="${fb.boardCtgId}">
				<input type="hidden" name="completed" value="0">
				<table border="1">
                    <tr>
                        <th colspan="2">${fb.boardCtgName} 수정</th>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>${fb.memNickname}</td>
                    </tr>
                    <tr>
			            <th>제목</th>
			            <td><input type="text" class="input_text" id="title" name="title" value="${fb.title}" required></td>
			        </tr>
			        <tr>
			            <th>내용</th>
			            <td><textarea id="content" name="content" rows="10" cols="50">${fb.content}</textarea></td>
			        </tr>
			    <c:if test="${fb.boardCtgId == 5}">
                    <tr>
                        <td><label for="price">가격</label></td>
                        <td><input type="number" class="input_text" id="price" name="price" min="0" step="100" value="${fb.price}" required /></td>
                    </tr>
                </c:if>
                   <tr>
					    <th>첨부파일</th>
					    <td>
					        <input type="text" class="input_text" id="uploadedFile" value="${fb.uploadFile}" readonly/>
					        <button type="button" class="btn" id="deleteButton" onclick="clearFile(event)">삭제</button>
					        <input type="file" id="uploadFile" name="uploadFile" onchange="UploadOnChange(event)">
  						</td>
					</tr>
                    <tr>
                        <td colspan="2">
                        	<div class="btn_container">
		                        <button type="button" class="btn" onclick="window.location.href='<c:url value='/freeboard/freeboardView/${ fb.boardCtgId }'/>'">취소</button>
		                        <button type="submit" class="btn">완료</button>
		                    </div>
	                    </td>
                    </tr>
                </table>
			</form>
				
				
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>