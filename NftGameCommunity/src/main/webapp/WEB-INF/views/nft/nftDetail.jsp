<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/resources/css/test.css" rel="stylesheet">
<meta charset="UTF-8">
<title>nftDetail</title>
</head>
<body>
	    <jsp:include page="../header.jsp"></jsp:include>
	<h2> 구매 페이지 </h2>
     <div class="card h-100" style="max-width: 1000px; margin-top: 100px; margin-left: 3cm;">
  <div class="row g-0">
    <div class="col-md-4">
     <img class="img-fluid rounded-start" src="/resources/nft/${nft.nft_filename}" alt="..." />
    </div>
    <div class="col-md-8">
      <div class="card-body">
     	<input name="nft_number" type="hidden" value="${nft.nft_number}">
        <h2 class="card-title">${nft.nft_name}</h2>
        <p class="card-text">${nft.nft_intro}</p>
        
        <div class="card-footer"> 
        <p class="card-text"><small class="text-muted">업로드 시간 : ${nft.nft_date}</small></p>
        가격 : ${nft.nft_price} point <a class="btn btn-outline-success btn-sm" href="/nft/nftDetail?nft_nubmer=${nft.nft_number}">구매</a></div>
      </div>
    </div>
     </div>
    </div>


	
</body>
</html>