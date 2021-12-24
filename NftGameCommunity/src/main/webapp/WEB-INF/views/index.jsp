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
 <jsp:include page="header.jsp"></jsp:include>
  

 <!-- Page Content-->
 <div class="container px-4 px-lg-5 " style="margin-top:100px">
  <!-- Heading Row-->
  <div class="row gx-4 gx-lg-5 align-items-center my-5">
      <div class="col-lg-7"><img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/img/logo.png" alt="..." /></div>
      <div class="col-lg-5">
          <h2 class="font-weight-light">  ${sessionScope.loginId} 환영합니다! <br>
            NFT를 구매하여<br>프로필 사진을 꾸며보세요!</h2>
          <p>게시글과 댓글로 포인트를 모으거나 포인트를 충전해서 <br>
            단 하나밖에 없는 자신의 NFT프로필을 구매할 수 있어요</p>
          <a class="btn btn-outline-success" href="/nft/market">NFT 구매하러 가기!</a>
      </div>
  </div>
  <!-- Call to Action-->
  <div class="card text-white my-5 py-4 text-center bg-gradient border-success">
      <div class="card-body"><p class="text-white m-0">
       <c:if test="${sessionScope.loginId eq 'admin'}">
            <a class="btn btn-outline-success" href="/member/paging"> 관리자 페이지 이동 </a>
            <a class="btn btn-outline-danger" href="/nft/nftSave"> 관리자 nft상품 업로드 </a>
        </c:if>
        
        <c:if test="${sessionScope.loginId != null}">
        <div class="container text-center m-5" >
            <a class="btn btn-outline-success" href="/board/save"> 게시글 작성 </a>
            <a class="btn btn-outline-success" href="/board/paging?page=${page}"> 게시글 조회 </a>
        <a class="btn btn-outline-success" href="/member/mypage?m_id=${sessionScope.loginId}"> 마이페이지 </a>
        </div>
      </c:if></p>
      </div></div>
  </div>
  <!-- Content Row-->
  <div class="row gx-4 gx-lg-5 bg-gradient">
      <div class="col-md-4 mb-5">
          <div class="card h-100 border-success" >
              <div class="card-body">
                  <h2 class="card-title text-center">Zodium</h2>
                  <p class="card-text"><img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/nft/Zodium_dog.gif" alt="..." /></p>
              </div>
              <div class="card-footer text-center"> 귀여운 조디움 강아지! 40000p <a class="btn btn-outline-success btn-sm" href="/nft/market">구매</a></div>
          </div>
      </div>
      <div class="col-md-4 mb-5 bg-gradient">
          <div class="card h-100 border-success">
              <div class="card-body">
                  <h2 class="card-title text-center">Solchicks</h2>
                  <p class="card-text"><img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/nft/solchicks.png" alt="..." /></p>
              </div>
              <div class="card-footer text-center"> 발칙한 병아리! 20000p <a class="btn btn-outline-success btn-sm" href="/nft/market">구매</a></div>
          </div>
      </div>
      <div class="col-md-4 mb-5 bg-gradient">
          <div class="card h-100 border-success">
              <div class="card-body">
                  <h2 class="card-title text-center">Slimhood</h2>
                  <p class="card-text"><img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/nft/slimhood3.gif" alt="..." /></p>
              </div>
              <div class="card-footer text-center"> 발랄한 학생! 30000p <a class="btn btn-outline-success btn-sm" href="/nft/market">구매</a></div>
          </div>
      </div>
  </div>
<!-- Footer-->
<footer class="py-5 bg-dark">
  <div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; phl1021 2021</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

     

</body>
</html>