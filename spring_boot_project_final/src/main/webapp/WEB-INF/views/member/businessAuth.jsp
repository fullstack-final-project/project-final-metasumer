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
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			
			<section>
               
               <h2>사업자회원 신청 정보 입력</h2>
               
			    <form action="saveBusiness.jsp" method="post" enctype="multipart/form-data">
			        <input type="hidden" id="memId" name="memId" value="${sessionScope.sid}">
			        <input type="hidden" id="authStatus" name="authStatus" value="pending">

		        <table>
		        	<tr>
		        		<th>사업자 등록 번호</th>
		        		<td colspan="2">
		        			<input type="text" class="hp" id="bizNum1" name="bizNum1" maxlength="3" placeholder="3자리" required> -
						    <input type="text" class="hp" id="bizNum2" name="bizNum2" maxlength="2" placeholder="2자리" required> -
						    <input type="text" class="hp" id="bizNum3" name="bizNum3" maxlength="5" placeholder="5자리" required></td>
		        	</tr>
		            <tr>
		            <th>사업자 유형</th>
		                <td><input type="radio" id="sale" name="businessType" value="sale" required>
		                <label for="sale">판매</label></td>
		                <td><input type="radio" id="reservation" name="businessType" value="reservation" required>
		                <label for="reservation">예약</label></td>
		            </tr>
		            <tr>
		            	<th>사업자 소개</th>
		            	<td colspan="2"><textarea id="authDetails" name="authDetails" rows="4" cols="50" style="resize: none; width: 450px; height: 150px;"></textarea></td>
		            </tr>
		            <tr>
		                <th>사업자 등록증 이미지 첨부</th>
		                <td colspan="2"><input type="file" id="bizRegImg" name="bizRegImg"></td>
		            </tr>
		            <tr>
			            <th colspan="3">
			            	<input type="submit" class="btn" value="신청">
					        <button type="button" class="btn" onclick="history.back()">취소</button>
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