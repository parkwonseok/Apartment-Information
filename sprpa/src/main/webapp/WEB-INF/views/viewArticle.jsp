<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<head>
<meta charset="UTF-8">
<title>글보기</title>
<style>
#tr_file_upload {
	display: none;
}
#tr_btn_modify {
	display: none;
}
</style>
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/viewArticle.css">
<script
	src="${pageContext.request.contextPath }/resources/js/viewArticle.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
				<li><a
					href="${pageContext.request.contextPath}/board/boardList">문의하기</a></li>
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

	<div id="title">게시글 내용</div>
	<div id="wrap">
		<div class="articleInfo1">
			<div>글번호</div>
			<div class="div_info">${board.bno}</div>
			<div>작성자</div>
			<div class="div_info">${board.mb_name }</div>
			<div>등록일자</div>
			<div class="div_info">
				<fmt:formatDate value="${board.regdate}" />
			</div>
		</div>
		<div class="articleInfo2">
			<div>제목</div>
			<div class="bd-title">${board.title }</div>
		</div>
		<div class="articleInfo3">
			<div class="bd-content">${board.content}</div>
		</div>

		<button id="modify_btn" onclick="modifyArticle()">수정하기</button>
		<button id="delete_btn" onclick="deleteArticle(${board.bno})">삭제하기</button>
		
		<div id="modify-container">
			<form id="modifyForm" action="${contextPath }/board/modifyArticle"
				method="post" style="display: none;">
				<input type="hidden" name="bno" value="${board.bno }"><br>
				<input type="text" id="modify-title" name="title" value="${board.title }"><br>
				<textarea id="modify-content" name="content" cols="60" rows="20" style="resize: none;">${board.content }</textarea><br>
				<input type="submit" id="modify-btn" value="수정하기">
			</form>
		</div>
	</div>
	<div id=parentReply style="text-align: center;">
		<c:if test="${loginEmail == 'admin'}">
			<form id="reply"
				action="${pageContext.request.contextPath}/board/replyRegister"
				method="post">
				<p>
				<h3>댓글을 입력해주세요.</h3>
				<textarea id="replytext" name="cm_content" form="reply" cols="40"
					rows="5" autofocus required wrap="hard" placeholder="댓글을 입력해주세요"></textarea>
				<!-- 				<input type="text" name="cm_content" placeholder="댓글을 입력해주세요"><br> -->
				<input type="hidden" name="bno" value="${board.bno}">
				</p>
				<input type="submit" value="댓글등록">
			</form>
		</c:if>
		
		<h3>관리자 답글</h3>
		<div id="cm">
			<div id="cm-regdate">작성시간: ${board.cm_regdate}</div>
			<div id="cm-content">${board.cm_content}</div>
		</div>
	</div>
	<script>
		function modifyArticle() {
			$('#modifyForm').toggle('slow');
		}
		function deleteArticle(bno) {
			if(confirm('해당 글을 삭제하시겠습니까?')){
				/* alert('삭제 완료하였습니다.'); */
				$(location).attr('href', 'http://localhost:8080/sprpa/board/removeArticle?bno='+bno);
			} else {
				/* alert('취소 하였습니다.'); */
			}
		}
	</script>
	</body>
</html>
