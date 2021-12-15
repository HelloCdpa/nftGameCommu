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

    
    <div class="container text-center" style="background-color: rgb(191, 224, 196); border-radius: 1rem;">
        <h2>login.jsp</h2> 
    <form action="login" method="post" class="d-grid gap-2 col-6 mx-auto">
<label for="m_id" class="text-start"> 아이디</label>
<input class="form-control" type="text" placeholder="아이디 입력"  name="m_id" id="m_id">
<label for="m_password" class="text-start"> 비밀번호</label>
<input class="form-control" type="password" placeholder="비밀번호 입력"  name="m_password" id="m_password">

<button type="submit" class="btn btn-outline-success mb-3">로그인</button>
</form>
</div>
</body>
</html>