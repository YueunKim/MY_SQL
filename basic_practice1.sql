--Q2) �ǽ��� ���� ���� ���̺��� ������ �˻��϶�.
DESC SUBJECT;

--Q4) �ǽ��� ���� ���� ���̺��� ��� �����͸� �˻��϶�.
SELECT * FROM STUDENT;

--Q6) ������� �����ȣ�� �����̸��� �˻��϶�.
SELECT SUB_NO, SUB_NAME
FROM SUBJECT;

--Q7) �л����� �й��� �̸�, ������ �˻��϶�.
SELECT STU_NO, STU_NAME, STU_GENDER
FROM STUDENT;

--Q9) �л����� �й��� �̸�, �г�, ���� �˻��϶�.
SELECT STU_NO, STU_NAME, STU_GRADE, STU_CLASS
FROM STUDENT;

--Q11) �����ȣ, �й�, ������ �˻��϶�
SELECT SUB_NO, STU_NO, ENR_GRADE
FROM ENROL;

--Q14) �л����� ���� �ߺ��� �����ϰ� �˻��϶�.
SELECT DISTINCT(STU_GENDER)
FROM STUDENT;

--Q16) �л����� �а�, �г� �ߺ��� �����ϰ� �˻��϶�.
SELECT DISTINCT STU_DEPT, STU_GRADE
FROM STUDENT;

--Q17) �л����� �а�, �� �ߺ��� �����ϰ� �˻��϶�.
SELECT DISTINCT STU_DEPT, STU_CLASS
FROM STUDENT;

--Q18) �л����� Ű�� 5��ŭ�� ������Ų ���� �˻��϶�.(null���� 0)
SELECT NVL2(STU_HEIGHT,STU_HEIGHT+5,0)
FROM STUDENT;

--Q20) �л����� �й��� �̸��� ��Ī�� ���й����� ���̸��� ���� �ο��Ͽ� �˻��϶�
SELECT STU_NO AS �й� ,STU_NAME AS �̸�
FROM STUDENT;

--Q21) ���� ���̺��� ��� ������ �˻��϶�. �� ��Ī�� �ѱ۷� �ο��Ͽ� �˻��϶�
SELECT STU_NO AS �й�, STU_NAME AS �̸�, STU_DEPT AS �а�, STU_GRADE AS �г�, STU_CLASS AS ��,
       STU_GENDER AS ����, STU_HEIGHT AS Ű, STU_WEIGHT AS ������
FROM STUDENT;

--Q22) ���� ���̺��� �����̸��� �������� �Ӹ�(heading)�� �ѱ۷� �˻��϶�
SELECT SUB_NO AS �����̸�, SUB_NAME AS ������
FROM SUBJECT;

--Q23) �л� ���̺��� �а���� �̸��� ���ļ� �˻��϶�.
SELECT STU_DEPT||STU_NAME
FROM STUDENT;

--Q24) �л��� �̸��� �а��� ����ǻ�������� ���Ѻ��Դϴ�.�� ������ �˻��϶�.
SELECT STU_DEPT||'��'||STU_NAME||'�Դϴ�' AS �а�����
FROM STUDENT;

--Q27) �������ڰ� �л����� �˻��϶�.
SELECT *
FROM STUDENT
WHERE STU_DEPT='��������';

--Q28) ������ 170 �̻��� �л����� �˻��϶�.
SELECT *
FROM STUDENT
WHERE STU_HEIGHT>=170;

--Q29) ü���� 65 �̻��� �л����� �˻��϶�.
SELECT *
FROM STUDENT
WHERE STU_WEIGHT>=65;

--Q31) ��ǻ�������� �л����� �й�, �̸��� �˻��϶�.
SELECT STU_NO, STU_NAME
FROM STUDENT
WHERE STU_DEPT='��ǻ������';

--Q33) ���л��� �̸��� �˻��϶�.
SELECT *
FROM STUDENT
WHERE STU_GENDER='M';

--Q37) ������ 80���̻��� �л����� �й��� �˻��϶�.
SELECT STU_NO
FROM ENROL
WHERE ENR_GRADE>=80;

--Q38) �������ߡ� �л��� ��� ������ �˻��϶�.
SELECT *
FROM STUDENT
WHERE STU_NAME='������';

--Q39) ����ǻ���������� �л� �� 1�г� �л��� ��� �˻��϶�.
SELECT *
FROM STUDENT
WHERE STU_DEPT='��ǻ������' AND STU_GRADE = 1;

--Q40) ����衯 �� �̸鼭 2�г� �л����� ��� ������ �˻��϶�.
SELECT * 
FROM STUDENT
WHERE STU_DEPT='���' AND STU_GRADE = 2;

--Q41) ������ ���л��̸�, ü���� 60������ �л��� ��� �˻��϶�.
SELECT * 
FROM STUDENT
WHERE STU_GENDER='W' AND STU_WEIGHT <= 60;

--Q42) ����ǻ�������� �� �ܿ� 1�г� �л����� �̸��� �˻��϶�.
SELECT STU_NAME
FROM STUDENT
WHERE STU_DEPT IN('��������','���') AND STU_GRADE = 1;

--Q44) ��ǻ�������� 2�г� A�� �л��� �̸��� �˻��϶�.
SELECT STU_NAME
FROM STUDENT
WHERE STU_DEPT = '��ǻ������' AND STU_GRADE=2 AND STU_CLASS='A';

--Q45) ������ 160�̻��̸�, 170������ �л��� �й��� �̸��� �˻��϶�.
SELECT STU_NO, STU_NAME
FROM STUDENT
WHERE STU_HEIGHT BETWEEN 160 AND 170;

--Q46) 2013�й��� �л��� �й��� �̸�, �а��� �˻��϶�.
SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE STU_NO LIKE '2013%';

--Q47) 1,3�г� �л����� ��� ������ �˻��϶�.
SELECT *
FROM STUDENT
WHERE STU_GRADE IN (1,3);

--Q49) �й��� XXXX20XX�� �л��� ��������� �˻��϶�.
SELECT *
FROM STUDENT
WHERE STU_NO LIKE '____20%';

--Q51) �й��� 2006�� �й� �л��� ��� ������ �˻��϶�.
SELECT *
FROM STUDENT
WHERE STU_NO LIKE '2006%';

--Q52) ������ null �� �л��� �̸��� �˻��϶�.
SELECT STU_NAME
FROM STUDENT
WHERE STU_HEIGHT IS NULL;

--Q53) ������ null�� �ƴ� �л��� �й�, �̸��� �˻��϶�.
SELECT STU_NO,STU_NAME
FROM STUDENT
WHERE STU_HEIGHT IS NOT NULL;

--Q56) �л����� �й�, �̸��� �й� ������ �˻��϶�.
SELECT STU_NO,STU_NAME
FROM STUDENT
ORDER BY STU_NO; 

--Q57. �л����� �й�, �̸��� �̸������� �˻��϶�.
SELECT STU_NO,STU_NAME
FROM STUDENT
ORDER BY STU_NAME; 

--Q58. �л����� �й�, �̸�, �а��� �а��� �̸������� �˻��϶�.
SELECT STU_NO,STU_NAME,STU_DEPT
FROM STUDENT
ORDER BY STU_DEPT, STU_NAME; 

--Q59. �л����� ������ �а��� �г��� ���� ������ �˻��϶�.
SELECT *
FROM STUDENT
ORDER BY STU_DEPT, STU_GRADE DESC; 

--Q60. �л����� ������ �а��� �� ������ �˻��϶�.
SELECT *
FROM STUDENT
ORDER BY  STU_DEPT, STU_GRADE DESC; 

--Q61. �л����� �й�, �̸��� �а���, ����, �г����� �˻��Ͽ���
SELECT STU_NO, STU_NAME
FROM STUDENT
ORDER BY  STU_DEPT, STU_GENDER, STU_GRADE;

--Q62. �л����� ������ �ҹ��ڷ� �˻��϶�.
SELECT LOWER(STU_GENDER)
FROM STUDENT;

--Q63. �л����� ������ �빮�ڷ� �˻��϶�.
SELECT UPPER(STU_GENDER)
FROM STUDENT;

--Q65. �л����� �а�, �г�, �̸��� �����Ͽ� �˻��϶�( --�� ?�г� ?�Դϴ�)
SELECT STU_DEPT||'��'||STU_GRADE||'�г�'||STU_NAME||'�Դϴ�'
FROM STUDENT;

--Q66. �л����� �̸��� �̸��� ù 2���ڸ� �˻��϶�.
SELECT STU_NAME,SUBSTR(STU_NAME,1,2)
FROM STUDENT;

--Q67. �л����� �̸�, �а� �׸��� �а��� �� ��°�κ��� 1�ڸ��� �˻��϶�.
SELECT STU_NAME, STU_DEPT, SUBSTR(STU_DEPT,2,1)
FROM STUDENT;

--Q69. �л����� �а��� �а����� ���̸� �˻��϶�.
SELECT STU_DEPT, LENGTH(STU_DEPT)
FROM STUDENT;

--Q70. �л����� �̸��� ���衯�� ���° �ִ��� �˻��϶�.
SELECT INSTR(STU_NAME, '��')
FROM STUDENT;

--Q71. �л����� �а��� ���⡯�� ���° �ִ��� �˻��϶�.
SELECT INSTR(STU_DEPT, '��')
FROM STUDENT;

--Q73. �л����� �а��� 20�ڸ��� �ϰ�, �տ� ��%���� ä�� �˻��϶�.
SELECT LPAD(STU_DEPT, 20, '$')
FROM STUDENT;

--Q74. �л��� �й�, �̸�, ������ �˻��϶�.(������ ù° �ڸ����� �ݿø�)
SELECT STU_NO, STU_NAME, ROUND(STU_HEIGHT,-1)
FROM STUDENT;

--Q75. �л��� �й�, �̸�, ������ �˻��϶�.(������ �ι�° �ڸ����� ������.)
SELECT STU_NO, STU_NAME, TRUNC(STU_HEIGHT,-2)
FROM STUDENT;

--Q76. ü���� 30���� ���� �������� �˻��϶�.
SELECT MOD(STU_WEIGHT,30)
FROM STUDENT;

--Q77. ���忭�� ���� null �� �л��� ��� ���̱�ϡ� ���� �˻��϶�.
SELECT NVL(TO_CHAR(STU_HEIGHT),'�̱��')
FROM STUDENT;

--Q78. ����� ü���� ���� ���� �й�, �̸��� �Բ� �˻��Ͽ���.(nvl ���)
SELECT STU_NO, STU_NAME, NVL(STU_HEIGHT+STU_WEIGHT,0)
FROM STUDENT;

--Q79. ���忡�� ü���� �� ���� �й�, �̸��� �Բ� �˻��Ͽ���.(nvl ���)
SELECT STU_NO, STU_NAME, NVL(STU_HEIGHT-STU_WEIGHT,0)
FROM STUDENT;

--Q80. ������ null �ΰ�� ���Է¿�������� �ٲپ� �й�,�̸��� �˻��Ͽ���.
SELECT STU_NO, STU_NAME, NVL(TO_CHAR(STU_HEIGHT),'�Է¿��')
FROM STUDENT;

--Q82. �л��� ������ nullif�� ���Ͽ�, ���л��� ��� ������ null�� �˻��϶�.
SELECT STU_GENDER,NVL(NULLIF(STU_GENDER,'M'),'NULL��')
FROM STUDENT;

--Q85. �л� �� Ű�� ���� ū �л��� ������ �˻��϶�.
SELECT MAX(STU_HEIGHT)
FROM STUDENT;

--Q86. �л� �� Ű�� ���� ���� ������ �˻��϶�.
SELECT MIN(STU_HEIGHT)
FROM STUDENT;

--Q88. �л��� �̸� �� max �� min ���� �˻��϶�.
SELECT MAX(STU_NAME), MIN(STU_NAME)
FROM STUDENT;

--Q89. ��ü �л��� ü��, ������ max�� min ���� �˻��϶�.
SELECT MAX(STU_HEIGHT), MIN(STU_HEIGHT)
FROM STUDENT;

--Q92. �л����� ������ ���� �˻��϶�.
SELECT SUBSTR(STU_NAME,1,1), count(*)
FROM STUDENT
group by SUBSTR(STU_NAME,1,1);

--Q93. �л� ���̺��� ���ڵ� ���� �˻��϶�.
SELECT COUNT(*)
FROM STUDENT;

--Q96. �а��� �л����� �ο����� �ο����� ���� ������ �˻��϶�.
SELECT STU_DEPT, COUNT(*)
FROM STUDENT
GROUP BY STU_DEPT
ORDER BY STU_DEPT DESC;

--Q97. �г⺰ �л����� �ο����� �˻��϶�.
SELECT STU_GRADE, COUNT(*)
FROM STUDENT
GROUP BY STU_GRADE;

--Q99. �а��� �л����� ��� ������ �˻��϶�.
SELECT STU_DEPT, ROUND(AVG(STU_HEIGHT),1)
FROM STUDENT
GROUP BY STU_DEPT;

--Q101. �а���, �г⺰ �л����� ��� ������ �а��� �г⺰�� �˻�(null����, �ڸ�������)
SELECT STU_DEPT, STU_GRADE, ROUND(AVG(STU_HEIGHT),0)
FROM STUDENT
GROUP BY STU_DEPT, STU_GRADE;

--Q104. �а��� �л����� �ο����� �ο����� ���� ������ �˻��϶�.
SELECT STU_DEPT, COUNT(*)
FROM STUDENT
GROUP BY STU_DEPT
ORDER BY STU_DEPT DESC;

--Q105. �а��� �л����� ��� ������ ��� ���� ������ �˻��Ͽ���.
SELECT STU_DEPT, ROUND(AVG(STU_HEIGHT),1)
FROM STUDENT
GROUP BY STU_DEPT
ORDER BY ROUND(AVG(STU_HEIGHT),1);

--Q106. �а��� �г⺰ �л����� ��� ü���� ��� ü�� ���� ������ �˻��Ͽ���.
SELECT STU_DEPT, STU_GRADE, ROUND(AVG(STU_WEIGHT),1)
FROM STUDENT
GROUP BY STU_DEPT, STU_GRADE
ORDER BY ROUND(AVG(STU_WEIGHT),1) DESC;

--Q107. �а��� �л����� ��� ������ ��� ������ ���� ������ �˻��Ͽ���.
SELECT STU_DEPT, ROUND(AVG(STU_HEIGHT),1)
FROM STUDENT
GROUP BY STU_DEPT
ORDER BY ROUND(AVG(STU_HEIGHT),1) DESC;

--Q108. �а��� �л����� ��� ������ 170 �̻��� �а��� ����� ���� ������ �˻��Ͽ���.
SELECT STU_DEPT, AVG(STU_HEIGHT)
FROM STUDENT
WHERE STU_HEIGHT >= 170
GROUP BY STU_DEPT
ORDER BY AVG(STU_HEIGHT);
