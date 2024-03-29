/*
    사용자 함수(FUNCTION)
    1. 어떤 값을 반환할 때 사용하는 데이터베이스 객체
    2. 실제로 함수를 만들어서 사용하는 개념이다.
    3. RETURN 개념이 존재한다.
    4. 함수의 결과 값을 확인할 수 있도록 SELECT문에서 많이 사용한다.
    5. 형식
        CREATE [OR REPLACE] FUNCTION 함수명[(매개변수)]
        RETURN 반환타입
        IS  -- AS도 가능
            변수 선언
        BEGIN
            함수 본문
        [EXCEPTION
            예외 처리]
        END;
*/

-- 사용자 함수 FUNC1 정의
CREATE OR REPLACE FUNCTION FUNC1
RETURN VARCHAR2   -- 반환타입에서는 크기를 명시하지 않는다.
IS
BEGIN
    RETURN 'Hello World';
END;

-- 사용자 함수 FUNC1 호출
SELECT FUNC1() FROM DUAL;

-- 사용자 함수 FUCN2 정의
-- 사원본호를 전달하면 해당 사원의 FIRST_NAME을 반환하는 함수

-- 사용자 함수의 파라미터는 IN/OUT 표기가 없다.
-- 입력 파라미터 형식으로 사용된다.

CREATE OR REPLACE FUNCTION FUNC2(EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE)
RETURN VARCHAR2
IS
    FNAME EMPLOYEES.FIRST_NAME%TYPE;    -- 변수 선언
BEGIN
    SELECT FIRST_NAME, LAST_NAME
      INTO FNAME
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = EMP_ID;
     
     RETURN FNAME;
END;

-- 호출
SELECT FUNC2(100), LAST_NAME
 FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 100;

-- 사원본호를 전달하면 해당 사원의 FULL_NAME 반환하는 함수
CREATE OR REPLACE FUNCTION FUNC3(EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE)
RETURN VARCHAR2
IS
    FNAME EMPLOYEES.FIRST_NAME%TYPE;
    LNAME EMPLOYEES.LAST_NAME%TYPE;
BEGIN
    SELECT FIRST_NAME , LAST_NAME
      INTO FNAME, LNAME
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = EMP_ID;
     
     RETURN FNAME || ' ' || LNAME;
END;

-- 호출
SELECT FUNC3(EMPLOYEE_ID)
 FROM EMPLOYEES;


-- 사용자 함수 3번 정의
-- 사원번호를 전달하면 해당 사원의 연봉이 15000이사이면 고액연봉 아니면 보통연봉
CREATE OR REPLACE FUNCTION FUNC4(EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE)
RETURN VARCHAR2
IS
    SAL EMPLOYEES.SALARY%TYPE;
    MESSAGE VARCHAR2(20 BYTE);
BEGIN
    SELECT SALARY
      INTO SAL
      FROM EMPLOYEES
      WHERE EMPLOYEE_ID = EMP_ID;
       IF SAL >= 15000 THEN
            MESSAGE := '고액연봉'; 
        ELSE
            MESSAGE := '보통연봉'; 
        END IF;
       RETURN MESSAGE;
        
END;
        
-- 호출
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, FUNC4(EMPLOYEE_ID)
 FROM EMPLOYEES;


-- 함수 MY_CEIL 정의 (올림)
CREATE OR REPLACE FUNCTION MY_CEIL(N NUMBER, DIGIT NUMBER)
RETURN NUMBER
IS
BEGIN
    RETURN CEIL(N * POWER(10,DIGIT)) / POWER(10, DIGIT);
END;

-- 함수 MY_CEIL 호출
SELECT
         MY_CEIL(1.111, 2)      -- 소수 2자리올림
       , MY_CEIL(1.111, 1)      -- 소수 1자리올림
       , MY_CEIL(111.111, 0)    -- 정수로 올림
       , MY_CEIL(111.111, -1)   -- 1의자리올림
       , MY_CEIL(111.111, -2)   -- 10의자리올림
    FROM DUAL;



-- 함수 MY_FLOOR 정의 (내림)
CREATE OR REPLACE FUNCTION MY_FLOOR(N NUMBER, DIGIT NUMBER)
RETURN NUMBER
IS
BEGIN
    RETURN FLOOR(N * POWER(10,DIGIT)) / POWER(10, DIGIT);
END;

SELECT
         MY_FLOOR(1.111, 2)      -- 소수 2자리내림
       , MY_FLOOR(1.111, 1)      -- 소수 1자리내림
       , MY_FLOOR(111.111, 0)    -- 정수로 내림
       , MY_FLOOR(111.111, -1)   -- 1의자리내림
       , MY_FLOOR(111.111, -2)   -- 10의자리내림
    FROM DUAL;
