<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
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
 
<label for="cphone">핸드폰번호 : </label>
 <input type="text" id="mtel2" name="mtel2" 
 value="${fn:split(m.mtel,'-')[0]}" size="3" disabled class="disableExp" style="display:inline-block;width:350px;"/>
<input type="text" id="mtel3" name="mtel3" 
value="${fn:split(m.mtel,'-')[1]}" size="3"  disabled class="disableExp" style="display:inline-block;width:350px;"/> 
<input type="text" id="mtel4" name="mtel4" 
value="${fn:split(m.mtel,'-')[2]}" size="3" disabled class="disableExp" style="display:inline-block;width:350px;"/>  
예)010-455-4568<br />
<label for="email">이메일:</label> 
<input type="text" id="memail" name="memail" 
value="${m.memail}" disabled class="disableExp"/>

 <br />



<label for="habit">취미:</label> 
	<c:set var="token" value="music,movie,trip" />
	
	<!-- Display Each token -->

<input type="checkbox" id="mfavorite1" name="mfavorite" value="music" 
	<c:forTokens var="f" items="${m.mfavorite}" delims=",">
	<c:if test="${f eq 'music'}">
	<c:out value="checked" />
	</c:if> 
	</c:forTokens>
	/>
<label for="mfavorite1" ></label>
음악


<input type="checkbox" id="mfavorite2" name="mfavorite" value="movie" 
	<c:forTokens var="f" items="${m.mfavorite}" delims=",">
	<c:if test="${f eq 'movie'}">
	<c:out value="checked" />
	</c:if> 
	</c:forTokens>
/>
<label for="mfavorite2"  ></label>
음악




 <input type="checkbox" id="mfavorite3" name="mfavorite" value="trip"
	<c:forTokens var="f" items="${m.mfavorite}" delims=",">
	<c:if test="${f eq 'trip'}">
	<c:out value="checked" />
	</c:if> 
	</c:forTokens>

/>
<label for="mfavorite3"  ></label>
여행 <br />

 

  <%-- <c:forEach var="tel" items="${m.mtel}" begin="0" end="2"  varStatus="status">  --%>
<%-- <c:set var="tel3" value="${tel.index eq 0} " /> --%>
<%--  <c:out value="${tel}"/> --%>
<%-- <c:set var="tel3" value="${tel[1]}" />
<c:set var="tel4" value="${tel[2]}" />  //${tel(0) } :  --%>
 <%--  </c:forEach> --%>
<br /><br />
<input type="button"  value="회원정보 수정" 
			onclick="location.href='${ctx }/member/pwCheckForm'">
</body>
</html>