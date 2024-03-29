/*
    DDL
    1. DATA Definition Language
    2. 데이터 정의어
    3. 데이터베이스 객체(user, table, sequence, view, table 등)를 생성/수정/삭제하는 언어
    4. 완료된 작업을 취소할 수 없다.(COMMIT할 필요가 없다. ROLLBACK을 할 수 없다.)
    5. 종류
        1) CREATE : 생성
        2) ALTER  : 수정
        3) DROP   : 삭제
*/
/*
    외래키 제약 조건의 옵션
    1. ON DELETE CASCADE
        1) 참조 중인 PARENT KEY가 삭제되면 해당 PARENT KEY를 가진 행 전체를 삭제한다.
        2) 예시) 회원 탈퇴 시 작성한 모든 게시글이 함께 삭제됩니다.
                 게시글 삭제 시 해당 게시글에 달린 모근 댓글이 함께 삭제됩니다. 
*/


DROP TABLE CUSTOMER_TBL;
DROP TABLE BANK_TBL;


CREATE TABLE BANK_TBL(
    BANK_CODE VARCHAR2(20 BYTE) NOT NULL,
    BANK_NAME VARCHAR2(30 BYTE),
    
    CONSTRAINT PK_BANK PRIMARY KEY(BANK_CODE)
);

CREATE TABLE CUSTOMER_TBL(
    NO        NUMBER            NOT NULL,
    NAME      VARCHAR2(30 BYTE) NOT NULL,
    PHONE     VARCHAR2(30 BYTE) UNIQUE,
    AGE       NUMBER            CHECK(AGE BETWEEN 0 AND 100),
    BANK_CODE VARCHAR2(20 BYTE) ,
    
    CONSTRAINT PK_CUS      PRIMARY KEY(NO),
    CONSTRAINT FK_CUS_BANK FOREIGN KEY (BANK_CODE)REFERENCES BANK_TBL(BANK_CODE)
);
    
/*
    테이블 변경하기
    1. 칼럼 추가 : ALTER TABLE 테이블명 ADD 칼럼명 데이터타입 [제약조건]
    2. 칼럼 삭제 : ALTER TABLE 테이블명 DROP COLUMN 칼럼명
    3. 칼럼 수정 : ALTER TABLE 테이블명 MODIFY 칼럼명 데이터타입 [제약조건]
    4. 칼럼 이름 : ALTER TABLE 테이블명 RENAME COLUMN 기존칼럼명 TO 신규칼럼명
    5. 테이블 이름 : ALTER TABLE RENAME TO 신규테이블명
*/
    
-- 1. BANK_TBL 테이블에 연락처(BANK_TEL) 칼럼을 추가하시오.
ALTER TABLE BANK_TBL 
    ADD BANK_TEL VARCHAR2(20 BYTE) NOT NULL;
    
-- 2. CUTOMER_TBL 테이블에서 나이(AGE) 칼럼을 삭제하시오
ALTER TABLE CUSTOMER_TBL
    DROP COLUMN AGE;
    
-- 3. BANK_TBL 테이블의 은행명(BANK_NAME) 칼럼의 데이터 타입을 VARCHAR2(15 BYTE)으로 변경하시오.
ALTER TABLE BANK_TBL
    MODIFY BANK_NAME VARCHAR2(15 BYTE);
    
-- 4. CUTOMER_TBL 테이블에서 고객명(NAME) 칼럼의 이름을 CUST_NAME으로 변경하시오.
ALTER TABLE CUSTOMER_TBL 
    RENAME COLUMN NAME TO CUST_NAME;
    
-- 개인 실습

-- 5. CUSTOMER_TBL에 GRADE 칼럼을 투가 하시오
-- GRADE 칼럼을 'VIP', 'GOLD', SILVER', 'BRONZE'중 하나의 값만 가질 수 있도록 CHECK 제약조건을 
ALTER TABLE CUSTOMER_TBL
    ADD GRADE VARCHAR2(6 BYTE) CHECK(GRADE IN('VIP', 'GOLD', 'SILVER', 'BRONZE'));

-- 6. BANK_TBL 테이블의 BANK_NAME 칼럼에 NOT NULL 제약조건을 추가하시오.
ALTER TABLE BANK_TBL
    MODIFY BANK_NAME VARCHAR2(15 BYTE) NOT NULL;    -- 데이터 타입 수정이 없어도 기존 데이터 타입 명시 해야한다

-- 7. CUSTOMER_TBL 테이블의 NO 칼럼의 이름을 CUST_NO로 변경하시오.
ALTER TABLE CUSTOMER_TBL
    RENAME COLUMN NO TO CUST_NO;

-- 8. CUSTOMER_TBL 테이블의 PHONE 칼럼을 삭제하시오.
ALTER TABLE CUSTOMER_TBL
    DROP COLUMN PHONE;

-- 9. CUSTOMER_TBL 테이블의 CUST_NAME 칼럼의 NOT NULL 제약조건을 NULL 제약조건으로 변경하시오.
ALTER TABLE CUSTOMER_TBL 
    MODIFY CUST_NAME VARCHAR2(30 BYTE) NULL;    -- NULL 명시를 반드시 해야 한다.



    