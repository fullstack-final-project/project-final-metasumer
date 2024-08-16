<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품 등록</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/productManagement.css'/>" />
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section id="product-management">
				<h1>제품 등록</h1>
				<div id="product-form">
					<form action="/product/insertProduct" method="post" enctype="multipart/form-data">
						<label for="prdNo">상품 번호:</label>
            <input type="text" id="prdNo" name="prdNo" required>
            
						<label for="prdName">제품명:</label>
            <input type="text" id="prdName" name="prdName" required>
            
            <label for="prdPrice">가격:</label>
            <input type="number" id="prdPrice" name="prdPrice" required>
            
            <label for="prdStock">재고:</label>
            <input type="number" id="prdStock" name="prdStock" required>
            
            <label for="prdCategory">카테고리:</label>
            <select id="prdCtgId" name="prdCtgId" required>
                <c:forEach var="category" items="${categoryList}">
                    <option value="${category.prdCtgId}">${category.prdCtgName}</option>
                </c:forEach>
            </select>
            
            <label for="prdMaker">제조사:</label>
            <input type="text" id="prdMaker" name="prdMaker" required>
            
            <label for="prdDescript">설명:</label>
            <input type="text" id="prdDescript" name="prdDescript" required>
            
            <label for="prdImage">이미지:</label>
            <input type="file" id="prdImage" name="prdImage" required>
            
            <label for="bizId">bizId(임시 작성):</label>
            <input type="number" id="bizId" name="bizId" required>
            
            <button type="submit">등록</button>
					</form>
				</div>
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>