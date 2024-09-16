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
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/interestTagEdit.css'/>">
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/interestTagEdit.js'/>"></script>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
			<h1>태그 편집 페이지</h1>
				<c:import url = "/WEB-INF/views/admin/adminPageList.jsp"></c:import>
				
				<table>
					<thead>
						<tr>
							<th>태그명</th>
							<th>편집</th>
						</tr>
					</thead>
					<tbody>
				    <c:forEach items="${itList}" var="it">
				    <tr>
				        <td>
				            <input type="text" name="tagName" class="input_tagName"  value="${ it.tagName }">
				            <input type="hidden" name="interestId" value="${it.interestId}" />
				            <input type="hidden" name="tagId" value="${it.tagId}" />
				        </td>
				        <td><button class="btn edit-btn">수정</button></td>
				    </tr>
				    </c:forEach>
				    <tr>
			            <td>
					        <input type="text" id="newTagName" class="input_tagName" placeholder="새 태그 입력">
					        <input type="hidden" id="newInterestId" value="${itList[0].interestId}">
					    </td>
			        	<td>
				            <button class="btn add-btn">추가</button>
				        </td>
				    </tr>
				</tbody>
				</table>
				
								
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>