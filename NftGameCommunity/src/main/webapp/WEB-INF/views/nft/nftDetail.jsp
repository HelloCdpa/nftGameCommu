<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nftDetail</title>
</head>
<body>
	
	<h2> 구매 페이지 </h2>
	
	
	 <div class="col-md-4 mb-5">
          <div class="card h-100">
              <div class="card-body">
                  <h2 class="card-title text-center">${nft.nft_name}</h2>
                  <p class="card-text"><img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/nft/${nft.nft_filename}" alt="..." /></p>
                  <p class="card-text">${nft.nft_date}</p>
              </div>
              <div class="card-footer text-center"> ${nft.nft_price} point <a class="btn btn-outline-success btn-sm" href="/nft/nftDetail?nft_nubmer=${nft.nft_number}">구매</a></div>
          </div>
      </div>
	
	
	
</body>
</html>