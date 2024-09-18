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
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/pagination.css'/>">
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			
			<section>
				<h2>사업자 회원 관리</h2>
				<c:import url = "/WEB-INF/views/admin/adminPageList.jsp"></c:import>
	
                    <c:choose>
                        <c:when test="${count > 0}">
                            <a href="<c:url value='/admin/businessAuthList'/>" class="right-align">* 사업자 회원 신청이 <span class="red-text">${count}건</span> 있습니다</a>
                        </c:when>
                        <c:otherwise>
                        	<a href="<c:url value='/admin/businessAuthList'/>" class="right-align">* 사업자 회원 신청이 없습니다</a>
                        </c:otherwise>
                    </c:choose>
		
				<table>
            <thead>
                <tr>
                	<th>순번</th>
                    <th>회원 ID</th>
                    <th>이름</th>
                    <th>업체명</th>
                    <th>사업자 등록번호</th>
                    <th>대표자</th>
                    <th>회원 유형</th>
                    <th>상태</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${bsList}" var="bs" varStatus="status">
                    <tr>
                    	<td>${(currentPage - 1) * pageSize + status.index + 1}</td>
                        <td id="memberIdCell" onclick="location.href='<c:url value='/admin/businessDetail/${bs.memId}/${bs.bizId}' />'">${bs.memId}</td>
                        <td>${bs.memName}</td>
                        <td>${bs.businessName}</td>
                        <td>${bs.bizRegNumber}</td>
                        <td>${bs.delegate}</td>
                        <td>${bs.memType}</td>                        
                       <td><form action="/admin/updateMemberStatus" method="post">
		                    <input type="hidden" name="memberId" value="${bs.memId}" />
		                    <input type="hidden" name="memType" value="${bs.memType}" />
		                    <select name="status">
		                        <option value="active" <c:if test="${bs.status == 'active'}">selected</c:if>>활성</option>
		                        <option value="inactive" <c:if test="${bs.status == 'inactive'}">selected</c:if>>비활성</option>
		                        <c:out value="${statusMessage}" />${statusMessage}
		                    </select>
		                    <button type="submit">변경</button>
		                	</form>
		                </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
         <div class="pagination">
		    <c:if test="${startPage > 1}">
		        <a href="<c:url value='/admin/businessManagement'/>?page=${startPage - 1}" class="page-link">« 이전</a>
		    </c:if>
		
		    <c:forEach var="i" begin="${startPage}" end="${endPage}">
		        <a href="<c:url value='/admin/businessManagement'/>?page=${i}"
		           class="page-link ${i == currentPage ? 'current' : ''}">
		           ${i}
		        </a>
		    </c:forEach>
		
		    <c:if test="${endPage < totalPages}">
		        <a href="<c:url value='/admin/businessManagement'/>?page=${endPage + 1}" class="page-link">다음 »</a>
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