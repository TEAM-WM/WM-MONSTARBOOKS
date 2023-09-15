<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1>이벤트 수정</h1>
<form action="eventmodify" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
    <label for="etitle">제목:</label>
    <input type="text" id="etitle" name="etitle" value="${eventdetail.etitle}"><br>
    <label for="econtent">내용:</label>
    <input type="text" id="econtent" name="econtent" value="${eventdetail.econtent}"><br>
    <label for="efilesrc">첨부 파일:</label>
    <input type="file" id="efilesrc" name="efilesrc"><br>
    <button type="submit">등록</button>
    <input type="hidden" name="eventno" value="${eventdetail.eventno}">
    <a href="event">목록</a>
</form>
</body>
</html>
