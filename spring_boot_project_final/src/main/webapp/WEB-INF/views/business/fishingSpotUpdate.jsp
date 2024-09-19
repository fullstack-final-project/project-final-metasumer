<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>낚시터 등록</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/fishingSpotRegister.css'/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/searchZip.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				<!-- 낚시터 수정 폼 -->
				<div id="addSpotSection">
			    <h1>낚시터 수정</h1>
			    <form action="/business/updateFishingSpot" method="post" enctype="multipart/form-data">
					    <input type="hidden" name="bizId" value="${bizId}">
		    			<input type="hidden" name="spotId" value="${fishingSpot.spotId}">
			    		<input type="hidden" name="bizId" value="${bizId}">
			        <table>
			            <tr>
			                <th><label for="spotName">낚시터명</label></th>
			                <td><input type="text" id="spotName" name="spotName" value="${fishingSpot.spotName}" required></td>
			            </tr>
			            <tr>
					            <th><label for="spotType">낚시터 유형</label></th>
					            <td>
					                <select id="spotType" name="spotType" required>
					                    <option value="freshwater" ${fishingSpot.spotType == 'freshwater' ? 'selected' : ''}>민물</option>
					                    <option value="saltwater" ${fishingSpot.spotType == 'saltwater' ? 'selected' : ''}>바다</option>
					                </select>
					            </td>
					        </tr>
					        <tr>
					            <th><label for="spotDescription">낚시터 설명</label></th>
					            <td><textarea id="spotDescription" name="spotDescription" required>${fishingSpot.spotDescription}</textarea></td>
					        </tr>
					        <tr>
					            <th><label for="spotPrice">가격</label></th>
					            <td><input type="number" id="spotPrice" name="spotPrice" class="price" value="${fishingSpot.spotPrice}" required>원</td>
					        </tr>
					        <tr>
					            <th><label for="spotImage">이미지 파일</label></th>
					            <td>
					                <!-- 기존 이미지 보여주기 -->
					                <img src="/project_images/${fishingSpot.spotImage}" alt="${fishingSpot.spotName}" width="100">
					                <input type="file" id="spotImage" name="spotImage" accept="image/*">
					                <!-- 새 이미지 업로드는 선택 사항 -->
					            </td>
					        </tr>
					        <tr>
					            <th><label for="openingTime">오픈 시간</label></th>
					            <td><input type="time" id="openingTime" name="openingTime" value="${fishingSpot.openingTime}" required></td>
					        </tr>
					        <tr>
					            <th><label for="closingTime">마감 시간</label></th>
					            <td><input type="time" id="closingTime" name="closingTime" value="${fishingSpot.closingTime}" required></td>
					        </tr>
					        <tr>
					            <th><label for="spotAddress">주소</label></th>
					            <td colspan="3">
					                <input type="text" id="memZipcode" name="spotZipcode" value="${fishingSpot.spotZipcode}" placeholder="우편번호" size="5" required readonly>
					                <input type="button" id="searchZipBtn" name="searchZipBtn" class="btn" value="우편번호 찾기"><br>
					                <input type="text" id="memAddress1" name="spotAddress1" value="${fishingSpot.spotAddress1}">
					                <input type="text" id="memAddress2" name="spotAddress2" value="${fishingSpot.spotAddress2}">
					            </td>
					        </tr>
					        <tr>
					            <th><label for="spotHP">전화번호</label></th>
					            <td>
					                <input type="text" id="spotHP1" name="spotHP1" value="${fishingSpot.spotHP1}" maxlength="3" class="hp" required> -
					                <input type="text" id="spotHP2" name="spotHP2" value="${fishingSpot.spotHP2}" maxlength="4" class="hp" required> -
					                <input type="text" id="spotHP3" name="spotHP3" value="${fishingSpot.spotHP3}" maxlength="4" class="hp" required>
					            </td>
					        </tr>
					        <tr>
					            <th><label for="spotFacility">편의시설</label></th>
					            <td><textarea id="spotFacility" name="spotFacility" required>${fishingSpot.spotFacility}</textarea></td>
					        </tr>
					        <tr>
					            <td colspan="2" style="text-align: center;">
					                <button type="submit" class="btn">수정</button>
					            </td>
					        </tr>
					    </table>
					</form>
			</div>
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>