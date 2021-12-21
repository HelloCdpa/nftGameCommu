<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/resources/css/test.css" rel="stylesheet">
<meta charset="UTF-8">
<title>관리자 nft 저장화면</title>
</head>
<body>
	
	<div class="container mt-3 " style="background-color: rgb(191, 224, 196); border-radius: 1rem;">
	<form action="/nft/nftSave" method="post" enctype="multipart/form-data" class="gap-2 col-6 mx-auto">
	 <label for="nft_file">NFT첨부</label>
	 <input class="form-control" type="file" name="nft_file" id="nft_file">
	 
	 <label for="nft_name">상품명</label>
 	<input class="form-control" type="text" name="nft_name" id="nft_name">
 	
 	<label for="nft_price">가격</label>
 	<input class="form-control" type="text" name="nft_price" id="nft_price">
	
	 
	 <input class="btn btn-outline-danger m-3" type="submit" value="상품 등록">
	</form>
	


</div>

</body>
</html>