<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        /* 마이페이지 사이드바 스타일 */
        .myprofile-sidebar {
            background-color: white;
            width: 250px;
            padding: 20px;
        }

        .profile-image img {
            max-width: 100%;
            border-radius: 50%;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
         }

        .mypofile-menu-list {
            list-style: none;
            padding: 0;
        }

        .menu-item a {
            text-decoration: none;
            display: block;
            padding: 10px 0;
            color: #555;
            transition: background-color 0.3s;
        }

        .menu-item a:hover {
            background-color: #ddd;
            color: #00004B;
        }

        .menu-item i {
            margin-right: 10px;
        }


    </style>
</head>
<body>
    <aside class="myprofile-sidebar">
        <div class="myprofile-logo">
        </div>
        <nav>
            <ul class="mypofile-menu-list">
                <c:choose>
                    <c:when test="${not empty myprofile_view.mprofileimg}">
                        <tr>
                            <td class="center" colspan=2>
                                <div align="left" class="image-container">
                                    <a href="download?p=resources/assets/upload/&f=${myprofile_view.mprofileimg }&mid=${myprofile_view.mid }">
                                        <img src="${pageContext.request.contextPath}/resources/assets/upload/${myprofile_view.mprofileimg }" alt="프로필사진" style="width: 60%; height: auto;" />
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td class="left" colspan=2>
                                <div align="left" class="image-container">
                                    <img src="${pageContext.request.contextPath}/resources/assets/imgs/hyoseul/profile.png" alt="기본이미지" style="max-width: 60%; height: auto;">
                                </div>
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                <li class="menu-item active">
                    <a href="<%=request.getContextPath()%>/myprofile/list">
                        <i class="fa-regular fa-circle-user"></i>
                        <span>프로필 변경</span>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="<%=request.getContextPath()%>/myprofile/myprofile_order">
                        <i class="fa-solid fa-briefcase"></i>
                        <span>주문/배송 목록</span>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="<%=request.getContextPath()%>/myreview/list">
                        <i class="fa-solid fa-pen"></i>
                        <span>리뷰</span>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="<%=request.getContextPath()%>/mycoupon/couponbox">
                        <i class="fa-solid fa-ticket-simple"></i>
                        <span>쿠폰함</span>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="#">
                        <i class="fa-solid fa-comments"></i>
                        <span>1:1문의</span>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="#">
                        <i class="fa-solid fa-user-astronaut"></i>
                        <span>내 정보관리</span>
                    </a>
                </li>
            </ul>
        </nav>
    </aside>
</body>
</html>
