 --멤버테이블 생성 ( 성호 )
  CREATE TABLE M_MEMBER  (	
    MEMBERNO NUMBER, 
	MID VARCHAR2(100), 
	MPW VARCHAR2(100), 
	MBIRTH DATE, 
	MNAME VARCHAR2(100), 
	MEMAIL VARCHAR2(100), 
	MTEL VARCHAR2(100), 
	MREGDATE DATE, 
	MPROFILEIMG VARCHAR2(255), 
	MFAVORITE VARCHAR2(255), 
	MAUTHORITY VARCHAR2(10), 
	DELETED CHAR(3)
   );

Insert into M_MEMBER (MEMBERNO,MID,MPW,MBIRTH,MNAME,MEMAIL,MTEL,MREGDATE,MPROFILEIMG,MFAVORITE,MAUTHORITY,DELETED) values (6,'asdf12','123456@',to_date('92/07/01','RR/MM/DD'),'카이지','test1@naver.com','01097922422',to_date('23/09/04','RR/MM/DD'),null,null,'사용자','no ');
Insert into M_MEMBER (MEMBERNO,MID,MPW,MBIRTH,MNAME,MEMAIL,MTEL,MREGDATE,MPROFILEIMG,MFAVORITE,MAUTHORITY,DELETED) values (1,'user1','123456@',to_date('90/01/15','RR/MM/DD'),'홍길동','user123@email.com','01012345678',to_date('23/08/23','RR/MM/DD'),null,null,'사용자','no ');
Insert into M_MEMBER (MEMBERNO,MID,MPW,MBIRTH,MNAME,MEMAIL,MTEL,MREGDATE,MPROFILEIMG,MFAVORITE,MAUTHORITY,DELETED) values (2,'oreho','1234',to_date('96/12/03','RR/MM/DD'),'관리자','admin@admin.com','010-1111-2222',to_date('23/08/23','RR/MM/DD'),null,null,'admin','No ');
Insert into M_MEMBER (MEMBERNO,MID,MPW,MBIRTH,MNAME,MEMAIL,MTEL,MREGDATE,MPROFILEIMG,MFAVORITE,MAUTHORITY,DELETED) values (3,'user2','1234',to_date('94/12/13','RR/MM/DD'),'타나카','tanaka@dana.com','010-1234-2233',to_date('23/08/25','RR/MM/DD'),null,'순정','user','NO ');
Insert into M_MEMBER (MEMBERNO,MID,MPW,MBIRTH,MNAME,MEMAIL,MTEL,MREGDATE,MPROFILEIMG,MFAVORITE,MAUTHORITY,DELETED) values (4,'ho','1234',to_date('92/02/03','RR/MM/DD'),'호랑이','ho@hoho.com','010-8888-8888',to_date('23/08/31','RR/MM/DD'),null,null,'user','NO ');
Insert into M_MEMBER (MEMBERNO,MID,MPW,MBIRTH,MNAME,MEMAIL,MTEL,MREGDATE,MPROFILEIMG,MFAVORITE,MAUTHORITY,DELETED) values (5,'jsdoodoo','wkdtjdgh123@',to_date('96/12/03','RR/MM/DD'),'장성호','jsdoodoo96@naver.com','01076666666',to_date('23/09/04','RR/MM/DD'),null,'자기계발','관리자','no ');
