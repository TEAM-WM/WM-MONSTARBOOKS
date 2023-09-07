<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<style>
div {
width:550px;
}
form {
width: 550px;
align: center;
padding: 0 0 0 10px;
}
table {
width: 550px;
align: center;
margin-left: auto;
margin-right: auto;
height: 400px;

}

tr, td {
	padding: 10px 5px 10px 5px;
}

.upde {
	margin-left: auto;
	margin-right: auto;
	display: block;
	width: 50%;
	height: 50px;
	text-align: center;
	vertical-align: middle;
	padding-top: 15px;
	border-radius: 5px;
	border: 1px solid #d9d9d9;
	color: #767676;
	background-color: var(- -color-white);
	font-weight: var(- -weight-bold);
	color: var(- -color-main);			
}
.relist {
	margin-left: auto;
	margin-right: auto;
	display: block;
	height: 50px;
	text-align: center;
	vertical-align: middle;
	padding-top: 15px;
	border-radius: 5px;
	border: 1px solid #d9d9d9;
	color: #767676;
	background-color: var(--color-main);
    font-weight: var(--weight-bold);
    color: var(--color-white);
    max-width: 50%
}
</style>
</head>

<body>
	<br />
	<br />
	<h3>Review Detail</h3>
	<br />
	
	
    <div class="content">
        <!-- 왼쪽에 myprofile.jsp 내용 추가 -->
        <div id="myprofile-sidebar">
            <%@ include file="../myprofile/myprofile.jsp" %>
        </div>

        <!-- 주문/배송 목록 테이블 -->
        <table class="order-table">
            <tr>
                <th>주문일자</th>
                <th>상품정보</th>
                <th>수량</th>
                <th>가격</th>
                <th>총 가격</th>
                <th>배송 상태</th>
            </tr>
		</table>

	<table>
		<tr>
			<td colspan="3">
			<input type="hidden" name="reviewno" value="${myreview_view.reviewno }" />
			<input type="hidden" name="memberno" value="${myreview_view.memberno }" /></td>
		</tr>

		<tr>
			<td colspan="3" style="border-bottom: 1px solid; border-color: darkgray; font-weight: bold;"
				class="left">[${myreview_view.bookcategory.bcategory1 }│${myreview_view.bookcategory.bcategory2 }]
			<%-- 	&nbsp;&nbsp; <input type="text" name="btitle" value="${myreview_view.book.btitle }"> <br /> --%>
				&nbsp;&nbsp; ${myreview_view.book.btitle } <br />
			<br />
			</td>
		</tr>

		<tr>

			<td class="left" colspan="2" style="border-spacing: 10px; width: 65px;">별점&nbsp;&nbsp;</td>
			<td class="left" style="color:#ffe100; font-weight: bold; font-size: 20px;" >
			<c:choose>
				<c:when test="${myreview_view.rstar == 1}">
                &nbsp;★
              </c:when>
					<c:when test="${myreview_view.rstar == 2}">
                &nbsp;★★
              </c:when>
					<c:when test="${myreview_view.rstar == 3}">
                &nbsp;★★★
              </c:when>
					<c:when test="${myreview_view.rstar == 4}">
                &nbsp;★★★★
              </c:when>
					<c:when test="${myreview_view.rstar == 5}">
                &nbsp;★★★★★
              </c:when>
				</c:choose></td>

		</tr>

		<tr>
			<td class="left" colspan="2" style="border-spacing: 10px; width: 65px; ">후기&nbsp;&nbsp;&nbsp;</td>
			<td class="left"  height="350" >${myreview_view.rcontent }</td>
		</tr>
		<tr>
			<td class="left" colspan="3" style="width: 65px; ">첨부&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
			<td colspan="3">
			<c:if test="${myreview_view.refilesrc ne null }">
					<img border="1" width="50" height="50"
						src="${pageContext.request.contextPath}/resources/assets/upload/${myreview_view.refilesrc }"
						alt="" />
				</c:if>
				</td>
		</tr>
		<tr>
		
		</tr>
		<tr>
		<td class="left" >&nbsp;&nbsp;</td>
		<td class="center" colspan="2">
			<a class="upde" href="update?reviewno=${myreview_view.reviewno }">수정</a>&nbsp;&nbsp;
			<a class="upde" href="reviewdelete?reviewno=${myreview_view.reviewno }">삭제</a></td>

		</tr>
		<tr>
				<td class="left" >&nbsp;&nbsp;</td>
			<td colspan="2"><a href="list" class="relist">list</a></td>
		</tr>

	</table>





</body>
</html>