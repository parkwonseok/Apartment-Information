<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>홈</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css">
	<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/home.js"></script>
</head>
<body>
	<div id="dialog" style="display:none">
		<div id="head">
			<span>로그인</span>
			<button id="login-close">X</button>
		</div>
  		<form id="loginForm" action="${pageContext.request.contextPath}/member/login" method="post">
  			<input type="text" id="id" name="mb_email" placeholder="이메일을 입력해주세요"><br>
  			<input type="text" id="pw" name="mb_pw" placeholder="비빌번호를 입력해주세요"><br>
  			<input type="submit" id="submit" value="로그인">
  		</form>
  		<div id="social-login">───────────────또는───────────────</div>
  		<button id="kakao-login"><img src="${pageContext.request.contextPath}/resources/images/kakao.jpg">카카오 로그인</button><br>
  		<button id="naver-login"><img src="${pageContext.request.contextPath}/resources/images/naver.JPG">네이버 로그인</button><br>
  		<button id="goggle-login"><img src="${pageContext.request.contextPath}/resources/images/google.JPG">구글 로그인</button>
	</div>
	<header>
		<div id="logo">
			<img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="로고"> <a href="${pageContext.request.contextPath}/">부동산 플랜</a>
		</div>
		<nav id="main-nav">
			<ul>
				<li><a href="#">실시간 거래</a></li>
				<li><a href="#">메뉴</a></li>
				<li><a href="#">메뉴</a></li>
				<li><a href="#">문의하기</a></li>
			</ul>
		</nav>
		<nav id="member">
			<ul>
				<c:if test="${empty loginEmail}">
					<li><a id="login-open">로그인</a></li>	
					<li><a href="${pageContext.request.contextPath}/signup">회원가입</a></li>
				</c:if>
				<c:if test="${not empty loginEmail}">
					<li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>	
					<li><a href="${pageContext.request.contextPath}/member/mypage">마이페이지</a></li>
				</c:if>
			</ul>
		</nav>
		<img id="home-img" src="${pageContext.request.contextPath}/resources/images/homeImg.jpg" alt="홈배경화면">
	</header>
	<div id="search-container">
		<h1>원하는 지역의 부동산 거래가를 검색해보세요</h1>
		<form action="#">
			<select name="sido" id="sido"></select><select name="gugun" id="gugun"></select><input type="submit" id="search-btn" value="검색">
		</form>
	</div>
</body>
</html>
