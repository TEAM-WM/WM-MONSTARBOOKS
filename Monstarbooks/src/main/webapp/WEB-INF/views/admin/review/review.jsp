<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function showDeleteConfirmation(reviewNo) {
    if (confirm("정말로 이 리뷰를 삭제하시겠습니까?")) {
        deleteReview(reviewNo);
    }
}

function deleteReview(reviewNo) {
    var deleteURL = "${pageContext.request.contextPath}/admin/review/delete?reviewno=" + reviewNo;

    // Ajax 요청 생성
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                // Ajax 요청이 성공하면 리뷰 목록을 업데이트
                updateReviewList();
            } else {
                alert("리뷰 삭제 중 오류가 발생했습니다.");
            }
        }
    };
    xhr.open("GET", deleteURL, true);
    xhr.send();
}

function updateReviewList() {

    window.location.reload();
}
</script>
</head>
<body>
<h1>리뷰목록</h1>
<form action="review" method="post">
    <div>
        <select name="searchType" id="searchType">
            <option value="btitle" ${qtitle ? 'selected' : ''}>도서명</option>
            <option value="mname" ${mname ? 'selected' : ''}>작성자</option>
        </select>
        <input type="text" name="sk" value="${resk }" style="width: 150px;" maxlength="50"/>
        <input type="submit" value="검색"/>
    </div>
</form>
	<table border="1">
		<tr>
			<td>이미지</td>
			<td>도서명</td>
			<td>작성자</td>
			<td>내용</td>
			<td>작성날짜</td>
			<td>별점</td>
			<td></td>
		</tr>
		<tr>

			<c:forEach items="${review}" var="review">
				<c:if test="${review.deleted ne 'yes'}">
					<tr>
						<td><img alt="aa" src="${pageContext.request.contextPath}/resources/assets/imgs/review/${review.refnlesrc }"></td>
						<td>${review.book.btitle }</td>
						<td>${review.member.mname }</td>
						<td>${review.rcontent }</td>
						<td>${review.redate }</td>
						<td>
							<c:choose>
								<c:when test="${review.rstar == 1}">★</c:when>
								<c:when test="${review.rstar == 2}">★★</c:when>
								<c:when test="${review.rstar == 3}">★★★</c:when>
								<c:when test="${review.rstar == 4}">★★★★</c:when>
								<c:when test="${review.rstar == 5}">★★★★★</c:when>
							</c:choose>
						</td>
						<td>
							<a href="#" onclick="showDeleteConfirmation(${review.reviewno })">삭제</a>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</tr>
	</table>
	<hr />
	<c:if test="${searchVO.page>1 }">
		<a href="review?page=1" style="text-decoration: none;">처음</a>
		<a href="review?page=${searchVO.page-1 }"
			style="text-decoration: none;">이전</a>
	</c:if>
	<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }"
		var="i">
		<c:choose>
			<c:when test="${i eq searchVO.page }">
				<span style="color: red; font-weight: bold;">${i }</span>
			</c:when>
			<c:otherwise>
				<a href="review?page=${i }" style="text-decoration: none;">${i }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${searchVO.page < searchVO.totPage }">
		<a href="review?page=${searchVO.page+1 }"
			style="text-decoration: none;">다음</a>
		<a href="review?page=${searchVO.totPage }"
			style="text-decoration: none;">마지막</a>
	</c:if>
</body>
</html>