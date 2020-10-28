<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/boardPaging.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/boardPaging.css">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap"
	rel="stylesheet">
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
	<h2>고객 문의</h2>

	<div id="outter">
		<div style="float: right;">
			<select id="cntPerPage" name="sel" onchange="selChange()">
				<option value="10"
					<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
					보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
					보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
					보기</option>
			</select>
		</div>
		<!-- 옵션선택 끝 -->
		<div>
			<button id="btn_write">글쓰기</button>
		</div>

		<div id="th">
			<ul>
				<li id="th_bno">글번호</li>
				<li id="th_title">제목</li>
				<li id="th_writer">작성자</li>
				<li id="th_regdate">작성날짜</li>
			</ul>
		</div>

		<table>
			<c:forEach var="board" items="${boardList}">
				<tr class="bd_tr" align="center">
					<td class="bd_bno">${board.bno}</td>
					<c:choose>
						<c:when test="${empty loginEmail}">
        					<c:choose>
	        					<c:when test="${board.secret == 1}">
	        						<td>비공개 글입니다.
	        					</c:when>
	        					<c:otherwise>
		       						<td class="bd_title">${board.title}
		    					</c:otherwise>
	    					</c:choose>
    					</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${loginEmail == 'admin'}">
									<td class="bd_title">${board.title}
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${loginEmail != board.mb_email && board.secret == 1}">
											<td>비공개 글입니다.
										</c:when>
										<c:otherwise>
											<td class="bd_title">${board.title}
										</c:otherwise>
		       						</c:choose>
								</c:otherwise>
       						</c:choose>
    					</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${empty loginEmail}">
        					<c:choose>
	        					<c:when test="${board.secret == 1}">
	        						<img class="secret-img" src="${pageContext.request.contextPath}/resources/images/secret.png">
	        					</c:when>
	        					<c:otherwise>
		    					</c:otherwise>
	    					</c:choose>
    					</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${loginEmail == 'admin'}">

								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${loginEmail != board.mb_email && board.secret == 1}">
											<img class="secret-img" src="${pageContext.request.contextPath}/resources/images/secret.png">
										</c:when>
										<c:otherwise>

										</c:otherwise>
		       						</c:choose>
								</c:otherwise>
       						</c:choose>
    					</c:otherwise>
					</c:choose>
					</td>
					<td class="bd_name">${board.mb_name}</td>
					<td class="bd_regdate">${board.regdate}</td>
				</tr>
			</c:forEach>
		</table>


		<div id="page-num" style="display: block; text-align: center;">
			<c:if test="${paging.startPage != 1 }">
				<a
					href="/sprpa/board/boardList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">◀</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a
							href="/sprpa/board/boardList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a
					href="/sprpa/board/boardList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">▶</a>
			</c:if>
		</div>
	</div>
	<script>
		function selChange() {
			var sel = document.getElementById('cntPerPage').value;
			location.href = "boardList?nowPage=${paging.nowPage}&cntPerPage="
					+ sel;
		}
	</script>
</body>
</html>