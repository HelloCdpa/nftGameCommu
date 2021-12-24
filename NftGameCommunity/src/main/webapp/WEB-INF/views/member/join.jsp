<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="/resources/css/test.css" rel="stylesheet">
<meta charset="UTF-8">
<title>회원가입</title>
<style>
input {
	display: block;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	function idDuplicate() {
		const id = document.getElementById('m_id').value;
		const checkResult = document.getElementById('m_id-dup-check');
		$.ajax({
			type : 'post',
			url : 'idDuplicate',
			data : {
				'm_id' : id
			},
			dataType : 'text',
			success : function(result) {
				if (result == "ok") {
					checkResult.style.color = 'green';
					checkResult.innerHTML = '멋진 아이디네요';
				} else {
					checkResult.style.color = 'red';
					checkResult.innerHTML = '이미 사용중인 아이디';
				}
			},
			error : function() {
				console.log('오타 찾으세요')
			}

		});

	}
</script>

</head>
<body>

     <jsp:include page="../header.jsp"></jsp:include>
	<form class="d-grid gap-2 col-6 mx-auto m-3" action="join" method="post">
		<div class="container"
			style="background-color: rgb(191, 224, 196); border-radius: 1rem; margin-top: 100px;">
			<h2 class="text-center">회원가입</h2>
			<label for="m_id" class="text-start">아이디</label> 
			<input class="form-control" type="text" name="m_id" id="m_id"
				placeholder="아이디 20자이내" onblur="idDuplicate()"> 
				<span id="m_id-dup-check"> </span><br>
				
				 <label id="m_password" class="text-start">비밀번호</label> 
				 <input class="form-control" type="password" name="m_password" id="m_password"
				placeholder="비밀번호 입력"> 
				
				<label for="m_name" class="text-start">이름</label>
				 <input class="form-control" type="text" name="m_name" id="m_name"> 
				 
				 <label for="m_email" class="text-start">이메일</label> 
				 <input class="form-control" type="text" name="m_email" id="m_email"> 
				 
				 <label for="m_phone" class="text-start">휴대폰번호</label> 
				 <input class="form-control" type="text" name="m_phone" id="m_phone"
				value="010"> <br>
				
				<label for="m_likegame" class="text-start">가장 선호하는 nft 게임</label> 
				
				<div class="form-check">
				<input class="form-check-input" type="radio" name="m_likegame" id="cyber dragon"
				value="cyber dragon"> 
            	<label class="form-check-label" for="cyber dragon">사이버 드래곤</label> 
            	</div>
            	
            	<div class="form-check">
            	 <input class="form-check-input" type="radio" name="m_likegame" id="hero cat"
				value="hero cat"> 
            	<label class="form-check-label" for="hero cat">히어로 캣</label> 
            	</div>
            	
            	<div class="form-check">
            	 <input class="form-check-input" type="radio" name="m_likegame" id="solchicks"
				value="solchicks"> 
            	<label class="form-check-label" for="solchicks">솔칙스</label> 
            	</div>
            	
            	<div class="form-check">
            	 <input class="form-check-input" type="radio" name="m_likegame" id="nine chronicles"
				value="nine chronicles"> 
            	<label class="form-check-label" for="nine chronicles">나인 크로니클</label> 
            	</div>
            	<div class="form-check">
            	 <input class="form-check-input" type="radio" name="m_likegame" id="zodium"
				value="zodium"> 
            	<label class="form-check-label" for="zodium">조디움</label> 
        		</div>
        		
        	
				
				<input class="btn btn-outline-success m-3" type="submit" value="회원가입">
		</div>
	</form>
</body>
</html>