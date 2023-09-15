<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Document</title>
<!-- <style>

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

.content {
	display:flex;
	text-align: left;
	justify-content:space-between;
    overflow: hidden; /* 사이드바와 테이블이 겹치지 않도록 처리 */
}	

</style> -->
</head>
<!-- 	리뷰번호,회원번호,회원아이디,도서명,후기내용,별점,사진첨부,카테고리1,2 -->
<!--  230830 [효슬] 리뷰 상세페이지 수정폼 구현 -->
<body>
	<article class="mypage-wrap">
		<section class="mypage-section-wrap">
			<jsp:include page="/WEB-INF/views/tiles/include/mypageMenu.jsp"></jsp:include>
			<div class="mypage-content-box">
				<div class="mypage-title">
					<h3>리뷰 수정</h3>
				</div>
				<div class="mypage-content">
					<div class="mypage-form order-box">
						<h3>
							[ ${myreview_view.bookcategory.bcategory1 } /
							${myreview_view.bookcategory.bcategory2 } ] <strong>${myreview_view.book.btitle } </strong>
						</h3>
						<!-- hidden값 잘 넘어옴 확인완료  -->
						<form action="reviewupdate" method="post" enctype="multipart/form-data">
							<input type="hidden" name="reviewno" value="${myreview_view.reviewno }" />
							<input type="hidden" name="memberno" value="${myreview_view.memberno }" />
							<input type="hidden" name="mid" value="${myreview_view.member.mid }" />
							<input type="hidden" name="rtitle" value="${myreview_view.bookcategory.bcategory1 }│${myreview_view.bookcategory.bcategory2 }&nbsp; ${myreview_view.book.btitle } " />
							<div class="select-group">
								<select name="rstar" class="form-select star">
									<option value="5" <c:if test="${myreview_view.rstar == 5}">selected</c:if>>★★★★★</option>
									<option value="4" <c:if test="${myreview_view.rstar == 4}">selected</c:if>>★★★★</option>
									<option value="3" <c:if test="${myreview_view.rstar == 3}">selected</c:if>>★★★</option>
									<option value="2" <c:if test="${myreview_view.rstar == 2}">selected</c:if>>★★</option>
									<option value="1" <c:if test="${myreview_view.rstar == 1}">selected</c:if>>★</option>
								</select>
							</div>
							<textarea name="rcontent" placeholder="리뷰를 입력해주세요." maxlength="800">${myreview_view.rcontent}</textarea>
							<input type="file" name="refilesrc" accept=".jpg, .png, .gif" value="${myreview_view.refilesrc}"/>
							<section class="cart-btn-box order-btn-box">
							<div class="btn-wrap">
								<input type="submit" value="저장" />
							</div>
							</section>
						</form>
					</div>
					<!--mypage-form-->
				</div>
				<!-- mypage-content -->
			</div>
			<!-- "mypage-content-box -->
		</section>
	</article>
<%-- 	<!-- hidden값 잘 넘어옴 확인완료  -->
	<form action="reviewupdate" method="post" enctype="multipart/form-data">
		<div>
			<br />
			<h2>Review Update</h2>
			<br /> <br />
			<table>
				<tr>
					<td colspan="3"><input type="hidden" name="reviewno"
						value="${myreview_view.reviewno }" /> <input type="hidden"
						name="memberno" value="${myreview_view.memberno }" /> <input
						type="hidden" name="mid" value="${myreview_view.member.mid }" />
						<input type="hidden" name="rtitle"
						value="${myreview_view.bookcategory.bcategory1 }│${myreview_view.bookcategory.bcategory2 }
				&nbsp; ${myreview_view.book.btitle } " /></td>
				</tr>

				<tr>
					<td colspan="3"
						style="border-bottom: 1px solid; border-color: darkgray; font-weight: bold;"
						class="left"><br />[${myreview_view.bookcategory.bcategory1 }│${myreview_view.bookcategory.bcategory2 }]
						&nbsp; ${myreview_view.book.btitle } <br /> <br /></td>
				</tr>

				<tr>
					<td class="left" colspan="2"
						style="border-spacing: 10px; width: 65px;">별점&nbsp;&nbsp;</td>
					<td class="left"><select name="rstar"
						style="color: #ffe100; font-weight: bold; font-size: 20px;">
							<option value="1"
								<c:if test="${myreview_view.rstar == 1}">selected</c:if>>★</option>
							<option value="2"
								<c:if test="${myreview_view.rstar == 2}">selected</c:if>>★★</option>
							<option value="3"
								<c:if test="${myreview_view.rstar == 3}">selected</c:if>>★★★</option>
							<option value="4"
								<c:if test="${myreview_view.rstar == 4}">selected</c:if>>★★★★</option>
							<option value="5"
								<c:if test="${myreview_view.rstar == 5}">selected</c:if>>★★★★★</option>
					</select></td>
				</tr>
				<tr>
					<td class="left" colspan="2"
						style="border-spacing: 10px; width: 65px;">후기&nbsp;&nbsp;</td>
					<td class="left"><input type="text" name="rcontent"
						style="height: 350px;" value="${myreview_view.rcontent}"></td>
				</tr>
				<tr>
					<td class="left" colspan="2"
						style="border-spacing: 10px; width: 65px;">첨부&nbsp;</td>
					<td><input type="file" name="refilesrc"
						accept=".jpg, .png, .gif" onchange="imageChoose(this)"
						value="${myreview_view.refilesrc}" /></td>
				</tr>

				<tr>
					<td colspan="3"><input type="submit" value="update" /> <a
						href="list" class="relist">list</a></td>
				</tr>
			</table>
		</div>
	</form>
	</div>
 --%>
</body>
</html>