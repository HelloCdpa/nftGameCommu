<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/resources/css/test.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function update() {
		 const pw = document.getElementById('m_password').value
				if(pw==${m.m_password}){
				alert('회원정보 수정이 완료되었습니다.');
				update_form.submit();
				
				}else {
				alert('비밀번호가 일치하지 않습니다.');
				}
	}

</script>



</head>
<body>
     <jsp:include page="../header.jsp"></jsp:include>
	<div class="container text-center" style="background-color: rgb(191, 224, 196); border-radius: 1rem; margin-top: 100px;">
	<h2>마이페이지</h2>
	<form action="/member/memberUpdate" method="post"
		enctype="multipart/form-data" name="update_form" class="gap-2 col-6 mx-auto">
		<table class="table">

			<tr>
				<td></td>
				<td><input type="hidden" name="m_number" value="${m.m_number}"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input class="form-control" type="text" name="m_id" value="${m.m_id}"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input class="form-control" type="password" name="m_password" id="m_password" placeholder ="비밀번호를 입력하세요"></td>
			</tr>

			<tr>
				<td>이름</td>
				<td><input class="form-control" type="text" name="m_name" value="${m.m_name}"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input class="form-control" type="text" name="m_email" value="${m.m_email}"></td>
			</tr>

			<tr>
				<td>휴대폰 번호</td>
				<td><input class="form-control" type="text" name="m_phone" value="${m.m_phone}"></td>
			</tr>
			<tr>
				<td>프로필사진</td>
				<td><img class="mt-3" alt=""
					src="/resources/profile_upload/${m.m_profilename}" width="150"
					height="150"><br> 
					<input type="file" name="m_profile" id="m_profile" class="btn mt-4"></td>
			</tr>

			<tr>
				<th><button class="btn btn-outline-success text-center"  type="button" onclick="update()"> 회원정보 수정</button></th>
			</tr>



		</table>
	</form>
		</div>


	<a href="/">홈으로 돌아가기</a>









</body>
</html>