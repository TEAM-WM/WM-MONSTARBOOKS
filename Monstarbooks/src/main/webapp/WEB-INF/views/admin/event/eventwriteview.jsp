<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>이벤트 글쓰기</h1>
<form action="eventwrite" method="post" enctype="multipart/form-data">
    <label for="etitle">제목:</label>
    <input type="text" id="etitle" name="etitle"><br>
    <label for="econtent">내용:</label>
    <input type="text" id="econtent" name="econtent"><br>
    <label for="efilesrc">첨부 파일:</label>
    <input type="file" id="efilesrc" name="efilesrc"><br>
    <button type="submit">등록</button>
    
    <a href="event">목록</a>
</form>
</body>
</html>