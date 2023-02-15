/*
    셀프 조인
    1. 하나의 테이블에 PK와 FK가 모두 있는 경우에 사용되는 조인이다.
    2. 동일한 테이블을 조인하기 때문에 별명을 다르게 지정해서 조인한다.
    3. 문법은 기본적으로 내부/외부 조인과 동일하다.
*/

-- 모든 사원들의 EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER의 FIRST_NAME을 조회하시오
-- 1:M 관계 파악
-- PK            FK
-- EMPLOYEE_ID   MANAGER_ID

-- 조인 조건 파악
-- 사원테이블 E        -  매니저테이블 M
-- 사원들의 매니저번호 -  매니저의 사원번호
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME -- 각 사원들의 정보
     , M.FIRST_NAME                             -- 매니저 정보
  FROM 
       EMPLOYEES E LEFT OUTER JOIN EMPLOYEES M
    ON 
       E.MANAGER_ID = M.EMPLOYEE_ID 
 ORDER BY
       E.EMPLOYEE_ID; 
     
     
-- 셀프 조인 연습
-- 각 사원 중에서 매니저보다 먼저 입사원 사원을 조회
SELECT 
       E.EMPLOYEE_ID, E.FIRST_NAME, E.HIRE_DATE AS 입사일자
    ,  M.EMPLOYEE_ID, M.FIRST_NAME, M.HIRE_DATE AS 매니저입사일자
    FROM
         EMPLOYEES E INNER JOIN EMPLOYEES M
    ON
        E.MANAGER_ID = M.EMPLOYEE_ID
    WHERE
        TO_DATE(E.HIRE_DATE, 'YY/MM/DD')  < TO_DATE(M.HIRE_DATE, 'YY/MM/DD')
    ORDER BY
        E.EMPLOYEE_ID;

-- PK, FK가 아닌 일반 칼럼을 이용한 셀프 조인

-- 동일한 부서에서 근무하는 사원들을 조인하기 위해서 DEPARTMENT_ID로 조인 조건을 생성

-- 사원(나)        사원(남)
-- EMPLOYEES ME    EMPLOYEES YOU

-- 문제. 같은 부서에서 근부하는 사원 중에서 나보다 SALARY가 높은 사원 정보 조회
SELECT 
        ME.EMPLOYEE_ID, ME.FIRST_NAME, ME.SALARY AS 내급여
    ,   YOU.FIRST_NAME, YOU.SALARY AS 너급여
    ,   ME.DEPARTMENT_ID, YOU.DEPARTMENT_ID
    FROM
        EMPLOYEES ME INNER JOIN EMPLOYEES YOU
    ON
       ME.DEPARTMENT_ID = YOU.DEPARTMENT_ID
    WHERE 
        ME.SALARY < YOU.SALARY
    ORDER BY
        ME.EMPLOYEE_ID;
        
        
-- 조인 연습

-- 1. LOCATION_ID가 1700인 부서에 근무하는 사원들의 EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME를 조회
-- 표준
SELECT 
       E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME, D.LOCATION_ID 
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
 WHERE D.LOCATION_ID = 1700;

-- 오라클
SELECT
       E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME, D.LOCATION_ID 
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID
   AND D.LOCATION_ID = 1700;     -- AND로 연결 해준다 조건 
 
 -- 2. DEPARTMENT_NAME이 EXECUTIVE인 부서에 근무하는 사원들의 EMPLOYEE_ID, FIRST_NAME을 조회하시오
 SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
   FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
   ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
   WHERE D.DEPARTMENT_NAME = 'Executive';
 
-- 3. 모든 사원들의 EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, CITY 출력(3개 이상 조인
-- 표준
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME, L.CITY
  FROM LOCATIONS L INNER JOIN DEPARTMENTS D
    ON L.LOCATION_ID = D.LOCATION_ID  INNER JOIN EMPLOYEES E      -- 먼저 가장 위에 PK부터 해주고 그다음 관계 이어준다
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID; 
  
-- 오라클
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME, L.CITY
  FROM LOCATIONS L, DEPARTMENTS D, EMPLOYEES E
 WHERE L.LOCATION_ID = D.LOCATION_ID
   AND D.DEPARTMENT_ID = E.DEPARTMENT_ID;
   
    
-- 4. 부서별 DEPARTMENT_NAME, 사원 수와 평균 연봉
-- GROUP BY, JOIN
SELECT D.DEPARTMENT_NAME, COUNT(*), AVG(E.SALARY)
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
   ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY  D.DEPARTMENT_NAME; -- SELECT에서 지정한 것은 GROUP BY에서도 지정해야함

 

 
 SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
   FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
   ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
   WHERE D.DEPARTMENT_NAME = 'Executive';
 
 -- 5. 모든 사원들의 EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME
 SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
   FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E     -- DEPARTMENT_ID가 NULL 이라
     ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
  ORDER BY E.EMPLOYEE_ID;
  
-- 6. 모든 부서의 DEPARTMENT_NAME 과 근무 중인 사원수응 조회하시오, 근무하는 사람이 없으면 0으로 하시오
 SELECT D.DEPARTMENT_NAME,COUNT(E.EMPLOYEE_ID)
  FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
  ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
  GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME;

 
 
 
 
 
 
 