<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/resources/css/test.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<h2>게시글 상세 조회</h2>
	<a href="../">홈으로 돌아가기</a>

	<table class="table">
		<tr>
			<td>작성자</td>
			<td>${b.m_id}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${b.b_title}</td>
		</tr>
		<tr>
			<td>사진</td>
			<td><img alt="" src="/resources/board_upload/${b.b_filename}"
				width="300" height="300"></td>
		</tr>

		<tr>
			<td>내용</td>
			<td>${b.b_contents}</td>
		</tr>
		
		<tr>
			<td>조회수</td>
			<td>${b.b_hits}</td>
		</tr>
	</table>

	<div id="comment-write">
		<input type="text" id="m_id" value="${sessionScope.loginId}" readonly="readonly"> 
		<input type="text" id="c_contents" placeholder="댓글내용">
		<button id="comment-write-btn">댓글등록</button>
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