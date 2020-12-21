-- ���� ������ ���̺�� Ŀ���� ��ȸ
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;
-- ��ü ������ ��ȸ
SELECT * FROM USER_SEQUENCES;

-- ���̺� ����
DROP TABLE "MEMBERS" CASCADE CONSTRAINTS;
DROP TABLE "MOVIE" CASCADE CONSTRAINTS;
DROP TABLE "FAQ" CASCADE CONSTRAINTS;
DROP TABLE "CUSTOMERSERVICE" CASCADE CONSTRAINTS;
DROP TABLE "REVIEW" CASCADE CONSTRAINTS;
DROP TABLE "REVIEW2" CASCADE CONSTRAINTS;

-- ������ ����
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

-- ���� ũ�Ѹ� ������
CREATE SEQUENCE REVIEW2_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
-- ������ 1:1���� ������
CREATE SEQUENCE CUSTOMERSERVICE_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
-- ȸ�� ���� ������
CREATE SEQUENCE REVIEW_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
-- ��ȭ ������
CREATE SEQUENCE movie_seq START WITH 1 INCREMENT BY 1 NOCACHE;
-- FAQ ������
CREATE SEQUENCE FAQ_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
-- ȸ������ ������
CREATE SEQUENCE MEMBERS_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;

-- FK ����

-- �ӽ� ������ ����
INSERT INTO MEMBERS(mem_uid, userid, userpw, name, status)
  	 VALUES(MEMBERS_SEQ.NEXTVAL, 'admin', 'admin', '������', '1');
-- ������
INSERT INTO MEMBERS(mem_uid, userid, userpw, name, email, phone, zipcode, 
					address1, address2, signupdate, status)
  	 VALUES(MEMBERS_SEQ.NEXTVAL, 'apple123', '1111', '���', 'a@gmail.com', '010-1111-1111', 
  	 		'00135', '�����߾ӷ� 1', 'Ǫ������', SYSDATE, '1');
  	 	
INSERT INTO MEMBERS(mem_uid, userid, userpw, name, email, phone, zipcode, 
					address1, address2, signupdate, status)
  	 VALUES(MEMBERS_SEQ.NEXTVAL, 'lemon123', '2222', '����', 'l@gmail.com', '010-2222-2222', 
  	 		'22135', '���ö��̷� 1', '��ī��ĳ��', SYSDATE, '1');
  	 	
INSERT INTO MEMBERS(mem_uid, userid, userpw, name, email, phone, zipcode, 
					address1, address2, signupdate, status)
  	 VALUES(MEMBERS_SEQ.NEXTVAL, 'banana123', '3333', '�ٳ���', 'ban@gmail.com', '010-1111-2222', 
  	 		'12123', '�ð�� 1', '�ʰ���', SYSDATE, '1');
  	 	
INSERT INTO MEMBERS(mem_uid, userid, userpw, name, email, phone, zipcode, 
					address1, address2, signupdate, status)
  	 VALUES(MEMBERS_SEQ.NEXTVAL, 'melon123', '0000', '����', 'mel@gmail.com', '010-1111-2222', 
  	 		'12123', '���շ� 1', '�������Ʈ', SYSDATE, '1');

INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'apple123', '�μ���', '������ ���鼭 ������������ ���ذ� �Ȱ����ϴ�. 2~3���� ���� ���� ���Ͱ��ƿ�', 3);

INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'lemon123', '����� : �������', '�ظ����� �ø��� ���� �ְ��� ��ȭ', 9);

INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'banana123', '����', '��վ����ϴ�. ���� �������� ������ �־���, ������ ���ᰡ ����� ������ �ʹ� ���������� �ƽ��׿�.', 7);

INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'melon123', '�����׷� �������͹�', '�׳����� �����ߴ� �� �����ϴ�. ', 5);

INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'melon123', '�μ���', '2�� ���ž� �����ϴ�.', 8);

INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'apple123', '����', '�̰� ������ ���� ���ϵ� ���Ͱ��׿�', 2);

INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'banana123', '����� : �������', '���� �����ε� ������ ��� ��¥ �����..', 10);

-- ȸ�����, ���̵��ߺ�, �α���, ȸ������, 
SELECT * FROM MEMBERS;
SELECT * FROM REVIEW2;
--DELETE * FROM REVIEW2;

--SHOW PARAMETER PROCESSES;

--���̵��ߺ�üũ
--SELECT userid FROM MEMBERS WHERE userid = 'apple123';			
--�α���
--SELECT userid FROM MEMBERS WHERE userid = 'apple123' and userpw = '1111'

--SELECT TO_CHAR(SYSDATE,'DL') FROM DUAL; --2019�� 11�� 30�� �����
--ȸ������
--SELECT userid, name, email, phone, zipcode, 
--					address1, address2, signupdate, status
--FROM MEMBERS WHERE userid = 'apple123';
--���̵�
--SELECT userid FROM MEMBERS WHERE name = #{name} AND email = #{email}
-- SELECT userid FROM MEMBERS WHERE name = '���' AND email = 'a@gmail.com'; 	
--���
--SELECT userpw FROM MEMBERS WHERE userid = 'apple123' AND email= 'a@gmail.com'; 	
--���� �ߺ� üũ
--SELECT email FROM MEMBERS WHERE email= 'a@gmail.com';
--ȸ����������
--UPDATE MEMBERS 
--	SET userpw = '1111', email = 'ab@gmail.com', phone = '010-2222-4321', 
--	zipcode = '00135', address1 = '�����߾ӷ�', address2 = '221' WHERE userid = 'apple123';
--Ż���ϱ� status = 0����
--UPDATE MEMBERS SET status = '0' WHERE userid = 'apple123';
--����Ʈ ��ȸ
--SELECT userid, point FROM MEMBERS WHERE userid = 'apple123';
--SELECT userid, point FROM MEMBERS;	 	
--���ų��� ���� 
--���� ���̺� ���� ANSI JOIN
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
--				(movie_seq.nextval, '��ȭ����', '�����̸�', '������', '�ѻ󿵽ð�', '�⿬���', '�ٰŸ�', '�̹����ּ�', 1, 
--				 '�󿵳�¥', '�󿵽ð�');
--INSERT INTO MOVIE
--  	VALUES((movie_seq.nextval, '��ȭ����', '�����̸�', '������', '�ѻ󿵽ð�', '�⿬���', '�ٰŸ�', '�̹����ּ�', 1, '�󿵳�¥', '�󿵽ð�');
--			��ȭ																				����
--INSERT INTO THEATERS
--	VALUES(THEATERS_SEQ.NEXTVAL, '����', '�����̸�', '�����ּ�', 8, 640);
--			����											�󿵰���, ���¼���
--INSERT INTO SCREENS 
--	VALUES(SCREENS_SEQ.NEXTVAL, 1, '�󿵰��̸�', 80);
--					  �󿵰�, ����,			  ���¼�
--INSERT INTO SEATS 
--	VALUES(SEATS_SEQ.NEXTVAL, 1, 10, 8, '0');
--			�¼�, �󿵰�, �¼� ��, �¼� ��, ����
--INSERT INTO TICKET
--	VALUES (TICKET_SEQ.NEXTVAL, 1, 8000);
--			Ƽ��, �󿵰�, ����
--INSERT INTO BOOKING 
--	VALUES (BOOKING_SEQ.NEXTVAL, '1', 'lemon123', 1, 1, 102, 1, 1);
--						����, ����,		 ����, �󿵰�, ��ȭ, �¼�, Ƽ��)
--SELECT * FROM MOVIE;
--SELECT * FROM THEATERS;
--SELECT * FROM SCREENS;
--SELECT * FROM SEATS;
--SELECT * FROM TICKET;
--SELECT * FROM BOOKING;










