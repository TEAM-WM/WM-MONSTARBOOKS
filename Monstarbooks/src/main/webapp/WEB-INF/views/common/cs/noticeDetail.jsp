<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="customer-wrap">
                <!-- board-wrap -->
                <section class="board-wrap">
                    <div class="board-detail-header">
                        <h3>
                            ${dto.ntitle }
                        </h3>
                        <p>
                            <fmt:formatDate value="${dto.nregdate }" pattern="yy-MM-dd" />
                        </p>
                    </div><!-- board-detail-header -->
                    <!-- board-detail-content -->
                    <div class="board-detail-content">
						<pre>${dto.ncontent }</pre>

                    </div><!-- board-detail-content -->
                    <div class="board-pagination">
                        <div class="board-prev">
                            이전글
                            <i class="fa-solid fa-caret-up"></i>
                            <c:choose>
								<c:when test="${move.next<9999}">
									<a href="${pageContext.request.contextPath}/cscenter/notice/detail?no=${move.next}">
		                                 ${move.nexttitle }
		                            </a>
								</c:when>
								<c:otherwise>
									<a>
										이전글이 없습니다.
									</a>
								</c:otherwise>
							</c:choose>
                        </div>
                        <div class="board-next">
                            다음글
                            <i class="fa-solid fa-caret-down"></i>
                            <c:choose>
								<c:when test="${move.last<9999}">
									<a href="${pageContext.request.contextPath}/cscenter/notice/detail?no=${move.last}">
		                                 ${move.lasttitle }
		                            </a>
								</c:when>
								<c:otherwise>
									<a>
										다음글이 없습니다.
									</a>
								</c:otherwise>
							</c:choose>
                        </div>
                    </div><!-- board-pagination -->
                    <div class="btn-wrap">
                        <button type="button" onclick="location.href='${pageContext.request.contextPath}/cscenter/notice/'">
                            공지사항 목록
                        </button>
                    </div>
                </section><!-- board-wrap -->
                
            </div><!-- customer-wrap -->
</body>
</html>