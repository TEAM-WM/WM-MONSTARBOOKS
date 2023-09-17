<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function validateForm() {
    var efilesrc = document.getElementById("efilesrc").value;
    if (efilesrc === "") {
        alert("파일을 선택해주세요.");
        return false; // 폼 전송을 중지합니다.
    }
}
</script>
</head>
<body>
<h1>배너수정</h1>
<form action="bannermodify" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
    <label for="etitle">제목:</label>
    <input type="text" id="etitle" name="etitle" value="${bannerdetail.etitle}"><br>
    <label for="efilesrc">첨부 파일: ${bannerdetail.efilesrc}</label>
    <input type="file" id="efilesrc" name="efilesrc"><br>
	<button type="submit">수정</button>
    <a href="list">목록</a>
    <input type="hidden" name="bannerno" value="${bannerdetail.bannerno}">
</form>
</body>
</html>
