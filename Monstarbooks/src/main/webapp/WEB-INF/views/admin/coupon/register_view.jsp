<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 등록</title>
<style>
.couponEntry {
	margin: 2em auto;
	padding: 2em;
	border-top: solid 5px #00004B;;
	border-bottom: solid 5px #00004B;;
	background-color: #F3F4F3;
}

/* 버튼 컨테이너에 대한 스타일 */
.button-container {
	display: flex; /* 버튼들을 가로로 나란히 배치하기 위해 Flexbox 사용 */
	justify-content: flex-end; /* 오른쪽 정렬 */
	margin-top: 10px; /* 버튼과 다른 콘텐츠 사이의 간격 조정 */
}

/* 버튼에 대한 스타일 */
.button-container button {
	margin-left: 10px; /* 버튼 사이의 간격 조정 */
}
</style>
</head>
<body>
	<script>
        document.title = "몬스타북스: 쿠폰 등록";
    </script>

	<h1>
		<a href="/books/admin/coupon/register_view">쿠폰 등록</a>
	</h1>

	<!-- 쿠폰 등록 폼 -->
	<form action="register" method="post"
		name="insertCoupon">
		<!-- 여러 개의 쿠폰을 등록할 수 있는 영역 -->
		<div id="couponEntries">
			<!-- 쿠폰 한 개의 입력 폼 -->
			<div class="couponEntry">
				<label for="cpname">쿠폰이름</label>
				<input type="text" name="cpname" placeholder="쿠폰이름을 입력하시오." id="cpname">
				<label for="cpdescription">쿠폰설명</label>
				<textarea cols="40" rows="5" name="cpdescription" placeholder="쿠폰설명 입력." id="cpdescription"></textarea>
				<label for="cpprice">쿠폰금액</label>
				<input type="number" name="cpprice" placeholder="쿠폰금액 입력."> 
				<label for="cpcreated">쿠폰 발행일</label> 
				<input type="Date" name="cpcreated" placeholder="쿠폰 발행일 입력."> 
				<label for="cpvalid">쿠폰 유효기간</label> 
				<input type="Date" name="cpvalid" placeholder="쿠폰 유효기간 입력.">
				<label for="cpstatus">쿠폰 유효성</label> 
				<select name="cpstatus" id="cpstatus">
					<option value="" disabled selected>유효성을 선택하세요</option>
					<option value="TRUE">사용가능</option>
					<option value="FALSE">사용불가</option>
				</select>
			</div>
		</div>

		<!-- 새로운 쿠폰 입력 폼을 추가하는 버튼 -->
		<!-- <div class="button-container">
			<button type="button" onclick="addCouponEntry()">새로운 쿠폰 추가</button>
		</div>
 -->
		<!-- 모든 쿠폰을 한 번에 제출하는 버튼 -->
		<div class="button-container">
			<button type="submit" onclick="submitCouponForm()">쿠폰 등록 하기
			</button>
		</div>
	</form>

	<script>
        // 새로운 쿠폰 입력 폼을 추가하는 함수
        function addCouponEntry() {
            var couponEntries = document.getElementById('couponEntries');
            var newCouponEntry = document.createElement('div');
            newCouponEntry.className = 'couponEntry';
            newCouponEntry.innerHTML = `
            	<label for="cpname">쿠폰이름</label>
				<input type="text" name="cpname" placeholder="쿠폰이름을 입력하시오." id="cpname">
				<label for="cpdescription">쿠폰설명</label>
				<textarea cols="40" rows="5" name="cpdescription" placeholder="쿠폰설명 입력." id="cpdescription"></textarea>
				<label for="cpprice">쿠폰금액</label>
				<input type="number" name="cpprice" placeholder="쿠폰금액 입력."> 
				<label for="cpcreated">쿠폰 발행일</label> 
				<input type="Date" name="cpcreated" placeholder="쿠폰 발행일 입력."> 
				<label for="cpvalid">쿠폰 유효기간</label> 
				<input type="Date" name="cpvalid" placeholder="쿠폰 유효기간 입력.">
				<label for="cpstatus">쿠폰 유효성</label> 
				<select name="cpstatus" id="cpstatus">
					<option value="" disabled selected>유효성을 선택하세요</option>
					<option value="TRUE">사용가능</option>
					<option value="FALSE">사용불가</option>
				</select>
			`;
            couponEntries.appendChild(newCouponEntry);
        }
    </script>
</body>
</html>
