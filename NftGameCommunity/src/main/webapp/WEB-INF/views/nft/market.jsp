<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <link href="/resources/css/test.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Market</title>
</head>
<body>
     <jsp:include page="../header.jsp"></jsp:include>
<div class="row gx-4 gx-lg-5 bg-gradient" style="margin-top: 100px; margin-left: 1cm;" >
<h2> NFT 마켓</h2>
<c:forEach items="${nList}" var="n">
      <div class="col-md-4 mb-5">
          <div class="card h-100">
              <div class="card-body">
            	 
                  <h2 class="card-title text-center">${n.nft_name}</h2>
                  <p class="card-text"><img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/nft/${n.nft_filename}" alt="..." /></p>
                  <p class="card-text">${n.nft_date}</p>
              </div>
              <div class="card-footer text-center"> ${n.nft_price} point <a class="btn btn-outline-success btn-sm" href="/nft/nftDetail?nft_number=${n.nft_number}">구매</a>
              <c:if test="${sessionScope.loginId eq 'admin'}">
            <a class="btn btn-outline-success" href="/nft/nftUpdate?nft_number=${n.nft_number}"> 수정 </a>
            <a class="btn btn-outline-danger" href="/nft/nftDelete?nft_number=${n.nft_number}"> 삭제 </a>
        </c:if></div>
          </div>
      </div>
  </c:forEach>
  </div>
 

</body>
</html>