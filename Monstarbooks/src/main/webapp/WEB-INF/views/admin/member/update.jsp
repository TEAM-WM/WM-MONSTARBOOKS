<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/admin/member/update/access" method="post" class="join left">
		<input type="hidden" name="memberno" value="${dto.memberno }" />
		<label for="auth">권한</label>
		<select name="auth" id="auth">
			<option value="관리자"<c:if test="${dto.mauthority eq '관리자'}" >selected</c:if>>관리자</option>
			<option value="사용자"<c:if test="${dto.mauthority eq '사용자'}" >selected</c:if>>사용자</option>
		</select>
		<label for="id">아이디</label>
		<input type="text" name="id" placeholder="아이디를 입력해주세요." id="id" value="${dto.mid }" readonly="readonly">
		
		<label for="pw">비밀번호</label>
		<input type="password" name="pw" placeholder="비밀번호를 입력해주세요" id="pw">
		<span class="form-sapn">비밀번호를 입력하면 수정됩니다.</span>
		
		<label for="name">이름</label>
		<input type="text" name="name" placeholder="이름을 입력해주세요." id="name" value="${dto.mname }" required>
		
        <label for="birth">생년월일</label>
        <input type="date" id="birth" name="birth" placeholder="생년월일을입력해주세요" value="${dto.mbirth }" required>
        
        <label for="tel">전화번호</label>
        <input type="tel" name="tel" id="tel" placeholder="ex)01000000000" value="${dto.mtel }" required>
        
        <label for="email">이메일</label>
        <input type="email" name="email" id="email" placeholder="이메일을 입력하세요" value="${dto.memail }" required>
		<c:set var="favorite" value="${dto.mfavorite}" />
		<label for="favorite">선호장르</label>
		<div class="favorite-box">
			<input type="checkbox" name="favorite" id="favorite01" value="소설" <c:if test="${fn:contains(favorite, '소설')}" >checked</c:if>/>
			<label for="favorite01">소설</label>
			<input type="checkbox" name="favorite" id="favorite02" value="시/에세이"<c:if test="${fn:contains(favorite, '시/에세이')}" >checked</c:if>/>
			<label for="favorite02">시/에세이</label>
			<input type="checkbox" name="favorite" id="favorite03" value="인문"<c:if test="${fn:contains(favorite, '인문')}" >checked</c:if>/>
			<label for="favorite03">인문</label>
			<input type="checkbox" name="favorite" id="favorite04" value="가정/육아"<c:if test="${fn:contains(favorite, '가정/육아')}" >checked</c:if>/>
			<label for="favorite04">가정/육아</label>
			<input type="checkbox" name="favorite" id="favorite05" value="요리"<c:if test="${fn:contains(favorite, '요리')}" >checked</c:if>/>
			<label for="favorite05">요리</label>
			<input type="checkbox" name="favorite" id="favorite06" value="정치/사회"<c:if test="${fn:contains(favorite, '정치/사회')}" >checked</c:if>/>
			<label for="favorite06">정치/사회</label>
			<input type="checkbox" name="favorite" id="favorite07" value="경제/경영"<c:if test="${fn:contains(favorite, '경제/경영')}" >checked</c:if>/>
			<label for="favorite07">경제/경영</label>
			<input type="checkbox" name="favorite" id="favorite08" value="역사/문화"<c:if test="${fn:contains(favorite, '역사/문화')}" >checked</c:if>/>
			<label for="favorite08">역사/문화</label>
			<input type="checkbox" name="favorite" id="favorite09" value="컴퓨터/IT"<c:if test="${fn:contains(favorite, '컴퓨터/IT')}" >checked</c:if>/>
			<label for="favorite09">컴퓨터/IT</label>
			<input type="checkbox" name="favorite" id="favorite10" value="건강"<c:if test="${fn:contains(favorite, '건강')}" >checked</c:if>/>
			<label for="favorite10">건강</label>
			<input type="checkbox" name="favorite" id="favorite11" value="스포츠"<c:if test="${fn:contains(favorite, '스포츠')}" >checked</c:if>/>
			<label for="favorite11">스포츠</label>
			<input type="checkbox" name="favorite" id="favorite12" value="자기계발"<c:if test="${fn:contains(favorite, '자기계발')}" >checked</c:if>/>
			<label for="favorite12">자기계발</label>
		</div>
		
		<input type="submit" value="수정" id="submit">
	</form>

</body>
</html>
