<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<br>
	<div class="coupon-container">
		<div class="coupon">
			<img
				src="/books/resources/assets/imgs/coupon/img_cuppon_discount.png"
				alt="쿠폰 1" width="150"><br /> <a href="eventcoupondwon1"
				onclick="showCouponMessage(10000);">10000원 쿠폰</a>
		</div>

		<div class="coupon">
			<img
				src="/books/resources/assets/imgs/coupon/img_cuppon_discount.png"
				alt="쿠폰 2" width="150"><br /> <a href="eventcoupondwon2"
				onclick="showCouponMessage(5000);">5000원 쿠폰</a>
		</div>

		<div class="coupon">
			<img
				src="/books/resources/assets/imgs/coupon/img_cuppon_discount.png"
				alt="쿠폰 3" width="150"><br /> <a href="eventcoupondwon3"
				onclick="showCouponMessage(2000);">2000원 쿠폰</a>
		</div>
	</div>
</body>
</html>

