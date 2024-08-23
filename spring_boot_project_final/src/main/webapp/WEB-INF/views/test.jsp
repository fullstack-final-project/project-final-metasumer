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
		<script src="<c:url value='/js/test.js'/>"></script>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			
			<section>
				<c:if test="${ empty sessionScope.sid }">
                    <form id="loginForm" name="loginForm" action="<c:url value='/login'/>" method="post">
                        <table>
                            <tr><th>ID</th><td><input type="text" id="id" name="id" required></td></tr>
                            <tr><th>비밀번호</th><td><input type="password" id="pwd" name="pwd" autocomplete="off" required></td></tr>
                            <tr>
                                <td colspan="2" align="center" id="button">
                                    <br><input type="submit" value="로그인">
                                    <input type="reset" value="취소">
                                </td>
                            </tr>             
                        </table>
                    </form>
				</c:if>
	
				<c:if test="${ not empty sessionScope.sid }">
					${ sessionScope.memNickname }님 환영합니다!<br>
					<a class="btn" href="<c:url value='/freeboard/freeboardView/1'/>">공지사항</a>
					<a class="btn" href="<c:url value='/freeboard/freeboardView/2'/>">자유게시판</a>
					<a class="btn" href="<c:url value='/freeboard/freeboardView/3'/>">자주묻는 질문</a>
					<a class="btn" href="<c:url value='/freeboard/freeboardView/4'/>">고객센터</a>
					<a class="btn" href="<c:url value='/freeboard/fleamarketList/5'/>">벼룩시장</a>
					<a class="btn" href="<c:url value='/myFishRecords/myFishRecordsListView'/>">물고기기록</a>
				</c:if>				
				
				<a href="<c:url value='/business/businessMain'/>">사업자 메인 페이지</a><br>
				<a href="<c:url value='/business/registerBusinessForm'/>">업체 등록</a><br>
				<a href="<c:url value='/fishingSpot/freshwater'/>">민물 낚시</a><br>
				<a href="<c:url value='/fishingSpot/saltwater'/>">바다 낚시</a><br>
				
        </section>
        
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>