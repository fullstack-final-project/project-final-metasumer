<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/newfreeboardForm.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/myFishRecordsUploadTag.css'/>">
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/myFishRecordsUpload.js'/>"></script>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				<form id="uploadMyFishRecordsForm" name="uploadMyFishRecordsForm" enctype="multipart/form-data">
				<input type="hidden" name="memId" value="${memId}">
				<input type="hidden" name="boardCtgId" value="${ boardCtgId }">
				<input type="hidden" name="typeNo" value="6">
				<input type="hidden" id="tagsInput" name="tagsArray" />
                <table>
                    <tr>
                        <th colspan="2">낚시 갤러리 기록</th>
                    </tr>
                    <tr>
		                <th>작성자</th>
		                <td>${memNickname }</td>
		            </tr>
		            <tr>
		                <th>제목</th>
		                <td><input type="text" id="title" name="title" class="input_text" required></td>
		            </tr>
		            <tr>
					    <th>날짜</th>
					    <td><input type="date" id="createdDate" name="createdDate" class="input_text" required></td>
					</tr>
		            <tr>
		                <th>내용</th>
		                <td><textarea id="content" name="content" rows="4" required></textarea></td>
		            </tr>
		            <tr>
		                <th>이미지 업로드</th>
		                <td><input type="file" id="uploadImage" name="uploadImage" onchange="previewImage(event)"><br>
		                <div id="imageBox"></div><br>
			                <button id="deleteButton" class="btn" onclick="deleteImage()">첨부파일 삭제</button>
            			</td>
		            </tr>
		            <tr>
					    <th>물고기 이름</th>
					    <td>
					        <button type="button" class="btn" onclick="searchFish()">사진으로 이름 찾기</button>
					        <input type="text" id="fishName" name="fishName" class="input_text">
					    </td>
					</tr>
		            <tr>
		                <th>물고기 크기</th>
		                <td><input type="number" id="fishSize" name="fishSize" class="input_num">cm</td>
		            </tr>
		            <tr>
		                <th>사용 장비</th>
		                <td><input type="text" id="equipment" name="equipment" class="input_text"></td>
		            </tr>
		            <tr>
					    <th>낚시 위치</th>
					    <td>
					        <input type="radio" id="freshwater" name="location " value="민물낚시" required>
					        <label for="freshwater">민물 낚시</label>
					        <input type="radio" id="saltwater" name="location " value="바다낚시" required>
					        <label for="saltwater">바다 낚시</label>
					    </td>
					</tr>
		            <tr>
		                <th>날씨</th>
		                <td><input type="text" id="weather" name="weather" class="input_text"></td>
		            </tr>
                    <tr>
					    <th>태그 추가하기</th>
					    <td>
					        <button type="button" class="btn" onclick="openInNewWindow()">태그 추가하기</button>
					        <div id="selectedTags"></div>
					    </td>
					</tr>
		            <tr>
		            	<td colspan="2" class="btn_box_center">
                            <button type="submit" class="btn">저장</button>
                            <button type="button" class="btn" onclick="window.location.href='<c:url value='/myFishRecords/myFishRecordsListView'/>'">취소</button>
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