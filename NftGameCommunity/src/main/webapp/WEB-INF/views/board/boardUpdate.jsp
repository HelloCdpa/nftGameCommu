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
    <jsp:include page="../header.jsp"></jsp:include>
<h2>수정화면</h2>
  <form action="/board/boardUpdate" method="post" enctype="multipart/form-data">
  <input type="hidden" name="b_number" value="${b.b_number}" >
  작성자 : 
  <input type="text" name="m_id" value="${sessionScope.loginId}" readonly="readonly" >
 <label for="b_title">제목</label>
 <input type="text" name="b_title" id="b_title" value="${b.b_title}">
 <label for="b_contents">내용</label>
 <textarea name="b_contents" id="b_contents">${b.b_contents}</textarea>
 <label for="b_file">파일첨부</label>
 현재 사진 <img alt="" src="/resources/board_upload/${b.b_filename}" width="300" height="300">
 <input type="file" name="b_file" id="b_file" value="${b.b_file}">
 
 
 <input type="submit" value="글 작성">
</form>









</body>
</html>