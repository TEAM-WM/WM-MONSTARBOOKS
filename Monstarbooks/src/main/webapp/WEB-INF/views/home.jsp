<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<!-- 캐러셀슬라이드 -->
            <div class="swiper main">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/assets/imgs/kyobo.jpg" alt=""></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/assets/imgs/kyobo2.jpg" alt=""></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/assets/imgs/kyobo3.jpg" alt="고요하게 휘몰아치는 문학 최은영 5년만의 신작 소설집">
                    </div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/assets/imgs/slide1.png" alt="베르나르 베르베르 작가전"></div>
                </div>
                <div class="swiper-pagination"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
            <!-- 이주의책 -->
            <article class="main-weekly-wrap">
                <div class="main-content-title">
                    <div class="main-content-title-left">
                        <h2>
                            이주의 책
                        </h2>
                    </div>
  <!--                   <strong>
                        <a href="">더보기 +</a>
                    </strong> -->
                </div>
                <article class="main-weekly-slides">
                    <section class="slider-weekly">
                        <div class="swiper-wrapper">
                            <div class="product-card swiper-slide">
                                <div class="product-card-image">
                                    <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791169259651.jpg"
                                        alt="">
                                </div>
                                <div class="product-info">
                                    <div class="product-card-title">
                                        <h3>
                                            <a href="">
                                                샬롯의 거미줄(70주년 기념 특별판)
                                            </a>
                                        </h3>
                                    </div>
                                    <strong aria-label="저자 / 출판사" class="product-card-author">엘윈 브룩스 화이트 · 시공주니어</strong>
                                    <div class="product-price">
                                        <span class="percent">10%</span>
                                        <span class="price">14,400 원</span>
                                    </div>
                                    <p class="product-md-comment">뉴베리 아너 상 수상작! 70주년 기념 특별판</p>
                                    <p class="product-md-desc">
                                        1952년 출간된 이래 전 세계적으로 사랑을 받아 온 아동 문학의 고전이자 스테디셀러!
                                        거미 샬롯과 돼지 윌버가 전해 주는 진정한 우정과 인생의 가치를 담은 작품
                                        1952년 출간된 이래 전 세계적으로 사랑을 받아 온 아동 문학의 고전이자 스테디셀러!
                                        거미 샬롯과 돼지 윌버가 전해 주는 진정한 우정과 인생의 가치를 담은 작품
                                    </p>
                                </div>
                            </div><!-- product-card 종료 -->
                            <div class="product-card swiper-slide">
                                <div class="product-card-image">
                                    <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788997066841.jpg"
                                        alt="">
                                </div>
                                <div class="product-info">
                                    <div class="product-card-title">
                                        <h3>
                                            <a href="">
                                                잃어버린 사람
                                            </a>
                                        </h3>
                                    </div>
                                    <strong aria-label="저자 / 출판사" class="product-card-author">김숨 · 모요사</strong>
                                    <div class="product-price">
                                        <span class="percent">10%</span>
                                        <span class="price">18,000 원</span>
                                    </div>
                                    <p class="product-md-comment">당신의 그리고 우리의 이야기</p>
                                    <p class="product-md-desc">
                                        1947년 9월 16일. ‘뜨내기들의 천국’ 부산에서 하루 동안 벌어진 이야기.
                                        암울한 역사, 바깥으로 밀려난 잃어버린 사람들의 역사를 처연하고 아름답게 그린다.
                                    </p>
                                </div>
                            </div><!-- product-card 종료 -->
                            <div class="product-card swiper-slide">
                                <div class="product-card-image">
                                    <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791168126626.jpg"
                                        alt="">
                                </div>
                                <div class="product-info">
                                    <div class="product-card-title">
                                        <h3>
                                            <a href="">
                                                황금성: 백 년이 넘은 식당
                                            </a>
                                        </h3>
                                    </div>
                                    <strong aria-label="저자 / 출판사" class="product-card-author">리사 이 · 위즈덤하우스</strong>
                                    <div class="product-price">
                                        <span class="percent">10%</span>
                                        <span class="price">16,200 원</span>
                                    </div>
                                    <p class="product-md-comment">2023 뉴베리 아너상 수상작!</p>
                                    <p class="product-md-desc">
                                        이민자가 겪는 차별과 부당함을 어린이의 시선으로 풀어낸
                                        『황금성』. 우리 사회가 지닌 높은 편견의 벽과, 그 벽을 부수고 넘어가고자 하는 사람들의 따뜻한 다정함
                                    </p>
                                </div>
                            </div><!-- product-card 종료 -->
                            <div class="product-card swiper-slide">
                                <div class="product-card-image">
                                    <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788925576152.jpg"
                                        alt="">
                                </div>
                                <div class="product-info">
                                    <div class="product-card-title">
                                        <h3>
                                            <a href="">
                                                이것은 라울 뒤피에 관한 이야기
                                            </a>
                                        </h3>
                                    </div>
                                    <strong aria-label="저자 / 출판사" class="product-card-author">이소영 · 알에이치코리아</strong>
                                    <div class="product-price">
                                        <span class="percent">10%</span>
                                        <span class="price">22,500 원</span>
                                    </div>
                                    <p class="product-md-comment">다채로운 빛의 화가 라울 뒤피의 이야기</p>
                                    <p class="product-md-desc">
                                        경쾌한 붓질과 다채로운 색채로 사람들을 끌어당기는 화가.
                                        '삶은 즐거운 음악처럼’이라는 인생관을 모토로 긍정적인 마음을 그림으로 표현한 라울 뒤피를 만나다.
                                    </p>
                                </div>
                            </div><!-- product-card 종료 -->
                            <div class="product-card swiper-slide">
                                <div class="product-card-image">
                                    <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791198129161.jpg"
                                        alt="">
                                </div>
                                <div class="product-info">
                                    <div class="product-card-title">
                                        <h3>
                                            <a href="">
                                                채소 식탁
                                            </a>
                                        </h3>
                                    </div>
                                    <strong aria-label="저자 / 출판사" class="product-card-author">김경민 · 래디시</strong>
                                    <div class="product-price">
                                        <span class="percent">10%</span>
                                        <span class="price">17,100 원</span>
                                    </div>
                                    <p class="product-md-comment">10만 팔로워가 인정한 화제의 메뉴 100</p>
                                    <p class="product-md-desc">
                                        “내가 알던 그 채소가 맞나요?” 채소와 두부 응용 요리로 건강하고 맛있게 챙겨 먹는 채소 덮밥, 면, 토스트, 김밥, 스페셜 한입 요리 레시피
                                    </p>
                                </div>
                            </div><!-- product-card 종료 -->
                            <div class="product-card swiper-slide">
                                <div class="product-card-image">
                                    <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788932923451.jpg"
                                        alt="">
                                </div>
                                <div class="product-info">
                                    <div class="product-card-title">
                                        <h3>
                                            <a href="">
                                                스파이와 배신자
                                            </a>
                                        </h3>
                                    </div>
                                    <strong aria-label="저자 / 출판사" class="product-card-author">벤 매킨타이어 · 열린책들</strong>
                                    <div class="product-price">
                                        <span class="percent">10%</span>
                                        <span class="price">28,800 원</span>
                                    </div>
                                    <p class="product-md-comment">스파이 소설만큼이나 흥미진진한 실화</p>
                                    <p class="product-md-desc">
                                        KGB와 M16을 오가며 냉전 시대의 종식을 앞당긴 올레크 고르디옙스키. 이중스파이로서의 그의 삶을 한 편의 스파이 소설처럼 몰입감과 속도감 있게
                                        펼쳐낸다.
                                    </p>
                                </div>
                            </div><!-- product-card 종료 -->
                        </div><!-- 슬라이드 랩 종료 -->
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    </section><!-- 슬라이드 위클리 종료 -->
                    <!-- 썸네일 슬라이드 시작-->
                    <section class="slider-thumbnail">
                        <div class="swiper-wrapper">
                            <div class="product-card swiper-slide">
                                <div class="product-card-image">
                                    <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791169259651.jpg"
                                        alt="">
                                </div>
                            </div>
                            <div class="product-card swiper-slide">
                                <div class="product-card-image">
                                    <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788997066841.jpg"
                                        alt="">
                                </div>
                            </div>
                            <div class="product-card swiper-slide">
                                <div class="product-card-image">
                                    <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791168126626.jpg"
                                        alt="">
                                </div>
                            </div>
                            <div class="product-card swiper-slide">
                                <div class="product-card-image">
                                    <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788925576152.jpg"
                                        alt="">
                                </div>
                            </div>
                            <div class="product-card swiper-slide">
                                <div class="product-card-image">
                                    <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791198129161.jpg"
                                        alt="">
                                </div>
                            </div>
                            <div class="product-card swiper-slide">
                                <div class="product-card-image">
                                    <img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788932923451.jpg"
                                        alt="">
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- 썸네일 슬라이드 종료 -->
                </article>

            </article>
            <!-- 베스트 -->
            <article class="main-best-wrap">
                <div class="main-content-title">
                    <div class="main-content-title-left">
                        <h2>
                            베스트
                        </h2>
                        <ul>
                            <li class="active">
                                <a>전체</a>
                            </li>
                            <!-- <li>
                                <a href="">국내도서</a>
                            </li>
                            <li>
                                <a href="">외국도서</a>
                            </li> -->
                        </ul>
                    </div>
                    <strong>
                        <a href="${pageContext.request.contextPath}/booklist/bestlist">더보기 +</a>
                    </strong>
                </div>
                <ul class="main-product-list">
                	<c:forEach items="${best }" var="list" begin="0" end="9">
                	<li onclick="location.href='${pageContext.request.contextPath}/booklist/bookdetail?bookno=${list.bookno }';">
                		<span class='rank'>${list.num }</span>
                		<div class='product-card'>
                		<div class='product-card-image'><img src='${pageContext.request.contextPath}/resources/assets/imgs/product/${list.detail.bimg }' alt='썸네일'></div>
                		<div class='product-card-title'><h3>${list.btitle }</h3></div>
                		<strong aria-label='저자 / 출판사' class='product-card-author'>${list.bwriter } · ${list.bpublisher }</strong>
                		</div>
                	</li>
                	</c:forEach>
                </ul>
            </article>
            <!-- 신상책 -->
            <article class="main-new-wrap">
                <div class="main-content-title">
                    <div class="main-content-title-left">
                        <h2>
                            새로 나왔어요
                        </h2>
                        <ul>
                            <li class="active">
                                <a>전체</a>
                            </li>
                        </ul>
                    </div>
                    <strong>
                        <a href="${pageContext.request.contextPath}/booklist/new">더보기 +</a>
                    </strong>
                </div>
                <div class="swiper book">
                    <ul class="main-product-list swiper-wrapper">
	                <c:forEach items="${newlist }" var="list" begin="0" end="9">
		                    <li onclick="location.href='${pageContext.request.contextPath}/booklist/bookdetail?bookno=${list.bookno }';" class='swiper-slide'>
		                    <div class='product-card'>
		                    <div class='product-card-image'><img src='${pageContext.request.contextPath}/resources/assets/imgs/product/${list.detail.bimg }' alt='썸네일'></div>
		                    <div class='product-card-title'><h3>${list.btitle }</h3></div>
		                    <strong aria-label='저자 / 출판사' class='product-card-author'>${list.bwriter } · ${list.bpublisher }</strong>
		                    </div></li>
					</c:forEach>
					</ul>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>

            </article>
</body>
</html>