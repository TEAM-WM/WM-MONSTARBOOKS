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
    
    <table>
    <thead>
        <tr>
            <th colspan="2"><strong>상품 정보</strong></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${productDetail}" var="product">
            <tr>
                <td style="vertical-align: top;">
                    <img src="${pageContext.request.contextPath}/resources/assets/imgs/adorder/${product.productImage}"
                         alt="상품 이미지" height="300px" style="width: auto; max-width: 100%;">
                </td>
                <td style="vertical-align: top;">
                    <p>상품명: ${product.productName}</p>
                    <p>가격: ${product.productPrice}<br>수량: ${product.productCount}</p>
                    <p>카테고리: ${product.category1} / ${product.category2}</p>
                    <p>배송상황: ${product.orderStatus}</p>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
    
      <div class="center-align">
                <c:choose>
                    <c:when test="${not empty orderDetail}">
                        <table class="info-table">
                            <caption><strong>주문 정보</strong></caption>
                            <tr>
                                <th>주문 번호</th>
                                <td>${orderDetail[0].orderNo}</td>
                            </tr>
                            <tr>
                                <th>주문 날짜</th>
                                <td>${orderDetail[0].orderDate}</td>
                            </tr>
                            <tr>
                                <th>수령인</th>
                                <td>${orderDetail[0].dname}</td>
                            </tr>
                            <tr>
                                <th>주소지</th>
                                <td>${orderDetail[0].daddress2}</td>
                            </tr>
                            <tr>
                            	<th>연락처</th>
                            	<td>${orderDetail[0].dtel}</td>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <p>주문 상세 정보를 가져오지 못했습니다.</p>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div class="center-align">
                <c:choose>
                    <c:when test="${not empty paymentDetail}">
                        <table class="info-table">
                            <caption><strong>결제 정보</strong></caption>
                            <tr>
                                <th>총 상품 가격</th>
                                <td>${paymentDetail[0].totalAmount}￦</td>
                            </tr>
                            <tr>
                                <th>할인 쿠폰</th>
                                <td>${paymentDetail[0].couponName}</td>
                            </tr>
                            <tr>
                                <th>총 결제 금액</th>
                                <td>${paymentDetail[0].finalpay}￦</td>
                            </tr>
                            <tr>
                                <th>결제 방법</th>
                                <td>${paymentDetail[0].paymentMethod}</td>
                            </tr>
                        </table>
                    </c:when>
                </c:choose>
            </div>
</body>
</html>
