<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문 상세 정보</title>
    <style>
        /* 페이지 제목 스타일 */
        h2 {
            margin: 20px 0;
            color: #333;
            text-align: center;
        }

        /* 테이블 헤더 스타일 */
        th {
            background-color: #f5f5f5;
            padding: 10px;
            text-align: left;
            font-weight: bold;
            border-bottom: 2px solid #ddd;
        }

        /* 이미지 스타일 */
        img.product-image {
            max-width: 100%;
            max-height: 300px;
            width: auto;
            height: auto;
        }

        /* 상품명 스타일 */
        .product-name {
            font-size: 18px;
            font-weight: bold;
            margin-top: 10px;
        }

        /* 가운데 정렬 스타일 */
        .center-align {
            text-align: center;
        }

        /* 정보 테이블 스타일 */
        .info-table {
            margin: 0 auto;
            text-align: left;
        }

        /* 상품 정보 테이블 스타일 */
        .product-info-table {
            margin: 0 auto;
        }

        /* 주문 및 결제 정보 컨테이너 스타일 */
        .info-container {
            display: flex;
            justify-content: space-between;
            margin: 20px auto;
        }

    </style>
</head>
<body>
    <script>
        document.title = "몬스타북스:주문상세";
    </script>
    <h2>주문 상세내역</h2>
    
    <div class="center-align">
        <div class="info-container">
            <table class="product-info-table">
                <thead>
                    <tr>
                        <th colspan="2"><strong>상품 정보</strong></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${productDetail}" var="product">
                        <tr>
                            <td>
                                <img src="${pageContext.request.contextPath}/resources/assets/imgs/adorder/${product.productImage}"
                                    alt="상품 이미지" height="300px" style="width: auto; max-width: 100%;">
                            </td>
                            <td>
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
                                <th>주문 날짜</th>
                                <td>${orderDetail[0].orderDate}</td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td>${orderDetail[0].dtel}</td>
                            </tr>
                            <tr>
                                <th>수령인</th>
                                <td>${orderDetail[0].dname}</td>
                            </tr>
                            <tr>
                                <th>주소지</th>
                                <td>${orderDetail[0].daddress2}</td>
                            </tr>
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
        </div>
    </div>
</body>
</html>
