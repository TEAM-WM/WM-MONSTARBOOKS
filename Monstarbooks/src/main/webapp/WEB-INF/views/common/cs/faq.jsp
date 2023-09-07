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
		<div class="customer-wrap">
                <!-- customer-title-wrap -->
                <div class="customer-title-wrap">
                    <h2>
                        <strong>자주 묻는 질문</strong>입니다.
                    </h2>
                </div>
                <!-- customer-subtitle-wrap -->
                <div class="customer-subtitle-wrap">
                    <h3>질문 검색</h3>
                </div>
                <!-- customer-subtitle-wrap -->
                <!-- customer-search-box -->
                <div class="customer-search-box">
                    <div class="customer-search-input">
                        <form action="${pageContext.request.contextPath}/cscenter/faq" method="post">
                            <input type="text" name="word" placeholder="질문을 검색해보세요." value="${word }">
                            <input type="submit" value="검색">
                        </form>
                    </div>
                </div>
                <!-- customer-search-box -->
                <!-- faq-category-list -->
                <div class="faq-category-list faq-sub">
                    <ul>
                        <li <c:if test="${code eq '0'}">class='active'</c:if> ><a href="${pageContext.request.contextPath}/cscenter/faq?code=0">전체</a></li>
                        <li <c:if test="${code eq '1'}">class='active'</c:if> ><a href="${pageContext.request.contextPath}/cscenter/faq?code=1">반품/교환/환불</a></li>
                        <li <c:if test="${code eq '2'}">class='active'</c:if> ><a href="${pageContext.request.contextPath}/cscenter/faq?code=2">주문/결제</a></li>
                        <li <c:if test="${code eq '3'}">class='active'</c:if> ><a href="${pageContext.request.contextPath}/cscenter/faq?code=3">배송/수령일 안내</a></li>
                    </ul>
                </div>
                <!-- faq-category-list -->

                <section class="accordion-wrap faq-acc">
                    <ul>
                    <c:forEach items="${dto }" var="dto">
                        <li>
                            <button type="button">${dto.fquestion }</button>
                            <div class="accordion-item">
                                <pre>${dto.fanswer }</pre>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
                </section><!--accordion-wrap-->
            </div>
        <!-- customer-wrap -->
        <script src="${pageContext.request.contextPath}/resources/assets/js/common.js"></script>
</body>
</html>