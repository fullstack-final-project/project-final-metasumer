<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 정보</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/checkPwd.css'/>">
        <script src="/js/checkPwd.js"></script>	
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
			  <header>
			    <h2>비밀번호 인증</h2>
			  </header>
			  <form id="pwdCheckForm" method="post">
			    <div id="pwdCheck">
			      <img src="<c:url value='/image/lock.png' />"> 
			      <h3>정보를 안전하게 보호하기 위해<br><b>비밀번호를 다시 한 번 확인</b>합니다.</h3>
			      <p>비밀번호가 타인에게 노출되지 않도록 항상 주의해주세요.</p>
			        <div id="idPwdCheck">
			          <div id="userInfo" data-memid="${memVo.memId}">
                        아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>${memVo.memId}</b><br>
                      </div>
			          비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" id="pwd" name="pwd" autocomplete="off" required>
			        </div>
			        <div id="checkBtn">
			          <button id="cancelChkBtn" type="button">취소</button>
			          <input id="confirmBtn" type="submit" value="확인">
			        </div>
			    </div>
			  </form>
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
