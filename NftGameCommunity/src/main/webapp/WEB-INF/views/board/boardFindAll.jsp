<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/resources/css/test.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>boardfindAll.jsp 게시글 전체 조회 페이지</h2>
	<a href="/board/save">게시글 작성</a>
	
<form action="/board/search" method="get">

<select name="searchtype">
<option value="b_title">제목</option>
<option value="m_id">작성자</option>
</select>

<input type="text" name="keyword">
<input type="submit" value="검색">

</form>
	
	<table>
		<tr>	
			<th>게시글 번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>내용</th>
			<th>파일</th>
			<th>조회수</th>
			<th></th>
			<th></th>
		</tr>
		<c:forEach items="${bList}" var="b">
			<tr>
				<td>${b.b_number}</td>
				<td>${b.m_id}</td>
				<td><a href="/board/boardDetail?b_number=${b.b_number}" type="submit">${b.b_title}</a></td>
				<td>${b.b_contents}</td>
				<td>${b.b_filename}</td>	
				<td>${b.b_hits}</td>	
				<c:if test="${sessionScope.loginId eq b.m_id}">		
				<td><a href="/board/boardUpdate?b_number=${b.b_number}" type="submit">수정</a></td>
				</c:if>
				<c:if test="${sessionScope.loginId eq b.m_id || sessionScope.loginId eq 'admin'}">		
				<td><a href="/board/boardDelete?b_number=${b.b_number}" type="submit">삭제</a></td>
				</c:if>

			</tr>
		</c:forEach>
	</table>
	<a href="/">홈으로 돌아가기</a>

	<div>
		<c:choose>
			<c:when test="${paging.page<=1}">
				[이전]&nbsp;
			</c:when>
			<c:otherwise>
				<a href="/board/paging?page=${paging.page-1}">[이전]</a>&nbsp;
			</c:otherwise>
		</c:choose>

		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i"
			step="1">
			<c:choose>
				<c:when test="${i eq paging.page}">
					${i}
				</c:when>
				<c:otherwise>
					<a href="/board/paging?page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${paging.page>=paging.maxPage}">
				[다음]
			</c:when>
			<c:otherwise>
				<a href="/board/paging?page=${paging.page+1}">[다음]</a>
			</c:otherwise>
		</c:choose>
	</div>

	


</body>
</html>