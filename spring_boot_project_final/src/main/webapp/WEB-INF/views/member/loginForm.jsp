<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/login.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/login.js'/>"></script>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			
			<section>
				<form id="loginForm" name="loginForm" action="<c:url value='/member/login'/>" method="post">
                <table>
                    <tr style="border-top: none;">
                        <td colspan="2">
                            <div id="findLinks">
                                <a href="<c:url value='/member/accountRecoveryForm'/>">아이디 찾기 / 비밀번호 찾기</a>
                            </div>
                        </td>
                    </tr>             
                    <tr><th>ID</th><td><input type="text" id="id" name="id" class="input_text" required></td></tr>
                    <tr><th>비밀번호</th><td><input type="password" id="pwd" name="pwd" autocomplete="off" required></td></tr>
                    <tr>
                        <td colspan="2" align="center" id="button">
                            <input type="submit" class="btn" value="로그인">
                            <input type="reset" class="btn" value="취소">
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