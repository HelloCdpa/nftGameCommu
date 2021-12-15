<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   
<meta charset="UTF-8">

<title>nft game community home</title>
<style>
    body {
    background-color: rgb(250, 255, 228);
}
</style>
</head>
<body>

    <header class="fixed-top bg-gradient"style="background-color: rgb(191, 224, 196);">
        <div class="container text-center btn-group" >
            <ul class="nav flex-grow-1">  
                <li class="navbar-brand">
                    <img src="/resources/board_upload/dad.png" alt="" width="30" height="30">
                  </li>
                <li class="nav-item">
                <a class=" nav-link btn btn-outline-success" href="/member/join"> 회원가입 </a>
                </li>
                <li class="nav-item">
                <a class=" nav-link btn btn-outline-success" href="/member/login"> 로그인 </a>
                </li>
                <li class="nav-item">
                <a class="nav-link btn btn-outline-success" href="/member/logout"> 로그아웃 </a>
                </li>    
           </ul>
        </div>
    </header>
  
        <img alt="" src="/resources/board_upload/dad.png" width="300" height="300"class="mx-auto d-block m-5">


        <div class="container text-center m-5" >
            <a class="btn btn-outline-success" href="/board/save"> 게시글 작성 </a>
            <a class="btn btn-outline-success" href="/board/paging?page=${page}"> 게시글 조회 </a>
        </div>
        
        <c:if test="${sessionScope.loginId != null}">
            <a class="btn btn-outline-success" href="/member/mypage?m_id=${sessionScope.loginId}"> 마이페이지 </a>
        </c:if>
        
        <c:if test="${sessionScope.loginId eq 'admin'}">
            <a class="btn btn-outline-success" href="/member/paging?page=${page}"> 관리자 페이지 이동 </a>
        </c:if>
        
        ${sessionScope.loginId} 환영합니다!
    
    

</body>
</html>