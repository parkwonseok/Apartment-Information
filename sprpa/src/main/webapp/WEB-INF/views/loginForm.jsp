<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>홈</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/loginForm.css">
	<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/loginForm.js"></script>
</head>
<body>
	<header>
		<div id="logo">
			<img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="로고"> <a href="${pageContext.request.contextPath}/">부동산 플랜</a>
		</div>
		<nav id="main-nav">
			<ul>
				<li><a href="#">실시간 거래</a></li>
				<li><a href="#">메뉴</a></li>
				<li><a href="#">메뉴</a></li>
				<li><a href="${pageContext.request.contextPath}/board/boardList">문의하기</a></li>
			</ul>
		</nav>
		<nav id="member">
			<ul>
				<c:if test="${empty loginEmail}">
					<li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
					<li><a href="${pageContext.request.contextPath}/signup">회원가입</a></li>
				</c:if>
				<c:if test="${not empty loginEmail}">
					<li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
					<li><a href="${pageContext.request.contextPath}/member/mypage">마이페이지</a></li>
				</c:if>
			</ul>
		</nav>
	</header>
	
	<h1>로그인</h1>
    <form id="loginForm" action="${pageContext.request.contextPath}/member/login" method="post">
  		<input type="text" id="id" name="mb_email" placeholder="이메일을 입력해주세요"><br>
  		<input type="password" id="pw" name="mb_pw" placeholder="비빌번호를 입력해주세요"><br>
  		<input type="submit" id="submit" value="로그인">
    </form>
    <div id="social-login">───────────또는───────────</div>
    <button id="kakao-login"><img src="${pageContext.request.contextPath}/resources/images/kakao.jpg">카카오 로그인</button><br>
    <button id="naver-login"><img src="${pageContext.request.contextPath}/resources/images/naver.JPG">네이버 로그인</button><br>
    <button id="goggle-login"><img src="${pageContext.request.contextPath}/resources/images/google.JPG">구글 로그인</button>
</body>
</html>