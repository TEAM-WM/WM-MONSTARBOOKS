// 달력 오늘 날짜 이후로 선택 금지
const now_utc = Date.now(); // 지금 날짜를 밀리초로
// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
const timeOff = new Date().getTimezoneOffset() * 60000; // 분단위를 밀리초로 변환
// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
const today = new Date(now_utc - timeOff).toISOString().split('T')[0];
document.querySelector('#birth').setAttribute('max', today);

// 아코디언
const acc = document.querySelectorAll('.accordion-wrap li');


for (let i = 0; i < acc.length; i++) {
  acc[i].querySelector('button').addEventListener('click', function (e) {
    const accItem = acc[i].querySelector('.accordion-item');
    // 현재 클릭한 아이템을 제외한 다른 애들 닫기
    for (let j = 0; j < acc.length; j++) {
      if (j !== i) {
        acc[j].classList.remove('active');
      }
    }
    acc[i].classList.toggle('active');
  });
}

// 탭 활성화
const tabItem = document.querySelectorAll('.tab-list li')
const tabContent = document.querySelectorAll('.tab-content')

tabItem.forEach((tab, idx)=> {
    tab.addEventListener('click', function(){
        tabContent.forEach((e)=> {
            e.classList.remove('active')
        });

        tabItem.forEach((item)=> {
            item.classList.remove('active')
        });

        tabItem[idx].classList.add('active')
        tabContent[idx].classList.add('active')
    });
});