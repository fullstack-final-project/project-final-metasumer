<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품 정보 수정</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/fishingSpotRegister.css'/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section id="product-management">
				<h1>상품 수정</h1>
				<div id="product-form">
					<form action="/product/updateProduct" method="post" enctype="multipart/form-data">
                		<input type="hidden" name="bizId" value="${business.bizId}">
                		<input type="hidden" name="prdNo" value="${prd.prdNo}">
                    <table>
                        <tbody>
                            <tr>
                                <th><label for="prdNo">상품 번호</label></th>
                                <td><input type="text" id="prdNo" name="prdNo" value="${prd.prdNo}" disabled></td>
                            </tr>
                            <tr>
                                <th><label for="prdName">제품명</label></th>
                                <td><input type="text" id="prdName" name="prdName" value="${prd.prdName}" required></td>
                            </tr>
                            <tr>
                                <th><label for="prdImage">이미지</label></th>
                                <td>
                                    <img src="<c:url value='/project_images/${prd.prdImage}' />" alt="Current Image" style="max-width: 150px; height: auto;" />
                                    <input type="file" id="prdImageFile" name="prdImageFile">
                                    <p>현재 이미지: <c:out value="${prd.prdImage}"/></p>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="prdPrice">가격</label></th>
                                <td><input type="number" id="prdPrice" name="prdPrice" value="${prd.prdPrice}" required>원</td>
                            </tr>
                            <tr>
                                <th><label for="prdStock">재고</label></th>
                                <td><input type="number" id="prdStock" name="prdStock" value="${prd.prdStock}" required></td>
                            </tr>
                            <tr>
                                <th><label for="prdCategory">카테고리</label></th>
                                <td>
                                    <select id="prdCtgId" name="prdCtgId" required>
                                    	 <c:forEach var="category" items="${categoryList}">
													                <option value="${category.prdCtgId}" 
													                    <c:if test="${category.prdCtgName == prd.prdCtgName}">selected</c:if>>
													                    ${category.prdCtgName}
													                </option>
												            </c:forEach>
														        </select>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="prdMaker">제조사</label></th>
                                <td><input type="text" id="prdMaker" name="prdMaker" value="${prd.prdMaker}" required></td>
                            </tr>
                            <tr>
                                <th><label for="prdDescript">설명</label></th>
                                <td><input type="text" id="prdDescript" name="prdDescript" value="${prd.prdDescript}" required></td>
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