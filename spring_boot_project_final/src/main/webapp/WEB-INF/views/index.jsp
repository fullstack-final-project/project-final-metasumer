<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/login.js'/>"></script>
		<!-- head.jsp import -->
		<%-- <c:import url = "/WEB-INF/views/layout/head.jsp"></c:import> --%>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<%-- <c:import url = "/WEB-INF/views/layout/top.jsp"></c:import> --%>
			
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
					<a href="<c:url value='/freeboard/freeboardView'/>">자유게시판</a>
				</c:if>


        </section>
        
			<!-- bottom.jsp import -->
			<%-- <c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>	 --%>	
		</div>
	</body>
</html>