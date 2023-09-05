 --책 상세 테이블 생성 ( 성호 )
 
  CREATE TABLE M_BOOK_DETAIL 
   (	BOOKNO NUMBER, 
	BCATEGORYNO NUMBER, 
	BIMG VARCHAR2(225 BYTE), 
	BIMGDETAIL VARCHAR2(225 BYTE), 
	BDESCRIPTION VARCHAR2(1000 BYTE), 
	BPAGE NUMBER, 
	BSIZE VARCHAR2(100 BYTE), 
   BADGE VARCHAR2(15 BYTE), 
	BPDATE DATE
   );

Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE,BPDATE) values (12,1,'book12.jpg','resources/assets/imgs/adorder/book12.jpg','어린왕자 입니다.',300,'150x230mm','Bestseller',to_date('23/01/28','RR/MM/DD'));
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE,BPDATE) values (13,2,'book13.jpg','resources/assets/imgs/adorder/book13.jpg','1984입니다.',400,'140x210mm','New Arrival',to_date('23/03/15','RR/MM/DD'));
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE,BPDATE) values (14,3,'book14.jpg','resources/assets/imgs/adorder/book14.jpg','헤리포터 입니다.',200,'180x250mm','Recommended',to_date('23/07/10','RR/MM/DD'));
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE,BPDATE) values (15,4,'book15.jpg','resources/assets/imgs/adorder/book15.jpg','君の名前は',200,'180x250mm','すごい',to_date('19/07/10','RR/MM/DD'));
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE,BPDATE) values (16,4,'book16.jpg','resources/assets/imgs/adorder/book16.jpg','도시와 그 불확실한 벽',215,'180x250','haruki',to_date('23/09/06','RR/MM/DD'));
