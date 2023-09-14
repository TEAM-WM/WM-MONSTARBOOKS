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
<!-- <style>
.disableExp{
background-color: #f4f6f9;
cursor:default;

}
</style>
 -->
</head>
<body>
<article class="mypage-wrap">
	<section class="mypage-section-wrap">
		<jsp:include page="/WEB-INF/views/tiles/include/mypageMenu.jsp">
			<jsp:param name="name" value="${m.mname}" />
			<jsp:param name="img" value="${m.mprofileimg}" />
			<jsp:param name="id" value="${m.mid }" />
		</jsp:include>
		<c:set var="ctx" value="${pageContext.request.contextPath}" />
		<div class="mypage-content-box">
			<div class="mypage-title">
				<h3>회원정보 관리</h3>
			</div> 
			<div class="mypage-content">
			<table>
				<tr>
					<th>아이디</th>
					<td>
						${m.mid}
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						${m.mname}
					</td>
				</tr>
				<tr>
					<th>
						생년월일
					</th>
					<td>
						<fmt:formatDate value="${m.mbirth}" pattern="yy-MM-dd" />
					</td>
				</tr>
				<tr>
					<th>
						핸드폰번호
					</th>
					<td>
						${fn:substring(m.mtel,0,3)}-${fn:substring(m.mtel,3,7)}-${fn:substring(m.mtel,7,12)}
					</td>
				</tr>
				<tr>
					<th>
						이메일
					</th>
					<td>
						${m.memail}
					</td>
				</tr>
				<tr>
					<th>
						취미
					</th>
					<td>
					<c:set var="token" value="소설,시,경제,에세이,요리,문화" />
					<!-- Display Each token -->
					<!-- 소설,시/에세이,인문,가정/육아,요리,정치/사회,경제/경영,역사/문화,컴퓨터/IT,건강,스포츠,자기계발 -->
					<div class="favorite-box" style="margin:0">
						<input type="checkbox" name="favorite" id="favorite01" value="소설" disabled
						<c:forTokens var="f" items="${m.mfavorite}" delims=",">
							<c:if test="${f eq '소설'}">
							<c:out value="checked" />
							</c:if> 
							</c:forTokens>
							/>
						<label for="favorite01">소설</label>
						<input type="checkbox" name="favorite" id="favorite02" value="시" disabled
						<c:forTokens var="f" items="${m.mfavorite}" delims=",">
							<c:if test="${f eq '시'}">
							<c:out value="checked" />
							</c:if> 
							</c:forTokens>
						/>
						<label for="favorite02">시</label>
						<input type="checkbox" name="favorite" id="favorite03" value="경제" disabled
						<c:forTokens var="f" items="${m.mfavorite}" delims=",">
							<c:if test="${f eq '경제'}">
							<c:out value="checked" />
							</c:if> 
							</c:forTokens>
						/>
						<label for="favorite03">경제</label>
						<input type="checkbox" name="favorite" id="favorite04" value="에세이" disabled
						<c:forTokens var="f" items="${m.mfavorite}" delims=",">
							<c:if test="${f eq '에세이'}">
							<c:out value="checked" />
							</c:if> 
							</c:forTokens>
						
						/>
						<label for="favorite04">에세이</label>
						<input type="checkbox" name="favorite" id="favorite05" value="요리" disabled
						<c:forTokens var="f" items="${m.mfavorite}" delims=",">
							<c:if test="${f eq '요리'}">
							<c:out value="checked" />
							</c:if> 
							</c:forTokens>
						/>
						<label for="favorite05">요리</label>
						<input type="checkbox" name="favorite" id="favorite06" value="문화" disabled
						<c:forTokens var="f" items="${m.mfavorite}" delims=",">
							<c:if test="${f eq '문화'}">
							<c:out value="checked" />
							</c:if> 
							</c:forTokens>
						/>
						<label for="favorite06">문화</label>
					</div>
					</td>
				</tr>
			</table>
			</div>
			<div class="cart-btn-box" style="margin-top:40px; width:150px;">
				<input type="button" class="btn-a" value="회원정보 수정" 
				onclick="location.href='${ctx }/mypage/pwCheckForm'">
			</div>
		</div>
	</section>
</article>

<%-- <link rel="stylesheet" href="${ctx }/resources/css/nstyle.css" /> --%>

<%-- <label for="id">아이디 : </label>
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
value="${m.memail}" disabled class="disableExp"/>--%>
 

 <br />





<!-- <label for="habit" style="margin-bottom:15px;">취미</label> --> 
	<%-- <c:set var="token" value="소설,시/에세이,인문,가정/육아,요리,정치/사회,경제/경영,역사/문화,컴퓨터/IT,건강,스포츠,자기계발" /> --%>
	
	<!-- Display Each token -->
<!-- 소설,시/에세이,인문,가정/육아,요리,정치/사회,경제/경영,역사/문화,컴퓨터/IT,건강,스포츠,자기계발 -->
<%-- <input type="checkbox" id="mfavorite1" name="mfavorite" class="disableExp" disabled value="소설" 
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
 --%>
</body>
</html>