-- 테이블 삭제
DROP TABLE REGISTERL;
DROP TABLE SUBJECT;
DROP TABLE STUDENT;

-- 학생 테이블
CREATE TABLE STUDENT(
    STU_STUNO NUMBER NOT NULL,
    STU_NAME VARCHAR2(15 BYTE) ,
    STU_AGE NUMBER(3) ,
    CONSTRAINT PK_STU PRIMARY KEY(STU_STUNO)
);
    
-- 과목 테이블
CREATE TABLE SUBJECT(
    SUB_SUBNO VARCHAR2(2 BYTE) NOT NULL,
    SUB_SUBNAME VARCHAR2(8 BYTE) ,
    SUB_PRONAME VARCHAR2(9 BYTE) ,
    CONSTRAINT PK_SUB PRIMARY KEY(SUB_SUBNO)
);
    
-- 수강신청 테이블
CREATE TABLE REGISTER(
    REG_REQNO NUMBER NOT NULL,
    REG_STUNO NUMBER(5) ,
    REG_SUBNO VARCHAR2(1 BYTE) ,
    CONSTRAINT PK_REG PRIMARY KEY(REG_REQNO),
    CONSTRAINT FK_REG_STU FOREIGN KEY(REG_STUNO) REFERENCES STUDENT(STU_STUNO),
    CONSTRAINT FK_REG_SUB FOREIGN KEY(REG_SUBNO) REFERENCES SUBJECT(SUB_SUBNO)
);


    