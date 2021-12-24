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
    <jsp:include page="../header.jsp"></jsp:include>
	<h2>findAll.jsp 회원목록 페이지</h2>

	<table class="table table-striped table-hover" style="margin-top: 100px;">
		<tr>	
			<th>회원번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>휴대폰 번호</th>
			<th>프로필사진</th>
			<th>회원삭제</th>
		</tr>
		<c:forEach items="${mList}" var="m">
			<tr>
				<td>${m.m_number}</td>
				<td>${m.m_id}</td>
				<td>${m.m_password}</td>
				<td>${m.m_name}</td>
				<td>${m.m_email}</td>
				<td>${m.m_phone}</td>
				<td>${m.m_profilename}</td>
				<td><a href="/member/delete?m_number=${m.m_number}" type="submit">삭제</a></td>

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
				<a href="/member/paging?page=${paging.page-1}">[이전]</a>&nbsp;
			</c:otherwise>
		</c:choose>

		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i"
			step="1">
			<c:choose>
				<c:when test="${i eq paging.page}">
					${i}
				</c:when>
				<c:otherwise>
					<a href="/member/paging?page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${paging.page>=paging.maxPage}">
				[다음]
			</c:when>
			<c:otherwise>
				<a href="/member/paging?page=${paging.page+1}">[다음]</a>
			</c:otherwise>
		</c:choose>
	</div>

	


</body>
</html>