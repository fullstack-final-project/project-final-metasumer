<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품관리</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/productManagement.css'/>" />
		<script src="<c:url value='/js/productManagement.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section id="product-management">
				<h1>상품 관리</h1>
				
				<!-- 제품 목록 섹션 -->
				<div id="product-list">
					<div class="table-header">
             <div class="table-title">
                 <h2>제품 목록</h2>
             </div>
             <div class="table table-button">
                 <button class="btn btn-add" onclick="location.href='/product/insertProductForm'">제품 등록</button>
             </div>
         	</div>
					<table class="table productList">
						<thead>
							<tr>
								<th>제품 번호</th>
								<th>제품명</th>
								<th>가격</th>
								<th>재고</th>
								<th>카테고리</th>
								<th>제조사</th>
								<th>설명</th>
								<th>이미지</th>
								<th>수정/삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="product" items="${prdList}">
								<tr>
									<td>${product.prdNo}</td>
									<td>${product.prdName}</td>
									<td>${product.prdPrice}</td>
									<td>${product.prdStock}</td>
									<td>${product.prdCtgId}</td>
									<td>${product.prdMaker}</td>
									<td>${product.prdDescript}</td>
									<td><img src="<c:url value='/project_images/${product.prdImage}'/>"
																alt="${product.prdName}"width="40px" height="40px">
									<td>
										<a href="<c:url value='/product/updateProductForm/${product.prdNo }'/>">[수정]</a>
										<a href="javascript:deleteCheck('${product.prdNo}');">[삭제]</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- 삭제 확인 메시지 출력 -->
	    <script>
	    	function deleteCheck(prdNo){
	    		let answer = confirm("삭제하시겠습니까?");
	    		if(answer) {
	    			location.href = "/product/deleteProduct/" + prdNo;
	    		}
	    	}
	    </script>
	
				<!-- 판매 내역 섹션 -->
				<div id="sales-history">
					<h2>판매 내역</h2>
					<table class="table salesList">
						<thead>
							<tr>
								<th>판매 번호</th>
								<th>제품명</th>
								<th>판매 날짜</th>
								<th>판매 가격</th>
								<th>판매 수량</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="sale" items="${sales}">
								<tr>
									<td>${sale.saleNo}</td>
									<td>${sale.prdName}</td>
									<td><fmt:formatDate value="${sale.saleDate}"
											pattern="yyyy-MM-dd" /></td>
									<td>${sale.salePrice}</td>
									<td>${sale.saleQuantity}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>