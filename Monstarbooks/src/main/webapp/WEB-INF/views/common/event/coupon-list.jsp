<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 페이지</title>
<style>
.coupon-container {
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: center;
}

.coupon {
	text-align: center;
	margin-right: 20px;
}

.coupon img {
	max-width: 150px;
}
</style>
<script>
    function showCouponMessage(couponAmount) {       
            alert(couponAmount + "원 쿠폰을 발급받았습니다!");

    }
</script>
</head>
<body>
<h1>쿠폰 리스트</h1>
<form action="eventcoupondwon" method="post">
<c:forEach items="${couponlist}" var="coupon">
    <div class="coupon-container">
        <div class="coupon">
            <img src="/books/resources/assets/imgs/coupon/img_cuppon_discount.png" alt="쿠폰 ${coupon.cpno}" width="150"><br />
            <button type="submit" name="cpno" value="${coupon.cpno }" onclick="showCouponMessage(${coupon.caprice});">${coupon.cpname}</button>
            <input type="hidden" name="cpcreated" value="${coupon.cpcreated }">
            <input type="hidden" name="cpvalid" value="${coupon.cpvalid }">
        </div>
    </div>
</c:forEach>
</form>

</body>
</html>

