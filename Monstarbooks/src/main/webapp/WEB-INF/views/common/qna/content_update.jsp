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
<c:set var="ctx" value="${pageContext.request.contextPath}" />

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

.pl{
    width: 200px;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    border-radius: 0px;
    padding: 12px 13px;
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 400;
    font-size: 14px;
    line-height: 16px;
}

.pl:focus{
    border: 1px solid white;
    box-sizing: border-box;
    border-radius: 0px;
    outline: 1px solid #000d82; /*  #F8E4FF */
    border-radius: 0px;
}

.pl2{
    border: 1px solid #d9d9d9;
 

}
.pl2:focus{

    border: 1px solid white;
    outline: 1px solid #000d82; /*  #F8E4FF */
}
.top{
   border-top: 1px solid #ddd;
}
</style>
</head>
<body>

<!-- 이 번호에 대한 글을 수정하겠다! -->
<h1>1:1문의 수정</h1>
<table class="toClass">
	<tr>
		<td class="left top">번호</td>
		<td class="top">${qna.qnano }</td>
	</tr>
	<tr>
		<td class="left">처리상태</td>
		<td>${qna.qstatus }</td>
	</tr>
<form action="${ctx }/qna/modify" method="post" 
enctype="multipart/form-data" onsubmit="return writeCheck();" name="writeForm">
<input type="hidden" name="qnano" value="${qna.qnano }" /> 
<input type="hidden" name="oldqfilesrc" value="${qna.qfilesrc }" /> 	
	<tr>
		<td class="left">질문유형</td>
		<td><!-- selected -->
			  <select name="qcategory" class="pl">
				<option value="상품" 
				<c:if test="${qna.qcategory eq '상품'}"><c:out value="selected" /></c:if>>상품</option>
				<option value="주문"
				<c:if test="${qna.qcategory eq '주문'}"><c:out value="selected" /></c:if>>주문</option>
				<option value="배송"
				<c:if test="${qna.qcategory eq '배송'}"><c:out value="selected" /></c:if>>배송</option>
				<option value="환불"
				<c:if test="${qna.qcategory eq '환불'}"><c:out value="selected" /></c:if>>환불</option>
				<option value="기타"
				<c:if test="${qna.qcategory eq '기타'}"><c:out value="selected" /></c:if>>기타</option>

  			</select>
		</td>
	</tr>
	<tr>
		<td class="left">제목</td>
		<td>
		<input type="text" name="qtitle" value="${qna.qtitle }" />		
		</td>
	</tr>
	<tr>
		<td class="left">질문내용</td>
		<td>
		<textarea type="text" name="qcontent" rows="10" cols="145" class="pl2" >${qna.qcontent }</textarea>
		</td>
	</tr>
	
		<tr>
		<td class="left">첨부</td>
		<td>
		<input type="file" name="qfilesrc" >
		
		</td>
	</tr>

		<td colspan="2">
			<input type="submit" value="수정" /> &nbsp;&nbsp;
			<input type="button" value="리스트" 
			onclick="location.href='./list'" /> 			
		</td>
	</tr>
</table>



</form>
<script>


	function writeCheck(){
		var frm	= document.writeForm;
		
		
		if(frm.qtitle.value==""){
			alert('제목을  입력하세요');
			frm.qtitle.focus();
			return false;
			
		}
		
		
		if(frm.qcontent.value==""){
			alert('내용을  입력하세요');
			frm.qcontent.focus();
			return false;
			
		}
	}
	
	
</script>

</body>
</html>