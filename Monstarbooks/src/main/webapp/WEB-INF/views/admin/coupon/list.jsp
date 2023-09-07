<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
.container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px;
}

.couponregister {
	margin-left: auto;
}
/* "쿠폰 등록하기" 버튼 스타일 */
.btn {
    background-color: #00007B; /* 배경색 */
    color: #fff; /* 글자색 */
    border: none;
    border-radius: 5px; /* 둥근 테두리 */
    padding: 10px 20px; /* 내용과 버튼 주변 간격 조절 */
    cursor: pointer;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
}

.btn:hover {
    background-color: #00004B; /* 마우스 호버 시 배경색 변경 */
}
</style>
</head>
<body>
	<script>
		document.title = "몬스타북스:쿠폰관리 리스트";
	</script>

	<h1>
		<a href="/books/admin/coupon/list">쿠폰 관리</a>
	</h1>

	<div class="container">
		<!-- 검색 폼 -->
		<form action="/books/admin/coupon/list" method="post">
			<div>
				<label for="searchType">검색 유형:</label> <select name="searchType"
					id="searchType">
					<option value="" disabled selected>검색 유형을 선택하세요</option>
					<option value="cpname">쿠폰이름</option>
					<option value="cpdescription">쿠폰설명</option>
				</select>
			</div>
			<div>
				<label for="sk">검색:</label> <input type="text" name="sk" value=""
					placeholder="검색어 입력" class="search" />
			</div>

			<div>
				<input type="submit" value="검색" />
			</div>
		</form>
	

	<div class="couponregister">
		<button class="btn"
			onclick="location.href='/books/admin/coupon/register';">
			쿠폰 등록하기</button>
	</div>
	</div>


	<!--쿠폰 목록 테이블 컨테이너-->
	<div class="coupon-table-container">
		<table>
			<tr>
				<th>쿠폰번호</th>
				<th>쿠폰이름</th>
				<th>쿠폰설명</th>
				<th>쿠폰금액</th>
				<th>발행날짜</th>
				<th>유효기간</th>
				<th>상태</th>
			</tr>
			<c:forEach items="${getCouponList}" var="coupon">
				<tr>
					<td>${coupon.cpno}</td>
					<td>${coupon.cpname}</td>
					<td>${coupon.cpdescription}</td>
					<td>${coupon.cpprice}</td>
					<td><fmt:formatDate value="${coupon.cpcreated}"
							pattern="yyyy.MM.dd" /></td>
					<td><fmt:formatDate value="${coupon.cpvalid}"
							pattern="yyyy.MM.dd" /></td>
					<td>
						<form id="statusForm${coupon.cpno}" method="post">
							<input type="hidden" name="cpno" value="${coupon.cpno}">
							<select name="newStatus" style="float: left;">
								<option value="TRUE"
									${coupon.cpstatus == 'TRUE' ? 'selected' : ''}>사용가능 쿠폰</option>
								<option value="FALSE"
									${coupon.cpstatus == 'FALSE' ? 'selected' : ''}>사용불가
									쿠폰</option>
							</select>
							<button type="button" style="float: left"
								onclick="updateCouponStatus(${coupon.cpno})">상태 변경</button>
						</form>
					</td>

				</tr>
			</c:forEach>

		</table>
	</div>

	<div>
		<!-- 이전 페이지 링크 -->
		<c:if test="${searchVo.page > 1}">
			<a
				href="<c:url value='/admin/order/list'><c:param name='page' value='${searchVo.page - 1}'/></c:url>">
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
						href="<c:url value='/admin/order/list'><c:param name='page' value='${i}'/></c:url>"
						style="text-decoration: none;">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 다음 페이지 링크 -->
		<c:if test="${searchVo.page < searchVo.totPage}">
			<a
				href="<c:url value='/admin/order/list'><c:param name='page' value='${searchVo.page + 1}'/></c:url>">
				<i class="pagelist"></i> <i class="fa-solid fa-circle-chevron-right"></i>
			</a>
		</c:if>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
    function updateCouponStatus(cpno) {
        var form = $("#statusForm" + cpno);
        var formData = form.serialize();

        $.ajax({
            url: "/books/admin/coupon/updatecouponStatus",
            type: "POST",
            data: formData,
            success: function(data) {
                // 서버로부터의 응답을 처리
                // 여기에서는 아무 것도 하지 않음
            },
            error: function() {
                alert("상태 변경에 실패했습니다.");
            },
            complete: function() {
                // AJAX 요청이 완료되면 페이지 다시 로드 (또는 필요한 업데이트 수행)
                location.reload();
            }
        });
    }
</script>


</body>
</html>