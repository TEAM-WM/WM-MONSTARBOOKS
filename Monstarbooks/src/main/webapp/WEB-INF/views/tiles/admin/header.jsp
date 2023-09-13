<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<aside class="admin-sidebar">
            <div class="admin-logo">
                <h1 aria-label="몬스타북스 :: 관리자">
                </h1>
            </div>
            <nav>
                <ul class="admin-menu-list">
                    <li class="${currentPage == '/admin/' ? 'active' : ''}">
                        <a href="${pageContext.request.contextPath}/admin/">
                            <i class="fa-solid fa-cube"></i>
                            <span>
                                대시보드
                            </span>
                        </a>
                    </li> 
					<li class="${currentPage == '/admin/member' ? 'active' : ''}">
    					<a href="${pageContext.request.contextPath}/admin/member/list">
                            <i class="fa-solid fa-user-astronaut"></i>
                            <span>
                                회원관리
                            </span>
                        </a>
                    </li>
                    <li class="${currentPage == '/admin/product' ? 'active' : ''}">
                        <a href="${pageContext.request.contextPath}/admin/product/productlist">
                            <i class="fa-solid fa-book-open"></i>
                            <span>
                                도서관리
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/order/list">
                            <i class="fa-solid fa-briefcase"></i>
                            <span>
                                주문관리
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/">
                            <i class="fa-solid fa-ticket-simple"></i>
                            <span>
                                쿠폰관리
                            </span>
                        </a>
                    </li>
                    <li class="accordion-button">
                        <a>
                            <i class="fa-solid fa-layer-group"></i>
                            <span>
                                게시판 관리
                            </span>
                        </a>
                        <div class="admin-submenu-list">
                            <ul>
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/adnotice/notice">
                                        공지사항
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/">
                                        FAQ
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/qna/list">
                                        1:1문의
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/review/review">
                                        리뷰 관리
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/banner/list">
                                        배너 관리
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>

            </nav>
        </aside>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
        /* $(document).ready(function() {
            var pageName = "<c:out value="${param.pageName}"/>";
            alert(pageName);
		 });
        */    

        </script>
</body>
</html>