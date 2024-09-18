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
			<form method="post" action="<c:url value='/myFishRecords/updatemyFishRecords'/>" enctype="multipart/form-data">
				<input type="hidden" name="recordNo" value="${mf.recordNo}" />
				<input type="hidden" name="memId" value="${mf.memId}" />
				<input type="hidden" name="boardCtgId" value="${mf.boardCtgId}" />
				
				<table>
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text" id="title" name="title" class="input_text" value="${ mf.title }" required></td>
						<th>날짜</th>
						<td><input type="date" id="createdDate" name="createdDate" class="input_text" value="<fmt:formatDate value="${mf.createdDate}" pattern="yyyy-MM-dd" />" required></td>
						
					</tr>
					<tr>
						<th>작성자</th>
						<td>${ mf.memNickname }</td>
						<th>위치</th>
						<td><input type="text" id="location" name="location" value="${ mf.location }" class="input_text" required></td>
						<th>날씨</th>
						<td><input type="text" id="weather" name="weather" value="${ mf.weather }" class="input_text" required></td>
					</tr>
					<tr>
						<th>어종</th>
						<td><input type="text" id="fishName" name="fishName" value="${ mf.fishName }" class="input_text" required></td>
						<th>크기</th>
						<td><input type="text" id="fishSize" name="fishSize" value="${ mf.fishSize }" class="input_text" required></td>
						<th>장비</th>
						<td><input type="text" id="equipment" name="equipment" value="${ mf.equipment }" class="input_text" required></td>
						
					</tr>
					<tr>
					    <th>글내용</th>
					    <td colspan="5"><textarea id="content" name="content" style="height: 250px;" required> ${mf.content}</textarea></td>
					</tr>
					<tr>
					    <th>첨부파일</th>
					    <td colspan="5">
					        <input type="text" id="uploadedFile" value="${mf.uploadImage}" class="input_text" readonly/>
					        <button type="button" class="btn" id="deleteButton" onclick="clearFile(event)">삭제</button>
					        <input type="file" id="uploadFile" name="uploadFile" onchange="UploadOnChange(event)">
  						</td>
					</tr>
					 <tr>
                        <td colspan="6">
	                        <div class="btn_container">
		                        <button class="btn" type="button" onclick="window.location.href='<c:url value='/myFishRecords/myFishRecordsListView'/>';">취소</button>
		                        <button class="btn" type="submit">완료</button>
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