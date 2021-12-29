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









<body>
	 <jsp:include page="../header.jsp"></jsp:include>

	<div class="container text-center" style="margin-top: 100px;">
		<table
			class="table bg-success p-2 text-dark bg-opacity-10 bg-gradient">
			 <thead>
			<tr >
				<td>${b.b_title}</td>
			</tr>
			</thead>
			<tbody>
			<tr>
			
				<td scope="col"><img alt=""
					src="/resources/nft/${m.m_profilename}" width="150"
					height="150"></td>
				
				<td scope="col">작성자 : ${b.m_id} <br> 조회 ${b.b_hits} | 추천 ${b.like_count} <br> 작성시간 ${b.b_date}</td>
			</tr>
			<tr>
				<td><img alt="사진이 없어요"
					src="/resources/board_uploadfile/${b.b_filename}" width="300"
					height="300"></td> <td align = "left" width="30%"> ${b.b_contents} </td> 
			</tr>
			<tr>
				<td><c:if test="${sessionScope.loginId == null}">
					추천 기능은 <a href="/member/login" type="button" id="newLogin"
							class="btn btn-outline-success">로그인</a> 후 사용 가능합니다.<br />
						<img src="/resources/img/좋아요전.png" id="likeimg" width="60px"
							height="60px" class="rounded-circle">
						<span id="rec_count"></span>

					</c:if> <c:if test="${sessionScope.loginId != null}">



						<div>
						<input type="hidden" id="like_check" value="${like.like_check}">
								<img class="rounded-circle likeimg"id="likeimg" src="/resources/img/좋아요전.png" width="60px"
							height="60px" > <span id="like_count">${b.like_count}</span>
						
						</div>
					</c:if></td>


			</tr>
			</tbody>
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
	
        
    $(document).ready(function () {
        var like_count = document.getElementById('like_count')
        var likeval = document.getElementById('like_check').value
        const b_number = '${b.b_number}';
        const m_id = "${sessionScope.loginId}";
        console.log(m_id);
        console.log(likeval);
        const likeimg = document.getElementById("likeimg")
			
        if(likeval>0) {
        	likeimg.src = "/resources/img/좋아요후.png";
           
        }
        else {
        	likeimg.src = "/resources/img/좋아요전.png";
            
        }

				// 좋아요 버튼을 클릭 시 실행되는 코드
        $(".likeimg").on("click", function () {
	            $.ajax({
	                url :'/board/like',
	                type :'POST',
	                data : {'b_number':b_number, 'm_id':m_id},
	                success : function(data){
	                    if(data==1) {
	                    	$("#likeimg").attr("src", "/resources/img/좋아요후.png");

	                    } else {
	                    	$("#likeimg").attr("src", "/resources/img/좋아요전.png");
	                    }
	                },error : function(){
	                    	$("#likeimg").attr("src", "/resources/img/좋아요후.png");
	            		console.log('오타 찾으세요')
	            	}
	                
							});
	            location.reload();
        });
    });
</script>





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