-- 학생 이름, 담당 교수 이름 조회하기
SELECT S.S_NAME, P.P_NAME
  FROM PROFESSOR_TBL P INNER JOIN STUDENT_TBL S
    ON P.P_NO = S.P_NO; 
  
SELECT S.S_NAME, P.P_NAME
  FROM PROFESSOR_TBL P, STUDENT_TBL S
 WHERE P.P_NO = S.P_NO;
  
-- 교수 번호, 교수 이름, 교수 정보, 강의 이름, 강의실 위치를 조회
SELECT P.P_NO, P.P_NAME, P.P_MAJOR, L.L_NAME, L.L_LOCATION
  FROM PROFESSOR_TBL P INNER JOIN LECTURE_TBL L
    ON P.P_NO = L.P_NO;
  
SELECT P.P_NO, P.P_NAME, P.P_MAJOR, L.L_NAME, L.L_LOCATION
  FROM PROFESSOR_TBL P, LECTURE_TBL L
 WHERE P.P_NO = L.P_NO;
 
 -- 학번, 학생이름, 수강신청한 과목명 을 조회하히소
 SELECT S.S_NO, S.S_NAME, C.C_NAME
   FROM STUDENT_TBL S INNER JOIN ENROLL_TBL E 
     ON S.S_NO  = E.S_NO INNER JOIN COURSE_TBL C        -- PK FK 순서 못지키면 꼭 안지켜도됨
     ON E.C_NO = C.C_NO;
     
SELECT S.S_NO, S.S_NAME, C.C_NAME
  FROM STUDENT_TBL, ENROLL_TBL E, COURSE_TBL C
 WHERE S.S_NO  = E.S_NO 
   AND E.C_NO = C.C_NO;
     
-- 모든 교수들의 교수이름, 교수전공, 강의이름을 조회
SELECT DISTINCT P.P_NAME, P.P_MAJOR, L.L_NAME
  FROM PROFESSOR_TBL P LEFT OUTER JOIN LECTURE_TBL L    -- 강의를 하는 교수가 제임스밖에 없어서 나머지도 출력하려고 OUTER조인한다
    ON P.P_NO = L.P_NO;
     
SELECT DISTINCT P.P_NAME, P.P_MAJOR, NVL(L.L_NAME, '강좌없음')
  FROM PROFESSOR_TBL P, LECTURE_TBL L
 WHERE P.P_NO = L.P_NO(+);
     
     