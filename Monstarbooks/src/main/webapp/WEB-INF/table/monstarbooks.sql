--------------------------------------------------------
--  파일이 생성됨 - 목요일-10월-12-2023   
--------------------------------------------------------

--------------------------------------------------------
--  파일이 생성됨 - 목요일-10월-12-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence EVENTNO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  EVENTNO_SEQ  
   MINVALUE 1 
   MAXVALUE 99999999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE  
   NOORDER  
   NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence M_BANNER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  
   M_BANNER_SEQ
   MINVALUE 1
   MAXVALUE 99999999
   INCREMENT BY 1
   START WITH 1
   NOCACHE 
   NOORDER
   NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence M_BOOK_CATEGORY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  
   M_BOOK_CATEGORY_SEQ
   MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence M_BOOK_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  M_BOOK_SEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 33 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence M_CART_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  M_CART_SEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 33 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence M_COUPON_MEMBER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "M_COUPON_MEMBER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 14 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence M_COUPON_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "M_COUPON_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 16 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence M_DELIVERY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "M_DELIVERY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 11 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence M_EVENT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "M_EVENT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence M_FAQ_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "M_FAQ_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 7 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence M_MEMBER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "M_MEMBER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 7 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence M_NOTICE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "M_NOTICE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence M_ORDER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "M_ORDER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 14 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence M_QNA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "M_QNA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence M_REVIEW_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "M_REVIEW_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 18 NOCACHE  NOORDER  NOCYCLE;

--------------------------------------------------------
--  DDL for Table M_BANNER
--------------------------------------------------------

  CREATE TABLE "M_BANNER" 
   (	"BANNERNO" NUMBER, 
	"EVENTNO" NUMBER, 
	"ETITLE" VARCHAR2(500 BYTE), 
	"EFILESRC" VARCHAR2(225 BYTE), 
	"EREGDATE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table M_BOOK
--------------------------------------------------------

  CREATE TABLE "M_BOOK" 
   (	"BOOKNO" NUMBER, 
	"BISBN" NUMBER, 
	"BTITLE" VARCHAR2(225 BYTE), 
	"BSUBTITLE" VARCHAR2(225 BYTE), 
	"BPUBLISHER" VARCHAR2(100 BYTE), 
	"BWRITER" VARCHAR2(100 BYTE), 
	"BTRANSLATOR" VARCHAR2(100 BYTE), 
	"BPDATE" DATE, 
	"BPRICE" NUMBER, 
	"BPRICESELL" NUMBER, 
	"BDISCOUNT" NUMBER, 
	"BSTATUS" VARCHAR2(10 BYTE), 
	"BCDATE" DATE, 
	"BMDATE" DATE, 
	"BSTOCK" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table M_BOOK_CATEGORY
--------------------------------------------------------

  CREATE TABLE "M_BOOK_CATEGORY" 
   (	"BCATEGORYNO" NUMBER, 
	"BCATEGORY1" VARCHAR2(100 BYTE), 
	"BCATEGORY2" VARCHAR2(100 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table M_BOOK_DETAIL
--------------------------------------------------------

  CREATE TABLE "M_BOOK_DETAIL" 
   (	"BOOKNO" NUMBER, 
	"BCATEGORYNO" NUMBER, 
	"BIMG" VARCHAR2(225 BYTE), 
	"BIMGDETAIL" VARCHAR2(225 BYTE), 
	"BDESCRIPTION" CLOB, 
	"BPAGE" NUMBER, 
	"BSIZE" VARCHAR2(100 BYTE), 
	"BADGE" VARCHAR2(15 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table M_CART
--------------------------------------------------------

  CREATE TABLE "M_CART" 
   (	"CARTNO" NUMBER, 
	"MEMBERNO" NUMBER, 
	"BOOKNO" NUMBER, 
	"CCOUNT" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table M_COUPON
--------------------------------------------------------

  CREATE TABLE "M_COUPON" 
   (	"CPNO" NUMBER, 
	"CPNAME" VARCHAR2(100 BYTE), 
	"CPDESCRIPTION" VARCHAR2(225 BYTE), 
	"CPPRICE" NUMBER, 
	"CPCREATED" DATE, 
	"CPVALID" DATE, 
	"CPSTATUS" VARCHAR2(10 BYTE)
   ) ;

   COMMENT ON COLUMN "M_COUPON"."CPSTATUS" IS 'FALSE';
--------------------------------------------------------
--  DDL for Table M_COUPON_MEMBER
--------------------------------------------------------

  CREATE TABLE "M_COUPON_MEMBER" 
   (	"CPNO" NUMBER, 
	"MEMBERNO" NUMBER, 
	"CPNO2" NUMBER, 
	"CPRDATE" DATE, 
	"CPVALID" DATE, 
	"CPSTATUS" VARCHAR2(10 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table M_DELIVERY
--------------------------------------------------------

  CREATE TABLE "M_DELIVERY" 
   (	"DELIVERYNO" NUMBER, 
	"ORDERNO" NUMBER, 
	"MEMBERNO" NUMBER, 
	"DADDRESS1" VARCHAR2(100 BYTE), 
	"DADDRESS2" VARCHAR2(100 BYTE), 
	"DADDRESS3" VARCHAR2(100 BYTE), 
	"DZIPCODE" NUMBER, 
	"DTEL" VARCHAR2(100 BYTE), 
	"DNAME" VARCHAR2(100 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table M_EVENT
--------------------------------------------------------

  CREATE TABLE "M_EVENT" 
   (	"EVENTNO" NUMBER, 
	"ETITLE" VARCHAR2(500 BYTE), 
	"ECONTENT" VARCHAR2(500 BYTE), 
	"EFILESRC" VARCHAR2(225 BYTE), 
	"EREGDATE" DATE, 
	"DELETED" CHAR(3 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table M_FAQ
--------------------------------------------------------

  CREATE TABLE "M_FAQ" 
   (	"FAQNO" NUMBER, 
	"FQUESTION" VARCHAR2(500 BYTE), 
	"FANSWER" CLOB, 
	"FCATEGORY" VARCHAR2(225 BYTE), 
	"FREGDATE" DATE DEFAULT sysdate, 
	"DELETED" CHAR(3 BYTE) DEFAULT 'no'
   ) ;
--------------------------------------------------------
--  DDL for Table M_MEMBER
--------------------------------------------------------

  CREATE TABLE "M_MEMBER" 
   (	"MEMBERNO" NUMBER, 
	"MID" VARCHAR2(100 BYTE), 
	"MPW" VARCHAR2(100 BYTE), 
	"MBIRTH" DATE, 
	"MNAME" VARCHAR2(100 BYTE), 
	"MEMAIL" VARCHAR2(100 BYTE), 
	"MTEL" VARCHAR2(100 BYTE), 
	"MREGDATE" DATE, 
	"MPROFILEIMG" VARCHAR2(225 BYTE), 
	"MFAVORITE" VARCHAR2(255 BYTE), 
	"MAUTHORITY" VARCHAR2(10 BYTE), 
	"DELETED" CHAR(3 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table M_NOTICE
--------------------------------------------------------

  CREATE TABLE "M_NOTICE" 
   (	"NOTICENO" NUMBER, 
	"NTITLE" VARCHAR2(225 BYTE), 
	"NCONTENT" CLOB, 
	"NWRITER" VARCHAR2(100 BYTE), 
	"NREGDATE" DATE DEFAULT sysdate, 
	"NFILESRC" VARCHAR2(100 BYTE), 
	"DELETED" CHAR(3 BYTE) DEFAULT 'no', 
	"MEMBERNO" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table M_ORDER
--------------------------------------------------------

  CREATE TABLE "M_ORDER" 
   (	"ORDERNO" NUMBER, 
	"MEMBERNO" NUMBER, 
	"CPNO" NUMBER, 
	"OTOTALPRICE" NUMBER, 
	"OSTATUS" VARCHAR2(50 BYTE), 
	"OPAY" VARCHAR2(50 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table M_ORDER_DETAIL
--------------------------------------------------------

  CREATE TABLE "M_ORDER_DETAIL" 
   (	"ORDERNO" NUMBER, 
	"BOOKNO" NUMBER, 
	"OPRICESELL" NUMBER, 
	"OCOUNT" NUMBER, 
	"OREFUND_CHECK" VARCHAR2(50 BYTE), 
	"OREGDATE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table M_QNA
--------------------------------------------------------

  CREATE TABLE "M_QNA" 
   (	"QNANO" NUMBER, 
	"MEMBERNO" NUMBER, 
	"QCATEGORY" VARCHAR2(100 BYTE), 
	"QTITLE" VARCHAR2(225 BYTE), 
	"QCONTENT" VARCHAR2(1000 BYTE), 
	"QREGDATE" DATE, 
	"QSTATUS" VARCHAR2(100 BYTE), 
	"QANSWER" VARCHAR2(1000 BYTE), 
	"QFILESRC" VARCHAR2(225 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table M_REVIEW
--------------------------------------------------------

  CREATE TABLE "M_REVIEW" 
   (	"REVIEWNO" NUMBER, 
	"BOOKNO" NUMBER, 
	"MEMBERNO" NUMBER, 
	"RTITLE" VARCHAR2(225 BYTE), 
	"RCONTENT" VARCHAR2(1000 BYTE), 
	"REGDATE" DATE, 
	"RSTAR" NUMBER, 
	"REFILESRC" VARCHAR2(225 BYTE), 
	"DELETED" CHAR(3 BYTE)
   ) ;
REM INSERTING into M_BANNER
SET DEFINE OFF;
REM INSERTING into M_BOOK
SET DEFINE OFF;
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (21,9788937437564,'참을 수 없는 존재의 가벼움',null,'민음사','밀란 쿤데라','이재룡',to_date('18/06/20','RR/MM/DD'),17000,13600,20,'판매중',to_date('23/09/15','RR/MM/DD'),null,33);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (22,9788950920043,'네 인생 우습지 않다',null,'21세기북스','전한길',null,to_date('23/06/12','RR/MM/DD'),18000,14400,20,'판매중',to_date('23/09/15','RR/MM/DD'),null,33);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (23,9788932474892,'유현준의 인문 건축 기행',null,'을유문화사','유현준',null,to_date('23/05/30','RR/MM/DD'),19500,15600,20,'판매중',to_date('23/09/15','RR/MM/DD'),null,22);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (19,9788937417375,'일이란 무엇인가',null,'민음사','고동진',null,to_date('23/07/11','RR/MM/DD'),18000,14400,20,'판매중',to_date('23/09/15','RR/MM/DD'),null,33);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (20,9791155816295,'브랜드 설계자',null,'윌북','러셀 브런슨','홍경탁',to_date('23/08/17','RR/MM/DD'),24800,22320,10,'판매중',to_date('23/09/15','RR/MM/DD'),null,33);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (24,9791168341234,'한석준의 말하기 수업',null,'인플루엔셜','한석준',null,to_date('23/08/25','RR/MM/DD'),16800,13440,20,'판매중',to_date('23/09/15','RR/MM/DD'),null,33);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (25,9791187033882,'망그러진 만화',null,'좋은생각','만화',null,to_date('22/11/01','RR/MM/DD'),16800,11760,30,'판매중',to_date('23/09/15','RR/MM/DD'),null,33);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (26,9791197919848,'오타니 쇼헤이의 쇼타임',null,'차선책','고다마 미츠오','김외현',to_date('23/05/20','RR/MM/DD'),17500,14000,20,'판매중',to_date('23/09/15','RR/MM/DD'),null,22);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (27,9791168126541,'나는 앞으로 몇 번의 보름달을 볼 수 있을까',null,'위즈덤하우스','사카모토 류이치','황국영',to_date('23/06/28','RR/MM/DD'),20000,14000,30,'판매중',to_date('23/09/15','RR/MM/DD'),null,33);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (28,9788960519916,'집착의 법칙',null,'부키','그랜트 카돈','최은아',to_date('23/08/18','RR/MM/DD'),18500,14800,20,'판매중',to_date('23/09/15','RR/MM/DD'),null,44);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (29,9791167552235,'뭐라도 써야 하는 너에게',null,'우리학교','정혜덕',null,to_date('23/08/30','RR/MM/DD'),14500,10150,30,'판매중',to_date('23/09/15','RR/MM/DD'),null,33);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (30,9788954695053,'아주 희미한 빛으로도',null,'문학동네','최은영',null,to_date('23/08/07','RR/MM/DD'),16800,10080,40,'판매중',to_date('23/09/15','RR/MM/DD'),null,33);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (31,9791167763983,'푸틴을 죽이는 완벽한 방법',null,'이타북스','김진명',null,to_date('23/09/20','RR/MM/DD'),18800,13160,30,'판매중',to_date('23/09/15','RR/MM/DD'),to_date('23/09/18','RR/MM/DD'),77);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (8,9791193078082,'오펜하이머 각본집',null,'허블','크리스토퍼 놀런','김은주',to_date('23/08/29','RR/MM/DD'),16800,8400,50,'판매중',to_date('23/09/15','RR/MM/DD'),null,22);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (9,9788934942467,'총 균 쇠',null,'김영사','재레드 다이아몬드','강주헌',to_date('23/05/11','RR/MM/DD'),29800,14900,50,'판매중',to_date('23/09/15','RR/MM/DD'),null,49);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (2,9791164845965,'필립 코틀러 마케팅의 미래',null,'매일경제신문사','필립 코틀러,허마원 카타자야,후이 덴 후안,제키 머스리','방영호',to_date('23/08/10','RR/MM/DD'),22000,17600,20,'판매중',to_date('23/09/15','RR/MM/DD'),null,11);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (3,9791193153055,'영어 질문 독서법',null,'더블북','대치동 헤더샘',null,to_date('23/08/10','RR/MM/DD'),17500,14000,20,'판매중',to_date('23/09/15','RR/MM/DD'),null,6);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (4,9791188331796,'돈의 속성(300쇄 리커버에디션)',null,'스노우폭스북스','김승호',null,to_date('20/06/15','RR/MM/DD'),17800,14240,20,'판매중',to_date('23/09/15','RR/MM/DD'),null,10);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (5,9791192908236,'아메리칸 프로메테우스(특별판)',null,'사이언스북스','Bird Kai,Martin J. Sherwin','최형섭',to_date('23/06/12','RR/MM/DD'),25000,20000,20,'판매중',to_date('23/09/15','RR/MM/DD'),null,22);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (6,9788901274379,'슈퍼노멀',null,'웅진지식하우스','주언규',null,to_date('23/08/30','RR/MM/DD'),19500,13650,30,'판매중',to_date('23/09/15','RR/MM/DD'),to_date('23/09/15','RR/MM/DD'),21);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (7,9788997575169,'원씽(The One Thing)(리커버 특별판)',null,'비즈니스북스','게리 켈러,제이 파파산','구세희',to_date('13/08/30','RR/MM/DD'),14000,8400,40,'판매중',to_date('23/09/15','RR/MM/DD'),null,31);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (10,9788932923413,'꿀벌의 예언 1',null,'열린책들','베르나르 베르베르','전미연',to_date('23/06/21','RR/MM/DD'),16800,8400,50,'판매중',to_date('23/09/15','RR/MM/DD'),to_date('23/09/15','RR/MM/DD'),50);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (11,9788926212660,'디즈니 픽사 엘리멘탈 무비동화',null,'애플비북스','픽사','이지안',to_date('23/06/15','RR/MM/DD'),12000,9600,20,'판매중',to_date('23/09/15','RR/MM/DD'),null,50);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (13,9788956605593,'불안',null,'은행나무','알랭 드 보통','정영목',to_date('12/01/04','RR/MM/DD'),15000,7500,50,'판매중',to_date('23/09/15','RR/MM/DD'),null,66);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (14,9791165796396,'아기 판다 푸바오',null,'시공주니어','에버랜드 동물원',null,to_date('21/07/20','RR/MM/DD'),18000,12600,30,'판매중',to_date('23/09/15','RR/MM/DD'),null,66);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (15,9791158511586,'우리는 모두 죽는다는 것을 기억하라',null,'토네이도','웨인 다이어','정지현',to_date('19/11/18','RR/MM/DD'),17000,8500,50,'판매중',to_date('23/09/15','RR/MM/DD'),null,66);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (16,9791188331888,'사장학개론',null,'스노우폭스북스','김승호',null,to_date('23/04/19','RR/MM/DD'),25000,20000,20,'판매중',to_date('23/09/15','RR/MM/DD'),null,55);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (17,9791187142560,'데일 카네기 인간관계론(무삭제 완역본)',null,'현대지성','데일 카네기','임상훈',to_date('19/10/07','RR/MM/DD'),11500,9200,20,'판매중',to_date('23/09/15','RR/MM/DD'),null,55);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (18,9791158883591,'부자 아빠 가난한 아빠 1(20주년 특별 기념판)',null,'민음인','로버트 기요사키','안진환',to_date('22/10/28','RR/MM/DD'),17000,15300,10,'판매중',to_date('23/09/15','RR/MM/DD'),null,44);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (1,9791192389073,'유연함의 힘',null,'상상스퀘어','수잔 애쉬포드','김정혜',to_date('23/05/10','RR/MM/DD'),22000,19800,10,'판매중',to_date('23/09/15','RR/MM/DD'),to_date('23/09/15','RR/MM/DD'),0);
Insert into M_BOOK (BOOKNO,BISBN,BTITLE,BSUBTITLE,BPUBLISHER,BWRITER,BTRANSLATOR,BPDATE,BPRICE,BPRICESELL,BDISCOUNT,BSTATUS,BCDATE,BMDATE,BSTOCK) values (12,9791190299770,'모든 삶은 흐른다',null,'피카(FIKA)','로랑스 드빌레르','이주영',to_date('23/04/03','RR/MM/DD'),16800,11760,30,'판매중',to_date('23/09/15','RR/MM/DD'),null,55);
REM INSERTING into M_BOOK_CATEGORY
SET DEFINE OFF;
Insert into M_BOOK_CATEGORY (BCATEGORYNO,BCATEGORY1,BCATEGORY2) values (1,'국내','소설');
Insert into M_BOOK_CATEGORY (BCATEGORYNO,BCATEGORY1,BCATEGORY2) values (2,'국내','시');
Insert into M_BOOK_CATEGORY (BCATEGORYNO,BCATEGORY1,BCATEGORY2) values (3,'국내','경제');
Insert into M_BOOK_CATEGORY (BCATEGORYNO,BCATEGORY1,BCATEGORY2) values (4,'국내','에세이');
Insert into M_BOOK_CATEGORY (BCATEGORYNO,BCATEGORY1,BCATEGORY2) values (5,'국내','요리');
Insert into M_BOOK_CATEGORY (BCATEGORYNO,BCATEGORY1,BCATEGORY2) values (6,'국내','문화');
Insert into M_BOOK_CATEGORY (BCATEGORYNO,BCATEGORY1,BCATEGORY2) values (7,'외국','소설');
Insert into M_BOOK_CATEGORY (BCATEGORYNO,BCATEGORY1,BCATEGORY2) values (8,'외국','시');
Insert into M_BOOK_CATEGORY (BCATEGORYNO,BCATEGORY1,BCATEGORY2) values (9,'외국','경제');
Insert into M_BOOK_CATEGORY (BCATEGORYNO,BCATEGORY1,BCATEGORY2) values (10,'외국','에세이');
Insert into M_BOOK_CATEGORY (BCATEGORYNO,BCATEGORY1,BCATEGORY2) values (11,'외국','요리');
Insert into M_BOOK_CATEGORY (BCATEGORYNO,BCATEGORY1,BCATEGORY2) values (12,'외국','문화');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (21,12,'book21.jpg','book21detail.jpg','살아 있는 신화가 된 작가 밀란 쿤데라의 대표작 『참을 수 없는 존재의 가벼움』을 밀란 쿤데라가 직접 그린 일러스트를 바탕으로 디자인한 신선한 표지와 장정으로 새롭게 만나볼 수 있다. 역사에서 태어났으되, 역사를 뛰어넘는 인간의 실존 그 자체를 다루고 있는 작품으로, 1960년대 체코와 1970년대 유럽을 뒤흔들어 놓은 무거운 역사의 상처와 개인적 트라우마를 어깨에 짊어진 네 남녀의 생과 사랑의 모습을 그리고 있다.  고향의 작은 술집에서 일하며',44,'44','신상품');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (22,4,'book22.jpg','book22detail.jpg','경상북도 경산시 용성면에서 가난한 소작농의 아들로 태어나 20대에 이미 강의 능력을 인정받으며 본격적인 스타강사의 길을 걷게 되지만 이후 도전한 사업이 연달아 실패하며 25억 빚더미의 신용 불량자로 전락, 생을 포기하기 직전까지 다다랐지만 그야말로 사무치는 노력으로 재기에 성공하며 대구를 넘어 대한민국의 일타강사가 된 이 굴곡 넘치는 이야기는 전한길의 ‘시그니처 히스토리’이다. 자신의 녹록지 않았던 인생에서 성공과 행복의 의미를 새롭게 정의해낸',33,'22','신상품');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (23,5,'book23.jpg','book23detail.jpg','건축물은 인간의 생각과 세상의 물질이 만나 만들어진 결정체로, 많은 자본이 드는 만큼 여러 사람의 의견이 일치할 때만 완성되는 그 사회의 반영이자 단면이다. 그렇기에 건축물을 보면 당대 사람들이 세상을 읽는 관점, 물질을 다루는 기술 수준, 사회 경제 시스템, 인간에 대한 이해, 꿈꾸는 이상향, 생존을 위한 몸부림 등이 보인다. 이 책은 건축가 유현준이 감명받거나 영감을 얻은 30개의 건축물을 소개한다. 이 작품들을 설계한 건축가들은 수백 년 된',33,'33','신상품');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (19,4,'book19.jpg','book19detail.jpg','“이 책은 지금 자신의 업에서, 그 무엇도 아닌 오직 일로 성공하고자 하는 사람들을 위한 책이다!”  1984년 삼성전자에 평사원으로 입사한 후 유럽 연구소장, 상품기획팀장, 개발실장 등 주요 직책을 두루 거치며, 차별화된 제품과 서비스로 삼성전자 모바일 사업을 세계 일류로 선도한 고동진 전 대표이사 사장. 무엇보다 그는 폴더블 스마트폰 등 혁신 기술을 세계 최초로 선보임으로써, 갤럭시 브랜드에 새로운 전기를 마련해 ‘갤럭시 성공 신화’의 주역',33,null,'신상품');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (20,4,'book20.jpg','book20detail.jpg','“왜 내 상품의 가치를 모를까?” “어째서 수익이 꾸준하지 않을까?” 열심히 광고하여 애써 모은 고객이 흐지부지 흩어지는 이유는 브랜드가 약하기 때문이다. 국내 최초로 퍼널 마케팅의 진정한 가치를 알려 극찬을 받은 ‘스타트업의 과학’ 시리즈의 두 번째 도서 『브랜드 설계자』가 출간되었다. 전작 『마케팅 설계자』가 방문객을 모으는 방법부터 구매를 유도하는 세일즈 퍼널의 설계법을 알려줬다면, 이번 책에서는 꾸준히 퍼널에 관심을 갖도록 이끄는 ‘평생',33,'33','신상품');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (24,3,'book24.jpg','book24detail.jpg','“내 인생을 바꾼 말하기 수업입니다!” _수강생 후기 中  수천 명의 수강생이 열광한 스피치 코치이자 24년 차 아나운서 한석준이 알려주는 원포인트 말하기 레슨!  “‘한기자’ 님의 소통 노하우로 여러분의 관계 맺음이 더 따듯해지기를 기원합니다.” _오상진 아나운서  “좋은 목소리를 타고나지 않았더라도 이 책에 소개된 요령만이라도 잘 익혀 실전에 적용하길 권한다.” _전현무 MC  “말하기에 자신이 생기면 인생이 바뀝니다!” 명확하고 똑 부러진',44,'44','신상품');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (25,6,'book25.jpg','book25detail.jpg','“항상 기억하기! 인생의 주인공은 바로 당신이란 걸!”  출간되자마자 많은 독자에게 큰 사랑을 받은 〈망그러진 만화〉가 봄을 맞아 새로운 표지로 돌아왔다! ‘이모티콘 캐릭터 장인’ 유랑 작가가 완벽하지 않은 상태에 대한 두려움을 줄여보고자 일부러 힘을 빼고 그리기 시작한 웹툰 ‘망그러진 만화’는 ‘꼭 내 얘기 같다’ ‘나도 이렇게 살고 싶다’ 등 엄청난 공감을 받으며 SNS 팔로워 수 약 14만 명, 카카오 이모티콘 다운로드 수 1위를 기록하며',44,'44','신상품');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (26,9,'book26.jpg','book26detail.jpg','종목과 국가를 불문하고 2023년 현재 세계적으로 가장 각광받는 스포츠스타 오타니 쇼헤이의 성공론을 국내 최초로 공개하는 책이다. 오타니의 열혈 팬이자 저명한 스포츠 심리학자인 저자는 오타니의 성공 무기를 자신이 ‘좋아하는 것’과 ‘잘하는 것’을 영리하게 잘 경영한 덕분이라고 말한다. MLB 최초로 ‘6억 달러의 사나이’가 될 야구 천재, 투타 겸업으로 활약한 세계 최고의 스타, NPB 5시즌 투타 겸업 선수, 압도적인 기량의 월드스타… ‘최초',44,'44','신상품');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (27,9,'book27.jpg','book27detail.jpg','한국, 일본, 중국, 대만 동시 출간! 방탄소년단 슈가, 윤상, 이준오(캐스커), 정세랑, 정재일, 황소윤, 허우 샤오시엔 추천  “세상은 소리로 가득 차 있고 그 소리들이 모이면 음악이 된다는 걸 알려주신 선생님” _방탄소년단 슈가(SUGA)  시대를 대표하는 예술가이자 활동가 류이치 사카모토가 살아생전 마지막으로 전하는 이야기. 2020년, 암의 재발과 전이로 인해 치료를 받더라도 5년 이상 생존율은 50퍼센트라는 진단을 받고서 시간의 유한',55,'55','신상품');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (28,11,'book28.jpg','book28detail.jpg','베스트셀러 《10배의 법칙》 저자 그랜트 카돈이 더 독하고 더 강력한 동기부여 책 《집착의 법칙》으로 돌아왔다. 저자가 마약중독자 루저에서 자수성가 억만장자가 될 수 있었던 유일한 비결, 세상에서 가장 부유하고 성공한 사람들이 공통으로 가진 마인드셋, 그것이 바로 집착이다. 입소문만으로 동기부여의 전설이 된 《10배의 법칙》은 엄청난 수준의 사고와 행동, 원대한 목표 설정의 중요성을 설파한 동기부여의 바이블과 같은 책이다. 《10배의 법칙》 출간',66,'66','신상품');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (29,5,'book29.jpg','book29detail.jpg','글쓰기에 관한 이야기라면 늘 반복되는 가르침이 있다. 바로 ‘삼다(三多)’, 즉 다독·다작·다상량이 그것이다. 그러나 당장 내일, 국어 수행 평가로 짧은 글을 써내야 하는 십 대에게 많이 읽고, 많이 쓰고, 많이 생각하라는 교훈은 정말이지 ‘쓸’모없다.  이 책은 대안 학교에서 문학과 글쓰기를 가르치고 있는 현직 교사이자, 에세이스트로 활발하게 작품 활동을 하고 있는 작가 정혜덕이 십 대에게 들려주는 ‘글 쓰는 마음’과 ‘글 쓰는 방법’에 관한',33,'33','신상품');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (30,9,'book30.jpg','book30detail.jpg','‘함께 성장해나가는 우리 세대의 소설가’를 갖는 드문 경험을 선사하며 동료 작가와 평론가, 독자 모두에게 특별한 이름으로 자리매김한 최은영의 세번째 소설집 『아주 희미한 빛으로도』가 출간되었다. 올해로 데뷔 10년을 맞이하는 최은영은 그간 만남과 헤어짐을 거듭하는 인물의 내밀하고 미세한 감정을 투명하게 비추며 우리의 사적인 관계 맺기가 어떻게 사회적인 맥락을 얻는지를 고찰하고(『쇼코의 미소』, 2016), 지난 시절을 끈질기게 떠올리는 인물을 통해',33,'33','신상품');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (31,1,'book31.jpg','book31detail.jpg','〈무궁화꽃이 피었습니다〉 김진명 작가 집필 30주년 기념작 장편소설 〈푸틴을 죽이는 완벽한 방법〉 출간과 동시에 전 세계 출판계와 OTT 문의 쇄도  전쟁에서 지면 권좌에서 추락해야 하는 운명의 푸틴 그가 패배 직전의 이 전쟁에서 핵을 쓰지 않을 거라는 당신의 확신은 과연 타당한가  밀리언셀러 작가 김진명, 우크라이나 전쟁을 쓰다 신작 소설 〈푸틴을 죽이는 완벽한 방법〉 출간  우크라이나 키이우 북쪽의 도시 부차. 미하일은 생일을 맞아 사랑하는',77,'77','신상품');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (8,8,'book08.jpg','book08detail.jpg','2023년 7월 최초 개봉 이후, 저명한 영화 평론가이기도 한 영화감독 폴 슈레이더가 남긴 평을 비롯해 크리스토퍼 놀란 감독의 열두 번째 장편 영화 〈오펜하이머〉에 대한 평단과 일반 관객의 찬사가 끊임없이 쏟아졌다. 상업적으로도 북미에서 개봉 3주차 흥행 수익 5억 달러를 돌파하는 등 흥행가도를 달리고 있다. 〈오펜하이머〉는 『아메리칸 프로메테우스』를 원작으로 하는 줄리어스 로버트 오펜하이머의 전기영화이다. 젊은 시절의 불안했던 정신 상태와 사생활',22,'22','신상품');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (9,6,'book09.jpg','book09detail.jpg','학문의 경계를 넘나드는 세계적 석학 재레드 다이아몬드. 인류 문명에 대한 예리한 통찰을 전해온 그의 대표작이자 1998년 퓰리처상 수상작 《총, 균, 쇠》를 새 번역, 새 편집으로 만난다. 왜 어떤 국가는 부유하고 어떤 국가는 가난한가? 왜 어떤 민족은 다른 민족의 정복과 지배의 대상이 되었는가? 생물학, 지리학, 인류학, 역사학 등 다양한 학문의 융합을 통해 장대한 인류사를 풀어내며 오늘날 현대 세계가 불평등한 원인을 종합 규명한 혁신적 저작',55,'55','신상품');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (2,2,'book02.jpg','book02detail.jpg','전문화된 마케팅이 유행하던 시대가 막을 내리고 창의성과 기업가정신이 요구되는 시대다. 팬데믹은 비즈니스 환경을 뿌리째 뒤흔들었으며 브랜드와 고객의 상호작용 방식을 완전히 뒤바꿔놓았다. 이 책은 옴니하우스 모델과 최신 마케팅 관리방법으로 조직 내 다양한 이분법적 구조를 통합하고 이해관계자들과 원활히 소통하는 법을 알려준다. 마케팅의 진리를 다시 정립해야 하는 마케팅 전문가, 경영자, 창업가, 관리자들에게 충실한 마케팅 교본이 될 것이다. 10년 후',11,'11','베스트');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (3,3,'book03.jpg','book03detail.jpg','영어유치원, 영어도서관 등 어릴 때부터 영어 공부를 시작하는 아이들이 많아지고 있지만 정작 상급학교에 진학하면 학교 진도와 학원 숙제를 해내느라 배경지식을 쌓고 사고력을 키우는 영어 학습은 생각도 못 하는 것이 현실이다.  대한민국 학군 1번지 대치동에서 다년간 영어 원서 읽기 전문 강사로 활동해온 저자는 수업 현장에서 얻은 경험과 연구를 통해 영어 독서와 질문하는 독서 공부법이 영어에 대한 노출이 적은 우리나라 교육 환경에서 가장 효과적인 영어',33,'33','베스트');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (4,4,'book04.jpg','book04detail.jpg','2020ㆍ2021ㆍ2022ㆍ2023 4년 연속 최장기 베스트셀러 80만 깨어있는 독자들이 선택한 경제경영 필독서 『돈의 속성』  ▶ 『돈의 속성』 300쇄 기념 개정증보판 발행! ▶ 『돈의 속성』 300쇄 기념, 김승호 회장의 추가 메시지를 담다! ▶ 중국, 일본, 대만, 태국 4개국 출간! 이 책은 초판 발행 후, 경제경영 필도서로 자리매김한 『돈의 속성』 300쇄 기념 개정증보판이다. 300쇄에 맞춰 코로나19로 바뀐 경제상황과 돈에 관한 김승호',44,'44','신상품');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (5,5,'book05.jpg','book05detail.jpg','「테넷」, 「덩케르크」, 「인터스텔라」, 「메멘토」……. 스크린 너머로 긴장을 늦출 수 없는 작품들을 선보여 온 거장 감독 크리스토퍼 놀란의 최신작 「오펜하이머(Oppenheimer)」가 올여름 개봉 예정이다. 북미 개봉(2023년 7월 21일)을 앞두고 6월 1일 공개된 비하인드더신 영상에서 그가 “상상할 수 있는 가장 큰 이야기”라고 표현한 「오펜하이머」는 1억 달러라는 제작비나 주연 킬리언 머피, 조연 「아이언 맨」 로버트 다우니 주니어 등',55,'55','신상품');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (6,6,'book06.jpg','book06detail.jpg','일평생 돈 걱정 하면서 살고 싶은 사람이 어디 있을까? 하지만 다들 부자의 삶을 꿈꾸면서도 체념해버린다. 금수저도, 천재도 아니므로 애초에 글렀다는 식이다. 진정 99%의 평범한 사람들은 부자가 될 수 없나? 그렇지 않다. 주위를 둘러보라. 한 달에 수천만 원을 벌어들이며 수십억 원의 자산을 쌓은 사람들이 지하철 한두 칸에 한 명씩은 있다. 이 책의 저자 주언규는 이렇듯 평범함의 범주 안에서 앞서나가는 사람들을 ‘슈퍼노멀’이라고 부른다. 물론 그',33,'33','신상품');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (7,7,'book07.jpg','book07detail.jpg','복잡한 세상을 이기는 단순함의 힘『원씽(THE ONE THING)』. 전 세계에서 두 번째로 큰 투자개발 회사의 대표이자 전미 130만 부 이상이 팔린 베스트셀러의 저자 게리 캘러가 더 적게 일함으로써 더 깊게 집중하여 더 크게 성공하는 비결이 무엇인지 제시하였다. 저자는 자신에게 가장 중요한 한 가지, ‘원씽’을 찾아 집중하고 파고들라고 제안한다. 우리의 삶을 소모시키는 멀티스태킹을 비롯한 성공에 대한 거짓신화를 바로잡고, ‘원씽’의 일을 찾아',55,'55','베스트');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (10,9,'book10.jpg','book10detail.jpg','전 세계 3천만 부, 한국어판 누계 3천 쇄를 돌파한 신화적 베스트셀러 작가 베르나르 베르베르의 신작 소설 『꿀벌의 예언』. 꿀벌이 사라지고 인류 멸종의 위기가 닥친 30년 뒤의 지구를 목격한 르네는 미래를 바꾸기 위해 시공간을 넘나드는 모험을 떠난다. 인류를 구할 방법이 적힌 고대의 예언서 〈꿀벌의 예언〉을 찾아 과거와 미래를 오가는 르네와 그 일행은 과연 예언서를 찾아 지구를 구할 수 있을까?  한국 독자들을 만난 지 30년이 되는 특별한 해',55,'55','베스트');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (11,10,'book11.jpg','book11detail.jpg','환영합니다! 이곳은 물, 불, 흙, 공기의 사람들이 어울려 살아가는 엘리멘트 시티예요. 성격이 불같은 불의 사람 앰버는 공감 능력 흘러넘치는 물의 사람 웨이드를 만나게 되었지요. 달라도 너무 다른 웨이드를 통해, 앰버는 자신이 진짜로 원하는 것을 제대로 바라보고 솔직하게 드러낼 용기를 얻게 된답니다. 아슬아슬 흥미진진! 물과 불의 균형을 찾아가는 이야기를 만나 보세요!',55,'55','베스트');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (13,8,'book13.jpg','book13detail.jpg','우리나라 독자들이 가장 사랑하는 작가 중 한 명인 알랭 드 보통의 인문철학 에세이 《불안》이 국내 판매 40만부를 기념해 교보문고 특별 리커버판으로 새롭게 선보인다. 2005년 한국어 초판 출간 이래 20여년 가까이 꾸준히 사랑받아온 이 책은 현대인의 욕망과 불안 심리에 대한 첨예하고 날카로운 통찰력과 해법을 담아 배우 장동건, 방송인 김제동, 천문학자 심재경 등 유명인과 지식인들이 추천하는 필독서로 잘 알려져 왔다. 특별히 이번 리커버판에는 러시아',55,'55','베스트');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (14,5,'book14.jpg','book14detail.jpg','이름처럼 아기 판다 푸바오를 보면 알 수 없는 행복감에 젖어 들지요. 천진난만하고 장난기 가득한 얼굴, 솟구치는 호기심으로 나무 위를 오르는 귀여운 몸짓. 세상을 알아가며 무럭무럭 성장하는 푸바오는 우리에게 자연의 여유와 행복을 선물합니다.   ★ 에버랜드 동물원 아기 판다 푸바오의 성장기를 담은 포토 에세이 아기는 무조건 사랑스럽습니다. 사람이든 동물이든 갓 태어난 아기는 모든 이의 마음을 무장 해제시킵니다. 하물며 어른이 되어서도 특유의 귀여움',55,'55','베스트');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (15,11,'book15.jpg','book15detail.jpg','타인의 시선에서 벗어나 자신의 삶을 사는 법을 전파했던 《행복한 이기주의자》로 지금 이 순간에도 수많은 사람들의 삶을 바꾸고 있는 웨인 다이어 박사의 『우리는 모두 죽는다는 것을 기억하라』. 우리 시대 가장 위대한 동기부여 전문가이자 심리학자, 영성가로 평가받으며 지혜롭고 통찰 깊은 삶을 살다 간 저자가 세상에 마지막으로 남기고 간 작품으로, 삶의 현자들로 불리는 작가, 철학자, 영성가, 명성가 등등 다양한 인물들의 뜨거운 목소리가 담겨 있다.    저자',55,'55','베스트');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (16,1,'book16.jpg','book16detail.jpg','이 책은 한국과 미국, 전 세계를 오가며 ‘사장을 가르치는 사장’으로 알려진 『돈의 속성』의 저자 김승호 회장의 신간이다. 평생 사장으로 살아온 그의 경영철학 모두를 10여 년에 걸쳐 정리해 온 그는, 이번 『사장학개론』 책을 통해 120가지 주제로 그 내용을 모두 담아 완성했다. 지난 7년간 3천 명의 사장 제자들을 만나 〈사장학 수업〉을 진행하며 현실에서 겪는 다양한 문제에 대해, 사장들이 묻는 공통적인 어려움이 존재했으며 그 문제들을 목차',55,'55','베스트');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (17,11,'book17.jpg','book17detail.jpg','사람을 다루는 핵심 원리는 무엇일까? 어떻게 하면 호감 가는 사람이 될 수 있을까? 원하는 것을 얻어내는 가장 효과적인 방법은 무엇일까?  인간관계는 친구를 만들고 적을 만들지 않는 것에서 시작된다. 『데일 카네기 인간관계론』은 이런 인간관계의 핵심을 꿰뚫는다. ‘친구를 만들고, 사람을 설득하는 법’이라는 제목으로 1936년 처음 출간된 데일 카네기의 책은 80년 넘게 수많은 사람들에게 영향을 끼쳐 왔다. 이후에 나온 모든 자기 계발서들이 이 책',55,'55','베스트');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (18,11,'book18.jpg','book18detail.jpg','기존 《부자 아빠 가난한 아빠》 제1권에는 없던 41개의 ‘20년 전 그리고 오늘’과 10가지 ‘스터디 세션’ 등 총 500매 분량의 새로운 내용을 추가한 『부자 아빠 가난한 아빠(20주년 특별 기념판)』. 돈에 대한 선입관을 깨뜨리는 파격적인 내용과 세월이 흘러도 흔들리지 않는 기준이 되어 줄 투자의 원칙들을 담은 책이다.  저자가 유년 시절 겪은 두 아버지를 통해 가난한 사람과 부자의 사고방식을 비교한다. 직설적인 화법과 몰입도 있는 스토리텔링',44,'44','베스트');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (1,1,'book01.jpg','book01detail.jpg','■ 조직 내 인사이동 때문에 준비도 없이 갑자기 리더가 된다. ■ 회의 중 인간미가 없어 보였다고 상사에게 지적받는다. ■ 프로젝트에 성공하려면 지역 사회로부터 지지를 끌어내야 한다. ■ 자녀 양육 시 예상치 못한 어려움에 봉착해 몹시 난감하다.  예상치 못한 장애물을 만났거나 성장을 위해 대인 기술을 개발하고 싶다면 더 이상 고민할 필요가 없다. ‘유연함의 기술’을 적용하면 누구나 성장과 자기 계발의 주인이 될 수 있다. 애쉬포드가 안내하는 성장',11,'11','베스트');
Insert into M_BOOK_DETAIL (BOOKNO,BCATEGORYNO,BIMG,BIMGDETAIL,BDESCRIPTION,BPAGE,BSIZE,BADGE) values (12,7,'book12.jpg','book12detail.jpg','“이 책은 흐르는 삶 속에서 ‘자기 자신’이라는 유일한 섬이 되는 길을 안내한다. 삶은 내가 내 의지대로 살아가는 게 아니라 그저 흘러가며 살아지는 것이다.” _ 최재천(이화여대 에코과학부 석좌교수, 생명다양성재단 이사장)  “인생과 바다에 대해서 어쩌면 이렇게까지 깊고 넓고 새로운 통찰을 할 수 있을까? 내내 감탄하면서 읽었다.” _ 이해인(수녀, 시인)  그 어느 때보다 본질에 집중해야 할 필요를 느끼는 요즘, 우리에게 ''무한함''과 삶의 모습',55,'55','신상품');

REM INSERTING into M_CART
SET DEFINE OFF;
Insert into M_CART (CARTNO,MEMBERNO,BOOKNO,CCOUNT) values (28,3,7,1);
Insert into M_CART (CARTNO,MEMBERNO,BOOKNO,CCOUNT) values (27,3,18,1);
Insert into M_CART (CARTNO,MEMBERNO,BOOKNO,CCOUNT) values (29,3,3,1);
Insert into M_CART (CARTNO,MEMBERNO,BOOKNO,CCOUNT) values (31,3,6,1);
Insert into M_CART (CARTNO,MEMBERNO,BOOKNO,CCOUNT) values (32,3,4,1);
Insert into M_CART (CARTNO,MEMBERNO,BOOKNO,CCOUNT) values (25,2,2,1);
Insert into M_CART (CARTNO,MEMBERNO,BOOKNO,CCOUNT) values (23,2,7,2);
Insert into M_CART (CARTNO,MEMBERNO,BOOKNO,CCOUNT) values (22,2,10,2);
Insert into M_CART (CARTNO,MEMBERNO,BOOKNO,CCOUNT) values (24,2,3,1);
REM INSERTING into M_COUPON
SET DEFINE OFF;
Insert into M_COUPON (CPNO,CPNAME,CPDESCRIPTION,CPPRICE,CPCREATED,CPVALID,CPSTATUS) values (1,'신규가입 할인쿠폰','회원가입 시 제공되는 가입 이벤트 할인쿠폰',10000,to_date('23/09/12','RR/MM/DD'),to_date('23/09/20','RR/MM/DD'),'FALSE');
Insert into M_COUPON (CPNO,CPNAME,CPDESCRIPTION,CPPRICE,CPCREATED,CPVALID,CPSTATUS) values (2,'WMBOOK 개업 이벤트','개업 이벤트',5000,to_date('23/09/12','RR/MM/DD'),to_date('23/09/20','RR/MM/DD'),'FALSE');
Insert into M_COUPON (CPNO,CPNAME,CPDESCRIPTION,CPPRICE,CPCREATED,CPVALID,CPSTATUS) values (3,'가을은 독서 이벤트','가을은 독서의 계절, 책을 읽자',2000,to_date('23/09/07','RR/MM/DD'),to_date('23/11/15','RR/MM/DD'),'FALSE');
Insert into M_COUPON (CPNO,CPNAME,CPDESCRIPTION,CPPRICE,CPCREATED,CPVALID,CPSTATUS) values (4,'사용된 쿠폰','사용된 쿠폰입니다.',3000,to_date('23/09/07','RR/MM/DD'),to_date('23/10/15','RR/MM/DD'),'TRUE');
Insert into M_COUPON (CPNO,CPNAME,CPDESCRIPTION,CPPRICE,CPCREATED,CPVALID,CPSTATUS) values (5,'신규가입 할인쿠폰','회원가입 시 제공되는 가입 이벤트 할인쿠폰',10000,to_date('23/09/13','RR/MM/DD'),to_date('23/09/20','RR/MM/DD'),'FALSE');
Insert into M_COUPON (CPNO,CPNAME,CPDESCRIPTION,CPPRICE,CPCREATED,CPVALID,CPSTATUS) values (6,'WMBOOK 개업 이벤트','개업 이벤트',5000,to_date('23/09/13','RR/MM/DD'),to_date('23/09/20','RR/MM/DD'),'FALSE');
Insert into M_COUPON (CPNO,CPNAME,CPDESCRIPTION,CPPRICE,CPCREATED,CPVALID,CPSTATUS) values (7,'가을은 독서 이벤트','가을은 독서의 계절, 책을 읽자',2000,to_date('23/09/07','RR/MM/DD'),to_date('23/11/15','RR/MM/DD'),'FALSE');
Insert into M_COUPON (CPNO,CPNAME,CPDESCRIPTION,CPPRICE,CPCREATED,CPVALID,CPSTATUS) values (8,'사용된 쿠폰','사용된 쿠폰입니다.',3000,to_date('23/09/07','RR/MM/DD'),to_date('23/10/15','RR/MM/DD'),'TRUE');
Insert into M_COUPON (CPNO,CPNAME,CPDESCRIPTION,CPPRICE,CPCREATED,CPVALID,CPSTATUS) values (0,'0원쿠폰','0원쿠폰',0,to_date('23/09/15','RR/MM/DD'),to_date('23/09/29','RR/MM/DD'),'TRUE');
Insert into M_COUPON (CPNO,CPNAME,CPDESCRIPTION,CPPRICE,CPCREATED,CPVALID,CPSTATUS) values (9,'신규가입 할인쿠폰','회원가입 시 제공되는 가입 이벤트 할인쿠폰',10000,to_date('23/09/12','RR/MM/DD'),to_date('23/09/20','RR/MM/DD'),'FALSE');
Insert into M_COUPON (CPNO,CPNAME,CPDESCRIPTION,CPPRICE,CPCREATED,CPVALID,CPSTATUS) values (10,'WMBOOK 개업 이벤트','개업 이벤트',5000,to_date('23/09/12','RR/MM/DD'),to_date('23/09/20','RR/MM/DD'),'FALSE');
Insert into M_COUPON (CPNO,CPNAME,CPDESCRIPTION,CPPRICE,CPCREATED,CPVALID,CPSTATUS) values (11,'가을은 독서 이벤트','가을은 독서의 계절, 책을 읽자',2000,to_date('23/09/07','RR/MM/DD'),to_date('23/11/15','RR/MM/DD'),'FALSE');
Insert into M_COUPON (CPNO,CPNAME,CPDESCRIPTION,CPPRICE,CPCREATED,CPVALID,CPSTATUS) values (12,'사용된 쿠폰','사용된 쿠폰입니다.',3000,to_date('23/09/07','RR/MM/DD'),to_date('23/10/15','RR/MM/DD'),'TRUE');
Insert into M_COUPON (CPNO,CPNAME,CPDESCRIPTION,CPPRICE,CPCREATED,CPVALID,CPSTATUS) values (15,'쿠폰등록','쿠폰등록',2000,to_date('23/09/18','RR/MM/DD'),to_date('23/09/25','RR/MM/DD'),'TRUE');
REM INSERTING into M_COUPON_MEMBER
SET DEFINE OFF;
Insert into M_COUPON_MEMBER (CPNO,MEMBERNO,CPNO2,CPRDATE,CPVALID,CPSTATUS) values (1,3,1,to_date('23/09/12','RR/MM/DD'),to_date('23/09/20','RR/MM/DD'),'N');
Insert into M_COUPON_MEMBER (CPNO,MEMBERNO,CPNO2,CPRDATE,CPVALID,CPSTATUS) values (2,3,2,to_date('23/09/12','RR/MM/DD'),to_date('23/09/20','RR/MM/DD'),'N');
Insert into M_COUPON_MEMBER (CPNO,MEMBERNO,CPNO2,CPRDATE,CPVALID,CPSTATUS) values (3,3,3,to_date('23/09/07','RR/MM/DD'),to_date('23/11/15','RR/MM/DD'),'N');
Insert into M_COUPON_MEMBER (CPNO,MEMBERNO,CPNO2,CPRDATE,CPVALID,CPSTATUS) values (4,3,4,to_date('23/09/07','RR/MM/DD'),to_date('23/10/15','RR/MM/DD'),'Y');
Insert into M_COUPON_MEMBER (CPNO,MEMBERNO,CPNO2,CPRDATE,CPVALID,CPSTATUS) values (5,2,5,to_date('23/09/12','RR/MM/DD'),to_date('23/09/20','RR/MM/DD'),'N');
Insert into M_COUPON_MEMBER (CPNO,MEMBERNO,CPNO2,CPRDATE,CPVALID,CPSTATUS) values (6,2,6,to_date('23/09/12','RR/MM/DD'),to_date('23/09/20','RR/MM/DD'),'N');
Insert into M_COUPON_MEMBER (CPNO,MEMBERNO,CPNO2,CPRDATE,CPVALID,CPSTATUS) values (7,2,7,to_date('23/09/07','RR/MM/DD'),to_date('23/11/15','RR/MM/DD'),'N');
Insert into M_COUPON_MEMBER (CPNO,MEMBERNO,CPNO2,CPRDATE,CPVALID,CPSTATUS) values (8,2,8,to_date('23/09/07','RR/MM/DD'),to_date('23/10/15','RR/MM/DD'),'N');
Insert into M_COUPON_MEMBER (CPNO,MEMBERNO,CPNO2,CPRDATE,CPVALID,CPSTATUS) values (13,2,0,to_date('23/09/07','RR/MM/DD'),to_date('23/11/15','RR/MM/DD'),'Y');
Insert into M_COUPON_MEMBER (CPNO,MEMBERNO,CPNO2,CPRDATE,CPVALID,CPSTATUS) values (9,1,9,to_date('23/09/12','RR/MM/DD'),to_date('23/09/20','RR/MM/DD'),'N');
Insert into M_COUPON_MEMBER (CPNO,MEMBERNO,CPNO2,CPRDATE,CPVALID,CPSTATUS) values (10,1,10,to_date('23/09/12','RR/MM/DD'),to_date('23/09/20','RR/MM/DD'),'N');
Insert into M_COUPON_MEMBER (CPNO,MEMBERNO,CPNO2,CPRDATE,CPVALID,CPSTATUS) values (11,1,11,to_date('23/09/07','RR/MM/DD'),to_date('23/11/15','RR/MM/DD'),'N');
Insert into M_COUPON_MEMBER (CPNO,MEMBERNO,CPNO2,CPRDATE,CPVALID,CPSTATUS) values (12,1,12,to_date('23/09/07','RR/MM/DD'),to_date('23/10/15','RR/MM/DD'),'N');
REM INSERTING into M_DELIVERY
SET DEFINE OFF;
Insert into M_DELIVERY (DELIVERYNO,ORDERNO,MEMBERNO,DADDRESS1,DADDRESS2,DADDRESS3,DZIPCODE,DTEL,DNAME) values (3,4,4,'서울 구로구 가마산로 87','101동 1202호','(구로동, 한일유앤아이아파트)',8327,'070-1600-4633','홍길동');
Insert into M_DELIVERY (DELIVERYNO,ORDERNO,MEMBERNO,DADDRESS1,DADDRESS2,DADDRESS3,DZIPCODE,DTEL,DNAME) values (9,12,2,'서울 구로구 가마산로 87','101동 203호',' (구로동, 한일유앤아이아파트)',8327,'01012223333','홍길동');
Insert into M_DELIVERY (DELIVERYNO,ORDERNO,MEMBERNO,DADDRESS1,DADDRESS2,DADDRESS3,DZIPCODE,DTEL,DNAME) values (6,9,2,'서울 강남구 가로수길 5','55',' (신사동)',6035,'01012345678','김유저');
Insert into M_DELIVERY (DELIVERYNO,ORDERNO,MEMBERNO,DADDRESS1,DADDRESS2,DADDRESS3,DZIPCODE,DTEL,DNAME) values (8,11,2,'경기 성남시 분당구 경부고속도로 409','22',' (삼평동)',13473,'01012345678','김유저');
Insert into M_DELIVERY (DELIVERYNO,ORDERNO,MEMBERNO,DADDRESS1,DADDRESS2,DADDRESS3,DZIPCODE,DTEL,DNAME) values (3,6,2,'서울 구로구 가마산로 87','111동 222호',' (구로동, 한일유앤아이아파트)',8327,'01022223333','홍길동');
Insert into M_DELIVERY (DELIVERYNO,ORDERNO,MEMBERNO,DADDRESS1,DADDRESS2,DADDRESS3,DZIPCODE,DTEL,DNAME) values (4,7,2,'서울 구로구 가마산로 87','222',' (구로동, 한일유앤아이아파트)',8327,'01044445555','ㅇㅇㅇ');
Insert into M_DELIVERY (DELIVERYNO,ORDERNO,MEMBERNO,DADDRESS1,DADDRESS2,DADDRESS3,DZIPCODE,DTEL,DNAME) values (1,1,2,'서울 구로구 가마산로 77','22',' (구로동)',8327,'0100000000','김효슬');
Insert into M_DELIVERY (DELIVERYNO,ORDERNO,MEMBERNO,DADDRESS1,DADDRESS2,DADDRESS3,DZIPCODE,DTEL,DNAME) values (10,13,2,'서울 구로구 가마산로 87','101동 202호',' (구로동, 한일유앤아이아파트)',8327,'01099998888','김유저');
REM INSERTING into M_EVENT
SET DEFINE OFF;
REM INSERTING into M_FAQ
SET DEFINE OFF;
Insert into M_FAQ (FAQNO,FQUESTION,FANSWER,FCATEGORY,FREGDATE,DELETED) values (1,'외국도서의 경우 반품 및 취소/환불이 가능한가요?','* 변심, 오주문에 의한 반품

1. 일반외서는 출고일로부터 10일 이내 미사용 시 반품택배비 차감 후 반품이 가능합니다.

2. 직수입외국도서는 출고일로부터 10일 이내 미사용 시  해외주문취소수수료 20%와 반품택배비 차감 후 반품이 가능합니다.(단, 랩핑도서의 경우 랩핑개봉 시 반품이 불가합니다. )



* 파손, 파본, 오발송에 의한 반품

파손, 파본, 오 발송 등의 경우 외국도서 및 직수입외국도서 모두 반품 및 교환이 가능하며, 반품기간은 출고일 기준 30일까지 가능합니다.

(책 단면이 울퉁불퉁한 도서는 Deckle Edge/Rough Cut 방식으로, 고급 제본된 상품이기 때문에 반품/교환 대상이 아닙니다.)



단, 문제점 발견이 단기간에 어려운 파본의 경우 문제점 발견 후 30일(늦어도 수령일로부터 3개월) 까지 가능','반품/교환/환불',to_date('23/09/18','RR/MM/DD'),'no ');
Insert into M_FAQ (FAQNO,FQUESTION,FANSWER,FCATEGORY,FREGDATE,DELETED) values (2,'주문한 상품이 품절/절판인 경우, 환불은 어떻게 이루어 지나요?',TO_CLOB(q'[주문하신 상품이 품절/절판인 경우는 상품준비가 불가능하기 때문에 보내드리기가 어려워 자동으로 주문취소가 됩니다.

주문시 사용 된 결제수단별로 환불되며, 결제수단별 자세한 환불방법은 아래와 같습니다. 

<결제수단별 환불안내> 

(1)신용카드 (간편결제 포함)  

- 전체취소 : 카드사 매입전은 당일 취소 되며, 카드사 매입후는 카드사에 따라 2일~ 최대 2주(공휴일 제외) 소요 됩니다.  

- 부분취소 : 카드사 매입후 취소 처리 되며, 카드사에 따라 2일~ 최대 2주(공휴일 제외) 소요 됩니다.(당일 부분취소한 경우도 동일함) 



※신용카드 부분취소 유의 사항  

- 카드사 취소 처리 되는 시점에 카드사에서 취소 문자 전송됩니다. (단, 카드사 문자 신청한 경우만 전송됨)  

- 부분취소 불가한 경우 예치금으로 처리 될 수 있습니다.     

: 카드사 포인트를 사용하여 결제한 경우 (롯데카드, 현대카드, 외환카드)     

: 카드사 정책에 따라 부분취소 불가능]')
|| TO_CLOB(q'[한 카드 (기프트카드, 법인복지카드 등)  

- 카드사정책에 따라 할부거래에 대해 부분취소 후, 잔여금액이 5만 원 미만인 경우 할부유지 또는 일시불로 전환 됩니다.     

:삼성: 기존할부 유지, 비씨 : 일시불로 전환 등  



※ 법인카드는 예치금으로 환원됩니다. 



(2)실시간계좌이체  

- 전체취소 : 승인한 당일 실시간계좌이체시 결제한 본인 계좌로 입금됩니다.  

- 부분취소 : 익일에 실시간계좌이체시 결제한 본인 계좌로 입금됩니다. 



(3)온라인입금  

- 전체/부분 취소 : 예치금으로 환원됩니다. (마이룸>예치금 환불신청 가능) 



(4)휴대폰결제, 모바일티머니  

- 전체취소 : 주문한상품을 모두 취소 한경우 즉시 취소 됩니다.  

- 부분취소 : 주문한 상품중 일부 상품을 취소한 경우 예치금으로 환불 됩니다. ]'),'반품/교환/환불',to_date('23/09/18','RR/MM/DD'),'no ');
Insert into M_FAQ (FAQNO,FQUESTION,FANSWER,FCATEGORY,FREGDATE,DELETED) values (3,'파본/훼손/오배송 된 상품을 교환하고 싶습니다. 어떻게 해야하나요?','일반 택배로 배송 받으신 상품에 하자가 있는 경우, 인터넷 홈페이지에서 배송 완료일로 부터 30일 이내 마이 > 주문/ 배송목록 > 주문상세페이지 > 교환신청 가능합니다.



※ 도서 자체 인쇄 파본인 경우 문제점 발견 후 30일이내 ※ 단, 우편/ 편의점택배 수령의 경우 회수주소지 정보에 일반 주소지 입력해 주시면 일반택배로 맞교환 진행됩니다. 

고객센터 1:1상담에서 <파본/ 상품불량 신고> 또는 <반품/교환/환불> 상담에 주문번호와 내용을 기재하여 주십시오. 



담당자 확인 후 주문시의 주소로 상품을 다시 배송 해 드립니다. 파본도서는 배송 된 상품을 받으시면서 맞교환해주시면 됩니다. 

택배직원 편에 반송을 못하셨을 경우, 고객센터의 Qa <반품/교환/환불>로 문의 접수해주시면, 택배기사가 반품회수 재방문을 하도록 조치해드립니다. 

또는 주문번호와 반송사유를 간략하게 메모하여 착불 반품을 보내주셔도 됩니다. ','반품/교환/환불',to_date('23/09/18','RR/MM/DD'),'no ');
Insert into M_FAQ (FAQNO,FQUESTION,FANSWER,FCATEGORY,FREGDATE,DELETED) values (4,'(택배파업)택배 파업 지역 반품 및 회수시 어떻게 하나요?','수령하신 도서의 반품을 원하시는 경우에는 매장에 직접 반품해주시거나 파업지역이 아닌 경우 홈페이지에서 반품신청을 해주시면 기사님께서 방문 회수하시게 됩니다.

파업지역인 경우, 다른 택배를 이용하여 아래 주소로 착불 반품 부탁드립니다. 



반품처 : 서울특별시 구로구 서울시 구로구 시흥대로 163길 33, 주호타워 구트아카데미 2층, 3층 인터넷반품담당자 앞','반품/교환/환불',to_date('23/09/18','RR/MM/DD'),'no ');
Insert into M_FAQ (FAQNO,FQUESTION,FANSWER,FCATEGORY,FREGDATE,DELETED) values (5,'배송이 안옵니다.','그렇습니까?','배송/수령일 안내',to_date('23/09/18','RR/MM/DD'),'no ');
Insert into M_FAQ (FAQNO,FQUESTION,FANSWER,FCATEGORY,FREGDATE,DELETED) values (6,'주문 취소하고싶어요','안됩니다.','주문취소/변경',to_date('23/09/18','RR/MM/DD'),'no ');

REM INSERTING into M_MEMBER
SET DEFINE OFF;
Insert into M_MEMBER (MEMBERNO,MID,MPW,MBIRTH,MNAME,MEMAIL,MTEL,MREGDATE,MPROFILEIMG,MFAVORITE,MAUTHORITY,DELETED) values (1,'wmbooks','$2a$10$.lS4BGZfvqJk69FzDUMTROC/9lhdyKtq6ad4xG417/fvIGp7r/e2u',to_date('23/08/31','RR/MM/DD'),'웹몬','hyottly@gmail.com','0100000000',to_date('23/09/13','RR/MM/DD'),'상세페이지 로고12.png','소설','관리자','no ');
Insert into M_MEMBER (MEMBERNO,MID,MPW,MBIRTH,MNAME,MEMAIL,MTEL,MREGDATE,MPROFILEIMG,MFAVORITE,MAUTHORITY,DELETED) values (2,'user1','$2a$10$AQGV58OxJfd2BI6JBdEbxO9iLP8zzsIqkWWqH8.roxixNaKn7E7.e',to_date('95/12/23','RR/MM/DD'),'김유저','hyottly@gmail.com','01112341234',to_date('23/09/13','RR/MM/DD'),'cat25.jpg','시,경제','사용자','no ');
Insert into M_MEMBER (MEMBERNO,MID,MPW,MBIRTH,MNAME,MEMAIL,MTEL,MREGDATE,MPROFILEIMG,MFAVORITE,MAUTHORITY,DELETED) values (3,'monster','$2a$10$b3RGLf36DFdphBs2aJYMYeupmXKm1AFDjvw4qK57gC5wvMo1z92MG',to_date('22/09/01','RR/MM/DD'),'몬스터','hyottly@gmail.com','01012345678',to_date('23/09/13','RR/MM/DD'),'kimpingu1.jpg','소설,정치/사회,컴퓨터/IT','사용자','no ');
Insert into M_MEMBER (MEMBERNO,MID,MPW,MBIRTH,MNAME,MEMAIL,MTEL,MREGDATE,MPROFILEIMG,MFAVORITE,MAUTHORITY,DELETED) values (4,'blue33','$2a$10$/lhhbuykr4B7bpR6Z3rpOuLIcHrtOkryj83LAYmZa.M8WQz6vpC7K',to_date('23/08/30','RR/MM/DD'),'김진별별별','aa@naver.com','01022223333',to_date('23/09/13','RR/MM/DD'),null,'인문,가정/육아,경제/경영','사용자','no ');
Insert into M_MEMBER (MEMBERNO,MID,MPW,MBIRTH,MNAME,MEMAIL,MTEL,MREGDATE,MPROFILEIMG,MFAVORITE,MAUTHORITY,DELETED) values (5,'monster2','$2a$10$4uOdqjXyZn5/5nM5rSiGm.cmrOFTq8FF1HR8/EwQHxd9VE4V2Xi5.',to_date('23/09/13','RR/MM/DD'),'박철수','m3pop@hanmail.net','01049125139',to_date('23/09/13','RR/MM/DD'),null,'소설,인문,가정/육아','사용자','no ');
Insert into M_MEMBER (MEMBERNO,MID,MPW,MBIRTH,MNAME,MEMAIL,MTEL,MREGDATE,MPROFILEIMG,MFAVORITE,MAUTHORITY,DELETED) values (101,'ididid1','1111',to_date('00/01/01','RR/MM/DD'),'이름','이메일','111-111',to_date('23/09/12','RR/MM/DD'),null,null,'사용자','no ');
Insert into M_MEMBER (MEMBERNO,MID,MPW,MBIRTH,MNAME,MEMAIL,MTEL,MREGDATE,MPROFILEIMG,MFAVORITE,MAUTHORITY,DELETED) values (102,'ididid2','1111',to_date('00/01/01','RR/MM/DD'),'이름','이메일','111-111',to_date('23/09/12','RR/MM/DD'),null,null,'사용자','no ');
Insert into M_MEMBER (MEMBERNO,MID,MPW,MBIRTH,MNAME,MEMAIL,MTEL,MREGDATE,MPROFILEIMG,MFAVORITE,MAUTHORITY,DELETED) values (103,'ididid3','1111',to_date('00/01/01','RR/MM/DD'),'이름','이메일','111-111',to_date('23/09/12','RR/MM/DD'),null,null,'사용자','no ');
Insert into M_MEMBER (MEMBERNO,MID,MPW,MBIRTH,MNAME,MEMAIL,MTEL,MREGDATE,MPROFILEIMG,MFAVORITE,MAUTHORITY,DELETED) values (104,'ididid4','1111',to_date('00/01/01','RR/MM/DD'),'이름','이메일','111-111',to_date('23/09/12','RR/MM/DD'),null,null,'사용자','no ');
Insert into M_MEMBER (MEMBERNO,MID,MPW,MBIRTH,MNAME,MEMAIL,MTEL,MREGDATE,MPROFILEIMG,MFAVORITE,MAUTHORITY,DELETED) values (105,'ididid5','1111',to_date('00/01/01','RR/MM/DD'),'이름','이메일','111-111',to_date('23/09/12','RR/MM/DD'),null,null,'사용자','no ');
Insert into M_MEMBER (MEMBERNO,MID,MPW,MBIRTH,MNAME,MEMAIL,MTEL,MREGDATE,MPROFILEIMG,MFAVORITE,MAUTHORITY,DELETED) values (106,'admin1','$2a$10$XGh14kNDjDl1Nkv9b84Qy.jIiGJIxdBWxezVUlY5zoL/4TCf7/Lx2',to_date('00/01/01','RR/MM/DD'),'이름','lll@gmail.com','111-111',to_date('23/09/12','RR/MM/DD'),null,null,'관리자','no ');
Insert into M_MEMBER (MEMBERNO,MID,MPW,MBIRTH,MNAME,MEMAIL,MTEL,MREGDATE,MPROFILEIMG,MFAVORITE,MAUTHORITY,DELETED) values (6,'admin12','$2a$10$ADjCMS4iZK9Pkp/phUJlyuu9blD13dfNRfUMmjvJOxG2jf.i5/VHe',to_date('99/07/31','RR/MM/DD'),'김리영','fldus612@gmail.com','01063843834',to_date('23/09/18','RR/MM/DD'),null,'소설,시,경제,에세이 ,요리,문화','관리자','no ');
REM INSERTING into M_NOTICE
SET DEFINE OFF;
Insert into M_NOTICE (NOTICENO,NTITLE,NCONTENT,NWRITER,NREGDATE,NFILESRC,DELETED,MEMBERNO) values (1,'서비스 종료 안내','테스트','admin',to_date('23/09/18','RR/MM/DD'),null,'no ',1);
Insert into M_NOTICE (NOTICENO,NTITLE,NCONTENT,NWRITER,NREGDATE,NFILESRC,DELETED,MEMBERNO) values (2,'서비스 종료 안내','테스트','admin',to_date('23/09/18','RR/MM/DD'),null,'no ',1);
Insert into M_NOTICE (NOTICENO,NTITLE,NCONTENT,NWRITER,NREGDATE,NFILESRC,DELETED,MEMBERNO) values (3,'서비스 종료 안내','테스트','admin',to_date('23/09/18','RR/MM/DD'),null,'no ',1);
Insert into M_NOTICE (NOTICENO,NTITLE,NCONTENT,NWRITER,NREGDATE,NFILESRC,DELETED,MEMBERNO) values (4,'서비스 종료 안내','테스트','admin',to_date('23/09/18','RR/MM/DD'),null,'no ',1);
Insert into M_NOTICE (NOTICENO,NTITLE,NCONTENT,NWRITER,NREGDATE,NFILESRC,DELETED,MEMBERNO) values (5,'서비스 종료 안내','테스트','admin',to_date('23/09/18','RR/MM/DD'),null,'no ',1);
Insert into M_NOTICE (NOTICENO,NTITLE,NCONTENT,NWRITER,NREGDATE,NFILESRC,DELETED,MEMBERNO) values (6,'서비스 종료 안내','테스트','admin',to_date('23/09/18','RR/MM/DD'),null,'no ',1);
Insert into M_NOTICE (NOTICENO,NTITLE,NCONTENT,NWRITER,NREGDATE,NFILESRC,DELETED,MEMBERNO) values (7,'서비스 종료 안내','테스트','admin',to_date('23/09/18','RR/MM/DD'),null,'no ',1);
Insert into M_NOTICE (NOTICENO,NTITLE,NCONTENT,NWRITER,NREGDATE,NFILESRC,DELETED,MEMBERNO) values (8,'서비스 종료 안내','테스트','admin',to_date('23/09/18','RR/MM/DD'),null,'no ',1);
Insert into M_NOTICE (NOTICENO,NTITLE,NCONTENT,NWRITER,NREGDATE,NFILESRC,DELETED,MEMBERNO) values (9,'서비스 종료 안내','테스트','admin',to_date('23/09/18','RR/MM/DD'),null,'no ',1);
Insert into M_NOTICE (NOTICENO,NTITLE,NCONTENT,NWRITER,NREGDATE,NFILESRC,DELETED,MEMBERNO) values (10,'서비스 종료 안내','테스트','admin',to_date('23/09/18','RR/MM/DD'),null,'no ',1);
Insert into M_NOTICE (NOTICENO,NTITLE,NCONTENT,NWRITER,NREGDATE,NFILESRC,DELETED,MEMBERNO) values (11,'서비스 종료 안내','테스트','admin',to_date('23/09/18','RR/MM/DD'),null,'no ',1);
Insert into M_NOTICE (NOTICENO,NTITLE,NCONTENT,NWRITER,NREGDATE,NFILESRC,DELETED,MEMBERNO) values (12,'서비스 종료 안내','테스트','admin',to_date('23/09/18','RR/MM/DD'),null,'no ',1);
Insert into M_NOTICE (NOTICENO,NTITLE,NCONTENT,NWRITER,NREGDATE,NFILESRC,DELETED,MEMBERNO) values (13,'서비스 종료 안내','테스트','admin',to_date('23/09/18','RR/MM/DD'),null,'no ',1);
Insert into M_NOTICE (NOTICENO,NTITLE,NCONTENT,NWRITER,NREGDATE,NFILESRC,DELETED,MEMBERNO) values (14,'서비스 종료 안내','테스트','admin',to_date('23/09/18','RR/MM/DD'),null,'no ',1);
Insert into M_NOTICE (NOTICENO,NTITLE,NCONTENT,NWRITER,NREGDATE,NFILESRC,DELETED,MEMBERNO) values (15,'서비스 종료 안내','테스트','admin',to_date('23/09/18','RR/MM/DD'),null,'no ',1);
Insert into M_NOTICE (NOTICENO,NTITLE,NCONTENT,NWRITER,NREGDATE,NFILESRC,DELETED,MEMBERNO) values (16,'서비스 종료 안내','테스트','admin',to_date('23/09/18','RR/MM/DD'),null,'no ',1);
Insert into M_NOTICE (NOTICENO,NTITLE,NCONTENT,NWRITER,NREGDATE,NFILESRC,DELETED,MEMBERNO) values (19,'서비스 종료 안내','테스트','admin',to_date('23/09/18','RR/MM/DD'),null,'no ',1);
Insert into M_NOTICE (NOTICENO,NTITLE,NCONTENT,NWRITER,NREGDATE,NFILESRC,DELETED,MEMBERNO) values (17,'서비스 종료 안내','테스트','admin',to_date('23/09/18','RR/MM/DD'),null,'no ',1);
Insert into M_NOTICE (NOTICENO,NTITLE,NCONTENT,NWRITER,NREGDATE,NFILESRC,DELETED,MEMBERNO) values (18,'서비스 종료 안내','테스트','admin',to_date('23/09/18','RR/MM/DD'),null,'no ',1);

REM INSERTING into M_ORDER
SET DEFINE OFF;
Insert into M_ORDER (ORDERNO,MEMBERNO,CPNO,OTOTALPRICE,OSTATUS,OPAY) values (12,2,5,34150,'결제완료','카카오페이');
Insert into M_ORDER (ORDERNO,MEMBERNO,CPNO,OTOTALPRICE,OSTATUS,OPAY) values (9,2,7,14500,'배송완료','신용/체크카드');
Insert into M_ORDER (ORDERNO,MEMBERNO,CPNO,OTOTALPRICE,OSTATUS,OPAY) values (11,2,7,8900,'배송완료','카카오페이');
Insert into M_ORDER (ORDERNO,MEMBERNO,CPNO,OTOTALPRICE,OSTATUS,OPAY) values (6,2,6,17300,'결제완료','카카오페이');
Insert into M_ORDER (ORDERNO,MEMBERNO,CPNO,OTOTALPRICE,OSTATUS,OPAY) values (7,2,7,20300,'결제완료','카카오페이');
Insert into M_ORDER (ORDERNO,MEMBERNO,CPNO,OTOTALPRICE,OSTATUS,OPAY) values (4,2,1,11220,'배송완료','신용/체크카드');
Insert into M_ORDER (ORDERNO,MEMBERNO,CPNO,OTOTALPRICE,OSTATUS,OPAY) values (1,2,1,10000,'배송완료','카드결제');
Insert into M_ORDER (ORDERNO,MEMBERNO,CPNO,OTOTALPRICE,OSTATUS,OPAY) values (13,2,5,14900,'결제완료','카카오페이');
REM INSERTING into M_ORDER_DETAIL
SET DEFINE OFF;
Insert into M_ORDER_DETAIL (ORDERNO,BOOKNO,OPRICESELL,OCOUNT,OREFUND_CHECK,OREGDATE) values (12,3,14000,2,'환불가능',to_date('23/09/17','RR/MM/DD'));
Insert into M_ORDER_DETAIL (ORDERNO,BOOKNO,OPRICESELL,OCOUNT,OREFUND_CHECK,OREGDATE) values (12,6,13650,1,'환불가능',to_date('23/09/17','RR/MM/DD'));
Insert into M_ORDER_DETAIL (ORDERNO,BOOKNO,OPRICESELL,OCOUNT,OREFUND_CHECK,OREGDATE) values (9,3,14000,1,'환불가능',to_date('23/09/15','RR/MM/DD'));
Insert into M_ORDER_DETAIL (ORDERNO,BOOKNO,OPRICESELL,OCOUNT,OREFUND_CHECK,OREGDATE) values (11,7,8400,1,'환불가능',to_date('23/09/17','RR/MM/DD'));
Insert into M_ORDER_DETAIL (ORDERNO,BOOKNO,OPRICESELL,OCOUNT,OREFUND_CHECK,OREGDATE) values (6,1,19800,1,'환불가능',to_date('23/09/15','RR/MM/DD'));
Insert into M_ORDER_DETAIL (ORDERNO,BOOKNO,OPRICESELL,OCOUNT,OREFUND_CHECK,OREGDATE) values (7,1,19800,2,'환불가능',to_date('23/09/15','RR/MM/DD'));
Insert into M_ORDER_DETAIL (ORDERNO,BOOKNO,OPRICESELL,OCOUNT,OREFUND_CHECK,OREGDATE) values (7,1,19800,1,'환불가능',to_date('23/09/15','RR/MM/DD'));
Insert into M_ORDER_DETAIL (ORDERNO,BOOKNO,OPRICESELL,OCOUNT,OREFUND_CHECK,OREGDATE) values (7,1,19800,1,'환불가능',to_date('23/09/15','RR/MM/DD'));
Insert into M_ORDER_DETAIL (ORDERNO,BOOKNO,OPRICESELL,OCOUNT,OREFUND_CHECK,OREGDATE) values (4,4,18720,1,'환불가능',to_date('23/09/13','RR/MM/DD'));
Insert into M_ORDER_DETAIL (ORDERNO,BOOKNO,OPRICESELL,OCOUNT,OREFUND_CHECK,OREGDATE) values (1,1,4000,1,'환불가능',to_date('23/09/12','RR/MM/DD'));
Insert into M_ORDER_DETAIL (ORDERNO,BOOKNO,OPRICESELL,OCOUNT,OREFUND_CHECK,OREGDATE) values (13,3,14000,1,'환불가능',to_date('23/09/18','RR/MM/DD'));
Insert into M_ORDER_DETAIL (ORDERNO,BOOKNO,OPRICESELL,OCOUNT,OREFUND_CHECK,OREGDATE) values (13,7,8400,1,'환불가능',to_date('23/09/18','RR/MM/DD'));
REM INSERTING into M_QNA
SET DEFINE OFF;
REM INSERTING into M_REVIEW
SET DEFINE OFF;
Insert into M_REVIEW (REVIEWNO,BOOKNO,MEMBERNO,RTITLE,RCONTENT,REGDATE,RSTAR,REFILESRC,DELETED) values (13,3,2,'국내│경제                   영어 질문 독서법 ','이 책은 영어를 못하는 학부모도 실천 가능한 영어 질문 독서법의 로드맵이 담겨 있어 영어 교육의 방향성을 잡지 못하는 많은 학부모에게 올바른 가이드가 되어줄 것이다.',to_date('23/09/15','RR/MM/DD'),5,'english.jpg','NO ');
Insert into M_REVIEW (REVIEWNO,BOOKNO,MEMBERNO,RTITLE,RCONTENT,REGDATE,RSTAR,REFILESRC,DELETED) values (14,4,2,'국내│에세이                   돈의 속성(300쇄 리커버에디션) ','앞으로 살아가면서 자산 관리를 할 때에 소중한 지침서로 활용이 가능할 것 같습니다.
좋은 양서를 지필 해주신 저자 분께 감사드립니다.',to_date('23/09/15','RR/MM/DD'),5,'money.jpg','NO ');
Insert into M_REVIEW (REVIEWNO,BOOKNO,MEMBERNO,RTITLE,RCONTENT,REGDATE,RSTAR,REFILESRC,DELETED) values (1,12,1,'리뷰제목','리뷰내용',to_date('23/09/12','RR/MM/DD'),5,null,'NO ');
Insert into M_REVIEW (REVIEWNO,BOOKNO,MEMBERNO,RTITLE,RCONTENT,REGDATE,RSTAR,REFILESRC,DELETED) values (2,7,2,'리뷰제목','리뷰내용',to_date('23/09/12','RR/MM/DD'),2,null,'NO ');
Insert into M_REVIEW (REVIEWNO,BOOKNO,MEMBERNO,RTITLE,RCONTENT,REGDATE,RSTAR,REFILESRC,DELETED) values (3,10,3,'리뷰제목33','리뷰내용33',to_date('23/09/12','RR/MM/DD'),3,null,'NO ');
Insert into M_REVIEW (REVIEWNO,BOOKNO,MEMBERNO,RTITLE,RCONTENT,REGDATE,RSTAR,REFILESRC,DELETED) values (4,1,4,'리뷰제목44','리뷰내용33',to_date('23/09/12','RR/MM/DD'),1,null,'NO ');
Insert into M_REVIEW (REVIEWNO,BOOKNO,MEMBERNO,RTITLE,RCONTENT,REGDATE,RSTAR,REFILESRC,DELETED) values (5,1,5,'리뷰제목55','리뷰내용33',to_date('23/09/12','RR/MM/DD'),4,null,'NO ');
Insert into M_REVIEW (REVIEWNO,BOOKNO,MEMBERNO,RTITLE,RCONTENT,REGDATE,RSTAR,REFILESRC,DELETED) values (7,2,3,'리뷰제목','리뷰내용',to_date('23/09/12','RR/MM/DD'),5,null,'NO ');
Insert into M_REVIEW (REVIEWNO,BOOKNO,MEMBERNO,RTITLE,RCONTENT,REGDATE,RSTAR,REFILESRC,DELETED) values (9,4,2,'리뷰제목55','돈의 가치에 대해 다시 생각할 수 있는 계기가 되었습니다.
구체적이고 영확한 생각과 경우를 담은 책이네요! :)',to_date('23/09/12','RR/MM/DD'),4,null,'NO ');
Insert into M_REVIEW (REVIEWNO,BOOKNO,MEMBERNO,RTITLE,RCONTENT,REGDATE,RSTAR,REFILESRC,DELETED) values (10,5,2,'리뷰제목55','크리스토퍼 놀란 감독의 영화 ''오펜하이머''에 대한 이해도를 높이기 위해 구매했습니다.
빠른 배송 감사드립니다!',to_date('23/09/12','RR/MM/DD'),5,'american.jpg','NO ');
Insert into M_REVIEW (REVIEWNO,BOOKNO,MEMBERNO,RTITLE,RCONTENT,REGDATE,RSTAR,REFILESRC,DELETED) values (11,6,2,'리뷰제목55','읽는 내내 심장이 뛰었다. 막연했던 나의 우선 순위 3가지가 무엇인지 알게 된 것 같다.',to_date('23/09/12','RR/MM/DD'),4,'super.jpg','NO ');
Insert into M_REVIEW (REVIEWNO,BOOKNO,MEMBERNO,RTITLE,RCONTENT,REGDATE,RSTAR,REFILESRC,DELETED) values (12,1,3,'리뷰제목66','문장 하나 버릴게 없습니다 강력추천합니다',to_date('23/09/12','RR/MM/DD'),4,'퓨처셀프.jpg','NO ');
--------------------------------------------------------
--  DDL for Index SYS_C006071
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C006071" ON "M_FAQ" ("FAQNO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C006055
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C006055" ON "M_NOTICE" ("NOTICENO") 
  ;
--------------------------------------------------------
--  Constraints for Table M_BOOK
--------------------------------------------------------

  ALTER TABLE "M_BOOK" MODIFY ("BOOKNO" NOT NULL ENABLE);
  ALTER TABLE "M_BOOK" MODIFY ("BISBN" NOT NULL ENABLE);
  ALTER TABLE "M_BOOK" MODIFY ("BTITLE" NOT NULL ENABLE);
  ALTER TABLE "M_BOOK" MODIFY ("BWRITER" NOT NULL ENABLE);
  ALTER TABLE "M_BOOK" MODIFY ("BPDATE" NOT NULL ENABLE);
  ALTER TABLE "M_BOOK" MODIFY ("BPRICE" NOT NULL ENABLE);
  ALTER TABLE "M_BOOK" MODIFY ("BPRICESELL" NOT NULL ENABLE);
  ALTER TABLE "M_BOOK" MODIFY ("BSTATUS" NOT NULL ENABLE);
  ALTER TABLE "M_BOOK" MODIFY ("BCDATE" NOT NULL ENABLE);
  ALTER TABLE "M_BOOK" MODIFY ("BSTOCK" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table M_BOOK_CATEGORY
--------------------------------------------------------

  ALTER TABLE "M_BOOK_CATEGORY" MODIFY ("BCATEGORYNO" NOT NULL ENABLE);
  ALTER TABLE "M_BOOK_CATEGORY" MODIFY ("BCATEGORY1" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table M_BOOK_DETAIL
--------------------------------------------------------

  ALTER TABLE "M_BOOK_DETAIL" MODIFY ("BOOKNO" NOT NULL ENABLE);
  ALTER TABLE "M_BOOK_DETAIL" MODIFY ("BCATEGORYNO" NOT NULL ENABLE);
  ALTER TABLE "M_BOOK_DETAIL" MODIFY ("BADGE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table M_CART
--------------------------------------------------------

  ALTER TABLE "M_CART" MODIFY ("CARTNO" NOT NULL ENABLE);
  ALTER TABLE "M_CART" MODIFY ("MEMBERNO" NOT NULL ENABLE);
  ALTER TABLE "M_CART" MODIFY ("BOOKNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table M_COUPON
--------------------------------------------------------

  ALTER TABLE "M_COUPON" MODIFY ("CPNO" NOT NULL ENABLE);
  ALTER TABLE "M_COUPON" MODIFY ("CPNAME" NOT NULL ENABLE);
  ALTER TABLE "M_COUPON" MODIFY ("CPPRICE" NOT NULL ENABLE);
  ALTER TABLE "M_COUPON" MODIFY ("CPCREATED" NOT NULL ENABLE);
  ALTER TABLE "M_COUPON" MODIFY ("CPVALID" NOT NULL ENABLE);
  ALTER TABLE "M_COUPON" MODIFY ("CPSTATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table M_COUPON_MEMBER
--------------------------------------------------------

  ALTER TABLE "M_COUPON_MEMBER" MODIFY ("CPNO" NOT NULL ENABLE);
  ALTER TABLE "M_COUPON_MEMBER" MODIFY ("MEMBERNO" NOT NULL ENABLE);
  ALTER TABLE "M_COUPON_MEMBER" MODIFY ("CPNO2" NOT NULL ENABLE);
  ALTER TABLE "M_COUPON_MEMBER" MODIFY ("CPRDATE" NOT NULL ENABLE);
  ALTER TABLE "M_COUPON_MEMBER" MODIFY ("CPVALID" NOT NULL ENABLE);
  ALTER TABLE "M_COUPON_MEMBER" MODIFY ("CPSTATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table M_DELIVERY
--------------------------------------------------------

  ALTER TABLE "M_DELIVERY" MODIFY ("DELIVERYNO" NOT NULL ENABLE);
  ALTER TABLE "M_DELIVERY" MODIFY ("ORDERNO" NOT NULL ENABLE);
  ALTER TABLE "M_DELIVERY" MODIFY ("MEMBERNO" NOT NULL ENABLE);
  ALTER TABLE "M_DELIVERY" MODIFY ("DADDRESS1" NOT NULL ENABLE);
  ALTER TABLE "M_DELIVERY" MODIFY ("DADDRESS2" NOT NULL ENABLE);
  ALTER TABLE "M_DELIVERY" MODIFY ("DADDRESS3" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table M_FAQ
--------------------------------------------------------

  ALTER TABLE "M_FAQ" MODIFY ("FQUESTION" NOT NULL ENABLE);
  ALTER TABLE "M_FAQ" MODIFY ("FANSWER" NOT NULL ENABLE);
  ALTER TABLE "M_FAQ" MODIFY ("FCATEGORY" NOT NULL ENABLE);
  ALTER TABLE "M_FAQ" MODIFY ("FREGDATE" NOT NULL ENABLE);
  ALTER TABLE "M_FAQ" ADD PRIMARY KEY ("FAQNO")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table M_MEMBER
--------------------------------------------------------

  ALTER TABLE "M_MEMBER" MODIFY ("MEMBERNO" NOT NULL ENABLE);
  ALTER TABLE "M_MEMBER" MODIFY ("MID" NOT NULL ENABLE);
  ALTER TABLE "M_MEMBER" MODIFY ("MPW" NOT NULL ENABLE);
  ALTER TABLE "M_MEMBER" MODIFY ("MBIRTH" NOT NULL ENABLE);
  ALTER TABLE "M_MEMBER" MODIFY ("MNAME" NOT NULL ENABLE);
  ALTER TABLE "M_MEMBER" MODIFY ("MEMAIL" NOT NULL ENABLE);
  ALTER TABLE "M_MEMBER" MODIFY ("MTEL" NOT NULL ENABLE);
  ALTER TABLE "M_MEMBER" MODIFY ("MREGDATE" NOT NULL ENABLE);
  ALTER TABLE "M_MEMBER" MODIFY ("MAUTHORITY" NOT NULL ENABLE);
  ALTER TABLE "M_MEMBER" MODIFY ("DELETED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table M_NOTICE
--------------------------------------------------------

  ALTER TABLE "M_NOTICE" MODIFY ("NTITLE" NOT NULL ENABLE);
  ALTER TABLE "M_NOTICE" MODIFY ("NCONTENT" NOT NULL ENABLE);
  ALTER TABLE "M_NOTICE" MODIFY ("NWRITER" NOT NULL ENABLE);
  ALTER TABLE "M_NOTICE" MODIFY ("NREGDATE" NOT NULL ENABLE);
  ALTER TABLE "M_NOTICE" MODIFY ("MEMBERNO" NOT NULL ENABLE);
  ALTER TABLE "M_NOTICE" ADD PRIMARY KEY ("NOTICENO")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table M_ORDER
--------------------------------------------------------

  ALTER TABLE "M_ORDER" MODIFY ("ORDERNO" NOT NULL ENABLE);
  ALTER TABLE "M_ORDER" MODIFY ("MEMBERNO" NOT NULL ENABLE);
  ALTER TABLE "M_ORDER" MODIFY ("CPNO" NOT NULL ENABLE);
  ALTER TABLE "M_ORDER" MODIFY ("OTOTALPRICE" NOT NULL ENABLE);
  ALTER TABLE "M_ORDER" MODIFY ("OSTATUS" NOT NULL ENABLE);
  ALTER TABLE "M_ORDER" MODIFY ("OPAY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table M_ORDER_DETAIL
--------------------------------------------------------

  ALTER TABLE "M_ORDER_DETAIL" MODIFY ("ORDERNO" NOT NULL ENABLE);
  ALTER TABLE "M_ORDER_DETAIL" MODIFY ("BOOKNO" NOT NULL ENABLE);
  ALTER TABLE "M_ORDER_DETAIL" MODIFY ("OPRICESELL" NOT NULL ENABLE);
  ALTER TABLE "M_ORDER_DETAIL" MODIFY ("OCOUNT" NOT NULL ENABLE);
  ALTER TABLE "M_ORDER_DETAIL" MODIFY ("OREGDATE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table M_REVIEW
--------------------------------------------------------

  ALTER TABLE "M_REVIEW" MODIFY ("REVIEWNO" NOT NULL ENABLE);
  ALTER TABLE "M_REVIEW" MODIFY ("BOOKNO" NOT NULL ENABLE);
  ALTER TABLE "M_REVIEW" MODIFY ("MEMBERNO" NOT NULL ENABLE);
  ALTER TABLE "M_REVIEW" MODIFY ("RTITLE" NOT NULL ENABLE);
  ALTER TABLE "M_REVIEW" MODIFY ("RSTAR" NOT NULL ENABLE);
  ALTER TABLE "M_REVIEW" MODIFY ("DELETED" NOT NULL ENABLE);
