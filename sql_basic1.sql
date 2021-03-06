--sql 명령어 연습 2020-08-11
DESC ENROL;
DESC STUDENT; -- VARCHAR2는 가번형 대부분 문자형태는 VARCHAR2로 제시
DESC SUBJECT;

--테이블내의 모든 정보 검색
SELECT * FROM STUDENT; --학생테이블로부터 모든 정보(*)
SELECT * FROM EMP;

--컬럼의 내용을 가져오는 방법
SELECT STU_NAME, STU_NO, STU_GENDER
FROM STUDENT;

--중복행 제거하는 방법
SELECT DISTINCT(STU_DEPT)
FROM STUDENT;
SELECT DISTINCT STU_CLASS, STU_DEPT
FROM STUDENT;

--수식을 포함한 검색(가감승제 모두가능)
SELECT STU_NO,SUB_NO,ENR_GRADE,ENR_GRADE+10,ENR_GRADE-10,ENR_GRADE*10
FROM ENROL;

--ALLAS 가능
SELECT STU_NO AS ID,STU_NAME AS NAME -- AS생략가능
FROM STUDENT;

--연결연산자 
SELECT STU_DEPT||'과'||STU_NAME||'입니다' AS 학과성명
FROM STUDENT;

--조건절 검색
--EX)컴퓨터정보과 학생들의 데이터 검색
SELECT *
FROM STUDENT
WHERE STU_DEPT='컴퓨터정보';

SELECT *
FROM STUDENT
WHERE STU_DEPT='컴퓨터정보' AND STU_GRADE=2;

--범위조건
SELECT *
FROM STUDENT
WHERE STU_WEIGHT BETWEEN 60 AND 70;

SELECT *
FROM STUDENT
WHERE STU_NO=20132003;

--LIKE를 이용한 조건검색 (LIKE의 와일드카드인 %는 모든, _는 하나의 문자)
SELECT *
FROM STUDENT 
WHERE STU_NAME LIKE '김%';

SELECT *
FROM STUDENT 
WHERE STU_NAME LIKE '_수%';

--EX)2014학번을 가진 모든 학생 검색
SELECT *
FROM STUDENT
WHERE STU_NO LIKE '2014%';

--NULL이 아닌 값
SELECT * FROM STUDENT
WHERE STU_HEIGHT IS NOT NULL;

--IN(OR기능을 내포)
--EX)컴퓨터정보과나 기계과 학생들의 학번과 학생이름 검색
SELECT STU_NO,STU_NAME
FROM STUDENT
WHERE STU_DEPT IN('컴퓨터정보','기계');

--정렬을 위한 명령어 (DESC는 내림차순, 생략시 OR ASC 오름차순)
SELECT *
FROM STUDENT
ORDER BY STU_NO DESC;

--EX)학생테이블에서 학번, 이름, 몸무게를 5KG감하여 검색
SELECT STU_NO, STU_NAME, STU_WEIGHT-5 AS TARGET
FROM STUDENT
ORDER BY STU_WEIGHT-5;
ORDER BY 2; --열번째도 가능

SELECT STU_NO,STU_NAME,STU_DEPT,STU_WEIGHT-5 TARGET
FROM STUDENT
ORDER BY STU_DEPT,TARGET DESC; --DEPT에선 오름차, TARGET에선 내림차

--단일행 함수
--숫자함수 (올림,버림,CEIL은 큰쪽, FLOOR은 작은쪽, MOD는 나눈나머지, ABS는 절댓값)
SELECT ROUND(345.678), TRUNC(345.678), CEIL(-3.1), CEIL(3.1), FLOOR(-3.1), FLOOR(3.1)
FROM DUAL;

SELECT MOD(10,3), ABS(-100)
FROM DUAL;

SELECT ROUND(345.678,-1) --1의자리에서올림
FROM DUAL;

--문자함수
SELECT LOWER('ABCDEFG'), UPPER('abcdefg'), INITCAP('abcdefg') --대->소, 소->대, 첫문자만 대문자
FROM DUAL;

SELECT CONCAT(ENAME, JOB) --합치기
FROM EMP;

SELECT ENAME, SUBSTR(ENAME,2,2) --2번째에서부터 2개
FROM EMP;

SELECT ENAME, LENGTH(ENAME) --길이
FROM EMP;

SELECT LPAD(ENAME, 10, '$') --10개 중에서 ENAME제외 왼쪽부터$ RPAD는 오른쪽부터
FROM EMP;

--날짜함수
SELECT MONTHS_BETWEEN(SYSDATE, HIREDATE) --개월수
FROM EMP;

SELECT NEXT_DAY(SYSDATE, '월'), LAST_DAY(SYSDATE) --기준일자를 제외하고 가장 가까운 월요일, 이번달 제일 마지막
FROM DUAL;

--변환함수
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE, 'YYYY-MM-DD') AS 입사년월
FROM EMP;

SELECT TO_CHAR(TO_NUMBER(1234.5678),'9999.999') --숫자열로 바꾼후 소수점 아래 세자리 자리수로
FROM DUAL;

SELECT * FROM EMP;
SELECT EMPNO,ENAME,TO_CHAR(TO_NUMBER(SAL),'$9999') SALARY --999로 하면 세자리수 배정이므로 4자리수가 안나옴
FROM EMP;

--TO_DATE는 날짜형태의 문자를 날짜로 변환할때 사용
SELECT EMPNO,ENAME
FROM EMP
WHERE HIREDATE=TO_DATE('1980-12-17','YY-MM-DD');

--일반함수
--NVL(인수1,인수2) 인수1이 NULL이면 인수2가 된다
SELECT ENAME, EMPNO, NVL(MGR,0)
FROM EMP;

--NVL2(인수1,인수2,인수3) 인수1이 NULL이면 인수3이 되고 NULL이 아니면 인수2
SELECT ENAME, NVL2(COMM,SAL+COMM,SAL)
FROM EMP;

--NULLIF(인수1,인수2) 인수1과 인수2가 같으면 NULL
SELECT NVL(NULLIF('A','A'),'NULL값')
FROM DUAL;

--EX)직급에 따른 급여인상
SELECT EMPNO,ENAME,SAL,
CASE JOB WHEN 'SALESMAN' THEN SAL*1.1
         WHEN 'CLERK' THEN SAL*1.15
         WHEN 'MANAGER' THEN SAL+1.2
         ELSE SAL
         END AS 급여인상
         FROM EMP;

SELECT EMPNO,ENAME,JOB,SAL,
DECODE(JOB,'SALESMAN',SAL*1.1,
           'CLERK',SAL*1.15,
           'MANAGER',SAL*1.2,
           SAL) AS 인상된급여
           FROM EMP;
           
--그룹함수
--COUNT()/COUNT(*)/SUM()/AVG()/MAX()/MIN()/STDDEV()/VARIANCE()
SELECT MAX(ENR_GRADE), MIN(ENR_GRADE)
FROM ENROL;

--EX)기계과 학생중 최저.최고 체중 검색
SELECT MAX(STU_WEIGHT), MIN(STU_WEIGHT)
FROM STUDENT
WHERE STU_DEPT='기계';

--COUNT
SELECT COUNT(*), COUNT(STU_HEIGHT)
FROM STUDENT;

--EX)컴퓨터정보과 학생들의 체중에 대한 합과 평균
SELECT SUM(STU_WEIGHT), TO_CHAR(AVG(STU_WEIGHT),'9999.99')
FROM STUDENT
WHERE STU_DEPT='컴퓨터정보';

--GROUP BY
--EX)학과별로 그룹화한 후 학과별 평균체중
SELECT STU_DEPT, AVG(STU_WEIGHT)
FROM STUDENT
GROUP BY STU_DEPT;

--EX)체중이 50KG이상인학생들의 학과별 인원수
SELECT STU_DEPT,COUNT(*)
FROM STUDENT
WHERE STU_WEIGHT>=50
GROUP BY STU_DEPT;

SELECT STU_DEPT,STU_GRADE,COUNT(*)
FROM STUDENT
WHERE STU_WEIGHT>=50
GROUP BY STU_DEPT, STU_GRADE;

--EX)기계과 학생들중 학년별 평균신장이 160이상인 학년과 평균신장
SELECT STU_GRADE, AVG(STU_HEIGHT)
FROM STUDENT
WHERE STU_DEPT='기계'
GROUP BY STU_GRADE HAVING AVG(STU_HEIGHT)>=160; --HAVING은 그룹할때 조건

--EX)최대신장이 175이상인 학과와 학과별 최대신장
SELECT STU_DEPT, MAX(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_DEPT HAVING MAX(STU_HEIGHT)>=175;

--EX)학과별 평균신장중 가장 높은 평균신장
SELECT MAX(AVG(STU_HEIGHT))
FROM STUDENT
GROUP BY STU_DEPT 
