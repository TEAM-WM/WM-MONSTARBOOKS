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
form {
    width: 100%;
    text-align: center;
    /* display: inline-block; */
}
.disableExp{
background-color: #f4f6f9;
cursor:default;
}
</style>
</head>
<body>
<h3>write_view.jsp</h3>

<form action="write" method="post" enctype="multipart/form-data"
onsubmit="return writeCheck();" name="writeForm">

	<table class="toClass">
		<tr>
		<td colspan="2" style="text-align:center"><h1>1:1 문의</h1></td>
	
	</tr>
		<tr>
			<td class="left">질문유형</td>
			<td>
			  <select name="qcategory" class="pl">
				<option value="상품" selected>상품</option>
				<option value="주문">주문</option>
				<option value="배송">배송</option>
				<option value="환불">환불</option>
				<option value="기타">기타</option>

  			</select>
		
			
			</td>
		</tr>
		<tr>
			<td class="left">제목</td>
			<td><input type="text" name="qtitle" value="" /></td>
		</tr>
		<tr>
			<td class="left">작성자</td>
			<td><input type="text" name="mid" value="${sessionScope.mid}" class="disableExp"/></td>
		</tr>		
		<tr>
			<td class="left">내용</td>
			<td><textarea type="text" name="qcontent" rows="10" cols="145" class="pl2"></textarea></td>
		</tr>
		<tr>
			<td class="left">첨부파일</td>
			<td><input type="file" name="qfilesrc" ></td>
		</tr>	
		<tr>	
			<td colspan="2">
			<input type="submit" value="등록" />
			<input type="button" value="리스트" onclick="location.href='./list'" /> 
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