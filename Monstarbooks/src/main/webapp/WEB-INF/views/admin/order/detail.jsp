<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문 상세 정보</title>
      <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        h1 {
            margin-bottom: 20px;
        }
        .order-info {
            text-align: center;
            border: 1px solid #ccc;
            padding: 20px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <h1>주문 상세내역</h1>
    
    <div class="order-info">
        <h2>주문 정보</h2>
        <p><strong>주문 번호:</strong> ${orderDetail.orderNo}</p>
        <p><strong>주문자:</strong> ${orderDetail.memberName} (${orderDetail.memberId})</p>
        <p><strong>주문날짜:</strong> ${orderDetail.orderDate}</p>
    </div>
    <p><strong>상품명:</strong> ${orderDetail.productName}</p>
    <p><strong>수량:</strong> ${orderDetail.productCount}</p>
    <p><strong>금액:</strong> ${orderDetail.totalAmount}</p>
    <p><strong>주문 상태:</strong> ${orderDetail.orderStatus}</p>
    <!-- 기타 다른 주문 상세 정보 필드 추가 -->
    <a href="/adorder/adorderList">주문 목록으로 돌아가기</a>
</body>
</html>