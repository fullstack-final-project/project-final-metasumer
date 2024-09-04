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
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/join.css'/>">
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/searchZip.js'/>"></script>
		<script src="<c:url value='/js/join.js'/>"></script>
		<script src="<c:url value='/js/normalization.js'/>"></script>
		
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			
			<section>
                <h1><c:choose>
		                <c:when test="${sessionScope.memType == 'admin'}">관리자 계정 생성</c:when>
		                <c:otherwise>회원가입</c:otherwise>
		            </c:choose>
	            </h1>
               <form id="joinForm" name="joinForm" method="post" action="<c:url value='/member/join'/>">
               <input type="hidden" name="memType" value="<c:out value='${sessionScope.memType == "admin" ? "admin" : "general"}'/>">
               <input type="hidden" name="sessionMemType" value="<c:out value='${sessionScope.memType == "admin" ? "admin" : "general"}'/>">
		        	<table>
			            <tr>
			            	<th> 성명</th>
			           		<td><input type="text" id="memName" name="memName" class="input_text" required></td>
		           		</tr>
			            <tr>
			            	<th> 닉네임</th>
			           		<td><input type="text" id="memNickname" name="memNickname" class="input_text" required>
			            		<input type="button" id="nicknamCheck" class="btn" value="닉네임 중복 체크">
			            		<input type="hidden" id="nickAvailable" name="nickAvailable" value="false"></td>
		           		</tr>
			            <tr>
			            	<th> ID</th>
			            	<td><input type="text" id="memId" name="memId" class="input_text" required> 
			            		<input type="button" id="idCheck" class="btn" value="ID 중복 체크">
			            		<input type="hidden" id="idAvailable" name="idAvailable" value="false"></td>
		            	</tr>
			            <tr>
			            	<th>비밀번호</th>
			            	<td><input type="password" id="memPwd" name="memPwd" required>
			            		<div id="passwordStrength" style="color: orange;"></div>
			            		<input type="hidden" id="passwordAvailable1" name="passwordAvailable1" value="false">
			            		<input type="hidden" id="passwordAvailable2" name="passwordAvailable2" value="false"></td>
		            	</tr>
			            <tr>
			            	<th>비밀번호 확인</th>
			            	<td><input type="password" id="PwdCheck" name="PwdCheck" required>
			            	<div id="passwordError" style="color: red;"></div></td>
		            	</tr>
			            <tr>
			            	<th>휴대폰 번호</th>
			            	<td><input type="text" id="memHp1" name="memHp1" size="3" class="hp" required> 
			                    - <input type="text" id="memHp2" name="memHp2" size="4" class="hp" required>
			                    - <input type="text" id="memHp3" name="memHp3" size="4" class="hp" required></td>
	                    </tr>
	                    <tr>
						    <th>이메일</th>
						    <td>
						        <input type="email" id="memEmail" name="memEmail" placeholder="이메일 입력" autocomplete="off" required>
						        <select id="emailDomain">
						            <option value="">도메인 선택</option>
						            <option value="naver.com">naver.com</option>
						            <option value="daum.net">daum.net</option>
						            <option value="gmail.com">gmail.com</option>
						            <option value="yahoo.co.kr">yahoo.co.kr</option>
						            <option value="hotmail.com">hotmail.com</option>
						            <option value="outlook.com">outlook.com</option>
						            <option value="nate.com">nate.com</option>
						            <option value="hanmail.net">hanmail.net</option>
						            <option value="kakao.com">kakao.com</option>
						            <option value="paran.com">paran.com</option>
						            <option value="empas.com">empas.com</option>
						            <option value="lycos.co.kr">lycos.co.kr</option>
						            <option value="daum.com">daum.com</option>
						            <option value="hitel.net">hitel.net</option>
						            <option value="dreamwiz.com">dreamwiz.com</option>
						            <option value="webmail.co.kr">webmail.co.kr</option>
						            <option value="samsung.com">samsung.com</option>
						            <option value="hyundai.com">hyundai.com</option>
						            <option value="custom">직접 입력</option>
						        </select>
						    </td>
						</tr>
	                    <tr>
						    <th>성별</th>
						    <td>
						        <label>
						            <input type="radio" id="M" name="memGender" value="M" required>
						            남
						        </label>
						        <label>
						            <input type="radio" id="F" name="memGender" value="F" required>
						            여
						        </label>
						    </td>
						</tr>
						<tr>
						    <th>생년월일</th>
						    <td>
						        <select id="birthYear" name="birthYear" required>
						            <option value="">연도</option>
						        </select>
						        <select id="birthMonth" name="birthMonth" required>
						            <option value="">월</option>
						        </select>
						        <select id="birthDay" name="birthDay" required>
						            <option value="">일</option>
						        </select>
						    </td>
						</tr>
	                    <tr>
			            	<th>주소</th>
			            	<td colspan="3">
			            		<input type="text" id="memZipcode" name="memZipcode" size="5" class="input_text" readonly>
			            		<input type="button" id="searchZipBtn" name="searchZipBtn" class="btn" value="우편번호 찾기"><br>
			            		<input type="text" id="memAddress1" name="memAddress1" class="input_text" readonly>
			            		<input type="text" id="memAddress2" name="memAddress2" placeholder="상세 주소 입력" class="input_text" required>
		            		</td>
		            	</tr>
			             <tr>
			                <td style="text-align: center;" colspan="2" align="center" id="button">
			                    <input type="submit" value="완료" class="btn">
			                    <input type="reset" value="취소" class="btn" id="cancelButton">
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