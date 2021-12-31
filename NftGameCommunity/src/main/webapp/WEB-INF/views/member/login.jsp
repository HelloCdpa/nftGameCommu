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
<title>login</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container text-center"
		style="background-color: rgb(191, 224, 196); border-radius: 1rem; margin-top: 100px;">
		<form action="login" method="post" class="d-grid gap-2 col-6 mx-auto">
			<h2>로그인</h2>
			<label for="m_id" class="text-start"> 아이디</label> <input
				class="form-control" type="text" placeholder="아이디 입력" name="m_id"
				id="m_id"> <label for="m_password" class="text-start">
				비밀번호</label> <input class="form-control" type="password"
				placeholder="비밀번호 입력" name="m_password" id="m_password">

			<button type="submit" class="btn btn-outline-success mb-3">로그인</button>
			<a id="custom-login-btn" href="kakaoLogin() ">
  <img
    src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
    width="222"
  />
</a>
<p id="token-result"></p>	
			
		</form>
	</div>
</body>


 <script>
        window.Kakao.init('caed560457f6ecf1485bfe5ba2eb1ce4');

        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'profile, account_email, gender, age_range, birthday', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    console.log(response) // 로그인 성공하면 받아오는 데이터
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account)
                        }
                    });
                    // window.location.href='/ex/kakao_login.html' //리다이렉트 되는 코드
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
    </script>
</html>