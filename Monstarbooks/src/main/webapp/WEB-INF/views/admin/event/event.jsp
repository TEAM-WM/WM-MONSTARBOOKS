<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>
</head>
<body>
<h1>이벤트</h1>
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
<a href="eventwriteview">글쓰기</a>
</form>

<table border="1">
	<tr>
		<td>이벤트이미지</td>
		<td>이벤트번호</td>
		<td>제목</td>
		<td>내용</td>
		<td>작성날짜</td>
		<td>상세보기</td>
	</tr>
	<c:forEach items="${list}" var="list">
		<c:choose>
			<c:when test="${list.deleted eq 'yes'}">
				<!-- DELETED 값이 'yes'인 경우 아무 작업을 하지 않습니다. -->
			</c:when>
			<c:otherwise>
				<tr>
					<td><img alt="11" src="/books/resources/assets/imgs/coupon/${list.efilesrc }"></td>
					<td>${list.eventno }</td>
					<td>${list.etitle }</td>
					<td>${list.econtent}</td>
					<td>${list.eregdate }</td>
					<td><button>
							<a href="eventdetail?eventno=${list.eventno }">상세보기</a>
						</button></td>
				</tr>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</table>
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
</body>
</html>
