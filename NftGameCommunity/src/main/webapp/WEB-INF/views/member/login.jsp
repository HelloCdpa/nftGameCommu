<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/resources/css/test.css" rel="stylesheet">
<meta charset="UTF-8">
<title>login</title>

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
    <div class="container text-center" style="background-color: rgb(191, 224, 196); border-radius: 1rem; margin-top:100px;">
        <form action="login" method="post" class="d-grid gap-2 col-6 mx-auto">
        <h2>로그인</h2> 
<label for="m_id" class="text-start"> 아이디</label>
<input class="form-control" type="text" placeholder="아이디 입력"  name="m_id" id="m_id">
<label for="m_password" class="text-start"> 비밀번호</label>
<input class="form-control" type="password" placeholder="비밀번호 입력"  name="m_password" id="m_password">

<button type="submit" class="btn btn-outline-success mb-3">로그인</button>
</form>
</div>
</body>
</html>