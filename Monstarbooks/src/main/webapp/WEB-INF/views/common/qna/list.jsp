<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 리스트</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
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
}

.left{
   background-color: #eee;
   width: 150px;
}

table.toClass tr:hover {
     background-color: #eee;
     cursor:pointer;
}

table.toClass th, td.non-line{
  border-bottom: 0px solid #ddd;
}
.nocursor:hover {
    // cursor:pointer;
     background-color: white;
}
form {
    width: 100%;
    text-align: center;
    /* display: inline-block; */
}
</style>

</head>
<br><br>
<h1>1:1문의</h1>
<br>
 <c:if test="${param.iResult eq 1 }">
<script>
	alert('등록 되었습니다');
</script>
</c:if>
<c:if test="${param.result eq 1 }">
<script>
	alert('수정 되었습니다');
</script>
</c:if>
<c:if test="${param.dResult eq 1 }">
<script>
	alert('삭제 되었습니다');
</script>
</c:if>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<style>
.faq_question:hover{
cursor:pointer;
}
.faq_answer{
display:none;
}
</style>
<table class="toClass" >
	<tr style="background-color:#f4f6f9">
		<td>번호</td> <!-- 1 -->
		<td>제목</td> <!-- 2 -->
		<td>문의유형</td> <!-- 3 -->
		<td>처리상태</td> <!-- 4 -->
		<td>등록일</td> <!-- 5 -->
	</tr>
	
<c:forEach items="${list }" var="dto">
	<tr>
		<td><c:set var = "listNum" value = "${listNum-1}" />${listNum}</td><!-- 1 -->
		<td><a href="content_view?qnano=${dto.qnano }">${dto.qtitle }</a></td><!-- 2 -->
		<td>${dto.qcategory }</td><!-- 3 -->
		<td>${dto.qstatus }</td><!-- 4 -->
		<td><fmt:formatDate value="${dto.qregDate }" pattern="yyyy-MM-dd" /></td><!-- 5 -->		
	</tr>
</c:forEach>
	<tr>
		<td colspan="5" class="nocursor"><input type="button" value="글쓰기"
		onclick="location.href='./write_view'" /> </td>
	</tr>
	
</table>
totcnt: ${totRowCnt } <br />
현재페이지/토탈페이지:${searchVO.page }/${searchVO.totPage }

<hr />
<form action="list" method="post" onsubmit="return searchCheck();" name="searchForm">
	<c:if test="${searchVO.totPage>1}">
		<a href="list?page=1"><i class="fa-solid fa-angles-left"></i></a>
		<a href="list?page=${searchVO.page-1 }"><i
			class="fa-solid fa-circle-chevron-left"></i></a>
	</c:if>
	<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }"
		var="i">
		<c:choose>
			<c:when test="${i eq searchVO.page }">
				<span style="color: red; font-weight: bold;">${i }
			</c:when>
			<c:otherwise>
				<a href="list?page=${i }&sk=${resk}&qtitle=${qtitle==true?'qtitle':''}&qtitle=${qcontent==true?'qcontent':''}" style="text-decoration: none">${i }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${searchVO.page < searchVO.totPage}">
		<a href="list?page=${searchVO.page+1 }"><i
			class="fa-solid fa-circle-chevron-right"></i></a>
		<a href="list?page=${searchVO.totPage }"><i
			class="fa-solid fa-angles-right"></i></a>
	</c:if>

<div>
	<c:choose>
		<c:when test="${qtitle }">
			<input type="checkbox"  id="searchType1" name="searchType" value="qtitle" checked/>
		</c:when>
		<c:otherwise>
			<input type="checkbox" id="searchType1"  name="searchType" value="qtitle" />

		</c:otherwise>
	</c:choose>
	<label for="searchType1" name="searchType" value="qtitle" ></label>
	
	제목
		<c:choose>
		<c:when test="${qcontent }">
			<input type="checkbox" id="searchType2" name="searchType" value="qcontent" checked/>
		</c:when>
		<c:otherwise>
			<input type="checkbox" id="searchType2" name="searchType" value="qcontent" />

		</c:otherwise>
	</c:choose>

	<label for="searchType2" name="searchType" value="qtitle" ></label>
		내용
	&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="sk" value="${resk }"  style="display:inline-block;width:300px"/>
	<br /><br /><input type="submit"  value="검색"/>
</div>


</form>
<script>


//검색폼 쳄크 자바스크립트
    function searchCheck(){
		var frm	= document.searchForm;
	
		var test1Result = document.getElementById('searchType1').checked;

		var test2Result = document.getElementById('searchType2').checked;
		 //console.log(test1Result+":"+test2Result);
		 //return false;
		 if (test1Result==false &&test2Result==false ){
			 alert("제목 이나 내용을 선택하세요");
			 return false;
		 }
		
        if (frm.sk.value.length<1){
            alert("검색어를 입력하세요");
			frm.sk.focus();

            return false;
        }

    }

    <!--
//-->
</script>

</body>
</html>