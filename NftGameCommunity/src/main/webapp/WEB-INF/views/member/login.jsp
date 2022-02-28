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
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>login</title>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container text-center"
		style="background-color: rgb(191, 224, 196); border-radius: 1rem; margin-top: 100px;">
		<form action="login" method="post" class="d-grid gap-2 col-6 mx-auto">
			<h2>로그인</h2>
			<label for="m_id" class="text-start"> 아이디</label> 
			<input class="form-control" type="text" placeholder="아이디 입력" name="m_id"
				id="m_id" required> 
				<label for="m_password" class="text-start"> 비밀번호</label> 
				<input class="form-control" type="password"
				placeholder="비밀번호 입력" name="m_password" id="m_password" required>
				<input class="btn btn-outline-success" type="submit" value="로그인"> 
		</form>
			
	</div>
</body>
   

 
</html>