<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="customer-wrap">
                <!-- customer-title-wrap -->
                <div class="customer-title-wrap">
                    <h2>
                        무엇을 도와드릴까요?<br>
                        <strong>몬스타북스 고객센터</strong>입니다.
                    </h2>
                </div>
                <!-- customer-subtitle-wrap -->
                <div class="customer-subtitle-wrap">
                    <h3>자주 묻는 질문</h3>
                    <strong>
                        <a href="${pageContext.request.contextPath}/cscenter/faq">더보기 +</a>
                    </strong>
                </div>
                <!-- customer-subtitle-wrap -->
                <!-- customer-search-box -->
                <div class="customer-search-box">
                    <div class="customer-search-input">
                        <form action="${pageContext.request.contextPath}/cscenter/faq" method="post">
                            <input type="text" name="word" placeholder="질문을 검색해보세요.">
                            <input type="submit" value="검색">
                        </form>
                    </div>
                </div>
                <!-- customer-search-box -->
                <!-- faq-category-list -->
                <div class="faq-category-list">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/cscenter/faq?code=1">반품/교환/환불</a></li>
                        <li><a href="${pageContext.request.contextPath}/cscenter/faq?code=2">주문/결제</a></li>
                        <li><a href="${pageContext.request.contextPath}/cscenter/faq?code=3">배송/수령일 안내</a></li>
                    </ul>
                </div>
                <!-- faq-category-list -->
                <!-- customer-subtitle-wrap -->
                <div class="customer-subtitle-wrap">
                    <h3>1:1문의</h3>
                </div>
                <!-- customer-subtitle-wrap -->
                <!-- customer-inquiry-box -->
                <div class="customer-inquiry-box">
                    <div class="box">
                        <a href="${pageContext.request.contextPath}/qna/write_view" class="box-content">
                            <span class="box-icon">
                                <i class="fa-regular fa-comment-dots"></i>
                            </span>
                            <p class="name">1:1 문의 접수</p>
                        </a>
                        
                    </div>
                    <div class="box">
                        <a href="${pageContext.request.contextPath}/qna/list" class="box-content">
                            <span class="box-icon">
                                <i class="fa-regular fa-file-lines"></i>
                            </span>
                            <p class="name">1:1 문의 내역</p>
                        </a>
                    </div>
                    <div class="box call">
                        <p class="title">전화 상담</p>
                        <a href="tel:1004-1004" class="tel">1004-1004</a>
                        <p class="desc">평일 09:00~18:00 (주말 및 공휴일 휴무)</p>
                    </div>
                </div>
                <!-- customer-inquiry-box -->
                <!-- customer-subtitle-wrap -->
                <div class="customer-subtitle-wrap">
                    <h3>공지사항</h3>
                    <strong>
                        <a href="${pageContext.request.contextPath}/cscenter/notice">더보기 +</a>
                    </strong>
                </div>
                <!-- customer-subtitle-wrap -->
                <!-- customer-table-wrap -->
                <div class="customer-table-wrap">
                    <table>
                        <colgroup>
                            <col style="width: 75px">
                            <col style="width: auto;">
                            <col style="width: 124px;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>
                                    1
                                </td>
                                <td class="left">
                                    <a href="">교보문고 개인정보 처리방침 변경 안내 (9/8)교보문고 개인정보 처리방침 변경 안내 (9/8)교보문고 개인정보 처리방침 변경 안내 (9/8)교보문고 개인정보 처리방침 변경 안내 (9/8)교보문고 개인정보 처리방침 변경 안내 (9/8)교보문고 개인정보 처리방침 변경 안내 (9/8)교보문고 개인정보 처리방침 변경 안내 (9/8)교보문고 개인정보 처리방침 변경 안내 (9/8)</a>
                                </td>
                                <td>2023.09.01</td>
                            </tr>
        
                            <tr>
                                <td>
                                    2
                                </td>
                                <td class="left">
                                    <a href="">교보북클럽 회원 개인정보 이용내역 안내</a>
                                </td>
                                <td>2023.07.21</td>
                            </tr>
        
                            <tr>
                                <td>
                                    3
                                </td>
                                <td class="left">
                                    <a href="">교보문고 개인정보 처리방침 변경 안내 (7/1)</a>
                                </td>
                                <td>2023.06.23</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- customer-table-wrap -->
            </div>
        <!-- customer-wrap -->
</body>
</html>