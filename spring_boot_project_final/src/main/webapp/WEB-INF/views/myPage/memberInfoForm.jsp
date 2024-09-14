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
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInfo.css'/>">
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
			  <div id="myInfoContainer">
			    <div id="myInfoListView">
			      <div id="hiMemInfo">
			        <span class="hiMessage">반가워요!</span><span> ${memVo.memName}님</span>
			        <p>최초 1회 무료배송</p>
			        <div id="pointsInfo">
			          <p>적립금</p>
			          <div id="pointsSum">100원</div>
			          <div id="eventGoWrapper">
                        <div id="eventGo">
                         <span>이벤트 확인하러 가기</span><span id="mark">></span>
                        </div>
                      </div>                    
			        </div>			  
			      </div>
			      <div id="myInfoList">
			        <h4>내 정보 관리</h4><hr>			        
			        <p><a href="/myPage/checkPwdForm?actionType=updateInfo">회원 정보 수정</a></p>
			        <p><a href="/myPage/checkPwdForm?actionType=changePwd">비밀번호 변경</a></p>
			      </div>
			    </div>
			    <div id="myList">
			      <div id="myFilter">
			        <p>나의 정보</p><hr>
			      </div>
			    </div>
			  </div>
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
