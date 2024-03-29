/*
    KEY 제약조건
    1. 기본키(PK : PRIMARY KEY)
        1) 개체무결성 
        2) PK는 NOT NULL + UNIQUE 해야 한다.
    2. 외래키(FK : FOREIGN KEY)
        1) 참조무결성
        2) FK는 참조하는 값만 가질 수 있다.
*/

/*
    일대다(1:M) 관계
    1. pk와 FK를 가진 테이블 간의 관계이다.
        1) 부모 테이블 : 1, PK를 가진 테이블
        2) 자식 테이블 : M, FK를 가진 테이블
    2. 생성과 삭제 규칙
        1) 생성 규칙 : "반드시" 부모 테이블을 먼저 생성한다.
        2) 삭제 규칙 : "반드시" 자식 테이블을 먼저 삭제한다.
*/

/*
    외래키 제약 조건의 옵션
    1. ON DELETE CASCADE
        1) 참조 중인 PARENT KEY가 삭제되면 해당 PARENT KEY를 가진 행 전체를 삭제한다.
        2) 예시) 회원 탈퇴 시 작성한 모든 게시글이 함께 삭제됩니다.
                 게시글 삭제 시 해당 게시글에 달린 모근 댓글이 함께 삭제됩니다. 
    2. ON DELETE SET NULL
        1) 참조 중인 PARENT KEY가 삭제되면 해당 PARENT KEY를 가진 칼럼 값만 NULL로 처리한다.
        2) 예시) 어떤 상품을 제거하였으나 해당 상품의 주문 내역은 남아 있는 경우
*/


-- 테이블 삭제
DROP TABLE ORDER_TBL;
DROP TABLE PRODUCT_TBL;

-- 제품 테이블 (부모 테이블)                            만드는거 먼저하면 삭제순서는 보인다.
CREATE TABLE PRODUCT_TBL(
    PROD_NO NUMBER NOT NULL,
    PROD_NAME VARCHAR2(10 BYTE),
    PROD_PRICE NUMBER,
    PROD_STOCK NUMBER,
    CONSTRAINT PK_PROD PRIMARY KEY(PROD_NO) -- CONSTRAINT 이름지정 PRIMARY KEY(저정할 칼럼)
);

-- 주문 테이블 (자식 테이블)
CREATE TABLE ORDER_TBL(
    ORDER_NO NUMBER NOT NULL ,
    USER_ID VARCHAR2(10 BYTE),
    PROD_NO NUMBER,      -- 위에 제품테이블에 제품번호를 주문 테이블에서는 여러번 쓰기 때문에 FK 
    ORDER_DATE DATE,
    CONSTRAINT PK_ORDER PRIMARY KEY(ORDER_NO),
    CONSTRAINT FK_ORDER_PROD FOREIGN KEY(PROD_NO) REFERENCES PRODUCT_TBL(PROD_NO)   -- CONSTRAINT 이름지정 FOREIGN KEY(저정할 칼럼) REFERRENCE 참조할테이블명(칼럼명)
);
    
-- 부모가 지워지면 자식 지우기 OR NULL값으로 만들어주기
-- 
    
    
/*
    제약조건 테이블
    1. SYS, SYSTEM 관리 계정으로 접속해서 확인한다
    2. 종류
        1) ALL_CONSTRAINTS
        2) USER_CONSTRAINTS
        3) DBA_CONSTRAINTS
*/

-- 테이블 구조를 확인하는 쿼리문 (설명)
-- DESCRIBE USER_CONSTRAINTS;
-- SELECT * FROM USER_CONSTRAINTS WHERE CONSTRAINT_NAME LIKE 'FK%';






    