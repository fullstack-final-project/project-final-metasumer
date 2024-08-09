<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사업체 등록</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section id="register-business">
        <h1>사업체 등록</h1>
        <form action="<c:url value='/business/register'/>" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="bizName">사업체명:</label>
                <input type="text" id="bizName" name="bizName" required>
            </div>
            <div class="form-group">
                <label for="bizRegNum">사업자 등록번호:</label>
                <input type="text" id="bizRegNum" name="bizRegNum" required>
            </div>
            <div class="form-group">
                <label for="bizZipcode">우편번호:</label>
                <input type="text" id="bizZipcode" name="bizZipcode">
            </div>
            <div class="form-group">
                <label for="bizAddress1">주소:</label>
                <input type="text" id="bizAddress1" name="bizAddress1">
            </div>
            <div class="form-group">
                <label for="bizAddress2">상세 주소:</label>
                <input type="text" id="bizAddress2" name="bizAddress2">
            </div>
            <div class="form-group">
                <label for="bizRegImg">사업자 등록증 이미지:</label>
                <input type="file" id="bizRegImg" name="bizRegImg" required>
            </div>
            <div class="form-group">
                <label for="bizHP1">대표 연락처:</label>
                <input type="text" id="bizHP1" name="bizHP1" placeholder="010" required> -
                <input type="text" id="bizHP2" name="bizHP2" placeholder="1234" required> -
                <input type="text" id="bizHP3" name="bizHP3" placeholder="5678" required>
            </div>
            <div class="form-group">
                <label for="bizCtgId">사업체 카테고리:</label>
                <select id="bizCtgId" name="bizCtgId" required>
                    <c:forEach var="category" items="${bizCategories}">
                        <option value="${category.bizCtgId}">${category.bizCtgName}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">등록</button>
          </form>
        </section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>