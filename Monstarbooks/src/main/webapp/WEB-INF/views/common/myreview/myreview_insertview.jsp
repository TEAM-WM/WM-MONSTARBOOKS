<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>
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
height: 450px;
}

tr, td {
	padding: 15px 5px 15px 5px;
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
	font-weight: bold;
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
}

.content {
	display:flex;
	text-align: left;
	justify-content:space-between;
    overflow: hidden; /* 사이드바와 테이블이 겹치지 않도록 처리 */
}

</style> -->
</head>

<body>
	<article class="mypage-wrap">
		<section class="mypage-section-wrap">
			<jsp:include page="/WEB-INF/views/tiles/include/mypageMenu.jsp"></jsp:include>
			<div class="mypage-content-box">
				<div class="mypage-title">
					<h3>내가 남긴 리뷰</h3>
				</div>
				<div class="mypage-content">
					<div class="mypage-form order-box">
						<h3>
							[ ${bcate.bookcategory.bcategory1 } / ${bcate.bookcategory.bcategory2 } ] 
							<strong>${bcate.book.btitle }</strong>
						</h3>
						<form action="insert" method="post" enctype="multipart/form-data">
							<input type="hidden" name="reviewno" value="${bcate.reviewno }" />
							<input type="hidden" name="memberno" value="${bcate.memberno }" />
							<input type="hidden" name="bookno" value="${bcate.bookno }" />
							<input
								type="hidden" name="mid" value="${bcate.member.mid }" />
							<input
								type="hidden" name="rtitle"
								value="${bcate.bookcategory.bcategory1 }│${bcate.bookcategory.bcategory2 }
					&nbsp;&nbsp; ${bcate.book.btitle } " />
							<div class="select-group">
								<select class="form-select star">
									<option value="5" <c:if test="${bcate.rstar == 5}">selected</c:if>>★★★★★</option>
									<option value="4" <c:if test="${bcate.rstar == 4}">selected</c:if>>★★★★</option>
									<option value="3" <c:if test="${bcate.rstar == 3}">selected</c:if>>★★★</option>
									<option value="2" <c:if test="${bcate.rstar == 2}">selected</c:if>>★★</option>
									<option value="1" <c:if test="${bcate.rstar == 1}">selected</c:if>>★</option>
								</select>
							</div>
							<textarea name="rcontent" placeholder="리뷰를 입력해주세요." maxlength="800"></textarea>
							<input type="file" name="refilesrc" accept=".jpg, .png, .gif" />
							<input type="submit" value="저장" />
						</form>

					</div>
					<!--mypage-form-->
				</div><!-- content -->
			</div><!-- content-box -->
		</section>
	</article>
	<%-- <div class="content">
		<!-- 왼쪽에 myprofile.jsp 내용 추가 -->
		<div id="myprofile-sidebar">
			<%@ include file="../myprofile/myprofile.jsp"%>
		</div>


		<form action="insert" method="post" enctype="multipart/form-data">
			<div>
				<br />
				<h2>Review Write</h2>
				<br /> <br />
				<table>
					<tr>
						<td colspan="3"><input type="hidden" name="reviewno"
							value="${bcate.reviewno }" /> <input type="hidden"
							name="memberno" value="${bcate.memberno }" /> <input
							type="hidden" name="bookno" value="${bcate.bookno }" /> <input
							type="hidden" name="mid" value="${bcate.member.mid }" /> <input
							type="hidden" name="rtitle"
							value="${bcate.bookcategory.bcategory1 }│${bcate.bookcategory.bcategory2 }
				&nbsp;&nbsp; ${bcate.book.btitle } " /></td>
						<!-- Use hidden fields to submit data to the server / bookno 제외하고 잘들어옴 -->

					</tr>

					<tr>
						<td colspan="3"
							style="border-bottom: 1px solid; border-color: darkgray; font-weight: bold;"
							class="left"><br />[${bcate.bookcategory.bcategory1 }│${bcate.bookcategory.bcategory2 }]
							&nbsp;&nbsp; ${bcate.book.btitle } <br /> <br /></td>
					</tr>

					<tr>
						<td class="left" style="border-spacing: 10px; width: 65px;">별점&nbsp;&nbsp;</td>
						<td class="left" colspan="2"><select name="rstar"
							style="color: #ffe100; font-weight: bold; font-size: 20px;">
								<option value="1"
									<c:if test="${bcate.rstar == 1}">selected</c:if>>★</option>
								<option value="2"
									<c:if test="${bcate.rstar == 2}">selected</c:if>>★★</option>
								<option value="3"
									<c:if test="${bcate.rstar == 3}">selected</c:if>>★★★</option>
								<option value="4"
									<c:if test="${bcate.rstar == 4}">selected</c:if>>★★★★</option>
								<option value="5"
									<c:if test="${bcate.rstar == 5}">selected</c:if>>★★★★★</option>
						</select></td>
					</tr>
					<tr>
						<td class="left">후기&nbsp;&nbsp;</td>
						<td class="left" colspan="2"><textarea name="rcontent"
								placeholder="후기를 입력하세요." rows="15"
								style="font-size: 15px; width: 450px;"></textarea></td>
					</tr>
					<tr>
						<td class="left">첨부&nbsp;&nbsp;</td>
						<td><input type="file" name="refilesrc"
							accept=".jpg, .png, .gif" onchange="imageChoose(this)" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="save" /> <a
							href="list" class="upde">list</a></td>
					</tr>

				</table>
			</div>
		</form>

	</div> --%>
</body>
</html>