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
    
    <c:choose>
        <c:when test="${not empty orderDetail}">
            <div>
                <strong>주문 정보</strong>
                <p>주문 번호: ${orderDetail[0].orderNo}</p>
                <p>주문 날짜: ${orderDetail[0].orderDate}</p>
                <p>수령인: ${orderDetail[0].dname}</p>
                <p>주소지: ${orderDetail[0].daddress2}</p>
            </div>
        </c:when>
        <c:otherwise>
            <p>주문 상세 정보를 가져오지 못했습니다.</p>
        </c:otherwise>
    </c:choose>

    <c:forEach items="${orderDetail}" var="order">
        <p>
            상품명: ${order.productName}
            <c:if test="${order.bookCount > 1}">
                ${order.productCount}권
            </c:if>
        </p>
    </c:forEach>
    
    <c:choose>
        <c:when test="${not empty paymentDetail}">
            <div>
                <strong>결제 정보</strong>
                <p>총 상품 가격: ${paymentDetail[0].totalAmount}￦</p>
                <p>할인 쿠폰: ${paymentDetail[0].couponName}</p>
                <p>총 결제 금액: ${paymentDetail[0].finalpay}￦</p>
                <p>결제 방법: ${paymentDetail[0].paymentMethod}</p>
            </div>
        </c:when>
    </c:choose>
    
    <table border="1" width="80%" align="center" cellspacing="0" cellpadding="5">
        <thead>
            <tr>
                <th colspan="4"><strong>상품 정보</strong></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${productDetail}" var="product">
                <tr>
                    <td rowspan="2">
                        <img src="${pageContext.request.contextPath}/resources/assets/imgs/adorder/${product.productImage}"
                             alt="상품 이미지" width="100px" height="150px">
                    </td>
                    
                    <td>상품명: ${product.productName}</td>
                    <td>가격: ${product.productPrice}<br>수량: ${product.productCount}</td>
                </tr>
                <tr>
                       <td> 카테고리: ${product.category1} / ${product.category2} </td>
                       <td> 배송상황: ${product.orderStatus}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
