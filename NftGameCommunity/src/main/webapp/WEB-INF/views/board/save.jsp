<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

  <div class="container" style="background-color: rgb(191, 224, 196); border-radius: 1rem; margin-top: 100px;">
  <h2 class="text-center"> 게시글 입력 페이지</h2>
  <form action="/board/save" method="post" enctype="multipart/form-data" class="gap-2 col-6 mx-auto">
  작성자 : <input class="form-control" type="text" name="m_id" value="${sessionScope.loginId}" readonly="readonly" >
  
 <label for="cate_number">카테고리</label>
  <select name="cate_number" id="cate_number" class="form-control">
    <option>카테고리</option>
    <option value="1">사이버드래곤</option>  
    <option value="2">조디움</option>  
    <option value="3">솔칙스</option>  
    <option value="4">나인크로니클</option>  
    <option value="5">그냥 잡담</option>  
    </select><br>
 
 
 
 <label for="b_title">제목</label>
 <input class="form-control" type="text" name="b_title" id="b_title">
 
 
 <label for="b_contents">내용</label>
 <textarea class="form-control" rows="4" cols="60" name="b_contents" id="b_contents"></textarea>
 <label for="b_file">파일첨부</label>
 <input class="form-control" type="file" name="b_file" id="b_file">

 
 <input class="btn btn-outline-success m-3" type="submit" value="글 작성">
</form>
</div>




</body>
</html>