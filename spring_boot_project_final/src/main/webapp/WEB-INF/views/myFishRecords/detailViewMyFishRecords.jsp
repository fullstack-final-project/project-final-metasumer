<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/detailViewFreeBoard.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
                            <button type="button" class="btn" onclick="window.location.href='<c:url value='/myFishRecords/myFishRecordsListView' />'">목록으로</button>
                        <c:if test="${sessionScope.sid eq mf.memId}">
                            <button type="button" class="btn" onclick="window.location.href='<c:url value='/freeboard/updatemyFishRecordsForm/${mf.recordNo}' />'">수정</button>
							    <button type="button" class="btn" onclick="confirmDelete()">삭제</button>
                            <form id="deleteForm" action="<c:url value='/freeboard/deleteBoard' />" method="post">
							    <input type="hidden" name="recordNo" value="${mf.recordNo}" />
							    <input type="hidden" name="boardCtgId" value="${fm.boardCtgId}" />
							</form>
						</c:if>
				<table>
					<tr>
						<th>작성자</th>
						<td>${ mf.memNickname }</td>
						<th>위치</th>
						<td>${ mf.location }</td>
						<th>날짜</th>
						<td><fmt:formatDate value="${mf.createdDate}" pattern="yyyy년 MM월 dd일" /></td>
					</tr>
					<tr>
						<th>어종</th>
						<td>${ mf.fishName }</td>
						<th>크기</th>
						<td>${ mf.fishSize }</td>
						<th>장비</th>
						<td>${ mf.equipment }</td>
						<th>날씨</th>
						<td>${ mf.weather }</td>
					</tr>
				</table>
				
				<pre>${fn:escapeXml(mf.content)}</pre>
				
				<c:if test="${not empty mf.uploadImage}">
				    <img src="<c:url value='/project_images/${mf.uploadImage}'/>" width="40%"><br>
				</c:if>
				
				
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
	<script>
	function confirmDelete() {
	    if (confirm("정말로 삭제하시겠습니까?")) {
	        document.getElementById('deleteForm').submit();
	    }
	}
	</script>
</html>