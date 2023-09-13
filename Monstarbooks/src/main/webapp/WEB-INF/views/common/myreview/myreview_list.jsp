<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

<style>

h2 {
    text-align: center;
}
tr, td {
	padding: 10px 0px 5px 0px;
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
    margin: 0 auto;
    width: 800px;
	align: center;
	text-align: left;
	vertical-align: top;
	padding: 20px 50px 40px 80px;
}

.content {
	display:flex;
	text-align: left;
	justify-content:space-between;
    overflow: hidden; /* 사이드바와 테이블이 겹치지 않도록 처리 */
}

/* "수정" 링크에 커서를 갖다 대면 색상 변경 */
a:hover {
  color: navy; /* 색상을 변경하고자 하는 색상으로 설정 */
  text-decoration: none; /* 밑줄을 제거하려면 이 줄을 추가 */
}
</style>

</head>
<body>
	<br />
	<br />

    <div class="content">
        <!-- 왼쪽에 myprofile.jsp 내용 추가 -->
        <div id="myprofile-sidebar">
            <%@ include file="../myprofile/myprofile.jsp" %>
        </div>

<form action="">	
	<!--  230826 [효슬] 리뷰 목록 페이지 구현 -->
	<div>
	<br />
		<h2>My Review</h2>
		<br/>	<br/>
		<table border="1">
			<c:forEach items="${reviewList }" var="dto">
				<tr>
					<td class="left" hidden>로그인,이미지,제목,별점,날짜,내용</td>
			<!-- hidden값 잘 넘어옴 확인완료  -->
						<tr>
						<td>
					<input type="hidden" name="mid" value="${dto.member.mid}" />
					<input type="hidden" name="bookno" value="${dto.book.bookno }" />
					<input type="hidden" name="memberno" value="${dto.memberno }" />
					<input type="hidden" name="rtitle" value="${dto.bookcategory.bcategory1 }│${dto.bookcategory.bcategory2 }&nbsp;${dto.book.btitle }" />
					</td>
				</tr>
				<c:if test="${empty dto.refilesrc}">
					<!-- dto.refilesrc가 비어있으면 -->
					<tr>
						<td colspan=3 style="border-bottom: 1px solid; border-color: darkgray; font-weight: bold; vertical-align: top; "
							class="left"><img style="max-width: 40px; height: 40px;"
							src="${pageContext.request.contextPath}/resources/assets/imgs/mypage/bookdefault.png"
							alt="기본썸네일" />&nbsp;&nbsp;&nbsp;<a href="view?reviewno=${dto.reviewno }">[${dto.bookcategory.bcategory1 }│${dto.bookcategory.bcategory2 }]
						&nbsp;${dto.book.btitle }</a></td>
					</tr>
				</c:if>

				<tr>
					<c:if test="${dto.refilesrc ne null }">
						<!-- dto.refilesrc가 비어있지 않으면 -->
						<td colspan=3 style="border-bottom: 1px solid; border-color: darkgray;  font-weight: bold; vertical-align: top;" class="left">
						<img style="max-width: 40px; height: 40px;"
							src="${pageContext.request.contextPath}/resources/assets/upload/${dto.refilesrc }"
							alt="이미지첨부" /> &nbsp;&nbsp;&nbsp;<a href="view?reviewno=${dto.reviewno }">[${dto.bookcategory.bcategory1 }│${dto.bookcategory.bcategory2 }]
						&nbsp;${dto.book.btitle }</a></td>
					</c:if>
					
			
				</tr>

				<tr>
					<td class="left" colspan="1" style=" font-size: 15px; ">
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
						</c:choose> &nbsp;&nbsp;&nbsp;<fmt:formatDate value="${dto.regdate}"
							pattern="yyyy.MM.dd" /></td>
							
					<td class="right"><a href="update?reviewno=${dto.reviewno }">수정</a>
						&nbsp; l &nbsp;<a href="reviewdelete?reviewno=${dto.reviewno }">삭제</a></td>
				</tr>
				<tr>
					<td style="vertical-align: top;" class="left" colspan="3"
						height="100px">${dto.rcontent }</td>
				</tr>
				
			</c:forEach>
			
			
			
		</table>

		
		<br /> 
		<br />

		<!-- 페이징 -->
	<div class="center">
	<%-- ${totRowcnt } <br />
	${searchVO.page }/${searchVO.totPage } --%>
	<hr />
	<c:if test="${searchVO.page>1}">
		<a href="list?page=1"><i class="fa-solid fa-angles-left"></i></a>
		<a href="list?page=${searchVO.page-1 }"><i class="fa-solid fa-circle-chevron-left"></i></a>
	</c:if>
	<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
		<c:choose>
			<c:when test="${i eq searchVO.page }">
				<span style="color:red; font-weight:bold;">${i }</span>
			</c:when>
			<c:otherwise>
				<a href="list?page=${i }" style="text-decoration:none;">${i }</a> 
			</c:otherwise>
		</c:choose>	
	</c:forEach>
	<c:if test="${searchVO.page < searchVO.totPage}">
		<a href="list?page=${searchVO.page+1 }"><i class="fa-solid fa-circle-chevron-right"></i></a>
		<a href="list?page=${searchVO.totPage }"><i class="fa-solid fa-angles-right"></i></a>
	</c:if>
	</div>
			
		        </div>
				</form>
	        </div>




	<script>
		document.title = "몬스타북스 :: 마이페이지 :: 마이리뷰";
	</script>
</body>
</html>