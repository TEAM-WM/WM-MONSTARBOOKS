<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../resources/css/nstyle.css" /> -->
<style>
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
</style>
</head>
<body>
<table class="toClass">
	<tr>
		<td colspan="2" style="text-align:center"><h1>1:1 문의</h1></td>
	
	</tr>
	
	<tr>
		<td class="left">제목</td>
		<td>${qna.qtitle }</td>
	</tr>	
<%-- 	<tr>
		<td class="left top">번호</td>
		<td style="text-align:left">${qna.qnano }</td>
	</tr> --%>
	<tr>
		<td class="left">처리상태</td>
		<td>${qna.qstatus }</td>
	</tr>
	<tr>
		<td class="left">질문유형</td>
		<td>${qna.qcategory }</td>
	</tr>

	<tr>
		<td class="left">질문내용</td>
		<td>${qna.qcontent }</td>
	</tr>
	<tr>
		<td class="left">답변내용</td>
		<td>
			<c:choose>
		<c:when test="${qna.qanswer eq null }">
			답변 준비중 입니다
		</c:when>
		<c:otherwise>
			${qna.qanswer }

		</c:otherwise>
	</c:choose>
	

		</td>
	</tr>	
		<tr>
		<td class="left">첨부</td>
		<td>
		<a href="download?p/resource/upload/&f=${qna.qfilesrc }
		&qnano=${qna.qnano }"> 
		${qna.qfilesrc }</a>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:center">
		
	<c:choose>	
	<c:when test="${qna.qstatus eq '답변완료' }">

		<input type="button" style="width:350px;" value="목록" onclick="location.href='./list'">
			
	</c:when>
	<c:otherwise>
		<input type="button"  value="수정" style="width:350px;"
			onclick="location.href='./content_update?qnano=${qna.qnano }'">
			
		<input type="button" style="width:350px;" value="목록" onclick="location.href='./list'">
			
		<input type="button"  style="width:350px;" value="삭제" onclick="location.href='delete?qnano=${qna.qnano }'">
			

		</c:otherwise>
	</c:choose>
		</td>
	</tr>
</table>


</body>
</html>