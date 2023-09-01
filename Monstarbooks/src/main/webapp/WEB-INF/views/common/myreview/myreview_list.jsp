<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path=request.getContextPath();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	
<style>
	table {
	margin-left: auto;
	margin-right: auto;
    text-align: left;
    padding: 20px 50px 40px 80px;
 }
 	tr, td {
 	padding : 10px 0px 5px 0px;
 }      
</style>

</head>
<body>
	<br />
	<br />
	<h3>My Review</h3>
<!--  230826 [효슬] 리뷰 목록 페이지 구현 -->	
	<div>
		<table width="950" border="1">
					<c:forEach items="${reviewlist }" var="dto">
			<tr>
				<td class="left" hidden>로그인,이미지,제목,별점,날짜,내용 </td>
				<td class="left" name="memberno" value="${dto.memberno }" hidden/></td>
			</tr>
			<c:if test="${empty dto.refilesrc}"> 
			<tr>
					<td style="border-bottom: 1px solid; border-color:darkgray;" class="left">
			<img style="max-width: 40px; height: 40px;" src="${pageContext.request.contextPath}/resources/assets/imgs/hyoseul/bookdefault.png" alt="" />
				</td>
				</c:if>
			<c:if test="${not empty dto.refilesrc}">
			        <!-- myList가 비어있지 않으면 -->
						</c:if>
					<td style="border-bottom: 1px solid; border-color:darkgray;" class="left">
				[${dto.bookcategory.bcategory1 }│${dto.bookcategory.bcategory2 }] &nbsp;${dto.rtitle }
				</td>
				
					<td style="border-bottom: 1px solid; border-color:darkgray;" class="right">
					<a href="myreview_view?reviewno=${dto.reviewno }">수정</a>
					&nbsp; l &nbsp;<a href="reviewdelete?reviewno=${dto.reviewno }">삭제</a></td>
			</tr>

			<tr>					
				<td class="left"	colspan="3">
			      <c:choose>
              <c:when test="${dto.rstar == 1}">
                ★
              </c:when>
              <c:when test="${dto.rstar == 2}">
                ★★
              </c:when>
              <c:when test="${dto.rstar == 3}">
                ★★★
              </c:when>
              <c:when test="${dto.rstar == 4}">
                ★★★★
              </c:when>
              <c:when test="${dto.rstar == 5}">
                ★★★★★
              </c:when>
            </c:choose>
					&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd" /></td>			
			</tr>
			<tr>					
					<td style="vertical-align : top;" class="left"	colspan="3" height="100px">${dto.rcontent }</td>
			</tr>			
			</c:forEach>
		</table>
	<br />		
	<input type="hidden" name="reviewno" value="${myreview_list.reviewno }" />
	<input type="hidden" name="bookno" value="${myreview_list.bookno }" />
	<input type="hidden" name="memberno" value="${myreview_list.memberno }" />	
	
	<br />
	<!-- 페이징 -->
	
	<a href=""><i class="fa-solid fa-circle-chevron-left"></i></a>
	
	<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i"> 
		<c:choose>
			<c:when test="${i eq searchVO.page }">
				<span style="font-weight:bold;">${i }</span>
			</c:when>
			<c:otherwise>
				<a href="review_list?page=${i }" style="text-decoration: none;">${i }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>	
	
	<a href=""><i class="fa-solid fa-circle-chevron-right"></i></a>
	
</div>





	<script>
		document.title = "몬스타북스 :: 마이페이지 :: 마이리뷰";
	</script>
</body>
</html>