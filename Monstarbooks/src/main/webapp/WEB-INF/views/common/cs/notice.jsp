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
                <!-- customer-title-wrap -->
                <div class="customer-title-wrap">
                    <h2>
                        <strong>공지사항</strong>입니다.
                    </h2>
                </div>
                <!-- customer-subtitle-wrap -->
                <div class="customer-subtitle-wrap">
                    <h3>공지사항 검색</h3>
                </div>
                <!-- customer-subtitle-wrap -->
                <!-- customer-search-box -->
                <div class="customer-search-box">
                    <div class="customer-search-input">
                        <form action="${pageContext.request.contextPath}/cscenter/notice" method="post">
                            <input type="text" name="word" placeholder="검색어를 입력해보세요." value="${searchKey }">
                            <input type="submit" value="검색">
                        </form>
                    </div>
                </div>
                <!-- customer-search-box -->
                <!-- customer-content -->
                <div class="customer-content">
                    <div class="customer-result">
                        <p>
                            <strong>
                                ${count }
                            </strong>
                            건
                        </p>
                    </div>
                    <!-- customer-result -->
                    <!-- customer-table-wrap -->
                    <c:choose>
                    	<c:when test="${count ne 0 }">
                    		<div class="customer-table-wrap">
		                        <table>
		                            <colgroup>
		                                <col style="width: 75px">
		                                <col style="width: auto;">
		                                <col style="width: 124px;">
		                            </colgroup>
		                            <thead>
		                                <tr>
		                                    <th>
		                                        번호
		                                    </th>
		                                    <th>
		                                        제목
		                                    </th>
		                                    <th>
		                                        작성날짜
		                                    </th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                            <c:forEach items="${dto }" var="dto">
		                            	<tr>
		                                    <td>
												${dto.noticeno }
		                                    </td>
		                                    <td class="left">
		                                        <a href="${pageContext.request.contextPath}/cscenter/notice/detail?no=${dto.noticeno }">
		                                        	${dto.ntitle }
		                                        </a>
		                                    </td>
		                                    <td>
		                                    	<fmt:formatDate value="${dto.nregdate }" pattern="yy-MM-dd" />
		                                    </td>
		                                </tr>
		                            </c:forEach>
		                            </tbody>
		                        </table>
		                    </div>
		                    <!-- customer-table-wrap -->
                    	</c:when>
                    	<c:otherwise>
                    		<div class="warning">
                    			검색 내역이 없습니다.
                    		</div>
                    	</c:otherwise>
                    </c:choose>
                    <!-- pagination-wrap -->
                    <div class="pagination-wrap">
                        <!-- pagination -->
                        <div class="pagination">
                            <ol>
								<c:choose>
									<c:when test="${searchVO.page>1}">
										<li><a href="notice?page=1"><i class="fa-solid fa-angles-left"></i></a></li>
										<li><a href="notice?page=${searchVO.page-1 }"><i class="fa-solid fa-angle-left"></i></a></li>
									</c:when>
									<c:otherwise>
										<li class="disabled">
											<a>
												<i class="fa-solid fa-angles-left"></i>
											</a>
										</li>
										<li class="disabled">
											<a>
												<i class="fa-solid fa-angle-left"></i>
											</a>
										</li>
									</c:otherwise>
								</c:choose>
								<!-- 14 -->
								<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
									<c:choose>
										<c:when test="${i eq searchVO.page }">
											<!-- 내가 클릭한 페이지의 숫자랑 같냐 -->
											<li class="current-page">
												<a>
													${i }
												</a>
											</li>
										</c:when>
										<c:otherwise>
											<li>
												<a href="notice?page=${i }&word=${searchKey }">${i }</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${searchVO.page < searchVO.totPage}">
										<li><a href="notice?page=${searchVO.page+1 }"><i class="fa-solid fa-angle-right"></i></a></li>
										<li><a href="notice?page=${searchVO.totPage }"><i class="fa-solid fa-angles-right"></i></a></li>
									</c:when>
									<c:otherwise>
										<li class="disabled">
											<a>
												<i class="fa-solid fa-angle-right"></i>
											</a>
										</li>
										<li class="disabled">
											<a>
												<i class="fa-solid fa-angles-right"></i>
											</a>
										</li>
									</c:otherwise>
								</c:choose>
                            </ol>
                        </div>
                        <!-- pagination -->
                    </div>
                    <!-- pagination-wrap -->
                </div>
                <!-- customer-content -->
            </div>
        <!-- customer-wrap -->
</body>
</html>