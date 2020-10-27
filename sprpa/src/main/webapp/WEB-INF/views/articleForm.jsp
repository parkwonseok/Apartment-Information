<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/articleForm.css">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/articleForm.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
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
				<li><a href="${pageContext.request.contextPath}/board/articleForm">문의하기</a></li>
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
	</header>
	<div id="title">글쓰기</div>
	<form name="articleForm" method="post"
		action="${pageContext.request.contextPath }/board/addArticle">
		<input type="text" name="title" placeholder="제목을 입력해주세요"><br>
		<textarea name="content" cols="50" rows="15" style="resize: none;"
			placeholder="내용을 입력해주세요"></textarea>
		<br> <label for="secret"><input type="checkbox"
			id="secret" name="chk_secret" onclick="hover()"><span>비밀글 등록</span></label><br> <input
			type="submit" value="등록하기">

	</form>
</body>
</html>