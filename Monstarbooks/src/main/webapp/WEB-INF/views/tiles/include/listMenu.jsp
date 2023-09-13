<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<aside class="aside-wrap">
    <h2>${param.asideTitle }</h2>
    <nav>
        <ul>
            <li class="aside-sub">
                <a href="${pageContext.request.contextPath}/booklist/bestlist">종합베스트</a>
            </li>
            <li class="aside-sub">
                <a href="${pageContext.request.contextPath}/booklist/category?list=kor&code=0">국내도서</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/booklist/category?list=kor&code=1">소설</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/booklist/category?list=kor&code=2">시</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/booklist/category?list=kor&code=3">경제</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/booklist/category?list=kor&code=4">에세이</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/booklist/category?list=kor&code=5">요리</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/booklist/category?list=kor&code=6">문화</a>
            </li>
            <li class="aside-sub">
                <a href="">외국도서</a>
            </li>
            <li>
                <a href="">소설</a>
            </li>
            <li>
                <a href="">시</a>
            </li>
            <li>
                <a href="">경제</a>
            </li>
            <li>
                <a href="">에세이</a>
            </li>
            <li>
                <a href="">요리</a>
            </li>
            <li>
                <a href="">문화</a>
            </li>
        </ul>
    </nav>
</aside>
</body>
</html>