<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../resources/css/nstyle.css" /> -->
<!-- <style>
.fa-solid{
	color:#333;
	
}

.fa-solid:hover{
	color:orange;
	
}
table.toClass{
   border-collapse: collapse;
   width: 100%;
}

table.toClass th{
   background-color: :#f4f6f9;
}

table.toClass th, td{
   padding: 20px;
   /* text-align: left; */
   border-bottom: 1px solid #ddd;
   text-align:left
}
.top  td{

   /* text-align: left; */
   border-top: 2px solid #ddd;
   
}

.left{
   background-color: #eee;
   width: 150px;
}

table.toClass tr:hover {
   /*  background-color: #eee; */
}

table.toClass th, td.non-line{
  border-bottom: 0px solid #ddd;
}
input[type="button"] {
    background-color: var(--color-white);
    font-weight: var(--weight-bold);
    color: var(--color-main);
    border-color: var(--color-main);
    display: inline-block;
}
</style> -->
</head>
<body>
	<article class="mypage-wrap">
		<section class="mypage-section-wrap">
			<jsp:include page="/WEB-INF/views/tiles/include/mypageMenu.jsp"></jsp:include>
			<div class="mypage-content-box">
				<div class="mypage-title">
					<h3>1:1문의 상세</h3>
				</div>
				<div class="mypage-content">
					<table>
					<colgroup>
								<col width="100px" />
							</colgroup>
						<tr>
							<th>제목</th>
							<td>${qna.qtitle }</td>
						</tr>
						<%-- 	<tr>
		<td class="left top">번호</td>
		<td style="text-align:left">${qna.qnano }</td>
	</tr> --%>
						<tr>
							<th>처리상태</th>
							<td><span class="text-back" style="line-height:normal">${qna.qstatus }</span></td>
						</tr>
						<tr>
							<th>질문유형</th>
							<td>${qna.qcategory }</td>
						</tr>

						<tr>
							<th>질문내용</th>
							<td>
								<pre>${qna.qcontent }</pre>
							</td>
						</tr>
						<tr>
							<th>답변내용</th>
							<td>
							<c:choose>
									<c:when test="${qna.qanswer eq null }">
										답변 준비중 입니다
									</c:when>
									<c:otherwise>
										<pre>${qna.qanswer }</pre>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<c:if test="${not empty qna.qfilesrc }">
						<tr>
							<th>첨부</th>
							<td>
							<a
								href="download?p/resources/assets/upload/&f=${qna.qfilesrc }&qnano=${qna.qnano }">
								<img src="${pageContext.request.contextPath}/resources/assets/upload/${qna.qfilesrc }" alt="" />
								</a>
							</td>
						</tr>
						</c:if>
					</table>
				</div>
				<!-- mypage-content <-->
				<section class="cart-btn-box" style="margin-top:30px;">
				<div class="btn-wrap">
					<c:choose>
						<c:when test="${qna.qstatus eq '답변완료' }">
							<input type="button" value="목록" onclick="location.href='./list'">
						</c:when>
						<c:otherwise>
							<input type="button" value="수정"
								onclick="location.href='./content_update?qnano=${qna.qnano }'">

							<input type="button" value="목록"
								onclick="location.href='./list'">

							<input type="button" value="삭제" class="btn-a gray"
								onclick="location.href='delete?qnano=${qna.qnano }'">
						</c:otherwise>
					</c:choose>
				</div>
				</section>
			</div>
			<!-- "mypage-content-box -->
		</section>
	</article>
</body>
</html>