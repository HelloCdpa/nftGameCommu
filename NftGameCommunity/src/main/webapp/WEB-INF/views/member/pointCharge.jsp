<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 충전</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
  <script>
  
  const IMP = window.IMP; 
  IMP.init('imp45182196'); 
    function requestPay1() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "kakao",
          pay_method: "card",
          merchant_uid: 'merchant_' + new Date().getTime(),
          name: "포인트 충전",
          amount: 1000,
          buyer_email: "gildong@gmail.com",
          buyer_name: "홍길동",
         
      }, function (rsp) { // callback
          if (rsp.success) {
        	  var msg = '결제가 완료되었습니다.';
        	  updatePoint1.submit();
        	  
          } else {
        	  var msg = '결제에 실패하였습니다.';
        	  
          }
      
      alert(msg);
      
      });
    }
    
    
      function requestPay2() {
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "kakao",
            pay_method: "card",
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: "포인트 충전",
            amount: 5000,
            buyer_email: "gildong@gmail.com",
            buyer_name: "홍길동",
           
        }, function (rsp) { // callback
            if (rsp.success) {
          	  var msg = '결제가 완료되었습니다.';
          	  updatePoint2.submit();
          	  
            } else {
          	  var msg = '결제에 실패하였습니다.';
          	  
            }
        
        alert(msg);
        
        });
      }
      
     
        function requestPay3() {
          // IMP.request_pay(param, callback) 결제창 호출
          IMP.request_pay({ // param
              pg: "kakao",
              pay_method: "card",
              merchant_uid: 'merchant_' + new Date().getTime(),
              name: "포인트 충전",
              amount: 10000,
              buyer_email: "gildong@gmail.com",
              buyer_name: "홍길동",
             
          }, function (rsp) { // callback
              if (rsp.success) {
            	  var msg = '결제가 완료되었습니다.';
            	  updatePoint3.submit();
            	  
              } else {
            	  var msg = '결제에 실패하였습니다.';
            	  
              }
          
          alert(msg);
          
          });
        }
  </script>
 
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<div class="container" style="margin-top: 100px;">
<h2>포인트 충전</h2>

<img alt="" src="/resources/nft/pudgy.gif" width="300" height="300">
<img alt="" src="/resources/nft/point.png" width="300" height="300">


<div class="btn-group" >
<form action="/member/pointCharge1" method="post" name="updatePoint1">
<input type="hidden" name="m_id"  value="${sessionScope.loginId}"> 
<input type="hidden" name="m_point" value="1000">
<button class="btn btn-outline-danger" type="button" onclick="requestPay1()"> 1000p 충전</button>
</form>

<form action="/member/pointCharge2" method="post" name="updatePoint2">
<input type="hidden" name="m_id"  value="${sessionScope.loginId}"> 
<input type="hidden" name="m_point" value="5000">
<button class="btn btn-outline-danger" type="button" onclick="requestPay2()">5000p 충전</button>
</form>

<form action="/member/pointCharge3" method="post" name="updatePoint3">
<input type="hidden" name="m_id"  value="${sessionScope.loginId}"> 
<input type="hidden" name="m_point" value="10000">
<button class="btn btn-outline-danger" type="button" onclick="requestPay3()">10000p 충전</button>
</form>

</div>
</div>







</body>
</html>