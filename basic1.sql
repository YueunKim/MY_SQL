--sql ��ɾ� ���� 2020-08-11
DESC ENROL;
DESC STUDENT; -- VARCHAR2�� ������ ��κ� �������´� VARCHAR2�� ����
DESC SUBJECT;

--���̺��� ��� ���� �˻�
SELECT * FROM STUDENT; --�л����̺�κ��� ��� ����(*)
SELECT * FROM EMP;

--�÷��� ������ �������� ���
SELECT STU_NAME, STU_NO, STU_GENDER
FROM STUDENT;

--�ߺ��� �����ϴ� ���
SELECT DISTINCT(STU_DEPT)
FROM STUDENT;
SELECT DISTINCT STU_CLASS, STU_DEPT
FROM STUDENT;

--������ ������ �˻�(�������� ��ΰ���)
SELECT STU_NO,SUB_NO,ENR_GRADE,ENR_GRADE+10,ENR_GRADE-10,ENR_GRADE*10
FROM ENROL;

--ALLAS ����
SELECT STU_NO AS ID,STU_NAME AS NAME -- AS��������
FROM STUDENT;

--���Ῥ���� 
SELECT STU_DEPT||'��'||STU_NAME||'�Դϴ�' AS �а�����
FROM STUDENT;

--������ �˻�
--EX)��ǻ�������� �л����� ������ �˻�
SELECT *
FROM STUDENT
WHERE STU_DEPT='��ǻ������';

SELECT *
FROM STUDENT
WHERE STU_DEPT='��ǻ������' AND STU_GRADE=2;

--��������
SELECT *
FROM STUDENT
WHERE STU_WEIGHT BETWEEN 60 AND 70;

SELECT *
FROM STUDENT
WHERE STU_NO=20132003;

--LIKE�� �̿��� ���ǰ˻� (LIKE�� ���ϵ�ī���� %�� ���, _�� �ϳ��� ����)
SELECT *
FROM STUDENT 
WHERE STU_NAME LIKE '��%';

SELECT *
FROM STUDENT 
WHERE STU_NAME LIKE '_��%';

--EX)2014�й��� ���� ��� �л� �˻�
SELECT *
FROM STUDENT
WHERE STU_NO LIKE '2014%';

--NULL�� �ƴ� ��
SELECT * FROM STUDENT
WHERE STU_HEIGHT IS NOT NULL;

--IN(OR����� ����)
--EX)��ǻ���������� ���� �л����� �й��� �л��̸� �˻�
SELECT STU_NO,STU_NAME
FROM STUDENT
WHERE STU_DEPT IN('��ǻ������','���');

--������ ���� ��ɾ� (DESC�� ��������, ������ OR ASC ��������)
SELECT *
FROM STUDENT
ORDER BY STU_NO DESC;

--EX)�л����̺��� �й�, �̸�, �����Ը� 5KG���Ͽ� �˻�
SELECT STU_NO, STU_NAME, STU_WEIGHT-5 AS TARGET
FROM STUDENT
ORDER BY STU_WEIGHT-5;
ORDER BY 2; --����°�� ����

SELECT STU_NO,STU_NAME,STU_DEPT,STU_WEIGHT-5 TARGET
FROM STUDENT
ORDER BY STU_DEPT,TARGET DESC; --DEPT���� ������, TARGET���� ������

--������ �Լ�
--�����Լ� (�ø�,����,CEIL�� ū��, FLOOR�� ������, MOD�� ����������, ABS�� ����)
SELECT ROUND(345.678), TRUNC(345.678), CEIL(-3.1), CEIL(3.1), FLOOR(-3.1), FLOOR(3.1)
FROM DUAL;

SELECT MOD(10,3), ABS(-100)
FROM DUAL;

SELECT ROUND(345.678,-1) --1���ڸ������ø�
FROM DUAL;

--�����Լ�
SELECT LOWER('ABCDEFG'), UPPER('abcdefg'), INITCAP('abcdefg') --��->��, ��->��, ù���ڸ� �빮��
FROM DUAL;

SELECT CONCAT(ENAME, JOB) --��ġ��
FROM EMP;

SELECT ENAME, SUBSTR(ENAME,2,2) --2��°�������� 2��
FROM EMP;

SELECT ENAME, LENGTH(ENAME) --����
FROM EMP;

SELECT LPAD(ENAME, 10, '$') --10�� �߿��� ENAME���� ���ʺ���$ RPAD�� �����ʺ���
FROM EMP;

--��¥�Լ�
SELECT MONTHS_BETWEEN(SYSDATE, HIREDATE) --������
FROM EMP;

SELECT NEXT_DAY(SYSDATE, '��'), LAST_DAY(SYSDATE) --�������ڸ� �����ϰ� ���� ����� ������, �̹��� ���� ������
FROM DUAL;

--��ȯ�Լ�
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE, 'YYYY-MM-DD') AS �Ի���
FROM EMP;

SELECT TO_CHAR(TO_NUMBER(1234.5678),'9999.999') --���ڿ��� �ٲ��� �Ҽ��� �Ʒ� ���ڸ� �ڸ�����
FROM DUAL;

SELECT * FROM EMP;
SELECT EMPNO,ENAME,TO_CHAR(TO_NUMBER(SAL),'$9999') SALARY --999�� �ϸ� ���ڸ��� �����̹Ƿ� 4�ڸ����� �ȳ���
FROM EMP;

--TO_DATE�� ��¥������ ���ڸ� ��¥�� ��ȯ�Ҷ� ���
SELECT EMPNO,ENAME
FROM EMP
WHERE HIREDATE=TO_DATE('1980-12-17','YY-MM-DD');

--�Ϲ��Լ�
--NVL(�μ�1,�μ�2) �μ�1�� NULL�̸� �μ�2�� �ȴ�
SELECT ENAME, EMPNO, NVL(MGR,0)
FROM EMP;

--NVL2(�μ�1,�μ�2,�μ�3) �μ�1�� NULL�̸� �μ�3�� �ǰ� NULL�� �ƴϸ� �μ�2
SELECT ENAME, NVL2(COMM,SAL+COMM,SAL)
FROM EMP;

--NULLIF(�μ�1,�μ�2) �μ�1�� �μ�2�� ������ NULL
SELECT NVL(NULLIF('A','A'),'NULL��')
FROM DUAL;

--EX)���޿� ���� �޿��λ�
SELECT EMPNO,ENAME,SAL,
CASE JOB WHEN 'SALESMAN' THEN SAL*1.1
         WHEN 'CLERK' THEN SAL*1.15
         WHEN 'MANAGER' THEN SAL+1.2
         ELSE SAL
         END AS �޿��λ�
         FROM EMP;

SELECT EMPNO,ENAME,JOB,SAL,
DECODE(JOB,'SALESMAN',SAL*1.1,
           'CLERK',SAL*1.15,
           'MANAGER',SAL*1.2,
           SAL) AS �λ�ȱ޿�
           FROM EMP;
           
--�׷��Լ�
--COUNT()/COUNT(*)/SUM()/AVG()/MAX()/MIN()/STDDEV()/VARIANCE()
SELECT MAX(ENR_GRADE), MIN(ENR_GRADE)
FROM ENROL;

--EX)���� �л��� ����.�ְ� ü�� �˻�
SELECT MAX(STU_WEIGHT), MIN(STU_WEIGHT)
FROM STUDENT
WHERE STU_DEPT='���';

--COUNT
SELECT COUNT(*), COUNT(STU_HEIGHT)
FROM STUDENT;

--EX)��ǻ�������� �л����� ü�߿� ���� �հ� ���
SELECT SUM(STU_WEIGHT), TO_CHAR(AVG(STU_WEIGHT),'9999.99')
FROM STUDENT
WHERE STU_DEPT='��ǻ������';

--GROUP BY
--EX)�а����� �׷�ȭ�� �� �а��� ���ü��
SELECT STU_DEPT, AVG(STU_WEIGHT)
FROM STUDENT
GROUP BY STU_DEPT;

--EX)ü���� 50KG�̻����л����� �а��� �ο���
SELECT STU_DEPT,COUNT(*)
FROM STUDENT
WHERE STU_WEIGHT>=50
GROUP BY STU_DEPT;

SELECT STU_DEPT,STU_GRADE,COUNT(*)
FROM STUDENT
WHERE STU_WEIGHT>=50
GROUP BY STU_DEPT, STU_GRADE;

--EX)���� �л����� �г⺰ ��ս����� 160�̻��� �г�� ��ս���
SELECT STU_GRADE, AVG(STU_HEIGHT)
FROM STUDENT
WHERE STU_DEPT='���'
GROUP BY STU_GRADE HAVING AVG(STU_HEIGHT)>=160; --HAVING�� �׷��Ҷ� ����

--EX)�ִ������ 175�̻��� �а��� �а��� �ִ����
SELECT STU_DEPT, MAX(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_DEPT HAVING MAX(STU_HEIGHT)>=175;

--EX)�а��� ��ս����� ���� ���� ��ս���
SELECT MAX(AVG(STU_HEIGHT))
FROM STUDENT
GROUP BY STU_DEPT 
