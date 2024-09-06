<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/accountRecoveryForm.css'/>">
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/accountRecoveryForm.js'/>"></script>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<script>
	        var formState = "${sessionScope.formState}";
	    </script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			
			<section>
			<div id="btnContainer">
			    <button id="showIdForm" class="plain-button">아이디 찾기</button>
			    <button id="showPwdForm" class="plain-button">비밀번호 찾기</button>
			</div>
			
			<c:if test="${not empty sessionScope.message}">
			    <div id="messageBox" class="message-box">
			        ${sessionScope.message}
			    </div>
			</c:if>
			
            
            <div id="idForm" class="formContainer">
                <form action="<c:url value='/member/forgotId'/>" method="post">
                    <table>
                    	<tr>
				            <td colspan="2"><p>아이디 찾기</p></td>
				        </tr>
				        <tr>
				            <th><label for="memName">이름</label></th>
				            <td><input type="text" id="memName" name="memName" class="inputF" required></td>
				        </tr>
				        <tr>
				            <th><label for="birthDate">생년월일</label></th>
				            <td><input type="date" id="birthDate" name="birthDate" class="inputF" required></td>
				        </tr>
				        <tr>
				            <th><label for="memHP">핸드폰번호</label></th>
				            <td>
			                    <input type="text" id="hp1" name="hp1" class="inputF ph" maxlength="3" required> -
			                    <input type="text" id="hp2" name="hp2" class="inputF ph" maxlength="4" required> -
			                    <input type="text" id="hp3" name="hp3" class="inputF ph" maxlength="4" required>
			                </td>
				        </tr>
				        <tr>
				            <th><label for="memEmail">이메일</label></th>
				            <td><input type="email" id="memEmail" name="memEmail" class="inputF" required></td>
				        </tr>
				        <tr>
				            <td colspan="2" align="center">
				                <input type="submit" class="btn" value="아이디 찾기">
				                <button type="button" class="btn" onclick="window.location.href='<c:url value='/' />'">취소</button>
				            </td>
				        </tr>
                    </table>
                </form>
            </div>
            
            <div id="pwdForm" class="formContainer" style="display:none;">
                <form action="<c:url value='/member/forgotPassword'/>" method="post">
                    <table>
                    	<tr>
				            <th colspan="2"><p>비밀번호 찾기</p></th>
				        </tr>
				        <tr>
				            <th><label for="memId">아이디</label></th>
				            <td><input type="text" id="memId" name="memId" class="inputF" required></td>
				        </tr>
				        <tr>
				            <th><label for="memName">이름</label></th>
				            <td><input type="text" id="memName" name="memName" class="inputF" required></td>
				        </tr>
				        <tr>
				            <th><label for="birthDate">생년월일</label></th>
				            <td><input type="date" id="birthDate" name="birthDate" class="inputF" required></td>
				        </tr>
				        <tr>
				            <th><label for="memEmail">이메일</label></th>
				            <td><input type="email" id="memEmail" name="memEmail" class="inputF" required></td>
				        </tr>
				        <tr>
				            <td colspan="2" align="center">
				                <input type="submit" class="btn" value="비밀번호 찾기">
				                <button type="button" class="btn" onclick="window.location.href='<c:url value='/' />'">취소</button>
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