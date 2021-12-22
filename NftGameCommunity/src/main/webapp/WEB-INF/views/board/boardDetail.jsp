<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script>
$(function(){
	// 추천버튼 클릭시(추천 추가 또는 추천 제거)
	$("#rec_update").click(function(){
		$.ajax({
			url: "/board/like",
            type: "POST",
            data: {
                no: ${content.board_no},
                id: '${id}'
            },
            success: function () {
		        recCount();
            },
		})
	})
	
	// 게시글 추천수
    function recCount() {
		$.ajax({
			url: "/expro/RecCount.do",
            type: "POST",
            data: {
                no: ${content.board_no}
            },
            success: function (count) {
            	$(".rec_count").html(count);
            },
		})
    };
    recCount(); // 처음 시작했을 때 실행되도록 해당 함수 호출
[출처] [JSP/JAVA] 홈페이지 만들기 7 - 좋아요(추천) 기능  구현 방법|작성자 JOKER
    
</script>
<body>
	<header class="fixed-top bg-gradient shadow bg-gradient"
		style="background-color: rgb(191, 224, 196);">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="#"> <img
					src="/resources/img/logo.png" alt="" width="30" height="30"></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarText"
					aria-controls="navbarText" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarText">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="../">Home</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/board/paging?page=${page}">커뮤니티</a></li>
						<li class="nav-item"><a class="nav-link" href="/nft/market">NFT</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">포인트</a></li>
					</ul>


					<ul class="nav nav-pills">
						<li class="nav-item"><a class="nav-link text-secondary"
							href="/member/login">로그인</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="/member/logout">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="/member/join">회원가입</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<div class="container text-center" style="margin-top: 100px;">
		<table
			class="table bg-success p-2 text-dark bg-opacity-10 bg-gradient">
			<tr
				class="border border-secondary border-2 bg-success p-2 bg-opacity-50">
				<td>${b.b_title}</td>
			</tr>
			<tr class="border border-secondary">
				<td>작성자 : ${b.m_id} 조회 ${b.b_hits} | 추천 ${b.like_count}</td>
			</tr>
			<tr class="border border-secondary">
				<td><img alt=""
					src="/resources/board_uploadfile/${b.b_filename}" width="300"
					height="300"> <br> ${b.b_contents} <br></td>
			</tr>
			<tr>
				<td>
				<c:if test="${sessionScope.loginId == null}">
					추천 기능은 <a href="/member/login" type="button" id="newLogin" class="btn btn-outline-success">로그인</a> 후 사용 가능합니다.<br />
					<img src="\resources\img\좋아요전.png" id='rec_update' width="60px" height="60px" id="img1" class="rounded-circle">
				<span class="rec_count"></span>
							
				</c:if>
				<c:if test="${sessionScope.loginId != null}">
				<img src="\resources\img\좋아요전.png" id='rec_update' width="60px" height="60px" id="img1" class="rounded-circle">
				&nbsp;<span class="rec_count"></span>
				</c:if>
		</td>
		

			</tr>
		</table>

		<div id="comment-write">
			<input type="text" id="m_id" value="${sessionScope.loginId}"
				readonly="readonly"> <input type="text" id="c_contents"
				placeholder="댓글내용">
			<button id="comment-write-btn">댓글등록</button>
		</div>
	</div>
	<!-- 댓글 목록 출력 -->
	<div id="comment-list">
		<table class="table">
			<tr>
				<th>댓글번호</th>
				<th>작성자</th>
				<th>내용</th>
				<th>작성시간</th>
			</tr>
			<c:forEach items="${commentList}" var="comment">
				<tr>
					<th>${comment.c_number}</th>
					<th>${comment.m_id}</th>
					<th>${comment.c_contents}</th>
					<th>${comment.c_date}</th>

				</tr>
			</c:forEach>


		</table>
	</div>

</body>
<script>

	$("#comment-write-btn").click(function(){
	console.log("댓글 등록 버튼 클릭");
	const commentWriter = $("#m_id").val();
		const commentContents = $("#c_contents").val();
		
		const boardNumber = '${b.b_number}';
		console.log(m_id,c_contents,boardNumber)
			
		$.ajax({
			type : 'post', 
			url : '/comment/commentSave',
			data : {"m_id":commentWriter, 
				"c_contents":commentContents,
				"b_number":boardNumber
				},
			dataType : 'json',
			
			success: function(result){
				console.log(result);
				console.log(result);
			let output = "<table class='table'>";
			output += "<tr><th>댓글번호</th>";
			output += "<th>작성자</th>";
			output += "<th>내용</th>";
			output += "<th>작성시간</th></tr>";
			for(let i in result){
				output += "<tr>";
				output += "<td>"+result[i].c_number+"</td>";
				output += "<td>"+result[i].m_id+"</td>";
				output += "<td>"+result[i].c_contents+"</td>";
				output += "<td>"+result[i].c_date+"</td>";
				output += "</tr>";
			}
			output += "</table>";
			document.getElementById('comment-list').innerHTML = output;
			document.getElementById('m_id').value='';
			document.getElementById('c_contents').value='';
			},
			error : function() {
				console.log("뭐가잘못된거니");
		}
			
			
			});
	});
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	




</script>
</html>