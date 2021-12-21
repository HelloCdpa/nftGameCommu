<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/resources/css/test.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.cards-box {
            display: flex;
            justify-content: space-between;
            margin: 0 70px;
            margin-top: 65px;
            flex-wrap: wrap;
            {#float: left;#}
        }
</style>
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
	<form action="/nft/nftUpdate" method="post">
      
      <div class="card h-100" style="max-width: 1000px; margin-top: 100px; margin-left: 3cm;">
  <div class="row g-0">
    <div class="col-md-4">
     <img class="img-fluid rounded-start" src="/resources/nft/${nft.nft_filename}" alt="..." />
    </div>
    <div class="col-md-8">
      <div class="card-body">
     	<input name="nft_number" type="hidden" value="${nft.nft_number}">
        <h5 class="card-title"><input name="nft_name" type="text" class="form-control" value="${nft.nft_name}"></h5>
        <p class="card-text"><textarea name="nft_intro" rows="4" cols="50" class="form-control">${nft.nft_intro} </textarea></p>
        <p class="card-text"><small class="text-muted">업로드 시간 : ${nft.nft_date}</small></p>
        
        <div class="card-footer col-auto"> 
        가격  <input class="form-control " style="width:300px;" type="number" value="${nft.nft_price}" name="nft_price"></div>
        <div class="card-footer col-auto"> <input type="submit" class="btn btn-outline-danger" value="수정"> </div>
      </div>
    </div>
  </div>
</div>
      </form>	

</body>
</html>