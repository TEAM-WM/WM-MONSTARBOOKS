const menuItems = document.querySelectorAll(".admin-menu-list > li");

// 각 메뉴 아이템에 클릭 이벤트 리스너 추가
menuItems.forEach((item) => {
  const menuItemLink = item.querySelector("a");

  menuItemLink.addEventListener("click", function (event) {
    event.preventDefault(); // 기본 동작 막기

    // 클릭한 메뉴 아이템에 'active' 클래스 추가
    item.classList.add("active");

    // 만약 클릭한 메뉴 아이템이 .accordion-button 클래스를 가진 경우
    if (item.classList.contains("accordion-button")) {
      const submenu = item.querySelector(".admin-submenu-list");
      if (submenu) {
        // 다른 모든 메뉴 아이템에서 'active' 클래스 제거
        menuItems.forEach((otherItem) => {
          if (otherItem !== item) {
            otherItem.classList.remove("active");
            const otherSubmenu = otherItem.querySelector(".admin-submenu-list");
            if (otherSubmenu) {
              otherSubmenu.classList.remove("active"); // 다른 하위 메뉴도 닫기
            }
          }
        });

        submenu.classList.toggle("active"); // 토글링
      }
    } else {
      // 다른 모든 메뉴 아이템에서 'active' 클래스 제거
      menuItems.forEach((otherItem) => {
        if (otherItem !== item) {
          otherItem.classList.remove("active");
          const otherSubmenu = otherItem.querySelector(".admin-submenu-list");
          if (otherSubmenu) {
            otherSubmenu.classList.remove("active"); // 닫기
          }
        }
      });
    }
  });
});
const submenuItems = document.querySelectorAll(".admin-submenu-list li");

submenuItems.forEach((submenuItem) => {
  submenuItem.addEventListener("click", function (event) {
    // 클릭 이벤트의 기본 동작 막기
    event.preventDefault();

    // 클릭한 하위 메뉴 아이템에 'active' 클래스 추가
    submenuItem.classList.add("active");

    // 다른 모든 하위 메뉴 아이템에서 'active' 클래스 제거
    submenuItems.forEach((otherSubmenuItem) => {
      if (otherSubmenuItem !== submenuItem) {
        otherSubmenuItem.classList.remove("active");
      }
    });
  });
});
