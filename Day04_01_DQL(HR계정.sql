-- 테이블의 구조 파악
DESC EMPLOYEES;  -- DESCRIBE

-- 1. EMPLOYEES 테이블에서 FIRST_NAME, LAST_NAME 조회하기
SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES;

-- 2. EMPLOYEES 테이블에서 DEPARTMENT_ID를 중복 제거하고 조회하기
SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES;

-- 3. EMPLOYEES 테이블에서 EMPLOYEE_ID가 150인 사원 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 150;  -- WHERE절(조건)의 등호(=)는 비교 연산자이다.

-- 4. EMPLOYEES 테이블에서 SALARY가 10000 ~ 20000 사이인 사원 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 10000 AND 20000;

-- 5. EMPLOYEES 테이블에서 DEPARTMENT_ID가 30, 40, 50인 사원 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN(30, 40, 50);

-- 6. EMPLOYEES 테이블에서 DEPARTMENT_ID가 NULL인 사원 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NULL;  -- IS NOT NULL

-- 7. EMPLOYEES 테이블에서 PHONE_NUMBER가 '515'로 시작하는 사원 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, PHONE_NUMBER
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '515%';  -- PHONE_NUMBER NOT LIKE '515%'

-- 8. EMPLOYEES 테이블을 FIRST_NAME의 가나다순(오름차순:Ascending Sort)으로 정렬해서 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 ORDER BY FIRST_NAME ASC;  -- ASC는 생략 가능하다.

-- 9. EMPLOYEES 테이블을 높은 SALARY(내림차순:Descending Sort)를 받는 사원순으로 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
  FROM EMPLOYEES
 ORDER BY SALARY DESC;  -- DESC는 생략이 불가능하다.

-- 10. EMPLOYEES 테이블의 사원들을 DEPARTMENT_ID순으로 조회하고, 동일한 DEPARTMENT_ID를 가진 사원들은 높은 SALARY순으로 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
  FROM EMPLOYEES
 ORDER BY DEPARTMENT_ID ASC, SALARY DESC;