<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
   <style>
      table {
         width: 90%;
         height: auto;
         border-collapse: collapse;
            margin: 0 auto; /* 수평 가운데 정렬 */
   }

      th {
         padding: "4";
         border: 1px solid #ddd;
         text-align: center;
      }

      /* 이미지 크기 조절 */
      .product-image {
         width: 70px; /* 원하는 최대 너비로 조절 */
         height: 100px;
      }
      
      /* 가운데 정렬을 위한 스타일 */
      .center-align {
         text-align: center;
      }
   </style>
</head>
<body>
  <table>
      <tr>
         <th>주문 일자</th>
         <th>상품정보</th>
         <th>수량</th>
         <th>가격</th>
         <th>총 가격</th>
         <th>배송 상태</th>
      </tr>
	   
      <!-- 주문 목록 데이터를 반복해서 출력 -->
      <c:set var="prevOrderNo" value="" />
      <c:forEach var="order" items="${orderList}">
         <c:set var="currentOrderNo" value="${order.orderNO}" />
         <c:if test="${currentOrderNo ne prevOrderNo}">
            <tr>
               <td>
               ${order.orderDate}
               <a href="myprofile_order/detail?orderNo=${order.orderNo}">상세보기</a>
               </td>
            </tr>
            <c:set var="prevOrderNo" value="${currentOrderNo}" />
         </c:if>
         <tr>
            <td></td>
            <td>
               <img class="product-image"
                 src="${pageContext.request.contextPath}/resources/assets/imgs/adorder/${order.productImage}"
                 alt="상품 이미지" align="left"> 
               ${order.productName}
            </td>
            <td>${order.productCount}</td>
            <td>${order.productPrice}</td>
            <td>${order.totalAmount}</td>
            <td>${order.orderStatus}</td>
         </tr>
      </c:forEach>
   </table>
</body>
</html>