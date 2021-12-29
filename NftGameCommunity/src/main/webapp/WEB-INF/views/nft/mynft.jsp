<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mynft</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="row gx-4 gx-lg-5 bg-gradient" style="margin-top: 100px; margin-left: 1cm;" >
<h2> mynft </h2>
<c:forEach items="${nList}" var="n">
      <div class="col-md-4 mb-5">
          <div class="card h-100">
              <div class="card-body">
            	 
                  <h2 class="card-title text-center">${n.nft_name}</h2>
                  <p class="card-text"><img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/nft/${n.nft_filename}" alt="..." /></p>
                  <p class="card-text">${n.nft_intro}</p>
              </div>
             
            <a class="btn btn-outline-success" href="/member/nftprofile?m_profilename=${n.nft_filename}&m_id=${sessionScope.loginId}"> 프로필 사진 등록하기 </a>
        </div>
          </div>
     
  </c:forEach>
  </div>
 

</body>
</html>