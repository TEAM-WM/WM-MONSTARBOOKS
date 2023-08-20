// 프로그레스바
let timerId;

const get = (target) => {
  return document.querySelector(target);
};

const $progressBar = get('.progress-bar');

const onScroll = () => {
  const scrollTop = document.documentElement.scrollTop;
  // console.log(scrollTop);

  const height = //보여지는 영역을 제외한 길이
    document.documentElement.scrollHeight - //스크롤의 총길이
    document.documentElement.clientHeight; //보여지는 영역

  //progress-bar 의 width 값 채우기
  const scrollWidth = (scrollTop / height) * 100;
  $progressBar.style.width = scrollWidth + '%'; //스타일 변경
};

window.addEventListener('scroll', () => onScroll());

// 프로그레스바 종료

// fiexed 가로 스크롤 짤림
window.addEventListener('scroll', () => {
  const bwLeft = window.scrollX;
  // console.log(bwLeft);
  document.querySelector('.global-header').style.left = `-${bwLeft}px`;
});
// fiexed 가로 스크롤 짤림 종료

// 스크롤시 메뉴 작게
const navbar = document.querySelector('.global-header');
const navbarHeight = navbar.getBoundingClientRect().height;
//arrow function
document.addEventListener('scroll', () => {
  // console.log('scollY' + window.scrollY);
  // console.log('navbarHeight' + navbarHeight);
  if (window.scrollY >= navbarHeight - 50) {
    navbar.classList.add('small-header');
  } else {
    navbar.classList.remove('small-header');
  }
});
// 스크롤시 메뉴 작게 종료

// 검색창 클릭시 히스토리 창 출력
const searchInput = document.querySelector('.global-search form input');
const searchHistory = document.querySelector('.global-search-history');

displaySearch = () => {
  searchInput.classList.toggle('active');
  searchHistory.classList.toggle('active');
};

searchInput.addEventListener('click', displaySearch);
// document.addEventListener('mouseup',()=>{
//   searchInput.classList.remove('active');
//   searchHistory.classList.remove('active');
// });

// 전체 메뉴 버튼 클릭시 전체메뉴 출력
const menuBtn = document.querySelector('.btn_menu');
const allMenu = document.querySelector('.global-all-menu');
menuBtn.addEventListener('click', () => {
  menuBtn.classList.toggle('active');
  allMenu.classList.toggle('active');
});

// 스크롤 내리면 화살표 보이게
const arrowUp = document.querySelector('.arrow-up');
document.addEventListener('scroll', () => {
  if (window.scrollY > 100 / 2) {
    arrowUp.classList.add('visible');
  } else {
    arrowUp.classList.remove('visible');
  }
});

// 화살표 클릭하면 위로 가기
arrowUp.addEventListener('click', () => {
  scrollIntoView('body');
});

function scrollIntoView(selector) {
  //https://developer.mozilla.org/ko/docs/Web/API/Element/scrollIntoView
  const scrollTo = document.querySelector(selector);
  scrollTo.scrollIntoView({ behavior: 'smooth' });
}

// 메인 슬라이드
const swiper = new Swiper('.swiper.main', {
  autoplay: true,
  loop: true,
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },
  pagination: {
    el: '.swiper-pagination',
    type: 'bullets',
    clickable: true, // 페이징을 클릭하면 해당 영역으로 이동
  },
  effect: 'slide',
  observer: true,
  observeParents: true,
});

// 새로나온책 슬라이드
const swiper2 = new Swiper('.swiper.book', {
  slidesPerView: 5,
  slidesPerGroup: 1,
  centeredSlides: false, //왼쪽부터 순차적으로 슬라이드가 들어섬
  observer: true,
  observeParents: true,
  spaceBetween: 35,
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },
});
// 위클리 썸네일  슬라이더
const sliderThumbnail = new Swiper(".slider-thumbnail", {
  slidesPerView: 3,
  slidesPerGroup: 1,
  centeredSlides: false,
  observer: true,
  observeParents: true,
  spaceBetween: 4,
  loop: true,
  freeMode: true,
  atchSlidesProgress: true,
});

const sliderWeekly = new Swiper(".slider-weekly", {
  loop: true,
  slidesPerView: 1,
  centeredSlides: false, //왼쪽부터 순차적으로 슬라이드가 들어섬
  observer: true,
  observeParents: true,
  spaceBetween: 35,
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },
  thumbs: {
    swiper: sliderThumbnail,
  },
});