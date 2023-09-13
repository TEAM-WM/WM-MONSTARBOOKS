<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
<style>
.disableExp{
background-color: #f4f6f9;
cursor:default;

}
</style>

</head>
<body>
<p style="color:red">


</p>
<h1>회원정보</h1>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%-- <link rel="stylesheet" href="${ctx }/resources/css/nstyle.css" /> --%>

<label for="id">아이디 : </label>
<input type="text" id="id" name="mid" value="${m.mid}" disabled class="disableExp"/>
 <br /> 
<label for="name">이름:</label> 
<input type="text" id="name" name="mname" value="${m.mname}" disabled class="disableExp"/>
<br />

<label for="year">생년월일:</label>
<input type="text" id="mbirth" name="mbirth" size="20" 
value="<fmt:formatDate value="${m.mbirth}" pattern="yyyy-MM-dd" />" 
disabled class="disableExp"/>

<br />
 
<label for="cphone" style="margin-bottom:15px;">핸드폰번호  </label>
 <input type="text" id="mtel2" name="mtel2" 
 value="${fn:substring(m.mtel,0,3)}" size="3" style="display:inline-block;width:350px;" disabled class="disableExp"/>
<input type="text" id="mtel3" name="mtel3" 
value="${fn:substring(m.mtel,3,7)}" size="3"  style="display:inline-block;width:350px;" disabled class="disableExp"/> 
<input type="text" id="mtel4" name="mtel4" 
value="${fn:substring(m.mtel,7,12)}" size="3" style="display:inline-block;width:350px;" disabled class="disableExp"/>  
예)010-455-4568<br />
<label for="email">이메일:</label> 
<input type="text" id="memail" name="memail" 
value="${m.memail}" disabled class="disableExp"/>

 <br />





<label for="habit" style="margin-bottom:15px;">취미</label> 
	<c:set var="token" value="소설,시/에세이,인문,가정/육아,요리,정치/사회,경제/경영,역사/문화,컴퓨터/IT,건강,스포츠,자기계발" />
	
	<!-- Display Each token -->
<!-- 소설,시/에세이,인문,가정/육아,요리,정치/사회,경제/경영,역사/문화,컴퓨터/IT,건강,스포츠,자기계발 -->
<input type="checkbox" id="mfavorite1" name="mfavorite" class="disableExp" disabled value="소설" 
	<c:forTokens var="f" items="${m.mfavorite}" delims=",">
	<c:if test="${f eq '소설'}">
	<c:out value="checked" />
	</c:if> 
	</c:forTokens>
	/>
<label for="mfavorite1" name="mfavorite" value="소설"  disabled class="disableExp"></label>
소설

<input type="checkbox" id="mfavorite2" name="mfavorite" disabled value="시/에세이" 
	<c:forTokens var="f" items="${m.mfavorite}" delims=",">
	<c:if test="${f eq '시/에세이'}">
	<c:out value="checked" />
	</c:if> 
	</c:forTokens>
/>
<label for="mfavorite2" name="mfavorite" value="시/에세이" disabled></label>
시/에세이



 <input type="checkbox" id="mfavorite3" name="mfavorite" disabled value="인문"
	<c:forTokens var="f" items="${m.mfavorite}" delims=",">
	<c:if test="${f eq '인문'}">
	<c:out value="checked" />
	</c:if> 
	</c:forTokens>

/>
<label for="mfavorite3" name="mfavorite" value="인문" disabled></label>

인문 

 <input type="checkbox" id="mfavorite4" name="mfavorite" disabled value="가정/육아"
	<c:forTokens var="f" items="${m.mfavorite}" delims=",">
	<c:if test="${f eq '가정/육아'}">
	<c:out value="checked" />
	</c:if> 
	</c:forTokens>

/>
<label for="mfavorite4" name="mfavorite" value="가정/육아" disabled></label>
가정/육아
  
 <input type="checkbox" id="mfavorite5" name="mfavorite" disabled value="요리"
	<c:forTokens var="f" items="${m.mfavorite}" delims=",">
	<c:if test="${f eq '요리'}">
	<c:out value="checked" />
	</c:if> 
	</c:forTokens>

/>
<label for="mfavorite5" name="mfavorite" value="요리" disabled></label>
요리
 <input type="checkbox" id="mfavorite6" name="mfavorite" disabled value="정치/사회"
	<c:forTokens var="f" items="${m.mfavorite}" delims=",">
	<c:if test="${f eq '정치/사회'}">
	<c:out value="checked" />
	</c:if> 
	</c:forTokens>

/>
<label for="mfavorite6" name="mfavorite" value="정치/사회" disabled></label>
정치/사회
 <input type="checkbox" id="mfavorite7" name="mfavorite" disabled value="경제/경영"
	<c:forTokens var="f" items="${m.mfavorite}" delims=",">
	<c:if test="${f eq '경제/경영'}">
	<c:out value="checked" />
	</c:if> 
	</c:forTokens>

/>
<label for="mfavorite7" name="mfavorite" value="경제/경영" disabled></label>
경제/경영

 <input type="checkbox" id="mfavorite8" name="mfavorite" disabled value="역사/문화"
	<c:forTokens var="f" items="${m.mfavorite}" delims=",">
	<c:if test="${f eq '역사/문화'}">
	<c:out value="checked" />
	</c:if> 
	</c:forTokens>

/>
<label for="mfavorite8" name="mfavorite" value="역사/문화" disabled></label>
역사/문화



 <input type="checkbox" id="mfavorite9" name="mfavorite" disabled value="컴퓨터/IT"
	<c:forTokens var="f" items="${m.mfavorite}" delims=",">
	<c:if test="${f eq '컴퓨터/IT'}">
	<c:out value="checked" />
	</c:if> 
	</c:forTokens>

/>
<label for="mfavorite9" name="mfavorite" value="컴퓨터/IT" disabled></label>
컴퓨터/IT


<input type="checkbox" id="mfavorite10" name="mfavorite" disabled value="건강"
	<c:forTokens var="f" items="${m.mfavorite}" delims=",">
	<c:if test="${f eq '건강'}">
	<c:out value="checked" />
	</c:if> 
	</c:forTokens>

/>
<label for="mfavorite10" name="mfavorite" value="건강" disabled></label>
건강


 <input type="checkbox" id="mfavorite11" name="mfavorite" disabled value="스포츠"
	<c:forTokens var="f" items="${m.mfavorite}" delims=",">
	<c:if test="${f eq '스포츠'}">
	<c:out value="checked" />
	</c:if> 
	</c:forTokens>

/>
<label for="mfavorite11" name="mfavorite" value="스포츠" disabled></label>
스포츠


<input type="checkbox" id="mfavorite12" name="mfavorite" disabled value="자기계발"
	<c:forTokens var="f" items="${m.mfavorite}" delims=",">
	<c:if test="${f eq '자기계발'}">
	<c:out value="checked" />
	</c:if> 
	</c:forTokens>

/>
<label for="mfavorite12" name="mfavorite" value="자기계발" disabled></label>

자기계발

<br /><br />
<input type="button"  value="회원정보 수정" 
			onclick="location.href='${ctx }/mypage/pwCheckForm'">
</body>
</html>