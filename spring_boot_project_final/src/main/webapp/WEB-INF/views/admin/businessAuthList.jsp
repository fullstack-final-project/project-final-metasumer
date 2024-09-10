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
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/businessAuthList.js'/>"></script>
		<style>
		    
		</style>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				<h2>사업자 신청 리스트</h2>
				<c:import url = "/WEB-INF/views/admin/adminPageList.jsp"></c:import>
				
				<span id="statusMessage">${statusMessage}</span>
					
				<div class="filter-container">
	                <form action="<c:url value='/admin/businessAuthList'/>" method="get">
	                    <select id="authStatus" name="authStatus" onchange="this.form.submit()">
	                        <option value="">전체</option>
	                        <option value="pending" ${param.authStatus == 'pending' ? 'selected' : ''}>검토 중</option>
	                        <option value="approved" ${param.authStatus == 'approved' ? 'selected' : ''}>승인</option>
	                        <option value="rejected" ${param.authStatus == 'rejected' ? 'selected' : ''}>거부</option>
	                    </select>
	                </form>
	            </div>
            
                <table class="auth-table">
                    <thead>
                        <tr>
                        	<th>순번</th>
                        	<th>회원ID</th>
                            <th>업체명</th>
                            <th>사업자 등록번호</th>
                            <th>대표자</th>
                            <th>업태</th>
                            <th>사업 유형</th>
                            <th>승인상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${authList}" var="at" varStatus="status">
                            <tr>
                            	<td>${(currentPage - 1) * pageSize + status.index + 1}</td>
                                <td id="memberIdCell" onclick="location.href='<c:url value='/admin/businessDetail/${at.memId}/${at.bizId}' />'">${at.memId}</td>
                                <td>${at.businessName}</td>
                                <td>${at.bizRegNumber}</td>
                                <td>${at.delegate}</td>
                                <td>${at.businessCategory}</td>
                                <td>
								    <c:choose>
								        <c:when test="${at.businessType == 'sale'}">판매 사업자</c:when>
								        <c:when test="${at.businessType == 'reservation'}">예약 사업자</c:when>
								    </c:choose>
								</td>
                                <td id="lastColumn">
                                    <form action="<c:url value='/admin/updateAuthStatus'/>" method="post">
                                        <input type="hidden" name="bizId" value="${at.bizId}">
                                        <input type="hidden" name="memId" value="${at.memId}">
                                        <input type="hidden" id="memType" name="memType" value="">
                                        <select name="authStatus">
								            <option value="pending" ${at.authStatus == 'pending' ? 'selected' : ''}>검토 중</option>
								            <option value="approved" ${at.authStatus == 'approved' ? 'selected' : ''}>승인</option>
								            <option value="rejected" ${at.authStatus == 'rejected' ? 'selected' : ''}>거부</option>
								        </select>
                                        <input type="submit" value="변경">
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
                 <div class="pagination">
				    <c:if test="${startPage > 1}">
				        <a href="<c:url value='/admin/businessAuthList'/>?page=${startPage - 1}" class="page-link">« 이전</a>
				    </c:if>
				
				    <c:forEach var="i" begin="${startPage}" end="${endPage}">
				        <a href="<c:url value='/admin/businessAuthList'/>?page=${i}" 
				           class="page-link ${i == currentPage ? 'current' : ''}">
				           ${i}
				        </a>
				    </c:forEach>
				
				    <c:if test="${endPage < totalPages}">
				        <a href="<c:url value='/admin/businessAuthList'/>?page=${endPage + 1}" class="page-link">다음 »</a>
				    </c:if>
				</div>
				
      
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>