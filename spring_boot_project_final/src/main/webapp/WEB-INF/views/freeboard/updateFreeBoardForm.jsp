<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/update.js'/>"></script>
		<!-- head.jsp import -->
		<%-- <c:import url = "/WEB-INF/views/layout/head.jsp"></c:import> --%>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<%-- <c:import url = "/WEB-INF/views/layout/top.jsp"></c:import> --%>
			<section>
				<table border="1" width="80%">
                    <tr>
                        <th colspan="2">수정</th>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td>${fb.memNickname}</td>
                    </tr>
                    <tr>
                        <td>수정일</td>
                        <td><fmt:formatDate value="${fb.createdDate}" pattern="yyyy년 MM월 dd일" /></td>
                    </tr>
                    <tr>
                    	<th>제목</th>
                		<td><input type="text" id="title" name="title" value="${fb.title}" required></td>
                    </tr>
                    <tr>
					    <td>내용</td>
                <td><textarea id="content" name="content" rows="10" cols="50">${fb.content}</textarea></td>
					</tr>
                    <tr>
					    <td>첨부파일</td>
					    <td>
						    <c:if test="${not empty fb.uploadFile}">
						        ${fb.uploadFile }
						        <form id="deleteForm" action="<c:url value='/deleteFile/${fb.uploadFile}'/>" method="post">
						            <input type="hidden" name="url" value="${fb.uploadFile}" />
						            <button type="submit">삭제</button>
						        </form>
						        <script>
						            document.getElementById('uploadFile').style.display = 'none';
						        </script>
						    </c:if>
						    <c:if test="${empty fb.uploadFile}">
						        <input type="file" id="uploadFile" name="uploadFile" onchange="handleFileInputChange()">
						    </c:if>
						</td>

					</tr>
                    <tr>
                        <td colspan="2">
                            <button type="button" onclick="window.location.href='<c:url value='/freeboard/freeboardView' />'">취소</button>
                            <button type="button" onclick="window.location.href='<c:url value='/freeboard/updateFreeBoard' />'">완료</button>
                        </td>
                    </tr>
                </table>
				
				
				
			</section>
			<!-- bottom.jsp import -->
			<%-- <c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>	 --%>	
		</div>
	</body>
</html>