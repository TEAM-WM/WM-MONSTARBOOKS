<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>샘플페이지</title>
<style>
    .event-table-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: flex-start;
    }
    .event-row {
        width: calc(25% - 20px);
        padding: 20px;
        text-align: center;
        box-sizing: border-box;
        border: 1px solid #ddd;
        border: none;
        margin-bottom: 20px; 
    }
    .event-table img {
        max-width: 100%;
    }
</style>
<script>
    function checkLogin() {
        // 세션에서 로그인 여부 확인
        var loggedIn = <%= session.getAttribute("memberNumber") != null %>;
        
        if (!loggedIn) {
            // 로그인이 필요한 경우 경고 메시지 표시
            alert("로그인이 필요합니다.");
        } else {
            // 로그인한 경우 쿠폰 받기 페이지로 이동
            window.location.href = "coupon-list";
        }
    }
</script>
</head>
<body>
<form action="event" method="post">
    <div style="display: inline-block;">
        <select name="searchType" id="searchType">
            <option value="etitle" ${etitle ? 'selected' : ''}>제목</option>
            <option value="econtent" ${econtent ? 'selected' : ''}>내용</option>
        </select>
    </div>
    <div style="display: inline-block;">
        <input type="text" name="sk" value="${resk}" style="width: 150px;" maxlength="50"/>
    </div>
    <div style="display: inline-block;">
        <input type="submit" value="검색"/>
    </div>
</form>
<a href="javascript:void(0);" onclick="checkLogin();">쿠폰받기</a>
<div class="event-table-container">
    <c:forEach items="${event }" var="event" varStatus="status">
        <c:if test="${event.deleted ne 'yes'}">
            <div class="event-row">
                <a href="eventdetail?eventno=${event.eventno }"><img width="200" height="200" alt="11" src="/books/resources/assets/imgs/coupon/${event.efilesrc }"></a><br/>
                <a href="eventdetail?eventno=${event.eventno }">${event.etitle }</a><br/>
                ${list.eregdate }
            </div>
        </c:if>
    </c:forEach>
</div>
<div style="display: inline-block; margin-top: 10px;">
    <c:if test="${searchVO.page > 1 }">
        <a href="list?page=1" style="text-decoration: none;">처음</a>
        <a href="list?page=${searchVO.page - 1 }" style="text-decoration: none;">이전</a>
    </c:if>
    <c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
        <c:choose>
            <c:when test="${i eq searchVO.page }">
                <span style="color: red; font-weight: bold;">${i }</span>
            </c:when>
            <c:otherwise>
                <a href="list?page=${i }" style="text-decoration: none;">${i }</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${searchVO.page < searchVO.totPage }">
        <a href="list?page=${searchVO.page + 1 }" style="text-decoration: none;">다음</a>
        <a href="list?page=${searchVO.totPage }" style="text-decoration: none;">마지막</a>
    </c:if>
</div>
<script>
	document.title = "몬스타북스 :: 샘플페이지"; 
</script>
</body>
</html>