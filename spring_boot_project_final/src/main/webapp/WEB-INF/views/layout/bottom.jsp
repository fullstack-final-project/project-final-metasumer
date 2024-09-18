<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<footer>
	<div id="footerWrap" class="topMenuBoth">
		<div id="leftFooterBox">
			<div id="csInfoBox">
				<div class="csInfoItem"><div>고객센터</div><div>154X-90XX</div></div>
				<div class="csInfoItem">
					운영시간 : 평일 <time datetime="09:00">09:00</time>
					~<time datetime="18:00">18:00</time> (점심시간 제외)
				</div>
			</div>
			<hr>
			<div id="cpInfoBox">
				<div id="companyInfo">
					<div><span>상호명</span> : <span>어사모</span></div>
					<div><span>대표이사</span> : <span>메타슈머</span></div>
					<div><span>사업장소재지</span> : <span>서울시 강남구 테헤란로 2XX</span></div>
					<div><span>사업자등록번호</span> : <span>1004-8X-531XX</span></div>
					<div><span>통신판매업신고</span> : <span>제201X-서울강남-005XX호</span></div>
					<div><span>개인정보 보호책임자</span> : <span>메타슈머</span></div>
				</div>
			</div>
		</div>
		<div id="rightFooterBox">
			<ul class="footerMenuList">
				<li class="footerMenuItem">
					<h3>고객센터</h3>
					<a>1:1 문의내역</a>
					<a>상품Q&A</a>
					<a>공지사항</a>
					<a>고객의소리</a>
				</li>
				<li class="footerMenuItem">
					<h3>주문/예약</h3>
					<a>주문배송</a>
					<a>예약관리</a>
				</li>				
				<li class="footerMenuItem">
					<h3>개인정보관리</h3>
					<a>일반회원</a>
					<a>사업자회원</a>
					<a>쿠폰</a>
				</li>
				<li class="footerMenuItem">
					<h3>회사 소개</h3>
					<a>제휴/광고 문의</a>
					<a>개인정보처리방침</a>
					<a>이용약관</a>
				</li>
			</ul>
		</div>
	</div>
	<div id="topBtnBox">
		<img src="<c:url value='/image/moveToTop.png"'/>" id="topBtn">
	</div>
	<div id="chatbotBox">
		<i class="fa-solid fa-robot fa-2xl" style="color: #37a2f8;"></i>
	</div>
	<div id="my_modal" class="noshow modal-body">
    	<iframe src="<c:url value='/chatbotPage'/>" id="chat_iframe" class="forModal">모달창 내용: 챗봇</iframe>
    	<div class="modal_close_btn">
    		<i class="fa-regular fa-circle-xmark" 
    			style="color: #38a3f9; background: white; cursor: pointer; "></i>
    	</div><br>
	</div>
</footer> <!-- footer 끝 -->
