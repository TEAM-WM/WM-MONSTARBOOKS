<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문관리자(주문 목록)</title>
<script>
document.title = "몬스타북스:주문관리자"; 

// DOM이 로드된 후에 이벤트 리스너를 연결하는 함수
function attachSubmitEventListener() {
    document.getElementById("searchForm").addEventListener("submit", function(event) {
        // 검색 결과가 없을 경우 경고창 띄우기
        if (${totRowcnt} === 0) {
            event.preventDefault(); // 폼 제출 막기
            alert("검색 결과가 없습니다.");
        }
    }));
}
</script>
</head>
<body onload="attachSubmitEventListener()">

<h1>주문목록</h1>

<div>
    <form action="adorder/adorderList" method="post" id="searchForm">
        <input type="checkbox" name="searchType" value="btitle" />도서명&nbsp;
        <input type="checkbox" name="searchType" value="memberno" />주문자
        <input type="text" name="sk" value="" placeholder="검색창" class="search" />
        <input type="submit" value="검색" />
    </form>
</div>

<table border="1">
    <tr>
        <th>주문 번호</th>
        <th>주문자</th>
       <!-- <th>주문날짜</th> -->
        <th>상품명</th>
        <th>수량</th>
        <th>금액</th>
        <th>주문 상태</th>
    </tr>
    <c:forEach items="${getOrderList}" var="order">
        <tr>
            <td>${order.orderNo}</td>
            <td>${order.memberName}&nbsp;(${order.memberId})</td>
            <%-- <td>${order.orderdate}</td> --%>
            <td>${order.productName}</td>
            <td>${order.productCount}</td>
            <td>${order.totalAmount}</td>
            <td>${order.orderStatus}</td>
        </tr>
    </c:forEach>
</table>

<div>
    <c:choose>
        <c:when test="${totRowcnt > 0}">
            <p>전체 ${totRowcnt}개의 주문이 검색되었습니다.</p>
        </c:when>
        <c:otherwise>
            <p>주문이 없습니다.</p>
        </c:otherwise>
    </c:choose>
</div>

 <div>
    <!-- 페이징 -->
    <c:if test="${searchVo.totPage > 0}">
        <a href="adorder/adorderList?page=1"><i class="pagelist"></i></a>
        <c:if test="${searchVo.page > 1}">
            <a href="adorder/adorderList?page=${searchVo.page - 1}"><i class="pagelist"></i></a>
        </c:if>
        <c:forEach begin="${searchVo.pageStart}" end="${searchVo.pageEnd}" var="i">
            <c:choose>
                <c:when test="${i eq searchVo.page}">
                    <span style="color:blue; font-weight:bold;">${i}</span>
                </c:when>
                <c:otherwise>
                    <a href="adorder/adorderList?page=${i}" style="text-decoration:none;">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${searchVo.page < searchVo.totPage}">
            <a href="adorder/adorderList?page=${searchVo.page + 1}"><i class="pagelist"></i></a>
        </c:if>
        <a href="adorder/adorderList?page=${searchVo.totPage}"><i class="pagelist"></i></a>
        
        <!-- 추가된 부분 -->
        <c:url var="prevUrl" value="${pageContext.request.requestURI}">
            <c:param name="page" value="${searchVo.page - 1}" />
        </c:url>
        <c:url var="nextUrl" value="${pageContext.request.requestURI}">
            <c:param name="page" value="${searchVo.page + 1}" />
        </c:url>
                
        <c:if test="${searchVo.page > 1}">
            <a href="${prevUrl}">이전 페이지</a>
        </c:if>
                
        <c:if test="${searchVo.page < searchVo.totPage}">
            <a href="${nextUrl}">다음 페이지</a>
        </c:if>
    </c:if>
</div>

</body>
</html>

