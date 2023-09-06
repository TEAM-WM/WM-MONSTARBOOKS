<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
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
<p style="color:red">


</p>
<h1>회원정보 수정</h1>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%-- <link rel="stylesheet" href="${ctx }/resources/css/nstyle.css" /> --%>
<c:if test="${param.result eq 1 }">
<script>
	alert('회원정보가 수정되었습니다');
</script>
</c:if>
<!-- enctype="multipart/form-data" -->
<form action="${ctx }/member/modify" method="post">
<input type="hidden" name="mid" value="${m.mid}">
<label for="id" style="margin-bottom:15px;" >아이디  </label>

<input type="text" id="id" name="mid" value="${m.mid}" disabled class="disableExp"/> <br /> 

<label for="name" style="margin-bottom:15px;">이름</label> 
<input type="text" id="name" name="mname" value="${m.mname}" disabled class="disableExp"/> <br />
<!-- <label for="gender">성별:</label>

<select name="gender" id="gender">
	<option value="남성">남성</option>
	<option value="여성">여성</option>
</select> -->

<label for="year" style="margin-bottom:15px;">생년월일</label>

<input type="text" id="mbirth" name="mbirth" size="20" value="<fmt:formatDate value="${m.mbirth}" pattern="yyyy-MM-dd" />"/> 
<br />
 
<label for="cphone" style="margin-bottom:15px;">핸드폰번호  </label>
 <input type="text" id="mtel2" name="mtel2" 
 value="${fn:split(m.mtel,'-')[0]}" size="3" style="display:inline-block;width:350px;"/>
<input type="text" id="mtel3" name="mtel3" 
value="${fn:split(m.mtel,'-')[1]}" size="3"  style="display:inline-block;width:350px;"/> 
<input type="text" id="mtel4" name="mtel4" 
value="${fn:split(m.mtel,'-')[2]}" size="3" style="display:inline-block;width:350px;"/>  
예)010-455-4568<br />
<label for="email" style="margin-bottom:10px">이메일</label> 
<input type="text" id="memail" name="memail" value="${m.memail}" />

 <br />
<!-- <label for="habit">첨부:</label> <input type="file" name="mprofileimg" > <br />
 -->

<label for="habit" style="margin-bottom:15px;">취미</label> 
	<c:set var="token" value="music,movie,trip" />
	
	<!-- Display Each token -->

<input type="checkbox" id="mfavorite1" name="mfavorite" value="music" 
	<c:forTokens var="f" items="${m.mfavorite}" delims=",">
	<c:if test="${f eq 'music'}">
	<c:out value="checked" />
	</c:if> 
	</c:forTokens>
	/>
<label for="mfavorite1" name="mfavorite" value="music" ></label>
음악

<input type="checkbox" id="mfavorite2" name="mfavorite" value="movie" 
	<c:forTokens var="f" items="${m.mfavorite}" delims=",">
	<c:if test="${f eq 'movie'}">
	<c:out value="checked" />
	</c:if> 
	</c:forTokens>
/>
<label for="mfavorite2" name="mfavorite" value="movie" ></label>
영화



 <input type="checkbox" id="mfavorite3" name="mfavorite" value="trip"
	<c:forTokens var="f" items="${m.mfavorite}" delims=",">
	<c:if test="${f eq 'trip'}">
	<c:out value="checked" />
	</c:if> 
	</c:forTokens>

/>
<label for="mfavorite3" name="mfavorite" value="trip" ></label>

여행 <br />

 

  <%-- <c:forEach var="tel" items="${m.mtel}" begin="0" end="2"  varStatus="status">  --%>
<%-- <c:set var="tel3" value="${tel.index eq 0} " /> --%>
<%--  <c:out value="${tel}"/> --%>
<%-- <c:set var="tel3" value="${tel[1]}" />
<c:set var="tel4" value="${tel[2]}" />  //${tel(0) } :  --%>
 <%--  </c:forEach> --%>

<br /><br />
<input type="submit" value="확인" />

</form>

</body>
</html>