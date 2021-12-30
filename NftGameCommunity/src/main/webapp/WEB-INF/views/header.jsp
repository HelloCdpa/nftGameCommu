<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
              <a class="navbar-brand" href="../"> <img src="/resources/img/logo.png" alt="" width="30" height="30"></a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link active fw-bold" aria-current="page" href="../">Home</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link text-dark" href="/board/paging?page=${page}">커뮤니티</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link text-dark" href="/nft/market">NFT마켓</a>
                  </li>
                 
                </ul>
          
                <ul class="nav nav-pills">
                <c:if test="${sessionScope.loginId == null}">
                  <li class="nav-item">
                    <a class="nav-link text-dark" href="/member/login">로그인</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link text-dark" href="/member/join">회원가입</a>
                  </li>
                  </c:if>
                  <c:if test="${sessionScope.loginId != null}">
                  <li class="nav-item">
                    <a class="nav-link text-dark" href="/nft/mynft?m_id=${sessionScope.loginId}">나의 NFT</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link text-dark" href="/member/pointView?m_id=${sessionScope.loginId}">포인트</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link text-danger" href="/member/pointCharge?m_id=${sessionScope.loginId}">포인트 충전</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link text-secondary" href="/member/logout">로그아웃</a>
                  </li>
                  </c:if>
                </ul>
              </div>
            </div>
          </nav>
          
        
    </header>
</body>
</html>