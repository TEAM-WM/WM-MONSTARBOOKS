<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	width: 500px;
	align: center;
	margin-left: auto;
	margin-right: auto;
	height: 350px;
}

tr, td {
	padding: 10px 0px 10px 0px;
}

.relist {
	margin-left: auto;
	margin-right: auto;
	display: block;
	width: 100%;
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
</style>
</head>

<body>
	<br />
	<br />
	<h3>Review Detail</h3>
	<br />
	<br />

	<table>
		<tr>
			<td class="left">제목&nbsp;</td>
			<td class="left">&nbsp;[${myreview_view.bookcategory.bcategory1 }│${myreview_view.bookcategory.bcategory2 }]
				&nbsp;${myreview_view.rtitle }</td>
		</tr>

		<tr>

			<td class="left">별점&nbsp;</td>
			<td class="left"><c:choose>
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
			<td class="left">후기&nbsp;</td>
			<td class="left">&nbsp;${myreview_view.rcontent }</td>
		</tr>
		<tr>
			<td class="left">첨부&nbsp;</td>
			<td class="left"><c:if
					test="${myreview_view.refilesrc ne null }">
					<img border="1" width="80" height="80"
						src="${pageContext.request.contextPath}/resources/assets/upload/${myreview_view.refilesrc }"
						alt="" />
				</c:if></td>
		</tr>

		<tr>
			<td colspan="2"><a
				href="myreview_update?memberno=${myreview_view.memberno }">수정</a>
				&nbsp;&nbsp; <a
				href="reviewdelete?memberno=${myreview_view.memberno }">삭제</a></td>
		</tr>
		<tr>
			<td colspan="2"><a href="myreview_list" class="relist">list</a></td>
		</tr>
	</table>





</body>
</html>