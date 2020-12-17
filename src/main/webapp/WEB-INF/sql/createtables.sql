-- 삭제 가능한 테이블과 커리문 조회
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;
-- 전체 시퀀스 조회
SELECT * FROM USER_SEQUENCES;

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

-- 회원 리뷰 시퀀스
CREATE SEQUENCE REVIEW_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
