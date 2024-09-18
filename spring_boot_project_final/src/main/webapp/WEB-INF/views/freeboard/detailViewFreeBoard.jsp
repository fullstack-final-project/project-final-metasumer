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
		<script src="<c:url value='/js/commentBoard.js'/>"></script>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				<input type="hidden" name="sid" value="${sessionScope.sid}" />
				<table border="1">
                    <tr>
                        <th colspan="4">${fb.boardCtgName } 상세페이지</th>
                    </tr>
                    <tr>
                    	<th>제목</th>
                    	<td>${ fb.title }</td>
                    	<th>조회수</th>
                    	<td class="tdWidth">${ fb.views }</td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>${fb.memNickname}</td>
                        <th>작성일</th>
                        <td><fmt:formatDate value="${fb.createdDate}" pattern="yyyy년 MM월 dd일" /></td>
                    </tr>
                    <tr>
					    <th>내용</th>
					    <td colspan="3"><pre>${fn:escapeXml(fb.content)}</pre></td>
					</tr>
				<c:if test="${fb.boardCtgId == 5}">
                    <tr>
                        <th>가격</th>
                        <c:choose>
						    <c:when test="${not empty sessionScope.sid}">
						        <td><fmt:formatNumber value="${fb.price}" type="number" maxFractionDigits="0"/> 원</td>
						    </c:when>
						    <c:otherwise>
						        <td>로그인이 필요합니다.</td>
						    </c:otherwise>
						</c:choose>
                    </tr>
                </c:if>	
					
					<tr>
					    <c:choose>
					        <c:when test="${fb.boardCtgId == 5}">
					            <td colspan="5"><img src="<c:url value='/project_images/${fb.uploadFile}'/>" alt="Item Image" style="width: 500px; height: auto;"></td>
					        </c:when>
					        <c:otherwise>
					            <th>첨부파일</th>
					            <td colspan="3">
					                <c:if test="${not empty fb.uploadFile}">
					                    ${fb.uploadFile} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					                    <form action="<c:url value='/downloadFile/${fb.uploadFile}'/>" method="post" style="display: inline;">
					                        <input type="hidden" name="url" value="${fb.uploadFile}" />
					                        <button type="submit" class="btn">다운로드</button>
					                    </form>
					                </c:if>
					            </td>
					        </c:otherwise>
					    </c:choose>
					</tr>
					                   
                    <tr>
                        <td colspan="4">
                            <button type="button" class="btn" onclick="history.back()">목록으로</button>
                        <c:if test="${sessionScope.sid eq fb.memId}">
                            <button type="button" class="btn" onclick="window.location.href='<c:url value='/freeboard/updateBoardForm/${fb.boardPostNo}' />'">수정</button>
							    <button type="button" class="btn" onclick="confirmDelete()">삭제</button>
                            <form id="deleteForm" action="<c:url value='/freeboard/deleteBoard' />" method="post">
							    <input type="hidden" name="boardPostNo" value="${fb.boardPostNo}" />
							    <input type="hidden" name="boardCtgId" value="${fb.boardCtgId}" />
							    <input type="hidden" name="completed" value="${fb.completed}" />
							</form>
						</c:if>
                        </td>
                    </tr>
                </table>
				
				<c:choose>
					    <c:when test="${not empty sessionScope.sid}">
				<div id="contentContainer">
					<!-- 댓글 작성 -->
					<form id="commentForm">
							<p>${sessionScope.memNickname}</p>
					        <input type="hidden" name="memId" value="${sessionScope.sid}">
					        <input type="hidden" name="boardPostNo" value="${fb.boardPostNo}">
					        <input type="hidden" name="boardCtgId" value="${fb.boardCtgId}">
					        <input type="hidden" name="postAuthorId" value="${fb.memId}">
					        <textarea id="commentContent" name="content" placeholder="댓글을 입력하세요..." required></textarea>
					        
					        <label>
					            <input type="checkbox" id="secretComment" name="secretComment">
					            비밀댓글
					        </label>
					        <button class="btn" type="button" onclick="addComment()">댓글 추가</button>
					    </form>
						</c:when>
					    <c:otherwise>
					        <p style="text-align: center;">로그인 후 댓글을 작성할 수 있습니다.</p>
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