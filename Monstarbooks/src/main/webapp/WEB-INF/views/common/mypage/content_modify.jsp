<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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


input:focus.disableExp,
input:hover.disableExp
{
    outline: none;
    box-shadow: none;
    border: 1px solid #f4f6f9;
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
</style> -->
</head>
<body>
	<c:set var="ctx" value="${pageContext.request.contextPath}" />
	<%-- <link rel="stylesheet" href="${ctx }/resources/css/nstyle.css" /> --%>
	<c:if test="${param.result eq 1 }">
		<script>
			alert('회원정보가 수정되었습니다');
		</script>
	</c:if>
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
					<h3>회원정보 수정</h3>
				</div>
				<form action="${ctx }/mypage/modify" method="post" class="join" style="width:400px;">
				<div class="mypage-content bn">
						<input type="hidden" name="mid" value="${m.mid}">
						<label for="id">아이디 </label>
						<input type="text" id="id" name="mid" value="${m.mid}" disabled />
						<label for="name">이름</label>
						<input type="text" id="name" name="mname" value="${m.mname}" disabled />

						<label for="year">생년월일</label>
						<input type="text" id="mbirth" name="mbirth" size="20"
							value="<fmt:formatDate value="${m.mbirth}" pattern="yyyy-MM-dd" />" />
						
						<label for="cphone">핸드폰번호</label>
						<div class="form-small">
							<input type="text" id="mtel2" name="mtel2"
							value="${fn:substring(m.mtel,0,3)}" size="3" />
						<input type="text" id="mtel3" name="mtel3"
							value="${fn:substring(m.mtel,3,7)}" size="3" />
							<input type="text" id="mtel4" name="mtel4" value="${fn:substring(m.mtel,7,12)}" size="3"/>
						</div>
						<span class="form-sapn left">
						ex ) 010-455-4568
						</span>
						<label for="memail">이메일</label>
						<input
							type="text" id="memail" name="memail" value="${m.memail}" />
						<label for="favorite">키워드</label>
						<c:set var="token" value="소설,시,경제,에세이,요리,문화" />
						<!-- Display Each token -->
						<!-- 소설,시/에세이,인문,가정/육아,요리,정치/사회,경제/경영,역사/문화,컴퓨터/IT,건강,스포츠,자기계발 -->
						<div class="favorite-box left">
							<input type="checkbox" name="mfavorite" id="favorite01" value="소설"
								<c:forTokens var="f" items="${m.mfavorite}" delims=",">
							<c:if test="${f eq '소설'}">
							<c:out value="checked" />
							</c:if> 
							</c:forTokens> />
							<label for="favorite01">소설</label> <input type="checkbox"
								name="mfavorite" id="favorite02" value="시"
								<c:forTokens var="f" items="${m.mfavorite}" delims=",">
							<c:if test="${f eq '시'}">
							<c:out value="checked" />
							</c:if> 
							</c:forTokens> />
							<label for="favorite02">시</label> <input type="checkbox"
								name="mfavorite" id="favorite03" value="경제"
								<c:forTokens var="f" items="${m.mfavorite}" delims=",">
							<c:if test="${f eq '경제'}">
							<c:out value="checked" />
							</c:if> 
							</c:forTokens> />
							<label for="favorite03">경제</label> <input type="checkbox"
								name="mfavorite" id="favorite04" value="에세이"
								<c:forTokens var="f" items="${m.mfavorite}" delims=",">
							<c:if test="${f eq '에세이'}">
							<c:out value="checked" />
							</c:if> 
							</c:forTokens> />
							<label for="favorite04">에세이</label> <input type="checkbox"
								name="mfavorite" id="favorite05" value="요리"
								<c:forTokens var="f" items="${m.mfavorite}" delims=",">
							<c:if test="${f eq '요리'}">
							<c:out value="checked" />
							</c:if> 
							</c:forTokens> />
							<label for="favorite05">요리</label> <input type="checkbox"
								name="mfavorite" id="favorite06" value="문화"
								<c:forTokens var="f" items="${m.mfavorite}" delims=",">
							<c:if test="${f eq '문화'}">
							<c:out value="checked" />
							</c:if> 
							</c:forTokens> />
							<label for="favorite06">문화</label>
						</div>
				</div>
						<input type="submit" value="확인" style="margin-top:40px;"/>
					</form>
			</div>
		</section>
	</article>

	<%-- <h1>회원정보 수정</h1>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ctx }/resources/css/nstyle.css" />
<c:if test="${param.result eq 1 }">
<script>
	alert('회원정보가 수정되었습니다');
</script>
</c:if> --%>

	<!-- enctype="multipart/form-data" -->

</body>
</html>