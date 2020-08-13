--Q2) 실습에 사용될 과목 테이블의 구조를 검색하라.
DESC SUBJECT;

--Q4) 실습에 사용될 수강 테이블의 모든 데이터를 검색하라.
SELECT * FROM STUDENT;

--Q6) 과목들의 과목번호와 과목이름을 검색하라.
SELECT SUB_NO, SUB_NAME
FROM SUBJECT;

--Q7) 학생들의 학번과 이름, 성별을 검색하라.
SELECT STU_NO, STU_NAME, STU_GENDER
FROM STUDENT;

--Q9) 학생들의 학번과 이름, 학년, 반을 검색하라.
SELECT STU_NO, STU_NAME, STU_GRADE, STU_CLASS
FROM STUDENT;

--Q11) 과목번호, 학번, 점수를 검색하라
SELECT SUB_NO, STU_NO, ENR_GRADE
FROM ENROL;

--Q14) 학생들의 성별 중복을 제거하고 검색하라.
SELECT DISTINCT(STU_GENDER)
FROM STUDENT;

--Q16) 학생들의 학과, 학년 중복을 제거하고 검색하라.
SELECT DISTINCT STU_DEPT, STU_GRADE
FROM STUDENT;

--Q17) 학생들의 학과, 반 중복을 제거하고 검색하라.
SELECT DISTINCT STU_DEPT, STU_CLASS
FROM STUDENT;

--Q18) 학생들의 키를 5만큼씩 증가시킨 값을 검색하라.(null값은 0)
SELECT NVL2(STU_HEIGHT,STU_HEIGHT+5,0)
FROM STUDENT;

--Q20) 학생들의 학번과 이름을 별칭을 “학번”과 “이름” 으로 부여하여 검색하라
SELECT STU_NO AS 학번 ,STU_NAME AS 이름
FROM STUDENT;

--Q21) 수강 테이블의 모든 정보를 검색하라. 단 별칭을 한글로 부여하여 검색하라
SELECT STU_NO AS 학번, STU_NAME AS 이름, STU_DEPT AS 학과, STU_GRADE AS 학년, STU_CLASS AS 반,
       STU_GENDER AS 성별, STU_HEIGHT AS 키, STU_WEIGHT AS 몸무게
FROM STUDENT;

--Q22) 과목 테이블에서 과목이름과 교수명을 머리(heading)은 한글로 검색하라
SELECT SUB_NO AS 과목이름, SUB_NAME AS 교수명
FROM SUBJECT;

--Q23) 학생 테이블에서 학과명과 이름을 합쳐서 검색하라.
SELECT STU_DEPT||STU_NAME
FROM STUDENT;

--Q24) 학생의 이름과 학과를 ‘컴퓨터정보과 옥한빛입니다.’ 식으로 검색하라.
SELECT STU_DEPT||'과'||STU_NAME||'입니다' AS 학과성명
FROM STUDENT;

--Q27) 전기전자과 학생들을 검색하라.
SELECT *
FROM STUDENT
WHERE STU_DEPT='전기전자';

--Q28) 신장이 170 이상인 학생들을 검색하라.
SELECT *
FROM STUDENT
WHERE STU_HEIGHT>=170;

--Q29) 체중이 65 이상인 학생들을 검색하라.
SELECT *
FROM STUDENT
WHERE STU_WEIGHT>=65;

--Q31) 컴퓨터정보과 학생들의 학번, 이름을 검색하라.
SELECT STU_NO, STU_NAME
FROM STUDENT
WHERE STU_DEPT='컴퓨터정보';

--Q33) 남학생의 이름을 검색하라.
SELECT *
FROM STUDENT
WHERE STU_GENDER='M';

--Q37) 점수가 80점이상인 학생들의 학번을 검색하라.
SELECT STU_NO
FROM ENROL
WHERE ENR_GRADE>=80;

--Q38) ‘김인중’ 학생의 모든 정보를 검색하라.
SELECT *
FROM STUDENT
WHERE STU_NAME='김인중';

--Q39) ‘컴퓨터정보’과 학생 중 1학년 학생을 모두 검색하라.
SELECT *
FROM STUDENT
WHERE STU_DEPT='컴퓨터정보' AND STU_GRADE = 1;

--Q40) ‘기계’ 과 이면서 2학년 학생들의 모든 정보를 검색하라.
SELECT * 
FROM STUDENT
WHERE STU_DEPT='기계' AND STU_GRADE = 2;

--Q41) 성별이 여학생이며, 체중이 60이하인 학생을 모두 검색하라.
SELECT * 
FROM STUDENT
WHERE STU_GENDER='W' AND STU_WEIGHT <= 60;

--Q42) ‘컴퓨터정보’ 과 외에 1학년 학생들의 이름을 검색하라.
SELECT STU_NAME
FROM STUDENT
WHERE STU_DEPT IN('전기전자','기계') AND STU_GRADE = 1;

--Q44) 컴퓨터정보과 2학년 A반 학생의 이름을 검색하라.
SELECT STU_NAME
FROM STUDENT
WHERE STU_DEPT = '컴퓨터정보' AND STU_GRADE=2 AND STU_CLASS='A';

--Q45) 신장이 160이상이며, 170이하인 학생의 학번과 이름을 검색하라.
SELECT STU_NO, STU_NAME
FROM STUDENT
WHERE STU_HEIGHT BETWEEN 160 AND 170;

--Q46) 2013학번인 학생의 학번과 이름, 학과를 검색하라.
SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE STU_NO LIKE '2013%';

--Q47) 1,3학년 학생들의 모든 정보를 검색하라.
SELECT *
FROM STUDENT
WHERE STU_GRADE IN (1,3);

--Q49) 학번이 XXXX20XX인 학생의 모든정보를 검색하라.
SELECT *
FROM STUDENT
WHERE STU_NO LIKE '____20%';

--Q51) 학번이 2006년 학번 학생의 모든 정보를 검색하라.
SELECT *
FROM STUDENT
WHERE STU_NO LIKE '2006%';

--Q52) 신장이 null 인 학생의 이름을 검색하라.
SELECT STU_NAME
FROM STUDENT
WHERE STU_HEIGHT IS NULL;

--Q53) 신장이 null이 아닌 학생의 학번, 이름을 검색하라.
SELECT STU_NO,STU_NAME
FROM STUDENT
WHERE STU_HEIGHT IS NOT NULL;

--Q56) 학생들의 학번, 이름을 학번 순으로 검색하라.
SELECT STU_NO,STU_NAME
FROM STUDENT
ORDER BY STU_NO; 

--Q57. 학생들의 학번, 이름을 이름순으로 검색하라.
SELECT STU_NO,STU_NAME
FROM STUDENT
ORDER BY STU_NAME; 

--Q58. 학생들의 학번, 이름, 학과를 학과별 이름순으로 검색하라.
SELECT STU_NO,STU_NAME,STU_DEPT
FROM STUDENT
ORDER BY STU_DEPT, STU_NAME; 

--Q59. 학생들의 정보를 학과별 학년이 높은 순으로 검색하라.
SELECT *
FROM STUDENT
ORDER BY STU_DEPT, STU_GRADE DESC; 

--Q60. 학생들의 정보를 학과별 반 순으로 검색하라.
SELECT *
FROM STUDENT
ORDER BY  STU_DEPT, STU_GRADE DESC; 

--Q61. 학생들의 학번, 이름을 학과별, 성별, 학년으로 검색하여라
SELECT STU_NO, STU_NAME
FROM STUDENT
ORDER BY  STU_DEPT, STU_GENDER, STU_GRADE;

--Q62. 학생들의 성별을 소문자로 검색하라.
SELECT LOWER(STU_GENDER)
FROM STUDENT;

--Q63. 학생들의 성별을 대문자로 검색하라.
SELECT UPPER(STU_GENDER)
FROM STUDENT;

--Q65. 학생들의 학과, 학년, 이름을 연결하여 검색하라( --과 ?학년 ?입니다)
SELECT STU_DEPT||'과'||STU_GRADE||'학년'||STU_NAME||'입니다'
FROM STUDENT;

--Q66. 학생들의 이름과 이름의 첫 2글자를 검색하라.
SELECT STU_NAME,SUBSTR(STU_NAME,1,2)
FROM STUDENT;

--Q67. 학생들의 이름, 학과 그리고 학과의 두 번째로부터 1자리를 검색하라.
SELECT STU_NAME, STU_DEPT, SUBSTR(STU_DEPT,2,1)
FROM STUDENT;

--Q69. 학생들의 학과와 학과명의 길이를 검색하라.
SELECT STU_DEPT, LENGTH(STU_DEPT)
FROM STUDENT;

--Q70. 학생들의 이름에 ‘김’이 몇번째 있는지 검색하라.
SELECT INSTR(STU_NAME, '김')
FROM STUDENT;

--Q71. 학생들의 학과에 ‘기’가 몇번째 있는지 검색하라.
SELECT INSTR(STU_DEPT, '기')
FROM STUDENT;

--Q73. 학생들의 학과를 20자리로 하고, 앞에 ‘%’를 채워 검색하라.
SELECT LPAD(STU_DEPT, 20, '$')
FROM STUDENT;

--Q74. 학생의 학번, 이름, 신장을 검색하라.(신장은 첫째 자리에서 반올림)
SELECT STU_NO, STU_NAME, ROUND(STU_HEIGHT,-1)
FROM STUDENT;

--Q75. 학생의 학번, 이름, 신장을 검색하라.(신장은 두번째 자리에서 절삭함.)
SELECT STU_NO, STU_NAME, TRUNC(STU_HEIGHT,-2)
FROM STUDENT;

--Q76. 체중을 30으로 나눈 나머지를 검색하라.
SELECT MOD(STU_WEIGHT,30)
FROM STUDENT;

--Q77. 신장열의 값이 null 인 학생의 경우 ‘미기록’ 으로 검색하라.
SELECT NVL(TO_CHAR(STU_HEIGHT),'미기록')
FROM STUDENT;

--Q78. 신장과 체중을 합한 값을 학번, 이름과 함께 검색하여라.(nvl 사용)
SELECT STU_NO, STU_NAME, NVL(STU_HEIGHT+STU_WEIGHT,0)
FROM STUDENT;

--Q79. 신장에서 체중을 뺀 값을 학번, 이름과 함께 검색하여라.(nvl 사용)
SELECT STU_NO, STU_NAME, NVL(STU_HEIGHT-STU_WEIGHT,0)
FROM STUDENT;

--Q80. 신장이 null 인경우 ‘입력요망’으로 바꾸어 학번,이름을 검색하여라.
SELECT STU_NO, STU_NAME, NVL(TO_CHAR(STU_HEIGHT),'입력요망')
FROM STUDENT;

--Q82. 학생의 성별을 nullif로 비교하여, 남학생인 경우 성별과 null을 검색하라.
SELECT STU_GENDER,NVL(NULLIF(STU_GENDER,'M'),'NULL값')
FROM STUDENT;

--Q85. 학생 중 키가 가장 큰 학생의 신장을 검색하라.
SELECT MAX(STU_HEIGHT)
FROM STUDENT;

--Q86. 학생 중 키가 가장 작은 신장을 검색하라.
SELECT MIN(STU_HEIGHT)
FROM STUDENT;

--Q88. 학생의 이름 중 max 와 min 값을 검색하라.
SELECT MAX(STU_NAME), MIN(STU_NAME)
FROM STUDENT;

--Q89. 전체 학생의 체중, 신장의 max와 min 값을 검색하라.
SELECT MAX(STU_HEIGHT), MIN(STU_HEIGHT)
FROM STUDENT;

--Q92. 학생들의 성씨의 수를 검색하라.
SELECT SUBSTR(STU_NAME,1,1), count(*)
FROM STUDENT
group by SUBSTR(STU_NAME,1,1);

--Q93. 학생 테이블의 레코드 수를 검색하라.
SELECT COUNT(*)
FROM STUDENT;

--Q96. 학과별 학생들의 인원수를 인원수가 많은 순으로 검색하라.
SELECT STU_DEPT, COUNT(*)
FROM STUDENT
GROUP BY STU_DEPT
ORDER BY STU_DEPT DESC;

--Q97. 학년별 학생들의 인원수를 검색하라.
SELECT STU_GRADE, COUNT(*)
FROM STUDENT
GROUP BY STU_GRADE;

--Q99. 학과별 학생들의 평균 신장을 검색하라.
SELECT STU_DEPT, ROUND(AVG(STU_HEIGHT),1)
FROM STUDENT
GROUP BY STU_DEPT;

--Q101. 학과별, 학년별 학생들의 평균 신장을 학과별 학년별로 검색(null제외, 자리수맞춤)
SELECT STU_DEPT, STU_GRADE, ROUND(AVG(STU_HEIGHT),0)
FROM STUDENT
GROUP BY STU_DEPT, STU_GRADE;

--Q104. 학과별 학생들의 인원수를 인원수가 많은 순으로 검색하라.
SELECT STU_DEPT, COUNT(*)
FROM STUDENT
GROUP BY STU_DEPT
ORDER BY STU_DEPT DESC;

--Q105. 학과별 학생들의 평균 신장을 평균 신장 순으로 검색하여라.
SELECT STU_DEPT, ROUND(AVG(STU_HEIGHT),1)
FROM STUDENT
GROUP BY STU_DEPT
ORDER BY ROUND(AVG(STU_HEIGHT),1);

--Q106. 학과별 학년별 학생들의 평균 체중을 평균 체중 많은 순으로 검색하여라.
SELECT STU_DEPT, STU_GRADE, ROUND(AVG(STU_WEIGHT),1)
FROM STUDENT
GROUP BY STU_DEPT, STU_GRADE
ORDER BY ROUND(AVG(STU_WEIGHT),1) DESC;

--Q107. 학과별 학생들의 평균 신장을 평균 신장이 높은 순으로 검색하여라.
SELECT STU_DEPT, ROUND(AVG(STU_HEIGHT),1)
FROM STUDENT
GROUP BY STU_DEPT
ORDER BY ROUND(AVG(STU_HEIGHT),1) DESC;

--Q108. 학과별 학생들의 평균 신장이 170 이상인 학과를 평균이 낮은 순으로 검색하여라.
SELECT STU_DEPT, AVG(STU_HEIGHT)
FROM STUDENT
WHERE STU_HEIGHT >= 170
GROUP BY STU_DEPT
ORDER BY AVG(STU_HEIGHT);
