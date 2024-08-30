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
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/memberManagement.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminPageList.css'/>">
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				<c:choose>
		            <c:when test="${memList[0].memType == 'general'}"><h2>일반 회원 관리</h2></c:when>
		            <c:when test="${memList[0].memType == 'business'}"><h2>사업자 회원 관리</h2></c:when>
		            <c:when test="${memList[0].memType == 'admin'}"><h2>관리자 관리</h2>
		            </c:when>
		        </c:choose>
				<c:import url = "/WEB-INF/views/admin/adminPageList.jsp"></c:import>
	
	            <c:choose>
				    <c:when test="${memList[0].memType == 'admin'}">
				        <a href="<c:url value='/admin/createAdminId'/>" class="btn-create-admin">관리자 아이디 만들기</a>
				    </c:when>
				</c:choose>
		
				<table>
            <thead>
                <tr>
                	<th>순번</th>
                    <th>회원 ID</th>
                    <th>이름</th>
                    <th>닉네임</th>
                    <th>가입일</th>
                    <th>회원 유형</th>
                    <th>상태</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${memList}" var="mem" varStatus="status">
                   	<tr>
                    	<td>${(currentPage - 1) * pageSize + status.index + 1}</td>
                        <td id="memberIdCell" onclick="location.href='<c:url value='/admin/memberDetail/${mem.memId}' />'">${mem.memId}</td>
                        <td>${mem.memName}</td>
                        <td>${mem.memNickname}</td>
                        <td><fmt:parseDate value="${mem.memJoinDate}" pattern="yyyy-MM-dd" var="parsedDate" />
                			<fmt:formatDate value="${parsedDate}" pattern="yyyy년 MM월 dd일" /></td>
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
        
        <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="<c:url value='/admin/memberManagement/${memType}'/>?page=${currentPage - 1}">« 이전</a>
                </c:if>
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <a href="<c:url value='/admin/memberManagement/${memType}'/>?page=${i}" 
                       class="${i == currentPage ? 'active' : ''}">${i}</a>
                </c:forEach>
                <c:if test="${currentPage < totalPages}">
                    <a href="<c:url value='/admin/memberManagement/${memType}'/>?page=${currentPage + 1}">다음 »</a>
                </c:if>
            </div>
        
        
        
        <c:if test="${not empty statusMessage}">
            <script>
                alert('${statusMessage}');
            </script>
        </c:if> 
				
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>