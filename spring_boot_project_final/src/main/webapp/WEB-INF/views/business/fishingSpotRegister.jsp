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
				<!-- 낚시터 등록 폼 -->
				<div id="addSpotSection">
			    <h1>낚시터 등록</h1>
			    <form action="/business/registerFishingSpot" method="post" enctype="multipart/form-data">
			    		<input type="hidden" name="bizId" value="${bizId}">
			        <table>
			            <tr>
			                <th><label for="spotName">낚시터명</label></th>
			                <td><input type="text" id="spotName" name="spotName" required></td>
			            </tr>
			            <tr>
			                <th><label for="spotType">낚시터 유형</label></th>
			                <td>
			                    <select id="spotType" name="spotType" required>
			                        <option value="freshwater">민물</option>
			                        <option value="saltwater">바다</option>
			                    </select>
			                </td>
			            </tr>
			            <tr>
			                <th><label for="spotDescription">낚시터 설명</label></th>
			                <td><textarea id="spotDescription" name="spotDescription" required></textarea></td>
			            </tr>
			            <tr>
			                <th><label for="spotPrice">가격</label></th>
			                <td><input type="number" id="spotPrice" name="spotPrice" class="price" placeholder="최소가격을 입력하세요." required>원</td>
			            </tr>
			            <tr>
			                <th><label for="spotImage">이미지 파일</label></th>
			                <td><input type="file" id="spotImage" name="spotImage" accept="image/*"></td>
			            </tr>
			            <tr>
			                <th><label for="openingTime">오픈 시간</label></th>
			                <td><input type="time" id="openingTime" name="openingTime" required></td>
			            </tr>
			            <tr>
			                <th><label for="closingTime">마감 시간</label></th>
			                <td><input type="time" id="closingTime" name="closingTime" required></td>
			            </tr>
			            <tr>
			                <th><label for="spotAddress">주소</label></th>
			                <td colspan="3">
			                		<input type="text" id="memZipcode" name="spotZipcode" placeholder="우편번호" size="5" class="input_text" required readonly>
			                    <input type="button" id="searchZipBtn" name="searchZipBtn" class="btn" value="우편번호 찾기"><br>
					                <input type="text" id="memAddress1" name="spotAddress1">
					                <input type="text" id="memAddress2" name="spotAddress2">
			                </td>
			            </tr>
			            <tr>
			                <th><label for="spotHP">전화번호:</label></th>
			                <td>
			                    <input type="text" id="spotHP1" name="spotHP1" maxlength="3" class="hp" required> -
			                    <input type="text" id="spotHP2" name="spotHP2" maxlength="4" class="hp" required> -
			                    <input type="text" id="spotHP3" name="spotHP3" maxlength="4" class="hp" required>
			                </td>
			            </tr>
			            <tr>
			                <th><label for="spotFacility">편의시설:</label></th>
			                <td><textarea id="spotFacility" name="spotFacility" required></textarea></td>
			            </tr>
			            <tr>
			                <td colspan="2" style="text-align: center;">
			                    <button type="submit" class="btn">등록</button>
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