-- 단일 행 주석
/*
    다중 행 주석
*/

/*
    1. SYS, SYSTEM 계정은 관리 계정이므로 해당 계정에서 작업하지 않는다
    2. 새로운 계정을 만들고, 해당 계정으로 접속해서 작업을 수행한다.
    3. 새로운 계정을 만드는 작업은 SYS, SYSTEM 게정에서 처리한다.
    4. 새로운 계정을 만드는 방법
        1) DROP USER 계정이름 CASCADE : 기존에 생성된 계정이 있다면 삭제하시오. CASCADE는 계정이 가진 데이터도 함께 삭제하라는 옵션이다.
        2) CREATE USER 계정이름 IDENTIFIED BY 비밀번호 : 계정 만들기
        3) GRANT 권한 TO 계정이름 : 생성된 계정에 권한(CONNECT, RESOURCE, DBA)을 준다.
*/

/*
    쿼리문 실행하는 방법
    1. 선택 쿠리 실행 : Ctrl + Enter
    2. 모든 쿼리 실행 : F5 (새로 고침 아님 주의!)
*/

DROP USER GDJ61 CASCADE;        -- 지우려면 SYS, SYSTEM 계정(관리계정) 으로 들어가 삭제 해야함
CREATE USER GDJ61 IDENTIFIED BY 1111;
GRANT DBA TO GDJ61;

-- HR은 접속은 HR로만 바꿔주면 된다
