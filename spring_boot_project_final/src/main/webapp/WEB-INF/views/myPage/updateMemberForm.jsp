<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 정보 수정</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/checkPwd.css'/>">
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
        <script src="<c:url value='/js/searchZip.js'/>"></script>
        <script src="/js/updateMember.js"></script>
        <script src="/js/join.js"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
			  <header>
			    <h2>회원 정보 수정</h2>
			  </header>
			  <form id="updateMemForm" method="post">	
			    <table id="updateMemTable">
			      <tr>
			        <th>아이디</th>
			        <td>${memVo.memId}</td>
			      </tr>
			      <tr>
			        <th>이름</th>
			        <td><input type="text" id="updateName" name="updateName" value="${memVo.memName}"></td>
			      </tr>
			      <tr>
			        <th>닉네임</th>
			        <td><input type="text" name="updateNickName" value="${memVo.memNickname}"></td>
			      </tr>
			      <tr>
			        <th>휴대폰 번호</th>
			        <td><input type="text" name="hp1" value="${hp1}" size="3"> - 
	        		    <input type="text" name="hp2" value="${hp2}" size="4"> - 
	        		    <input type="text" name="hp3" value="${hp3}" size="4">
	        	    </td>
			      </tr>
			      <tr>
			        <th>이메일</th>
				    <td>
					    <input type="email" id="memEmail" name="updateEmail" value="${memVo.memEmail}">
						<select id="emailDomain">
						  <option value="">직접 입력</option>
						  <option value="naver.com">@naver.com</option>
						  <option value="daum.net">@daum.net</option>
						  <option value="gmail.com">@gmail.com</option>
						  <option value="yahoo.co.kr">@yahoo.co.kr</option>
						  <option value="hotmail.com">@hotmail.com</option>
						  <option value="outlook.com">@outlook.com</option>
						  <option value="nate.com">@nate.com</option>
						  <option value="hanmail.net">@hanmail.net</option>
						  <option value="kakao.com">@kakao.com</option>
						  <option value="paran.com">@paran.com</option>
						  <option value="empas.com">@empas.com</option>
						  <option value="lycos.co.kr">@lycos.co.kr</option>
						  <option value="daum.com">@daum.com</option>
						  <option value="hitel.net">@hitel.net</option>
						  <option value="dreamwiz.com">@dreamwiz.com</option>
						  <option value="webmail.co.kr">@webmail.co.kr</option>
						  <option value="samsung.com">@samsung.com</option>
						  <option value="hyundai.com">@hyundai.com</option>
						</select>
				    </td>
				  </tr>
				  <tr>
				    <th>성별</th>
					   <td>
					     <c:choose>
                            <c:when test="${memVo.memGender == 'M'}">
                              <label>
                                <input type="radio" id="M" name="updateGender" value="M" checked> 남
                              </label>
                              <label>
                                <input type="radio" id="F" name="updateGender" value="F"> 여
                              </label>
                            </c:when>
                            <c:when test="${memVo.memGender == 'F'}">
                              <label>
                                <input type="radio" id="M" name="updateGender" value="M"> 남
                              </label>
                              <label>
                                <input type="radio" id="F" name="updateGender" value="F" checked> 여
                              </label>
                            </c:when>
                         </c:choose>
				     </td>
				  </tr>
			      <tr>
			        <th>주소</th>
			        <td colspan="3">
			          <input type="text" id="memZipcode" name="updateMemZipcode" size="5" value="${memVo.memZipcode}">
			          <input type="button" id="searchZipBtn" name="searchZipBtn" class="btn" value="우편번호 찾기"><br>
			          <input type="text" id="memAddress1" name="updateMemAddress1" value="${memVo.memAddress1}">
			          <input type="text" id="memAddress2" name="updateMemAddress2" value="${memVo.memAddress2}">
		            </td>
			      </tr>
			    </table>
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
