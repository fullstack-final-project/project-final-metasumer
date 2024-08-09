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
				<table border="1" width="80%">
                    <tr>
                        <th colspan="4">상세페이지 ${fb.boardCtgId }</th>
                    </tr>
                    <tr>
                    	<th>제목</th>
                    	<td colspan="3">${ fb.title }</td>
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
                    <tr>
					    <th>첨부파일</th>
					    <td colspan="3">
					        ${fb.uploadFile} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					        <c:if test="${not empty fb.uploadFile}">
					            <form action="<c:url value='/downloadFile/${fb.uploadFile}'/>" method="post" style="display: inline;">
					                <input type="hidden" name="url" value="${fb.uploadFile}" />
					                <button type="submit" class="btn">다운로드</button>
					            </form>
					        </c:if>
					    </td>
					</tr>
                    <tr>
                        <td colspan="4">
                            <button type="button" class="btn" onclick="window.location.href='<c:url value='/freeboard/freeboardView/${fb.boardCtgId }' />'">목록으로</button>
                        <c:if test="${sessionScope.sid eq fb.memId}">
                            <button type="button" class="btn" onclick="window.location.href='<c:url value='/freeboard/updateBoardForm/${fb.boardPostNo}' />'">수정</button>
							    <button type="button" class="btn" onclick="confirmDelete()">삭제</button>
                            <form id="deleteForm" action="<c:url value='/freeboard/deleteBoard' />" method="post">
							    <input type="hidden" name="boardPostNo" value="${fb.boardPostNo}" />
							    <input type="hidden" name="boardCtgId" value="${fb.boardCtgId}" />
							</form>
						</c:if>
                        </td>
                    </tr>
                </table>
				
				
				
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