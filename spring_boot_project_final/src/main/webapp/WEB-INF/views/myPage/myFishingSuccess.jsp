<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>나의 낚시 성공률</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>">
		<script src="/js/fishSuccess.js"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
			<img src="/image/successBanner3.png" class="successBanner">
			<form id="successForm" method="post">				
			  <table id="fishingSuccessTable">
			    <tr>
			      <th>오늘의<br>낚시 성공률은?</th> 
			      <td>
			        <ul>
			          <li><b>잡으려는 어종 : &nbsp;</b><input type="text" id="fishSuccessName" name="fishName" placeholder="어종 이름 입력" required></li>
			          <li><b>현재 위치 물때 : </b><input type="radio" name="tide" value="밀물" style="vertical-align: middle">밀물&nbsp;
			            <input type="radio" name="tide" value="썰물" style="vertical-align: middle">썰물
			          </li>
			          <li><b>현재 위치 : </b>
			            <input type="radio" name="location" value="갯바위/방파제" style="vertical-align: middle">갯바위/방파제&nbsp;
			            <input type="radio" name="location" value="갯벌/얕은 수심" style="vertical-align: middle">갯벌/얕은 수심&nbsp;
			            <input type="radio" name="location" value="선상(바다)" style="vertical-align: middle">선상(바다)&nbsp;
			            <input type="radio" name="location" value="내륙 낚시터" style="vertical-align: middle">내륙 낚시터&nbsp;
			            <input type="radio" name="location" value="호수/강" style="vertical-align: middle">호수/강
			          </li>
			          <li><b>오늘의 날씨 : </b>
			            <input type="radio" name="weather" value="맑음" style="vertical-align: middle">맑음&nbsp;
			            <input type="radio" name="weather" value="흐림" style="vertical-align: middle">흐림&nbsp;
			            <input type="radio" name="weather" value="비" style="vertical-align: middle">비&nbsp;
			            <input type="radio" name="weather" value="눈" style="vertical-align: middle">눈
			          </li>		
			          <li><b>나의 낚시 수준 : </b>
			            <input type="radio" name="skill" value="초보" style="vertical-align: middle">초보&nbsp;
			            <input type="radio" name="skill" value="중수" style="vertical-align: middle">중수&nbsp;
			            <input type="radio" name="skill" value="고수" style="vertical-align: middle">고수			          
			          </li>
			          <li><b>오늘의 운세 : </b>
			            <input type="radio" name="fortune" value="대길" style="vertical-align: middle">대길&nbsp;
			            <input type="radio" name="fortune" value="중길" style="vertical-align: middle">중길&nbsp;
			            <input type="radio" name="fortune" value="소길" style="vertical-align: middle">소길&nbsp;	
			            <input type="radio" name="fortune" value="길" style="vertical-align: middle">길&nbsp;
			            <input type="radio" name="fortune" value="흉" style="vertical-align: middle">흉			          
			          </li>	        
			        </ul>
			      </td>
			    </tr>
			  </table>			
			  <div class="calcBtn">
	            <input id="submitBtn" type="submit" value="성공률 확인">
	            <button id="cancelBtn" type="reset">초기화</button>
	          </div>	
			</form>	
			<div id="resultSuccessTable"></div>		
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
