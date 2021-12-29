<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/resources/css/test.css" rel="stylesheet">
<meta charset="UTF-8">
<title>nftDetail</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
// 아이디 입력을 하는 동안에 idDuplicate() 함수를 호출하고 입력된 값을 콘솔에 출력
    function NftBuy() {
        const m_id = "${sessionScope.loginId}"
        const nft_number = "${nft.nft_number}"
        const nft_price = "${nft.nft_price}"
        $.ajax({
	type : 'post', //(get, post, delet, put)
	url : '/nft/nftBuyCheck',
	data : {'m_id' : m_id,'nft_number' : nft_number,'nft_price' : nft_price},
	dataType : 'text',
	success : function(result){
		if(result == "ok") {
			alert('구매 완료 되었습니다.')
		 success.submit();
		}else {
			alert('포인트가 부족합니다.')
			location.href='/member/pointCharge?m_id=m_id';
		}
	},
	error : function(){
		console.log('오타 찾으세요')
	}
	
});
}
</script>



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
        
        <form action="/nft/nftBuy" name="success" method="get">
        <input type="hidden" id="nft_number" name="nft_number" value="${nft.nft_number}" >
        <input type="hidden" id="nft_price" name="nft_price" value="${nft.nft_price}" >
        <input type="hidden" id="m_id" name="m_id" value="${sessionScope.loginId}" >
        
        가격 : ${nft.nft_price} point <input class="btn btn-outline-success btn-sm" onclick="NftBuy()" value="구매">
        </form>
        </div>
      </div>
    </div>
     </div>
    </div>


	
</body>
</html>