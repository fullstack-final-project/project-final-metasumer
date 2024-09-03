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
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/comment.js'/>"></script>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>		
				<input type="hidden" name="sid" value="${sessionScope.sid}" />
                <div id="btn_box">
                    <button type="button" class="btn" onclick="window.location.href='<c:url value='/myFishRecords/myFishRecordsListView' />'">목록으로</button>
                        
                        <c:if test="${sessionScope.sid eq mf.memId}">
                            <button type="button" class="btn" onclick="window.location.href='<c:url value='/myFishRecords/updatemyFishRecordsForm/${mf.recordNo}' />'">수정</button>
							<button type="button" class="btn" onclick="confirmDelete()">삭제</button>
                            <form id="deleteForm" action="<c:url value='/myFishRecords/deletemyFishRecords' />" method="post">
							    <input type="hidden" name="recordNo" value="${mf.recordNo}" />
							</form>
						</c:if>
						</div>
				<table>
					<tr>
						<th>작성자</th>
						<td>${ mf.memNickname }</td>
						<th>날짜</th>
						<td><fmt:formatDate value="${mf.createdDate}" pattern="yyyy년 MM월 dd일" /></td>
						<th>조회수</th>
						<td>${ mf.views }</td>
					</tr>
					<tr>
						<th>위치</th>
						<td>${ mf.location }</td>
						<th>장비</th>
						<td colspan="3">${ mf.equipment }</td>
						
					</tr>
					<tr>	
						<th>어종</th>
						<td>${ mf.fishName }</td>
						<th>크기</th>
						<td>${ mf.fishSize }</td>
						<th>날씨</th>
						<td>${ mf.weather }</td>
					</tr>
				</table>
				<div id="contentContainer">
					<pre>${fn:escapeXml(mf.content)}</pre>
					
					<c:if test="${not empty mf.uploadImage}">
					    <img src="<c:url value='/project_images/${mf.uploadImage}'/>" width="40%"><br>
					</c:if>
					
					
					<c:choose>
					    <c:when test="${not empty sessionScope.sid}">
					<!-- 댓글 작성 -->
					<form id="commentForm">
						<p>${sessionScope.memNickname}</p>
				        <input type="hidden" name="memId" value="${sessionScope.sid}">
				        <input type="hidden" name="recordNo" value="${mf.recordNo}">
				        <input type="hidden" name="boardCtgId" value="${mf.boardCtgId}">
				        <input type="hidden" name="postAuthorId" value="${mf.memId}">
				        <textarea id="commentContent" name="content" placeholder="댓글을 입력하세요." required></textarea>
				    <label>
				            <input type="checkbox" id="secretComment" name="secretComment">
				            비밀댓글
				        </label>
				        
				        <button class="btn" type="button" onclick="addComment()">댓글 추가</button>
				    </form>
				    </c:when>
					    <c:otherwise>
					        <p>로그인 후 댓글을 작성할 수 있습니다.</p>
					    </c:otherwise>
					</c:choose>
	
				    <div id="commentList">
				    </div>
				</div>			
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>