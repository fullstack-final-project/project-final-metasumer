<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/newfreeboardForm.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/uploadFile.js'/>"></script>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				<form id="uploadFileForm" name="uploadFileForm" enctype="multipart/form-data">
				<input type="hidden" name="memId" value="${memId}">
				<input type="hidden" name="boardCtgId" value="${ boardCtgId }">
				<input type="hidden" name="completed" value="0">
				
				
                <table border="1">
                    <tr>
                        <th colspan="2">글쓰기 페이지${memId}</th>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td>${memNickname}</td>
                    </tr>
                    <tr>
                        <td><label for="title">제목</label></td>
                        <td><input type="text" id="title" name="title" class="input_text" required></td>
                    </tr>
                    <tr>
                        <td><label for="content">내용</label></td>
                        <td><textarea id="content" name="content" rows="10" cols="50" required></textarea></td>
                    </tr>
                <c:if test="${boardCtgId == 5}">
                    <tr>
                        <td><label for="price">가격</label></td>
                        <td><input type="number" id="price" name="price" min="0" step="100" class="input_num" required/></td>
                    </tr>
                </c:if>
                <c:if test="${boardCtgId != 3}">
                    <tr>
			            <td><label for="uploadFile">파일 업로드</label></td>
			            <td>
			                <input type="file" id="uploadFile" name="uploadFile" onchange="toggleDeleteButton()">
			                <button id="deleteButton" class="btn" style="display: none;" onclick="resetFileInput()">첨부파일 삭제</button>
            			</td>
			        </tr>
			    </c:if>
                    <tr>
                        <th colspan="2">
                            <button type="submit" class="btn">저장</button>
                            <button type="button" class="btn" onclick="window.location.href='<c:url value='/freeboard/freeboardView/${ boardCtgId }'/>'">취소</button>
                        </th>
                    </tr>
                </table>
            </form>
				
				
				
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>