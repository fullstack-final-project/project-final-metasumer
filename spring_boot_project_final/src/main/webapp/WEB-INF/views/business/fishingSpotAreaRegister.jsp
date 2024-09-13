<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>낚시터 상품 등록</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/fishingSpotRegister.css'/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/btn.css'/>">
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
          <div id="addAreaSection">
              <h1>낚시터 상품 등록</h1>
              <form action="/business/registerFishingSpotArea" method="POST">
                  <input type="hidden" name="spotId" value="${spotId}">
                  <table>
                      <tbody>
                          <tr>
                              <th><label for="areaName">구역 이름</label></th>
                              <td><input type="text" id="areaName" name="areaName" required></td>
                          </tr>
                          <tr>
                              <th><label for="areaPrice">가격</label></th>
                              <td><input type="number" id="areaPrice" name="areaPrice"  placeholder="최소가격을 입력하세요." required>원</td>
                          </tr>
                          <tr>
                              <th><label for="minCapacity">최소 수용 인원</label></th>
                              <td><input type="number" id="minCapacity" name="minCapacity" required></td>
                          </tr>
                          <tr>
                              <th><label for="maxCapacity">최대 수용 인원</label></th>
                              <td><input type="number" id="maxCapacity" name="maxCapacity" required></td>
                          </tr>
                          <tr>
                              <th><label for="startTime">시작 시간</label></th>
                              <td><input type="time" id="startTime" name="startTime" required></td>
                          </tr>
                          <tr>
                              <th><label for="endTime">종료 시간</label></th>
                              <td><input type="time" id="endTime" name="endTime" required></td>
                          </tr>
                          <tr>
                              <th><label for="fishType">어종</label></th>
                              <td><input type="text" id="fishType" name="fishType" required></td>
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