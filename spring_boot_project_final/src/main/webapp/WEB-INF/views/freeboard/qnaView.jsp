<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/qnaView.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
    <meta charset="UTF-8">
    <title>Q&A 게시판</title>
    <script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
    <script src="<c:url value='/js/commentBoard.js'/>"></script>
    <script>
        $(document).ready(function() {
            $(".content").hide();
            
            $(".title").click(function() {
                $(this).next(".content").slideToggle();
            });
        });
    </script>
    <!-- head.jsp import -->
    <c:import url="/WEB-INF/views/layout/head.jsp"></c:import>
</head>
<body>
    <div id="wrap">
        <!-- top.jsp import -->
        <c:import url="/WEB-INF/views/layout/top.jsp"></c:import>
        <section>
        <h1>[자주 묻는 질문]</h1>
        <c:if test="${sessionScope.memType eq 'admin'}">
             <a class="btn" href="<c:url value='/freeboard/newfreeboardForm/${ boardCtgId }'/>">글쓰기</a>
        </c:if>
            <c:forEach items="${qnaList}" var="qna">
                <div class="text-content">
                    <h2 class="title">${qna.title}</h2>
                    <div class="content">${qna.content}</div>
                    <div>
                    <c:if test="${sessionScope.memType eq 'admin'}">
             		<button type="button" class="btn" onclick="window.location.href='<c:url value='/freeboard/updateBoardForm/${qna.boardPostNo}' />'">수정</button>
							    <button type="button" class="btn" onclick="confirmDelete()">삭제</button>
                            <form id="deleteForm" action="<c:url value='/freeboard/deleteBoard' />" method="post">
							    <input type="hidden" name="boardPostNo" value="${qna.boardPostNo}" />
							    <input type="hidden" name="boardCtgId" value="${qna.boardCtgId}" />
							    <input type="hidden" name="completed" value="${qna.completed}" />
							</form>
        			</c:if>
                    </div>
                </div>
            </c:forEach>
        </section>
        <!-- bottom.jsp import -->
        <c:import url="/WEB-INF/views/layout/bottom.jsp"></c:import>
    </div>
</body>
</html>
