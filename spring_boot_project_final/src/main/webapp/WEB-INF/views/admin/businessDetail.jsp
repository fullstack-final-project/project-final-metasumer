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
		<script>
		function openImageInNewWindow(imageUrl) {
		    window.open(imageUrl, 'ImageWindow', 'width=800,height=600');
		}
		</script>
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
                <c:forEach items="${bsList}" var="bs">
					<tr>
						<th>사업자 등록 이미지</th>
						<th>회원 ID</th>
						<th>업체명</th>
						<th>사업자 등록번호</th>
						<th>대표자</th>
					</tr>
					<tr>
						<td rowspan="7" style="width: 28%;"><img 
                                      src="<c:url value='/ocr_image/${bs.bizRegImg}'/>" 
                                      width="100%" 
                                      height="auto" 
                                      alt="사업자 등록증 이미지"
                                      onclick="openImageInNewWindow('<c:url value='/ocr_image/${bs.bizRegImg}'/>')"
                                      style="cursor: pointer;">
                         </td>
						<td>${bs.memId}</td>
						<td>${bs.businessName}</td>
						<td>${bs.bizRegNumber}</td>
						<td>${bs.delegate}</td>
					</tr>
					<tr>	
						<th colspan="3">사업장 주소</th>
						<th>사업자 승인 상태</th>
						
					</tr>
					<tr>	
						<td colspan="3">${bs.businessAddress}</td>
						<td id="lastColumn">
                            <form action="<c:url value='/admin/updateAuthStatus'/>" method="post">
                                <input type="hidden" name="bizId" value="${bs.bizId}">
                                <input type="hidden" name="memId" value="${bs.memId}">
                                <input type="hidden" id="memType" name="memType" value="">
                                <select name="authStatus">
						            <option value="pending" ${bs.authStatus == 'pending' ? 'selected' : ''}>검토 중</option>
						            <option value="approved" ${bs.authStatus == 'approved' ? 'selected' : ''}>승인</option>
						            <option value="rejected" ${bs.authStatus == 'rejected' ? 'selected' : ''}>거부</option>
						        </select>
                                <input type="submit" value="변경">
                            </form>
                        </td>
					</tr>
					<tr>
						<th>사업 유형</th>
						<th>업종</th>
						<th>발급일</th>
						<th>승인 상태</th>
					</tr>
					<tr>	
						<td>
							<c:choose>
						        <c:when test="${bs.businessType == 'sale'}">판매 사업자</c:when>
						        <c:when test="${bs.businessType == 'reservation'}">예약 사업자</c:when>
						    </c:choose>
						</td>
						<td>${bs.businessCategory}</td>
						<td>${bs.issueDate}</td>
						<td>
						    <c:choose>
						        <c:when test="${bs.authStatus == 'pending'}">검토중</c:when>
						        <c:when test="${bs.authStatus == 'approved'}">승인</c:when>
						        <c:when test="${bs.authStatus == 'rejected'}">거절</c:when>
						    </c:choose>
						</td>
					</tr>
					<tr>
						<th>회원 이름</th>
						<th>회원 이메일</th>
						<th>회원 유형</th>
						<th>회원 상태</th>
					</tr>
					<tr>	
						<td>${bs.memName}</td>
						<td>${bs.memEmail}</td>
						<td>
						    <c:choose>
						        <c:when test="${bs.memType == 'business'}">사업자</c:when>
						        <c:when test="${bs.memType == 'general'}">일반회원</c:when>
						        <c:when test="${bs.memType == 'admin'}">관리자</c:when>
						    </c:choose>
						</td>
						<td><form action="/admin/updateMemberStatus" method="post">
		                    <input type="hidden" name="memberId" value="${bs.memId}" />
		                    <input type="hidden" name="memType" value="${bs.memType}" />
		                    <select name="status">
		                        <option value="active" <c:if test="${bs.status == 'active'}">selected</c:if>>활성</option>
		                        <option value="inactive" <c:if test="${bs.status == 'inactive'}">selected</c:if>>비활성</option>
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