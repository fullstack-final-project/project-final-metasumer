<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>어종 설명</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/fishDetail.css'/>">
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<br><br><br>
			<section>
			  <header>
			    <h2>${fish.fishName}</h2>
			  </header>
			  <div class="fishDetailInfo">
			    <div class="imageBox">
			      <img src="<c:url value='/project_images/어종/${fish.fishImg}'/>">
			    </div>
			    <div class="detailBox">
			      <table class="fishDetailTable">
			        <tr>
                      <td colspan="2"><hr class="section-divider"></td>
                    </tr>
			        <tr class="detailTable">			                                
			          <td class="label">어종 이름</td>                    
			        </tr>
			        <tr>
			          <td class="description">${fish.fishName}</td>
			        </tr>
			        <tr>
                      <td class="label">길이</td>
                    </tr>
                    <tr>
                      <td class="description">${fish.fishLength}</td>       
                    </tr>
                    <tr>
                      <td class="label">산란기</td>
                    </tr>
                    <tr>
                      <td class="description">${fish.fishBreeding}</td>       
                    </tr>
                    <tr>
                      <td class="label">서식지</td>
                    </tr>
                    <tr>
                      <td class="description">${fish.fishHabitat}</td>       
                    </tr>
			        <tr>
                      <td colspan="2"><hr class="section-divider"></td>
                    </tr>
			      </table>
			    </div>
			  </div>	
			  <div class="addFishDescription">
			    <br>
			    <h4>특성</h4>
			    <p>${fish.fishDescription}</p>
			    <h4>낚시 시기</h4>
			    <p>${fish.fishTime}</p>
			    <h4>낚시 장소</h4>
			    <p>${fish.fishPlace}</p>
			    <h4>낚시 방법(Tip!)</h4>
			    <p>${fish.fishTip}</p>
			  </div>		  		   
			</section>
			<br>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
