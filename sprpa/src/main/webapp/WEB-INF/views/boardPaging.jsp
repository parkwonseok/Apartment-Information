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
</head>
<style>
h2 {
	text-align: center;
}

table {
	width: 100%;
}

#outter {
	display: block;
	width: 60%;
	margin: auto;
}

a {
	text-decoration: none;
}
</style>
<script>
	
</script>
<body>
	<h2>게시판</h2>

	<div id="outter">
		<div style="float: right;">
			<select id="cntPerPage" name="sel" onchange="selChange()">
				<option value="5"
					<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
					보기</option>
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
		<table border="1">
			<tr align="center" bgcolor="lightgreen">
				<th><b>글번호</b></th>
				<th><b>글제목</b></th>
				<th><b>작성자</b></th>
				<th><b>작성일</b></th>

			</tr>

			<c:forEach var="board" items="${boardList}">
				<tr class="bd_tr" align="center">
					<td class="bd_bno">${board.bno}</td>
					<td class="bd_title">${board.title}</td>
					<td>${board.mb_name}</td>
					<td>${board.regdate}</td>

				</tr>
			</c:forEach>
		</table>


		<div style="display: block; text-align: center;">
			<c:if test="${paging.startPage != 1 }">
				<a
					href="/sprpa/board/boardList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
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
					href="/sprpa/board/boardList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
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