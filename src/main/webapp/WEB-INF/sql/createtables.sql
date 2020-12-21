-- 삭제 가능한 테이블과 커리문 조회
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;
-- 전체 시퀀스 조회
SELECT * FROM USER_SEQUENCES;

-- 테이블 삭제
DROP TABLE "MEMBERS" CASCADE CONSTRAINTS;
DROP TABLE "MOVIE" CASCADE CONSTRAINTS;
DROP TABLE "FAQ" CASCADE CONSTRAINTS;
DROP TABLE "CUSTOMERSERVICE" CASCADE CONSTRAINTS;
DROP TABLE "REVIEW" CASCADE CONSTRAINTS;
DROP TABLE "REVIEW2" CASCADE CONSTRAINTS;

-- 시퀀스 삭제
DROP SEQUENCE MEMBERS_SEQ;
DROP SEQUENCE FAQ_SEQ;
DROP SEQUENCE movie_seq;
DROP SEQUENCE REVIEW2_SEQ;
DROP SEQUENCE REVIEW_SEQ;
DROP SEQUENCE CUSTOMERSERVICE_SEQ;

-- THEATERS Table Create SQL
CREATE TABLE MEMBERS
(
    mem_uid        NUMBER           NOT NULL, 
    userid         VARCHAR2(20)     NOT NULL UNIQUE, 
    userpw         VARCHAR2(20)     NOT NULL, 
    name           VARCHAR2(20)     NOT NULL, 
    email          VARCHAR2(100)    NULL, 
    phone          VARCHAR2(20)     NULL, 
    zipcode        VARCHAR2(20)     NULL, 
    address1       VARCHAR2(100)    NULL, 
    address2       VARCHAR2(100)    NULL, 
    signupdate     DATE             NULL, 
    status         CHAR(1)          NOT NULL, 
    CONSTRAINT MEMBERS_PK PRIMARY KEY (mem_uid)
);

CREATE TABLE MOVIE
(
    movie_uid            NUMBER            NOT NULL, 
    movie_name           VARCHAR2(100)     NOT NULL, 
    movie_director       VARCHAR2(20)      NOT NULL, 
    movie_date           VARCHAR2(100)     NOT NULL, 
    move_time            VARCHAR2(20)      NOT NULL, 
    movie_actor          VARCHAR2(300)     NOT NULL, 
    movie_info           VARCHAR2(1000)    NOT NULL, 
    movie_img_address    VARCHAR2(400)     NOT NULL, 
    movie_screens		 NUMBER			   NOT NULL,
    movie_showdate		 VARCHAR2(20)      NOT NULL,
    movie_showtime		 VARCHAR2(20)      NOT NULL,
    CONSTRAINT MOVIE_PK PRIMARY KEY (movie_uid)
);

CREATE TABLE FAQ
(
    faq_uid        NUMBER           NOT NULL, 
    faq_subject    VARCHAR2(500)    NOT NULL, 
    faq_answer     CLOB             NOT NULL, 
    faq_regDate    TIMESTAMP        NOT NULL, 
    CONSTRAINT FAQ_PK PRIMARY KEY (faq_uid)
);

CREATE TABLE CUSTOMERSERVICE
(
    cs_uid        NUMBER          NOT NULL, 
    cs_memid      VARCHAR2(100)    NOT NULL,
    cs_subject    VARCHAR2(200)   NOT NULL,
    cs_content    CLOB            NOT NULL, 
   	cs_answer     CLOB            NULL, 
    cs_regdate    DATE            DEFAULT SYSDATE, 
    cs_status     CHAR(1)         DEFAULT '0' NOT NULL, 
    CONSTRAINT CUSTOMERSERVICE_PK PRIMARY KEY (cs_uid)
);

CREATE TABLE REVIEW
(
    reviewUid        NUMBER            NOT NULL, 
    rMemId           VARCHAR2(20)      NOT NULL, 
    rMovieName       VARCHAR2(100)     NOT NULL, 
    reviewContent    VARCHAR2(1000)    NOT NULL, 
    reviewGrade      NUMBER            NOT NULL, 
    reviewHeart      NUMBER            DEFAULT '0' NOT NULL,
    reviewRegdate    DATE              DEFAULT SYSDATE, 
    CONSTRAINT REVIEW_PK PRIMARY KEY (reviewUid)
);

CREATE TABLE REVIEW2
(
    reviewUid2        NUMBER            NOT NULL, 
    rMemId2           VARCHAR2(20)      NULL, 
    rMovieName2       VARCHAR2(100)     NULL, 
    reviewContent2    CLOB              NULL, 
    reviewGrade2      NUMBER            NULL, 
    reviewHeart2      NUMBER            DEFAULT '0' NOT NULL,
    reviewRegdate2    DATE              DEFAULT SYSDATE, 
    CONSTRAINT REVIEW_PK2 PRIMARY KEY (reviewUid2)
);

-- 리뷰 크롤링 시퀀스
CREATE SEQUENCE REVIEW2_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
-- 고객센터 1:1문의 시퀀스
CREATE SEQUENCE CUSTOMERSERVICE_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
-- 회원 리뷰 시퀀스
CREATE SEQUENCE REVIEW_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
-- 영화 시퀀스
CREATE SEQUENCE movie_seq START WITH 1 INCREMENT BY 1 NOCACHE;
-- FAQ 시퀀스
CREATE SEQUENCE FAQ_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
-- 회원관련 시퀀스
CREATE SEQUENCE MEMBERS_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;

-- FK 지정

-- 임시 관리자 계정
INSERT INTO MEMBERS(mem_uid, userid, userpw, name, status)
  	 VALUES(MEMBERS_SEQ.NEXTVAL, 'admin', 'admin', '관리자', '1');
-- 데이터
INSERT INTO MEMBERS(mem_uid, userid, userpw, name, email, phone, zipcode, 
					address1, address2, signupdate, status)
  	 VALUES(MEMBERS_SEQ.NEXTVAL, 'apple123', '1111', '사과', 'a@gmail.com', '010-1111-1111', 
  	 		'00135', '광교중앙로 1', '푸르지오', SYSDATE, '1');
  	 	
INSERT INTO MEMBERS(mem_uid, userid, userpw, name, email, phone, zipcode, 
					address1, address2, signupdate, status)
  	 VALUES(MEMBERS_SEQ.NEXTVAL, 'lemon123', '2222', '레몬', 'l@gmail.com', '010-2222-2222', 
  	 		'22135', '위올라이로 1', '스카이캐슬', SYSDATE, '1');
  	 	
INSERT INTO MEMBERS(mem_uid, userid, userpw, name, email, phone, zipcode, 
					address1, address2, signupdate, status)
  	 VALUES(MEMBERS_SEQ.NEXTVAL, 'banana123', '3333', '바나나', 'ban@gmail.com', '010-1111-2222', 
  	 		'12123', '시골로 1', '초가집', SYSDATE, '1');
  	 	
INSERT INTO MEMBERS(mem_uid, userid, userpw, name, email, phone, zipcode, 
					address1, address2, signupdate, status)
  	 VALUES(MEMBERS_SEQ.NEXTVAL, 'melon123', '0000', '김멜론', 'mel@gmail.com', '010-1111-2222', 
  	 		'12123', '무왕로 1', '협곡아파트', SYSDATE, '1');

INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'apple123', '인셉션', '솔직히 보면서 무슨내용인지 이해가 안갔습니다. 2~3번은 봐야 이해 갈것같아요', 3);

INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'lemon123', '어벤져스 : 엔드게임', '해리포터 시리즈 이후 최고의 영화', 9);

INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'banana123', '도굴', '재밌었습니다. 나름 마지막에 반전도 있었고, 하지만 동료가 생기는 과정이 너무 생략된점이 아쉽네요.', 7);

INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'melon123', '삼진그룹 영어토익반', '그냥저냥 볼만했던 것 같습니다. ', 5);

INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'melon123', '인셉션', '2번 보셔야 지립니다.', 8);

INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'apple123', '도굴', '이거 보느니 차라리 도둑들 볼것같네요', 2);

INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'banana123', '어벤져스 : 엔드게임', '마블 빅팬인데 마지막 장면 진짜 대박임..', 10);

-- 회원목록, 아이디중복, 로그인, 회원정보, 
SELECT * FROM MEMBERS;
SELECT * FROM REVIEW2;
--DELETE * FROM REVIEW2;

--SHOW PARAMETER PROCESSES;

--아이디중복체크
--SELECT userid FROM MEMBERS WHERE userid = 'apple123';			
--로그인
--SELECT userid FROM MEMBERS WHERE userid = 'apple123' and userpw = '1111'

--SELECT TO_CHAR(SYSDATE,'DL') FROM DUAL; --2019년 11월 30일 토요일
--회원정보
--SELECT userid, name, email, phone, zipcode, 
--					address1, address2, signupdate, status
--FROM MEMBERS WHERE userid = 'apple123';
--아이디
--SELECT userid FROM MEMBERS WHERE name = #{name} AND email = #{email}
-- SELECT userid FROM MEMBERS WHERE name = '사과' AND email = 'a@gmail.com'; 	
--비번
--SELECT userpw FROM MEMBERS WHERE userid = 'apple123' AND email= 'a@gmail.com'; 	
--메일 중복 체크
--SELECT email FROM MEMBERS WHERE email= 'a@gmail.com';
--회원정보수정
--UPDATE MEMBERS 
--	SET userpw = '1111', email = 'ab@gmail.com', phone = '010-2222-4321', 
--	zipcode = '00135', address1 = '상현중앙로', address2 = '221' WHERE userid = 'apple123';
--탈퇴하기 status = 0으로
--UPDATE MEMBERS SET status = '0' WHERE userid = 'apple123';
--포인트 조회
--SELECT userid, point FROM MEMBERS WHERE userid = 'apple123';
--SELECT userid, point FROM MEMBERS;	 	
--예매내역 보기 
--다중 테이블 조인 ANSI JOIN
--SELECT  B.BOOKING_STATUS, 
--		M.userid, 
--		V.MOVIE_NAME, 
--		T.THEATER_NAME, 
--		C.SCREEN_NAME, 
--		S.SEAT_NUM, 
--		K.TICKET_PRICE 
--  FROM BOOKING B
-- JOIN MEMBERS M
--    ON B.B_MEM_ID = M.userid 
-- JOIN THEATERS T
--    ON B.B_THEATER_UID = T.THEATER_UID 
-- JOIN SCREENS C
--    ON B.B_SCREEN_UID  = C.SCREEN_UID 
-- JOIN MOVIE V
--    ON B.B_MOVIE_UID = V.MOVIE_UID 
-- JOIN TICKET K
--    ON B.B_TICKET_UID = K.TICKET_UID
-- JOIN SEATS S
--    ON B.B_SEAT_UID = S.SEAT_UID
--WHERE B.B_MEM_ID = 'lemon123';
--INSERT INTO movie
--				(movie_uid, movie_name, movie_director, 
--				 movie_date, move_time, movie_actor, 
--				 movie_info, movie_img_address, movie_screens, 
--				 movie_showdate, movie_showtime)
--			VALUES
--				(movie_seq.nextval, '영화제목', '감독이름', '개봉일', '총상영시간', '출연배우', '줄거리', '이미지주소', 1, 
--				 '상영날짜', '상영시간');
--INSERT INTO MOVIE
--  	VALUES((movie_seq.nextval, '영화제목', '감독이름', '개봉일', '총상영시간', '출연배우', '줄거리', '이미지주소', 1, '상영날짜', '상영시간');
--			영화																				극장
--INSERT INTO THEATERS
--	VALUES(THEATERS_SEQ.NEXTVAL, '지역', '극장이름', '극장주소', 8, 640);
--			극장											상영관수, 총좌석수
--INSERT INTO SCREENS 
--	VALUES(SCREENS_SEQ.NEXTVAL, 1, '상영관이름', 80);
--					  상영관, 극장,			  총좌석
--INSERT INTO SEATS 
--	VALUES(SEATS_SEQ.NEXTVAL, 1, 10, 8, '0');
--			좌석, 상영관, 좌석 행, 좌석 열, 상태
--INSERT INTO TICKET
--	VALUES (TICKET_SEQ.NEXTVAL, 1, 8000);
--			티켓, 상영관, 가격
--INSERT INTO BOOKING 
--	VALUES (BOOKING_SEQ.NEXTVAL, '1', 'lemon123', 1, 1, 102, 1, 1);
--						예매, 상태,		 극장, 상영관, 영화, 좌석, 티켓)
--SELECT * FROM MOVIE;
--SELECT * FROM THEATERS;
--SELECT * FROM SCREENS;
--SELECT * FROM SEATS;
--SELECT * FROM TICKET;
--SELECT * FROM BOOKING;










