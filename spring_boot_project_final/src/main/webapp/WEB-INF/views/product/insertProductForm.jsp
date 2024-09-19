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
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/fishingSpotRegister.css'/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
		<script src="<c:url value='/js/prdNoCheck.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section id="product-management">
            <h1>상품 등록</h1>
            <div id="product-form">
                <form action="/product/insertProduct" method="post" enctype="multipart/form-data">
                		<input type="hidden" name="bizId" value="${bizId}">
                    <table>
                        <tbody>
                            <tr>
                                <th><label for="prdNo">상품 번호</label></th>
                                <td><input type="text" id="prdNo" name="prdNo" required>
                                <button id="prdNoCheckBtn" name="prdNoCheckBtn" class="btn">중복확인</button></td>
                            </tr>
                            <tr>
                                <th><label for="prdName">제품명</label></th>
                                <td><input type="text" id="prdName" name="prdName" required></td>
                            </tr>
                            <tr>
                                <th><label for="prdImage">이미지</label></th>
                                <td><input type="file" id="prdImage" name="prdImage" required></td>
                            </tr>
                            <tr>
                                <th><label for="prdPrice">가격</label></th>
                                <td><input type="number" id="prdPrice" name="prdPrice" required>원</td>
                            </tr>
                            <tr>
                                <th><label for="prdStock">재고</label></th>
                                <td><input type="number" id="prdStock" name="prdStock" required></td>
                            </tr>
                            <tr>
                                <th><label for="prdCategory">카테고리</label></th>
                                <td>
                                    <select id="prdCtgId" name="prdCtgId" required>
                                        <c:forEach var="category" items="${categoryList}">
                                            <option value="${category.prdCtgId}">${category.prdCtgName}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="prdMaker">제조사</label></th>
                                <td><input type="text" id="prdMaker" name="prdMaker" required></td>
                            </tr>
                            <tr>
                                <th><label for="prdDescript">설명</label></th>
                                <td><input type="text" id="prdDescript" name="prdDescript" required></td>
                            </tr>
                            <tr>
								                <td colspan="2" style="text-align: center;">
								                    <button type="submit" class="btn">등록</button>
								                </td>
								            </tr>
                        </tbody>
                    </table>
                    
                </form>
            </div>
        </section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
