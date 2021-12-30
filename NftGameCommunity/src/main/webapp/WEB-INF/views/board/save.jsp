<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <div class="container" style="background-color: rgb(191, 224, 196); border-radius: 1rem; margin-top: 100px;">
  <h2 class="text-center"> 게시글 입력 페이지</h2>
  <form action="/board/save" method="post" enctype="multipart/form-data" class="gap-2 col-6 mx-auto">
  작성자 : <input class="form-control" type="text" name="m_id" value="${sessionScope.loginId}" readonly="readonly" >
  
 <label for="cate_number">카테고리</label>
  <select name="cate_number" id="cate_number" class="form-control">
    <option value="5">카테고리 선택</option>
 <c:forEach items="${cList}" var="c" >
    <option value="${c.cate_number}">${c.cate_name}</option>
    </c:forEach>
    </select><br>
 
 
 
 <label for="b_title">제목</label>
 <input class="form-control" type="text" name="b_title" id="b_title">
 
 
 <label for="b_contents">내용</label>
 <textarea class="form-control" rows="4" cols="60" name="b_contents" id="b_contents"></textarea>
 <label for="b_file">파일첨부</label>
 <input class="form-control" type="file" name="b_file" id="b_file">

 
 <input class="btn btn-outline-success m-3" type="submit" value="글 작성">
</form>
</div>




</body>
</html>