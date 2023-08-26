<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문 상세 정보</title>
</head>
<body>
    <script>
        document.title = "몬스타북스:주문상세";
    </script>
    <h2>주문 상세 정보</h2>

    <c:forEach items="${orderDetail}" var="order">
        <strong>주문 상품 정보</strong>
        <p>
            상품명: ${order.productName}
            <c:if test="${order.bookCount > 1}">
                외 ${order.productCount - 1}권
            </c:if>
        </p>
        <table width="80%" border="2">
            <tr>
                <th>이미지</th>
                <th>상품정보</th>
                <th>가격</th>
                <th>수량</th>
            </tr>
            <!-- 추가적인 상품 정보 출력 -->
        </table>
        
        <c:if test="${not empty order}">
            <div>
                <strong>주문 정보</strong>
                <p>주문 번호: ${order.orderNo}</p>
                <p>주문 날짜: ${order.orderDate}</p>
                <p>수령인: ${order.dname}</p>
                <p>주소지: ${order.daddress2}</p>
            </div>
        </c:if>
    </c:forEach>
        
    <c:if test="${empty orderDetail}">
        <p>주문 상세 정보를 가져오지 못했습니다.</p>
    </c:if>
    
    <c:forEach items="${paymentDetail}" var="payment">
        <div>
            <strong>결제 정보</strong>
            <p>총 상품 가격: ${payment.totalAmount}</p>
            <p>할인 쿠폰: ${payment.couponName}</p>
            <p>총 결제 금액: ${payment.finalpay}</p>
            <p>결제 방법: ${payment.paymentMethod}</p>
        </div>
    </c:forEach>
</body>
</html>


