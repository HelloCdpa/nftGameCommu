<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <jsp:include page="../header.jsp"></jsp:include>
 
 
 <table class="table table-striped table-hover" style="margin-top: 70px;">
		<tr>	
			<th>포인트</th>
			<th>유형</th>
			<th>시간</th>
		
		</tr>
		<c:forEach items="${pList}" var="p">
			<tr>
				<td>${p.p_point}</td>
				<td>${p.p_type}</td>
				<td>${p.p_pointdate}</td>
			</tr>
		</c:forEach>
		
	</table>
		${m.m_id}님의 전체 포인트 : ${m.m_point} point
 
 
 
 
 
 
 
 
 
 
</body>
</html>