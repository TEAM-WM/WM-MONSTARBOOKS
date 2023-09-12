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
<a href="coupon-list">쿠폰받기</a>
<div class="event-table-container">
    <c:forEach items="${list}" var="item" varStatus="status">
        <c:if test="${item.deleted ne 'yes'}">
            <div class="event-row">
                <a href="eventdetail?eventno=${item.eventno }"><img alt="11" src="/books/resources/assets/imgs/coupon/event.jpeg"></a><br/>
                <a href="eventdetail?eventno=${item.eventno }">${item.etitle }</a><br/>
                ${item.eregdate }
            </div>
        </c:if>
    </c:forEach>
</div>
<script>
	document.title = "몬스타북스 :: 샘플페이지"; 
</script>
</body>
</html>