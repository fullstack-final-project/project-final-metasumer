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
                        <th colspan="2">상세페이지</th>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td>${fb.memNickname}</td>
                    </tr>
                    <tr>
                        <td>작성일</td>
                        <td><fmt:formatDate value="${fb.createdDate}" pattern="yyyy년 MM월 dd일" /></td>
                    </tr>
                    <tr>
                    	<th>제목</th>
                    	<td>${ fb.title }</td>
                    </tr>
                    <tr>
					    <td>내용</td>
					    <td><pre>${fn:escapeXml(fb.content)}</pre></td>
					</tr>
                    <tr>
			            <td>첨부파일</td>
			            <td>${ fb.uploadFile }
			            	 <c:if test="${not empty fb.uploadFile}">
	                            <form action="<c:url value='/downloadFile/${fb.uploadFile}'/>" method="post">
	                                <input type="hidden" name="url" value="${fb.uploadFile}" />
	                                <button type="submit">다운로드</button>
	                            </form>
                       		 </c:if>
			        </tr>
                    <tr>
                        <td colspan="2">
                            <button type="button" onclick="window.location.href='<c:url value='/freeboard/freeboardView' />'">목록으로</button>
                            <button type="button" onclick="window.location.href='<c:url value='/freeboard/updateFreeBoard/${fb.boardPostNo}' />'">수정</button>
                            <button type="button" onclick="window.location.href='<c:url value='/freeboard/freeboardView/${fb.boardPostNo}' />'">삭제</button>
                        </td>
                    </tr>
                </table>
				
				
				
			</section>
			<!-- bottom.jsp import -->
			<%-- <c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>	 --%>	
		</div>
	</body>
</html>