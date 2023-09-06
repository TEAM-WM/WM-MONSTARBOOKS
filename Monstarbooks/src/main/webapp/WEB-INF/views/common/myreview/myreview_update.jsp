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
	
</style>

</head>
<!-- 	리뷰번호,회원번호,회원아이디,도서명,후기내용,별점,사진첨부,카테고리1,2 -->
<!--  230830 [효슬] 리뷰 상세페이지 수정폼 구현 -->
<body>
	<br />
	<br />

	<h3>Review Update</h3>
	<form action="reviewupdate" method="post" enctype="multipart/form-data">
	<br />
	<table>
		<tr>
			<td colspan="2">
			<input type="hidden" name="reviewno" value="${myreview_view.reviewno }" />
			<input type="hidden" name="memberno" value="${myreview_view.memberno }" /></td>
		</tr>
	
	<tr>
			<td colspan="2" style="border-bottom: 1px solid; border-color: darkgray; font-weight: bold;"
				class="left">[${myreview_view.bookcategory.bcategory1 }│${myreview_view.bookcategory.bcategory2 }]
			<%-- 	&nbsp;&nbsp; <input type="text" name="btitle" value="${myreview_view.book.btitle }"> <br /> --%>
				&nbsp; ${myreview_view.book.btitle } <br />
			<br />
			</td>
		</tr>

		<tr>
			<td class="left">별점&nbsp;&nbsp;</td>
				<td class="left">
					<select name="rstar" style="color:#ffe100; font-weight: bold; font-size: 20px; ">
						<option value="1" <c:if test="${myreview_view.rstar == 1}">selected</c:if>>★</option>
						<option value="2" <c:if test="${myreview_view.rstar == 2}">selected</c:if>>★★</option>
						<option value="3" <c:if test="${myreview_view.rstar == 3}">selected</c:if>>★★★</option>
						<option value="4" <c:if test="${myreview_view.rstar == 4}">selected</c:if>>★★★★</option>
						<option value="5" <c:if test="${myreview_view.rstar == 5}">selected</c:if>>★★★★★</option>
					</select>
			 </td>
			</tr>
		<tr>
			<td class="left">후기&nbsp;&nbsp;</td>
			<%-- <td class="left"><textarea name="rcontent" rows="10" style="font-size: 15px; height: 300px;">${myreview_view.rcontent}</textarea></td> --%>
			<td class="left"><input type="text" name="rcontent" style="height: 300px;" value="${myreview_view.rcontent}"></td>
		</tr>
		 <tr>
			<td class="left">첨부&nbsp;</td>
			<td><input type="file" name="refilesrc" value="${myreview_view.refilesrc}" /></td>
		</tr>
		
		<tr>			
			<td colspan="2">
				<input type="submit" value="save" />
				<a href="list" class="relist">list</a>
			</td>
		</tr>
	</table>
	<br />
	<br />
	
	</form>


</body>
</html>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
	<!--  별점 수정할 것 -->
	<%-- 	<c:forEach items="${reviewupdate }" var="star">
		<tr>
			<td class="star">별점 ${star.reviewno } | ${star.memberno }</td>
			<td><input type="range" onclick="redeptlist(this);"
				oninput="drawStar(this)" value="1" step="1" min="0" max="5">
			</td>
			<td align="center">
					<span class="star">
				      	  ★★★★★
				        <span id="star2" style="width:${star.rstar*20}%">★★★★★</span>
				        <input type="range" value="1" step="1" min="0" max="5">
					</span>
				</td>
		</tr>
		</c:forEach> --%>
		<%-- 			<td><input type="text" name="rstar"
					value="${myreview_list.rstar }" /></td> --%>
					
		<!-- <tr>					
					<td class="left">첨부</td>
					<td><input type="file" name="refilesrc" accept=".jpg, .png, .gif" onchange="imageChoose(this)" /></td>
				</tr>
			<tr>
				<td colspan="2"><input type="submit" value="update" />
					<a href="myreview_list" class="relist">list</a></td>
			</tr> -->
	