--도서 카테고리 테이블 생성
CREATE TABLE M_BOOK_CATEGORY (
BCATEGORYNO NUMBER,
BCATEGORY VARCHAR2(100),
BCATEGORY2 VARCHAR2(100)
);

--카테고리 더미데이터
INSERT INTO M_BOOK_CATEGORY (BCATEGORYNO, BCATEGORY, BCATEGORY2)
VALUES (01, '외국 도서', '문학');

INSERT INTO M_BOOK_CATEGORY (BCATEGORYNO, BCATEGORY, BCATEGORY2)
VALUES (02, '국내 도서', '소설');


INSERT INTO M_BOOK_CATEGORY (BCATEGORYNO, BCATEGORY, BCATEGORY2)
VALUES (03, '외국 도서', '판타지');
