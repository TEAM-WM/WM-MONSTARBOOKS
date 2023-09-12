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
<a href="javascript:void(0);" onclick="checkLogin();">쿠폰받기</a>
<div class="event-table-container">
    <c:forEach items="${list }" var="list" varStatus="status">
        <c:if test="${list.deleted ne 'yes'}">
            <div class="event-row">
                <a href="eventdetail?eventno=${list.eventno }"><img alt="11" src="/books/resources/assets/imgs/coupon/event.jpeg"></a><br/>
                <a href="eventdetail?eventno=${list.eventno }">${list.etitle }</a><br/>
                ${list.eregdate }
            </div>
        </c:if>
    </c:forEach>
</div>
<script>
	document.title = "몬스타북스 :: 샘플페이지"; 
</script>
</body>
</html>