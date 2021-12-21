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
    <header class="fixed-top bg-gradient shadow bg-gradient"style="background-color: rgb(191, 224, 196);">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
              <a class="navbar-brand" href="#"> <img src="/resources/img/logo.png" alt="" width="30" height="30"></a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="../">Home</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/board/paging?page=${page}">커뮤니티</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/nft/market">NFT</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">포인트</a>
                  </li>
                </ul>

          
                <ul class="nav nav-pills">
                  <li class="nav-item">
                    <a class="nav-link text-secondary" href="/member/login">로그인</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link text-secondary" href="/member/logout">로그아웃</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link text-secondary" href="/member/join">회원가입</a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
          
        
    </header>

<form class="row g-3 container text-center" style="margin-top: 100px;" action="/board/search" method="get">
<div class="col-auto" >
<select class="form-select" style="width:100px;height:40px; display:inline;" name="searchtype">
<option value="b_title">제목</option>
<option value="m_id">작성자</option>
</select>
</div>

<div class="col-auto">
<input class="form-control"  type="text" name="keyword">
</div>

<div class="col-auto">
<input class="form-control"  type="submit" value="검색">
</div>

<div class="col-auto">
<a class="btn btn-outline-success" href="/board/save">게시글 작성</a>
</div>


</form>
	
	<table class="table table-striped table-hover" style="margin-top: 30px;">
		<tr>	
			<th>글번호</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>작성자</th>
			<th>파일</th>
			<th>조회수</th>
			<th></th>
			<th></th>
		</tr>
		<c:forEach items="${bList}" var="b">
			<tr>
				<td>${b.b_number}</td>
				<td>${b.cate_number}</td>
				<td><a class="link-success" href="/board/boardDetail?b_number=${b.b_number}" type="submit">${b.b_title}</a></td>
				<td>${b.m_id}</td>
				<td>${b.b_filename}</td>	
				<td>${b.b_hits}</td>	
				<c:if test="${sessionScope.loginId eq b.m_id}">		
				<td><a class="link-success" href="/board/boardUpdate?b_number=${b.b_number}" type="submit">수정</a></td>
				</c:if>
				<c:if test="${sessionScope.loginId eq b.m_id || sessionScope.loginId eq 'admin'}">		
				<td><a class="link-success" href="/board/boardDelete?b_number=${b.b_number}" type="submit">삭제</a></td>
				</c:if>

			</tr>
		</c:forEach>
	</table>

	<c:if test="${sessionScope.loginId eq 'admin'}">
	<form action="/board/cateSave" method="get" class="row g-3" style="margin-left: 1cm">
	<div class="col-auto">
	<input type="text" name="cate_name" class="form-control" style="width:300px;" placeholder="추가할 카테고리 입력">
	</div>
	<div class="col-auto">
	<input type="submit" class="btn btn-outline-danger" value="카테고리 추가">
	</div>
	</form>	
	</c:if>


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