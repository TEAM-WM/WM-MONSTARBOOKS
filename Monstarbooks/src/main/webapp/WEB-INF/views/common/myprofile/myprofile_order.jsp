<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지 주문/배송 목록</title>
<style>
table {
    border: 1px solid #ddd; /* 테이블 외곽선 추가 */
    width: 100%; /* 테이블 100% 너비로 설정 */
    border-collapse: collapse;
    margin: 0 auto; /* 수평 가운데 정렬 */
}

th {
    padding: 4px;
    border: 1px solid #ddd;
    text-align: center;
}

/* 책 이미지 크기 조절 */
.product-image {
    width: 70px;
    height: 100px;
}

/* 가운데 정렬을 위한 스타일 */
.center-align {
    text-align: center;
    vertical-align: middle;
}

.center-align-td {
    text-align: center;
    vertical-align: middle;
}


/* 주문/배송 목록 테이블 스타일 */
.order-table {
    width: 100%; /* 테이블 70% 너비로 설정 */
    float: right;
}

.content {
	display:flex;
	justify-content:space-between;
    overflow: hidden; /* 사이드바와 테이블이 겹치지 않도록 처리 */
}

</style>
</head>
<script>
    document.title = "몬스타북스:마이페이지(주문/배송)"
</script>
<body>
    <h1>주문/배송 목록</h1>

    <div class="content">
        <!-- 왼쪽에 myprofile.jsp 내용 추가 -->
        <div id="myprofile-sidebar">
            <%@ include file="myprofile.jsp" %>
        </div>

        <!-- 주문/배송 목록 테이블 -->
        <table class="order-table">
            <tr>
                <th>주문일자</th>
                <th>상품정보</th>
                <th>수량</th>
                <th>가격</th>
                <th>총 가격</th>
                <th>배송 상태</th>
            </tr>

            <!-- 주문 목록 데이터를 반복해서 출력 -->
            <c:set var="prevOrderNo" value="" />
            <c:forEach var="order" items="${orderList}">
                <c:set var="currentOrderNo" value="${order.orderNo}" />
                <c:if test="${currentOrderNo ne prevOrderNo}">
                    <tr style="border-top: 2px solid black;">
                        <td class="center-align-td"><fmt:formatDate
                                value="${order.orderDate}" pattern="yyyy.MM.dd" /><br> <strong><a
                                href="myprofile_orderdetail?orderNo=${order.orderNo}">주문 상세보기</a>
                        </strong></td>
                    </tr>
                    <c:set var="prevOrderNo" value="${currentOrderNo}" />
                </c:if>

                <tr>
                    <td></td>
                    <td><img class="product-image"
                            src="${pageContext.request.contextPath}/resources/assets/imgs/adorder/${order.productImage}"
                            alt="상품 이미지" align="left"> ${order.productName}</td>
                    <td>${order.productCount}개</td>
                    <td>${order.productPrice}원</td>
                    <td>${order.totalAmount}원</td>
                    <td><strong>${order.orderStatus}</strong></td>

                    <c:choose>
                        <c:when test="${order.orderStatus eq '배송완료'}">
                            <br>
                            <tr>
                                <td colspan="6" style="text-align: right;"><strong>
                                        <a href="/write_review?bookNo=${order.bookNo}"> 책 리뷰 쓰러가기</a>
                                </strong></td>
                            </tr>
                        </c:when>
                    </c:choose>
                    <c:set var="prevOrderNo" value="${currentOrderNo}" />
                </tr>
            </c:forEach>
        </table>
    </div>

    <c:choose>
        <c:when test="${totRowcnt > 0}">
            <p>${totRowcnt}건의 주문 존재합니다.</p>
        </c:when>
        <c:otherwise>
            <p>주문이 없습니다.</p>
        </c:otherwise>
    </c:choose>

    <div>
        <!-- 이전 페이지 링크 -->
        <c:if test="${searchVo.page > 1}">
            <a
                href="<c:url value='/common/myprofile/myprofile_order'><c:param name='page' value='${searchVo.page - 1}'/></c:url>">
                <i class="pagelist"></i> <i class="fa-solid fa-circle-chevron-left"></i>
            </a>
        </c:if>

        <!-- 페이지 갯수 표시 -->
        <c:forEach begin="${searchVo.pageStart}" end="${searchVo.pageEnd}"
            var="i">
            <c:choose>
                <c:when test="${i eq searchVo.page}">
                    <span style="font-weight: bold;">${i}</span>
                </c:when>
                <c:otherwise>
                    <!-- 페이지 번호 링크 -->
                    <a
                        href="<c:url value='/common/myprofile/myprofile_order'><c:param name='page' value='${i}'/></c:url>"
                        style="text-decoration: none;">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <!-- 다음 페이지 링크 -->
        <c:if test="${searchVo.page < searchVo.totPage}">
            <a
                href="<c:url value='/common/myprofile/myprofile_order'><c:param name='page' value='${searchVo.page + 1}'/></c:url>">
                <i class="pagelist"></i> <i class="fa-solid fa-circle-chevron-right"></i>
            </a>
        </c:if>
    </div>
</body>
</html>
