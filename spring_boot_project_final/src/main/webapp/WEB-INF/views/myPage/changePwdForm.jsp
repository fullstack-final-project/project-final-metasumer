<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/changePwd.css'/>">
		<script src="<c:url value='/js/normalization.js'/>"></script>
		<script src="<c:url value='/js/updateMember.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
			  <header>
			    <h2>비밀번호 수정</h2>
			  </header>
			  <form id="changePwdForm" method="post">
			    <div id="pwdCheck">
			      <img src="<c:url value='/image/lock.png' />"> 
			      <h3>주기적인 <b>비밀번호 변경</b>을 통해<br>개인정보를 안전하게 보호하세요.</h3>
			    <table id="changePwdTable">
			      <tr>
			        <th>새 비밀번호</th>
			        <td><input type="password" id="memPwd" name="memPwd" required>
			          <div id="passwordStrength" style="color: orange;"></div>
			          <input type="hidden" id="passwordAvailable1" name="passwordAvailable1" value="false">
			          <input type="hidden" id="passwordAvailable2" name="passwordAvailable2" value="false">
			        </td>
		          </tr>
			      <tr>
			        <th>새 비밀번호 확인</th>
			        <td><input type="password" id="PwdCheck" name="PwdCheck" required>
			        <div id="passwordError" style="color: red;"></div></td>
		          </tr>
			    </table>
			    </div>
			    <div id="updateMemBtn">
			      <button id="cancelUpdateBtn" type="button">취소</button>
			      <input id="updateBtn" type="submit" value="수정">
			    </div>
			  </form>
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
