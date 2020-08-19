create table student1
as select * from student where stu_grade in (1,2);
create table subject1
as select * from subject;
create table enrol1
as select * from enrol;
select * from student1;
select * from subject1;
select * from enrol1;

--no1. �й� 20101059, �̸� ������, �а� ��ǻ������, �г� 1, �� B, Ű 164, ������ 70�� ���л��� �߰��Ǿ���
INSERT INTO student1 
VALUES(20151059,'������','��ǻ������',1,'B','M',164,70);
SELECT * FROM STUDENT1;

--no2. �й� 20102038, �̸� ������, �а� ��������, �г� 1, �� C, ���л��� �߰��Ǿ���
INSERT INTO STUDENT1
VALUES(20102038,'������','��������',1,'C','F',NULL,NULL);
SELECT * FROM STUDENT1;

--no3. �й� 20103009, �̸� �ڼҽ�, �а� ���, 20153075 �л��� ���� �г�, ���� ���� ���л��� �߰��Ǿ���.
INSERT INTO STUDENT1(STU_NO, STU_NAME, STU_DEPT, STU_GENDER)
VALUES(20103009,'�ڼҽ�','���','M');
SELECT * FROM STUDENT1;

UPDATE STUDENT1
SET STU_GRADE = (SELECT STU_GRADE
FROM STUDENT1
WHERE STU_NO = 20153075)
WHERE STU_NO = 20103009;

UPDATE STUDENT1
SET STU_CLASS = (SELECT STU_CLASS
FROM STUDENT1
WHERE STU_NO = 20153075)
WHERE STU_NO = 20103009;
SELECT * FROM STUDENT1;

--no4. student1 ���̺� �л�(student) ���̺��� 3�г� �л��� �����͸� �Է��϶�.
INSERT INTO STUDENT1
SELECT * FROM STUDENT
WHERE STU_GRADE LIKE 3;
SELECT * FROM STUDENT1;

--no5. �й� 20131001�� ���� B�� �ٲپ��.
UPDATE STUDENT1
SET STU_CLASS = 'B'
WHERE STU_NO = 20131001;
SELECT * FROM STUDENT1;

--no6. 20152088 �л��� Ű�� 2cm �ڶ���.
UPDATE STUDENT1
SET STU_HEIGHT = STU_HEIGHT + 2
WHERE STU_NO = 20152088; --���ǹ��� ���ؼ��� ����
SELECT * FROM STUDENT1;

--no7. ��� �л��� �г��� �ö���.
UPDATE STUDENT1
SET STU_GRADE = STU_GRADE + 1;
SELECT * FROM STUDENT1;

--no9. ����ȸ�ν��� ������ ������ 10�� �����϶�.
select * from subject1;
select * from enrol1;

UPDATE ENROL1
SET ENR_GRADE = ENR_GRADE - 10
WHERE SUB_NO = (SELECT SUB_NO
FROM SUBJECT1
WHERE SUB_NAME = '����ȸ�ν���');
SELECT * FROM ENROL1;

--no10. 20151062 �л��� ����Ʈ������� ���� �� ���������� 0���� �Ǿ���.
UPDATE ENROL1
SET ENR_GRADE = 0
WHERE SUB_NO = (SELECT SUB_NO
FROM SUBJECT1
WHERE SUB_NAME = '����Ʈ�������');
SELECT * FROM ENROL1;

--no11. 20153088 �л��� �����Ͽ���.
DELETE FROM ENROL1
WHERE STU_NO = 20153088;
SELECT * FROM ENROL1;

--no12. �����ȣ 112, �����̸� �ڵ�ȭ�ý���, ������ ������, �г� 3, �а� ��谡 �߰��Ǿ���.
select * from subject1;

INSERT INTO SUBJECT1
VALUES(112,'�ڵ�ȭ�ý���','������',3,'���');
SELECT * FROM SUBJECT1;

--no13. �����ȣ�� 110���� 501�� ����Ǿ���.
UPDATE SUBJECT1
SET SUB_NO = 501
WHERE SUB_NO = 110;
SELECT * FROM SUBJECT1;

--no14. �����ȣ 101�� �󰭵Ǿ���.
DELETE FROM SUBJECT1
WHERE SUB_NO = 101;
SELECT * FROM SUBJECT1;

--no15. enrol1 ���̺��� subject1�� ���� �����ȣ�� 999�� �����϶�.
SELECT * FROM ENROL1;
SELECT * FROM SUBJECT1;

UPDATE ENROL1
SET SUB_NO = 999
WHERE SUB_NO NOT IN (SELECT SUB_NO FROM SUBJECT1);
SELECT * FROM ENROL1;

--no16. enrol1 ���̺��� student1�� ���� �й��� 99999999�� �����϶�.
SELECT * FROM STUDENT1;
SELECT * FROM ENROL1;

UPDATE ENROL1
SET STU_NO = 99999999
WHERE STU_NO NOT IN (SELECT STU_NO FROM STUDENT1);
SELECT * FROM ENROL1;

--no17. enrol1���� �����ȣ 999�� �����϶�.
DELETE FROM ENROL1
WHERE SUB_NO = 999;
SELECT * FROM ENROL1;

--no18. enrol1���� �й� 99999999�� �����϶�.
DELETE FROM ENROL1
WHERE STU_NO = 99999999;
SELECT * FROM ENROL1;

--no19. enrol1�� ���� ������� �����϶�.
SELECT * FROM ENROL1;
SELECT * FROM SUBJECT1;

DELETE SUBJECT1
WHERE SUB_NO NOT IN (SELECT SUB_NO FROM ENROL1);
SELECT * FROM SUBJECT1;

--no20. enrol1 ��ü ���̺��� �����͸� �����϶�.
DELETE FROM ENROL1;
SELECT * FROM ENROL1;
