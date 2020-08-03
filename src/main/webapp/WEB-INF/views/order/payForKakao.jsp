<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<sec:authentication var="principal" property="principal" />
	<script>
	
	var name = "${userInfo.nickname}";
	var phone = ${userInfo.phoneNumber};
	var totalPrice = ${totalPrice};
	var merchandiseName = "${merchandiseName}";
	var merchandises = ${merchandises};
	var msg;
	
	  $(function(){
			var IMP = window.IMP; // 생략가능
			IMP.init("imp41338638"); // 발급받은 "가맹점 식별코드"를 사용
			

				IMP.request_pay({
				pg : 'kakaopay',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : merchandiseName + " 외 " + merchandises + "건",
				amount : totalPrice,
				buyer_name : name,
				buyer_tel : phone,
			}, function(rsp) {
				if (rsp.success) {
					//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					jQuery.ajax({
						url : "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
						type : 'POST',
						dataType : 'json',
						data : {
							imp_uid : rsp.imp_uid
						//기타 필요한 데이터가 있으면 추가 전달
						}
					}).done(function(data) {
						//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
						if (everythings_fine) {
							msg = '결제가 완료되었습니다.';
							msg += '\n고유ID : ' + rsp.imp_uid;
							msg += '\n상점 거래ID : ' + rsp.merchant_uid;
							msg += '\결제 금액 : ' + rsp.paid_amount;
							msg += '카드 승인번호 : ' + rsp.apply_num;

							alert(msg);
						} else {
							// else 처리
						}
					});
					// 성공시 진행할 것 
					orderComplete();
										

				} else {
					msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					//실패시 이동할 페이지
					location.href = "/merchandise/cart";
					alert(msg);
				 }
	        });
	        
	    });
	  
	  function orderComplete() {
			// 1. 오더 테이블 등록
			// 2. 오더 상세 테이블 등록
			// 3. 결제 완료 페이지로 이동
			addNewOrder();
	  }
	  
	  function addNewOrder() {

		  var Data = {
					
					name: name,
					phone: phone,
					totalPrice: totalPrice,
					method: "카카오 페이",
					state : "결제완료"
						
				};
				
				
				return $.ajax({
					url: "/order/addNewOrder",
					type: "POST",
					data: JSON.stringify(Data),
					contentType: "application/json",
					success : function(){console.log("주문 등록 성공")},
					error : function(){
						msg = '결제에 실패하였습니다.';
						//실패시 이동할 페이지
						location.href = "/merchandise/cart";
						alert(msg);
						}
					
				});
	  }
	</script>

</body>
</html>