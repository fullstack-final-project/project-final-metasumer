<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 페이지</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/memberDetail.css'/>">
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				<h2>디테일 페이지</h2>
				<c:import url = "/WEB-INF/views/admin/adminPageList.jsp"></c:import>
				
				<table border="1">
                <tbody>
                    <tr>
                        <th>회원 ID</th>
                        <th>이름</th>
                        <th>성별</th>
                    </tr>    
                    <c:forEach items="${memList}" var="mem">
                        <tr>
                            <td>${mem.memId}</td>
                            <td>${mem.memName}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${mem.memGender == 'M'}">남성</c:when>
                                    <c:when test="${mem.memGender == 'F'}">여성</c:when>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
	                        <th>닉네임</th>
	                        <th>이메일</th>
	                        <th>휴대폰</th>
                         </tr>
                         <tr>
                            <td>${mem.memNickname}</td>
	                        <td>${mem.memEmail}</td>
                            <td>${mem.memHP}</td>
                        </tr>
                        <tr>
	                        <th>우편번호</th>
	                        <th colspan="2">주소</th>
                    	</tr>  
                    	<tr>
                    	<td>${mem.memZipcode}</td>
                            <td colspan="2">${mem.memAddress1}
                            ${mem.memAddress2}</td>
                    	</tr>
                    	
                         <tr>   
                            <th>가입일</th>
	                        <th>회원 유형</th>
	                        <th>상태</th>
                          </tr>
                          <tr>  
                            <td><fmt:parseDate value="${mem.memJoinDate}" pattern="yyyy-MM-dd" var="parsedDate" />
                                <fmt:formatDate value="${parsedDate}" pattern="yyyy년 MM월 dd일" />
                            </td>
                            <td>
                            	<c:choose>
		                            <c:when test="${mem.memType == 'general'}">일반</c:when>
		                            <c:when test="${mem.memType == 'business'}">사업자</c:when>
		                            <c:when test="${mem.memType == 'admin'}">관리자</c:when>
		                        </c:choose>
                            </td>
                            <td><form action="/admin/updateMemberStatus" method="post">
		                    <input type="hidden" name="memberId" value="${mem.memId}" />
		                    <input type="hidden" name="memType" value="${mem.memType}" />
		                    <select name="status">
		                        <option value="active" <c:if test="${mem.status == 'active'}">selected</c:if>>활성</option>
		                        <option value="inactive" <c:if test="${mem.status == 'inactive'}">selected</c:if>>비활성</option>
		                        <c:out value="${statusMessage}" />${statusMessage}
		                    </select>
		                    <button type="submit" class="btn">변경</button>
		                	</form>
		                </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
				
				
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>