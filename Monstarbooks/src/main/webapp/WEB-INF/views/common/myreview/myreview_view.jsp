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

h2 {
    text-align: center;
}

form {
	width: 800px;
	align: center;
	text-align: left;
	margin-left: auto;
	margin-right: auto;
}
/* 테이블 가운데 정렬 */
table {
width: 600px;
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

.content {
	display:flex;
	text-align: left;
	justify-content:space-between;
    overflow: hidden; /* 사이드바와 테이블이 겹치지 않도록 처리 */
}

</style>
</head>

<body>
	<br /><br />

    <div class="content">
        <!-- 왼쪽에 myprofile.jsp 내용 추가 -->
        <div id="myprofile-sidebar">
            <%@ include file="../myprofile/myprofile.jsp" %>
        </div>
        
			<!-- hidden값 잘 넘어옴 확인완료  -->
			<form action="">
		<div>
			<br />
				<h2>Review Detail</h2>
	<br /><br />
	<table>
		<tr>
			<td colspan="3">
			<input type="hidden" name="reviewno" value="${myreview_view.reviewno }" />
			<input type="hidden" name="memberno" value="${myreview_view.memberno }" />
			<input type="hidden" name="mid" value="${myreview_view.member.mid }" />
			<input type="hidden" name="rtitle" value="${myreview_view.bookcategory.bcategory1 }│${myreview_view.bookcategory.bcategory2 }
				&nbsp;&nbsp; ${myreview_view.book.btitle } " /></td>
		</tr>

		<tr>
			<td colspan="3" style="border-bottom: 1px solid; border-color: darkgray; font-weight: bold;"
				class="left"><br />[${myreview_view.bookcategory.bcategory1 }│${myreview_view.bookcategory.bcategory2 }]
				&nbsp;&nbsp; ${myreview_view.book.btitle } <br />
			<br />
			</td>
		</tr>

		<tr>

			<td class="left" colspan="2" style="border-spacing: 10px; width: 65px;">별점&nbsp;&nbsp;</td>
			<td class="left" style="color:#ffe100; font-weight: bold; font-size: 22px;" >
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
			<td class="left"  height="350" >&nbsp;${myreview_view.rcontent }</td>
		</tr>
			<c:if test="${myreview_view.refilesrc ne null }">
		<tr>
				<!-- dto.refilesrc가 비어있지 않으면 -->
			<td class="left" colspan="2" style="border-spacing: 10px; width: 65px;">첨부&nbsp;&nbsp;</td>
					<td class="left">&nbsp;<img border="1" style="width:100px; height=auto;" 
						src="${pageContext.request.contextPath}/resources/assets/upload/${myreview_view.refilesrc }"
						alt="이미지첨부" />
			</td></tr></c:if>
			<c:if test="${empty myreview_view.refilesrc}">
			<tr>
				<!-- dto.refilesrc가 비어있으면 -->
			<td class="left" colspan="2" style="border-spacing: 10px; width: 65px;">첨부&nbsp;&nbsp;</td>
					<td class="left">&nbsp;<img border="1" style="width:50px; height=auto;" 
					src="${pageContext.request.contextPath}/resources/assets/imgs/hyoseul/bookdefault.png"
					alt="기본썸네일" />
			</td></tr></c:if>
				


		<tr>
		<td class="center" colspan="3">
			<a class="upde" href="update?reviewno=${myreview_view.reviewno }">수정</a>&nbsp;&nbsp;
			<a class="upde" href="reviewdelete?reviewno=${myreview_view.reviewno }">삭제</a></td>

		</tr>
		<tr>
			<td colspan="3"><a href="list" class="relist">list</a></td>
		</tr>

	</table>
	</div>
	</form>
</div>

</body>
</html>