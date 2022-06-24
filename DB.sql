SELECT * FROM tab

SELECT * FROM class

SELECT * FROM dept

SELECT * FROM student

SELECT * FROM DEPARTMENT 

SELECT NAME,STU_ID ,DEPT_NAME 
FROM student, DEPARTMENT 
WHERE student.DEPT_ID = department.DEPT_ID 
--�Ȱ�ġ�°� �տ� ���̺� �Ƚᵵ �ȴ�.

SELECT * FROM DEPARTMENT,STUDENT WHERE department.DEPT_ID = student.DEPT_ID ;

SELECT address FROM student

SELECT name FROM student

SELECT DISTINCT address  FROM student 
-- �ߺ��� ���ڵ带 �����ϰ� �˻��Ϸ��� distinct�� ���
-- student ���̺��� address�� �����ϴµ� �ߺ��� ����.

--SELECT *FROM Tab;�Ҷ�  * ���ٴ� �ʵ�� �� �����ִ°� �� ����.

SELECT name,2012-year_emp FROM PROFESSOR 
-- PROFESSOR ���̺��� name �ʵ��, 2012-YEAR_emp �ʵ带 �����ؼ� ����Ѵ�.
--SELECT ���� �ʵ��̸� �ܿ� ������̳� ����� ����� �����ϴ�.

-- and or ������ �ڹٿ� ����. and�� �� �� ���϶� �� . or�� �ϳ��� ���̿��� ��
select student.stu_id
from student, department
where student.dept_id = department.dept_id and
student.year = 3 and
department.dept_name='��ǻ�Ͱ��а�'

--�豤��,������ 
--�İ� 920
-- ����� 1292001
--      1292002

SELECT name, stu_id FROM student WHERE YEAR=3 OR YEAR=4 ORDER BY name,stu_id
-- order by�� ������ ���
-- �豤��  1292001
--������ 1292002
--������  1292003
--�ڱ���  1292303
--����� 1292305
--��ö�� 1292501
--���¼� 1292502

--order by�� ������ ��� (�̸��� ������������ �����ϰ� ���� �̸��� ���ؼ��� �й��� ������������ ����)
--�豤��	1292001
--�����	1292305
--������	1292002
--������	1292003
--�ڱ���	1292303
--��ö��	1292501
--���¼�	1292502

SELECT name,stu_id FROM STUDENT 
WHERE YEAR =3 OR YEAR = 4 ORDER BY name,STU_ID 

SELECT s2.name FROM student s1,student s2
WHERE s1.address =s2.address AND s1.NAME ='�豤��'

SELECT name,POSITION ,2022-year_emp FROM professor

SELECT name �̸�, POSITION ����, 2012-year_emp �������� FROM professor
--select �ʵ� ���� ������ ����Ҷ� �ٲ� ���

SELECT * FROM student WHERE name LIKE '��%'

SELECT * FROM student WHERE RESIDENT_ID LIKE '______*2%' 
OR RESIDENT_ID LIKE '______*4%'

SELECT * FROM student WHERE RESIDENT_ID LIKE '%*2%'OR RESIDENT_ID LIKE '%*4%'

SELECT * FROM student WHERE RESIDENT_ID LIKE '8%'

SELECT name FROM STUDENT  UNION SELECT name FROM PROFESSOR 
-- student ���̺��� �л� �̸��� professor ���̺��� ���� �̸��� ���ļ� ��� (������ union)
-- union �����ڴ� ���� ����� �ߺ��Ǵ� ���� �� ��� �ѹ��� ���.
-- ���� ������ �ʵ��� ������ ������Ÿ���� ���� ���ƾ� ��.

SELECT name FROM PROFESSOR  

SELECT name FROM STUDENT  UNION ALL SELECT name FROM PROFESSOR 
-- union ����� �ߺ��� �����ϰ� ���� �ʴٸ� union all ������ ���

SELECT s.stu_id FROM STUDENT s, DEPARTMENT d ,TAKES t 
WHERE s.DEPT_ID= d.DEPT_ID AND t.STU_ID = s.STU_ID AND 
dept_name ='��ǻ�Ͱ��а�' AND grade='A+'

SELECT stu_id FROM student s, DEPARTMENT d WHERE s.DEPT_ID = d.DEPT_ID 
AND DEPT_name='��ǻ�Ͱ��а�' INTERSECT SELECT STU_ID FROM TAKES WHERE grade='A+';

select stu_id from student s, department d
where s.dept_id = d.dept_id and dept_name='������а�'
minus
select stu_id from takes
where grade = 'A+'

SELECT title,credit,YEAR, semester FROM course,class WHERE course.COURSE_ID =class.COURSE_ID 

SELECT *FROM COURSE c 

SELECT title,credit, YEAR, semester FROM course LEFT OUTER JOIN class USING (course_id)
--course ���̺�� class ���̺� ���� ���� �ܺ������� ����
--���� ������ course.course_id = class.COURSE_ID��� ���� �ǹ�

SELECT * FROM CLASS c 

select title, credit, year, semester
from course, class
where course.course_id = class.course_id (+)
--oracle�� Ưȭ�� ���� 

SELECT title,credit, YEAR, semester FROM COURSE RIGHT OUTER JOIN class USING (COURSE_id)

SELECT title,credit, YEAR, semester FROM course,class WHERE course.COURSE_ID(+)=class.COURSE_ID 

select title, credit, year, semester
from course full outer join class
using (course_id)
--���� ���̺��� ���� ��ġ�ϴ� ���ڵ尡 ���� ���, �ش� ���ڵ�鵵 ��� ���̺� ���Խ�Ű�� ������ �ʵ忡 ���ؼ��� ��� NULL

SELECT count(*) FROM STUDENT WHERE YEAR=3
--count(*) �ش� ���̺��� �� ������ 

SELECT * FROM emp

SELECT count(COMM) FROM EMP  
--null���� ����

SELECT count(mgr) FROM emp

SELECT count(DEPT_ID) FROM STUDENT  

SELECT count(DISTINCT dept_id) FROM STUDENT s 
-- distinct Ű���带 ����ϸ� �ߺ��Ǵ� �����͸� ������ ������ ����

SELECT count(*) FROM student s, DEPARTMENT d WHERE s.DEPT_ID = d.DEPT_ID AND d.DEPT_NAME ='��ǻ�Ͱ��а�'

SELECT sum(2022-YEAR_emp) FROM PROFESSOR  

SELECT name,2022-YEAR_EMP  FROM PROFESSOR p 

SELECT * FROM emp

SELECT sum(SAL) FROM emp

SELECT sum(SAL) FROM emp WHERE job='ANALYST'

SELECT sum(sal) FROM emp e,dept d WHERE e.DEPTNO = d.DEPTNO AND dept.DNAME ='RESEARCH'

SELECT sum(sal) FROM emp WHERE job = 'CLERK'  

SELECT sum(sal) FROM emp WHERE job = 'SALESMAN'  

SELECT sum(sal) FROM emp WHERE job = 'MANAGER'

SELECT sum(sal) FROM emp WHERE job = 'ANALYST'  

SELECT sum(sal) FROM emp WHERE job = 'PRESIDENT' 

SELECT avg(2022-YEAR_emp) FROM PROFESSOR p 



SELECT ename,sal+COMM FROM emp

SELECT max(sal), min(sal), avg(sal) FROM EMP e, DEPT d WHERE e.DEPTNO = d.DEPTNO AND dname='ACCOUNTING'

SELECT sal FROM EMP e, DEPT d  WHERE e.DEPTNO =d.DEPTNO 

SELECT DISTINCT  job FROM EMP e 
-- CLERK, SALESMAN, MANAGER, ANALYST, PRESIDENT

SELECT * FROM STUDENT s 

SELECT dept_id,count(*) FROM student GROUP BY DEPT_ID 

SELECT * FROM DEPARTMENT d 

SELECT * FROM PROFESSOR p 

SELECT DEPT_name, count(*) FROM STUDENT s ,DEPARTMENT d WHERE s.DEPT_ID=d.DEPT_ID  GROUP BY DEPT_NAME 

SELECT dname,count(*),avg(sal),max(sal),min(sal) FROM emp e, DEPT d WHERE e.DEPTNO = d.DEPTNO GROUP BY dname

SELECT dept_name,count(*),avg(2012-year_emp), max(2012-year_emp) 
FROM PROFESSOR p ,DEPARTMENT d WHERE p.DEPT_ID =d.DEPT_ID 
GROUP BY DEPT_name ORDER BY dept_name

SELECT dept_name, count(*), avg(2012-year_emp),max(2012-year_emp) 
FROM professor p, DEPARTMENT d 
WHERE p.DEPT_ID =d.DEPT_ID 
GROUP BY DEPT_name
HAVING avg(2012-year_emp)>=10

SELECT dname,count(*),avg(sal),max(sal),min(sal) 
FROM EMP e ,DEPT d 
WHERE e.DEPTNO = d.DEPTNO 
GROUP BY dname
HAVING count(*)>=5

SELECT * FROM EMP e 

SELECT * FROM emp WHERE comm IS NOT NULL
-- �� ���� �˻�

SELECT * FROM emp WHERE comm IS NULL 
-- comm �ʵ忡 �� ���� ��������� ���

SELECT * FROM TAKES t  

SELECT stu_id FROM TAKES t  WHERE grade !='A+'
-- where not �̸� �� �ݴ��� ���. != �� �ݴ��� ���, <>�� ����� �� ����.

SELECT * FROM course

SELECT * FROM class

SELECT title FROM course WHERE course_id in(SELECT DISTINCT COURSE_ID FROM class WHERE classroom='301ȣ')
-- course ���̺��� title�� ����ϴµ� class���̺��� COURSE_ID�� �ߺ����ش��� classroom�� 301ȣ�� ������ �� ������ ���ԵǸ�
-- ���.

SELECT DISTINCT title FROM course c1, CLASS c2 WHERE c1.COURSE_ID = c2.COURSE_ID AND classroom='301ȣ'
-- title�� ����ϴµ� �ߺ����� �ʰ� ����Ѵ�. course ���̺� course_id�� class���̺� course id�� ��ġ�ϸ鼭 classroom�� 301ȣ
--�� ���� ���.

SELECT title FROM COURSE c WHERE course_id NOT IN (SELECT DISTINCT course_id FROM class WHERE YEAR = 2012 
AND semester =2 )
-- title�� ����ϴµ� course���̺��� course_id�� class���̺��� course_id�� ��ġ�� �����鼭 class ���̺��� year ������ 2012�̰� 
--semester�� 2�� �ƴ� �͵��� ����Ѵ�.

SELECT * FROM course

SELECT * FROM class

CREATE VIEW v_takes AS SELECT stu_id,class_id FROM takes
-- view�� ������ ���� ���̺��� ���ϴ� �ʵ常 ������ ���̺�� ������ �� ����.
-- view�� ���� �� �Ϻθ� ���� �� �ֱ� ������ ������ ȿ���� ���Ǹ� ������ ǥ���� �� ����.
-- ������ view�� ���̺�� �����ϰ� ���.
-- create or replace view <���̸�> as <select��>
-- or replace Ű���带 �߰��ϸ� �̸��� ���� �䰡 �����ϴ� ��� ������ �並 ����� ���� ����.
-- ���⼭ select���� �� ������ ����.

SELECT * FROM STUDENT s 

CREATE OR REPLACE VIEW cs_student AS 
SELECT s.stu_id, s.resident_id,s.name,s.YEAR,s.address,s.dept_id
FROM student s, department d
WHERE s.DEPT_ID =d.DEPT_ID AND 
d.DEPT_NAME ='��ǻ�Ͱ��а�'

SELECT *FROM CS_STUDENT cs 

CREATE OR REPLACE VIEW v_TAKES AS SELECT stu_id, class_id FROM takes

SELECT * FROM V_TAKES vt WHERE stu_id ='1292001'

INSERT INTO V_TAKES VALUES ('1292502','C101-01')

SELECT * FROM V_TAKES vt 

SELECT * FROM TAKES t 

DROP VIEW V_TAKES  


CREATE OR REPLACE VIEW v_takes AS
SELECT stu_id, class_id
FROM takes
WITH READ ONLY

--INSERT INTO v_takes VALUES('123456','C101-01')
-- read only�� ������ ������ �߰� ����.