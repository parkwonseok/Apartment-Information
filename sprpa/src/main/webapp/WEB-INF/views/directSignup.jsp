<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>직접 회원가입</title>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/directSignup.css">
	<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
</head>
<body>
	<header>
		<div id="logo">
			<img
				src="${pageContext.request.contextPath}/resources/images/logo.png"
				alt="로고"> <a href="${pageContext.request.contextPath}/">부동산
				플랜</a>
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
				<li><a id="login-open">로그인</a></li>
				<li><a href="${pageContext.request.contextPath}/signup">회원가입</a></li>
			</ul>
		</nav>
	</header>
	<div id="title">회원가입</div>
    <form action="${pageContext.request.contextPath}/member/addMember" method="post">
		<input type="text" name="mb_email" placeholder="이메일을 입력해주세요"><br>
		<input type="text" name="mb_pw" placeholder="비밀번호를 입력해주세요"><br>
		<input type="text" name="mb_name" placeholder="이름을 입력해주세요"><br> 
		<input type="submit" value="회원가입">
	</form>
</body>
</html>