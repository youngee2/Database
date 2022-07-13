SELECT * FROM tab

SELECT * FROM class

SELECT * FROM dept

SELECT * FROM student

SELECT * FROM DEPARTMENT 

SELECT NAME,STU_ID ,DEPT_NAME 
FROM student, DEPARTMENT 
WHERE student.DEPT_ID = department.DEPT_ID 
--안겹치는건 앞에 테이블 안써도 된다.

SELECT * FROM DEPARTMENT,STUDENT WHERE department.DEPT_ID = student.DEPT_ID ;

SELECT address FROM student

SELECT name FROM student

SELECT DISTINCT address  FROM student 
-- 중복된 레코드를 제거하고 검색하려면 distinct를 사용
-- student 테이블에서 address를 추출하는데 중복은 제거.

--SELECT *FROM Tab;할때  * 보다는 필드명 다 적어주는게 더 좋다.

SELECT name,2012-year_emp FROM PROFESSOR 
-- PROFESSOR 테이블에서 name 필드와, 2012-YEAR_emp 필드를 추출해서 출력한다.
--SELECT 절에 필드이름 외에 산술식이나 상수의 사용이 가능하다.

-- and or 조건은 자바와 같다. and는 둘 다 참일때 참 . or은 하나만 참이여도 참
select student.stu_id
from student, department
where student.dept_id = department.dept_id and
student.year = 3 and
department.dept_name='컴퓨터공학과'

--김광식,김정현 
--컴공 920
-- 결과는 1292001
--      1292002

SELECT name, stu_id FROM student WHERE YEAR=3 OR YEAR=4 ORDER BY name,stu_id
-- order by를 제외한 출력
-- 김광식  1292001
--김정현 1292002
--김현정  1292003
--박광수  1292303
--김우주 1292305
--박철수 1292501
--백태성 1292502

--order by로 정렬한 출력 (이름을 오른차순으로 정렬하고 같은 이름에 대해서는 학번의 오름차순으로 정렬)
--김광식	1292001
--김우주	1292305
--김정현	1292002
--김현정	1292003
--박광수	1292303
--박철수	1292501
--백태성	1292502

SELECT name,stu_id FROM STUDENT 
WHERE YEAR =3 OR YEAR = 4 ORDER BY name,STU_ID 

SELECT s2.name FROM student s1,student s2
WHERE s1.address =s2.address AND s1.NAME ='김광식'

SELECT name,POSITION ,2022-year_emp FROM professor

SELECT name 이름, POSITION 직위, 2012-year_emp 재직연수 FROM professor
--select 필드 옆에 적으면 출력할때 바뀌어서 출력

SELECT * FROM student WHERE name LIKE '김%'

SELECT * FROM student WHERE RESIDENT_ID LIKE '______*2%' 
OR RESIDENT_ID LIKE '______*4%'

SELECT * FROM student WHERE RESIDENT_ID LIKE '%*2%'OR RESIDENT_ID LIKE '%*4%'

SELECT * FROM student WHERE RESIDENT_ID LIKE '8%'

SELECT name FROM STUDENT  UNION SELECT name FROM PROFESSOR 
-- student 테이블의 학생 이름과 professor 테이블의 교수 이름을 합쳐서 출력 (합집합 union)
-- union 연산자는 연산 결과에 중복되는 값이 들어갈 경우 한번만 출력.
-- 집합 연산은 필드의 개수와 데이터타입이 서로 같아야 함.

SELECT name FROM PROFESSOR  

SELECT name FROM STUDENT  UNION ALL SELECT name FROM PROFESSOR 
-- union 결과에 중복을 제거하고 싶지 않다면 union all 연산자 사용

SELECT s.stu_id FROM STUDENT s, DEPARTMENT d ,TAKES t 
WHERE s.DEPT_ID= d.DEPT_ID AND t.STU_ID = s.STU_ID AND 
dept_name ='컴퓨터공학과' AND grade='A+'

SELECT stu_id FROM student s, DEPARTMENT d WHERE s.DEPT_ID = d.DEPT_ID 
AND DEPT_name='컴퓨터공학과' INTERSECT SELECT STU_ID FROM TAKES WHERE grade='A+';

select stu_id from student s, department d
where s.dept_id = d.dept_id and dept_name='산업공학과'
minus
select stu_id from takes
where grade = 'A+'

SELECT title,credit,YEAR, semester FROM course,class WHERE course.COURSE_ID =class.COURSE_ID 

SELECT *FROM COURSE c 

SELECT title,credit, YEAR, semester FROM course LEFT OUTER JOIN class USING (course_id)
--course 테이블과 class 테이블에 대해 왼쪽 외부조인을 적용
--조인 조건이 course.course_id = class.COURSE_ID라는 것을 의미

SELECT * FROM CLASS c 

select title, credit, year, semester
from course, class
where course.course_id = class.course_id (+)
--oracle에 특화된 쿼리 

SELECT title,credit, YEAR, semester FROM COURSE RIGHT OUTER JOIN class USING (COURSE_id)

SELECT title,credit, YEAR, semester FROM course,class WHERE course.COURSE_ID(+)=class.COURSE_ID 

select title, credit, year, semester
from course full outer join class
using (course_id)
--양쪽 테이블에서 서로 일치하는 레코드가 없을 경우, 해당 레코드들도 결과 테이블에 포함시키며 나머지 필드에 대해서는 모두 NULL

SELECT count(*) FROM STUDENT WHERE YEAR=3
--count(*) 해당 테이블에서 몇 명인지 

SELECT * FROM emp

SELECT count(COMM) FROM EMP  
--null값은 제외

SELECT count(mgr) FROM emp

SELECT count(DEPT_ID) FROM STUDENT  

SELECT count(DISTINCT dept_id) FROM STUDENT s 
-- distinct 키워드를 사용하면 중복되는 데이터를 제외한 개수를 리턴

SELECT count(*) FROM student s, DEPARTMENT d WHERE s.DEPT_ID = d.DEPT_ID AND d.DEPT_NAME ='컴퓨터공학과'

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
-- 널 빼고 검색

SELECT * FROM emp WHERE comm IS NULL 
-- comm 필드에 널 값이 들어있으면 출력

SELECT * FROM TAKES t  

SELECT stu_id FROM TAKES t  WHERE grade !='A+'
-- where not 이면 그 반대의 경우. != 도 반대의 경우, <>도 사용할 수 있음.

SELECT * FROM course

SELECT * FROM class

SELECT title FROM course WHERE course_id in(SELECT DISTINCT COURSE_ID FROM class WHERE classroom='301호')
-- course 테이블에서 title을 출력하는데 class테이블에서 COURSE_ID가 중복없앤다음 classroom이 301호인 쿼리가 앞 쿼리에 포함되면
-- 출력.

SELECT DISTINCT title FROM course c1, CLASS c2 WHERE c1.COURSE_ID = c2.COURSE_ID AND classroom='301호'
-- title을 출력하는데 중복되지 않게 출력한다. course 테이블에 course_id와 class테이블에 course id가 일치하면서 classroom이 301호
--인 곳을 출력.

SELECT title FROM COURSE c WHERE course_id NOT IN (SELECT DISTINCT course_id FROM class WHERE YEAR = 2012 
AND semester =2 )
-- title을 출력하는데 course테이블의 course_id랑 class테이블의 course_id랑 겹치지 않으면서 class 테이블의 year 연도가 2012이고 
--semester가 2가 아닌 것들을 출력한다.

SELECT * FROM course

SELECT * FROM class

CREATE VIEW v_takes AS SELECT stu_id,class_id FROM takes
-- view의 역할은 기존 테이블에서 원하는 필드만 가상의 테이블로 구성할 수 있음.
-- view는 내용 중 일부를 숨길 수 있기 때문에 보안의 효과와 질의를 간단히 표현할 수 있음.
-- 생성된 view는 테이블과 동등하게 사용.
-- create or replace view <뷰이름> as <select문>
-- or replace 키워드를 추가하면 이름이 같은 뷰가 존재하는 경우 기존의 뷰를 지우고 새로 생성.
-- 여기서 select문은 뷰 생성에 사용됨.

SELECT * FROM STUDENT s 

CREATE OR REPLACE VIEW cs_student AS 
SELECT s.stu_id, s.resident_id,s.name,s.YEAR,s.address,s.dept_id
FROM student s, department d
WHERE s.DEPT_ID =d.DEPT_ID AND 
d.DEPT_NAME ='컴퓨터공학과'

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
-- read only기 때문에 데이터 추가 못함.


SELECT deptno AS 부서코드, dname AS 부서명, loc AS 지역 FROM dept;
--dept 테이블의 deptno 필드를 부서코드로 별명짓고, dname 필드를 부서명으로 별명 짓고, loc 필드를 지역으로 별명 짓는다.

SELECT empno, ename ||'('|| job || ')' employee FROM emp;
-- || 문자와 문자를 연결함

SELECT * FROM emp;

SELECT ename,round(Sal/12,1),TRUNC(sal/12,1) FROM emp; 
-- 숫자형 함수중에 round(숫자[,m])는 숫자를 소수점 m+1자리에서 반올림 (생략 가능)
-- 숫자형 함수중에 TRUNC(숫자,[,m])는 숫자를 소수점 m+1자리에서 잘라서 버림(생략 가능) sql 서버에서는 trunc함수 제공 X

SELECT sysdate,EXTRACT (MONTH FROM sysdate),
extract(DAY FROM sysdate)
FROM dual;
-- sysdate 는 현재 날짜와 시각 출력. extrac('year'|'Month'|'day' from d)날짜 데이터에서 년/월/일 데이터를 출력
-- 시간, 분, 초도 가능 
-- dual 테이블에서 현재 날짜와 날짜데이터에서 오늘날짜에서 월을 출력. 그 밑줄은 오늘 날짜에서 날짜를 출력함.

SELECT SYSDATE FROM dual;

SELECT * FROM dual;

SELECT ename, hiredate, TO_NUMBER(TO_CHAR(hiredate, 'YYYY')) 입사년도,
TO_NUMBER(TO_CHAR(hiredate,'MM'))입사월,
TO_NUMBER(TO_CHAR(hiredate,'DD'))입사일
FROM emp;
-- to_number 함수 제외 시 문자형으로 출력
-- to_number(문자열) : 문자열을 숫자로 변환

SELECT ename,hiredate,
TO_CHAR(hiredate,'YYYY')입사년도,
TO_CHAR(hiredate, 'MM')월,
TO_CHAR(hiredate, 'DD')일
FROM emp;
-- to_char(숫자|날짜[,format]) : 숫자나 날짜를 주어진 format 형태로 문자열 타입으로 변환
-- to_Date(문자열,[,Format]): 문자열을 주어진 format 형태로 날짜타입으로 변환

SELECT TO_CHAR(sysdate, 'YYYY/MM/DD') 날짜,
TO_CHAR(sysdate, 'YYYY.MON.DAY')문자형
FROM dual;
--현재 날짜를 'YYYY/MM/DD'형으로 출력한다. 근데 숫자로 출력 
--to_char(sysdate, 'YYYY.MON.DAY)는 문자형으로 출력한다. ex)YYYY. MON월. DAY요일

SELECT ename, CASE WHEN sal>2000
THEN sal
ELSE 2000
END revised_salary
FROM emp;

SELECT loc,
CASE loc
WHEN 'NEW YORK' THEN 'EAST'
WHEN 'BOSTON' then'EAST'
WHEN 'CHICAGO' THEN 'CENTER'
WHEN 'DALLAS' THEN 'CENTER'
ELSE 'ETC'
END AS AREA
FROM dept;
--부서 정보(dept)에서 부서 위치를 미국의 동부,중부,서부로 구분하라.

SELECT loc, 
decode(loc,
'NEW YORK','EAST',
'BOSTON', 'EAST',
'DALLAS','CENTER',
'CHICAGO','CENTER','ETC')area
FROM dept;


select ename,
CASE WHEN sal>=3000 THEN 'high'
WHEN sal>=1000 THEN 'mid'
ELSE 'low'
END AS salary_grade
FROM emp;

-- emp테이블에 sal 필드 값이 3000보다 같거나 크면 hight, sal 값이 1000보다 크거나 같으면 mid 나머지는 low를 나타낸다.
-- 나타내는 필드는 salary_grade로 나타낸다.

SELECT empno, ename, sal, nvl(comm, 0) FROM emp;

SELECT empno, ename, sal, 
CASE WHEN comm IS NULL
THEN 0
ELSE comm
END AS commission
FROM emp;

SELECT * FROM EMP 
WHERE comm IS NULL;

SELECT * FROM EMP WHERE comm Is NOT NULL;

SELECT * FROM EMP e WHERE rownum<=5;
--rownum은 select 절에 의해 추출되는 데이터에 붙는 순번

SELECT*FROM (
SELECT * FROM emp 
ORDER BY sal DESC 
)WHERE rownum<=5;

SELECT ename, sal, comm, sal+nvl(comm, 0) salsum FROM emp 
ORDER BY 4 DESC; 
-- emp 테이블에서 ename필드, sal필드, comm필드 salsum필드를 출력한다. salsum필드는 sal+comm 

SELECT * FROM 
(
SELECT ename, sal, comm, sal+nvl(comm, 0) salsum
FROM EMP e ORDER BY 4 DESC 
)
WHERE rownum<=5;
-- emp 테이블에서 ename,필드, sal필드, comm필드, salsum필드를 출력한다. 
-- desc로 정렬하고 rownum<=5이므로 5행까지만 출력한다.
 
SELECT * FROM EMP e WHERE sal BETWEEN 1500 AND 2500;
-- emp 테이블에서 급여가 1500이상 2500이하인 직원의 정보를 출력한다. 
-- ex) BETWEEN num1 AND num2 ; // num1 이상 num2 이하

SELECT dname, job,
count(*) "Total Empl",
sum(sal) "Total sal"
FROM emp,dept
WHERE dept.DEPTNO = emp.DEPTNO 
GROUP BY dname, job
ORDER BY dname, job;

SELECT dname, job,
count (*) "Total Empl",
sum(sal) "Total Sal"
FROM emp,dept
WHERE dept.DEPTNO =emp.DEPTNO 
GROUP BY ROLLUP (dname,job)
ORDER BY dname, job;
-- rollup 함수는 subtotal을 생성하기 위해 사용


CREATE TABLE LOGIN(
ID varchar2(30) ,
PW varchar2(30) NOT NULL
CONSTRAINT PK_ID PRIMARY KEY(ID)
);

DROP TABLE todolist ;

INSERT INTO login values('green','green1234');

SELECT * FROM LOGIN  WHERE id='green' AND pw ='green1234';

CREATE TABLE LOGIN(
ID varchar2(30),
PW varchar2(30) NOT NULL,
CONSTRAINT PK_ID PRIMARY KEY(ID)
);





select * FROM LOGIN  ;

DELETE FROM login WHERE ID='ID' AND PW='PW' AND NAME = 'Name'AND EMAIL ='E-mail';

INSERT INTO login(id,pw,name,email)VALUES('green','green1234','ahyoung','jr3537@naver.com');

ALTER TABLE login ADD name varchar2(30) ;

ALTER TABLE login ADD email varchar2(30) ;

CREATE TABLE TODOLIST(
idx varchar2(30) NOT NULL,
LIST varchar2(70) NOT NULL,
CONSTRAINT fx_idx_todo FOREIGN key(idx) REFERENCES login(id)
)



SELECT * FROM TODOLIST;
-- TODO리스트 값 잘 들어감. 이제 아이디 별로 나눠서 저장되면 된다.

DROP table TODOLIST;

select todo from todolist WHERE rownum=2;

 INSERT INTO TODOLIST (list) VALUES('8080')

 
 CREATE TABLE TODOLIST (
todo varchar2(80) NOT NULL)



purge recyclebin;

COMMIT;


SELECT * FROM EXAM_SCHEDULE ;


CREATE TABLE Exam_schedule(
implYy varchar2(30),
implSeq varchar2(30), 
qualgbCd varchar2(30), 
qualgbNm varchar2(60), 
description varchar2(500) ,
docRegStartDt varchar2(30) ,
docRegEndDt varchar2(30) ,
docExamStartDt varchar2(30), 
docExamEndDt varchar2(30) ,
docPassDt varchar2(30) ,
pracRegStartDt varchar2(30),
pracRegEndDt varchar2(30) ,
pracExamStartDt varchar2(30),
pracExamEndDt varchar2(30),
pracPassDt varchar2(30) );


DROP TABLE EXAM_SCHEDULE ;

ALTER TABLE EXAM_SCHEDULE DROP COLUMN idx;

ALTER TABLE api ADD qualgbNm varchar2(500) ;

ALTER TABLE api ADD docRegStartDt varchar2(500) ;

CREATE TABLE api (
implYy varchar2(30)
);

DROP TABLE api;
--년도별 회 별 , 필기시험 원서접수, 필기 시험, 필기시험 합격예정자 발표, 응시자격 제출/필기 시험 합격자 결정, 실기시험 원서접수, 실기시험, 합격자발표

--INSERT INTO EXAM_SCHEDULE(implYy,QUALGBNM, DESCRIPTION,docRegStartDt,docRegEndDt, docExamStartDt,docExamEndDt,docPassDt, pracRegStartDt,pracRegEndDt,pracExamStartDt,pracExamEndDt,pracPassDt) VALUES
--('2022','T','설명','필기 시험 원서접수 시작일자','필기시험 원서접수 종료일자','필기시험 시작일자','필기시험 종료일자','필기시험 합격자 발표일자','실기 시험 원서접수 시작일자','실기시험 원서접수 종료일자',
--'실기 시험 시작일자','실기시험 종료일자','실기 합격자 발표일자')


INSERT INTO EXAM_SCHEDULE(implYy,QUALGBNM, DESCRIPTION,docRegStartDt,docRegEndDt, docExamStartDt,docExamEndDt,docPassDt, pracRegStartDt,pracRegEndDt,pracExamStartDt,pracExamEndDt,pracPassDt) VALUES
('2022','T','2022년 기사 제3회','2022.06.07','2022.06.10','2022.07.02','2022.7.22','2022.08.10','2022.09.05','2022.09.08','2022.10.16','2022.10.28','2022.11.25')



SELECT * FROM EXAM_SCHEDULE  

DROP TABLE DOC_EXAM 

ALTER TABLE DOC_EXAM  ADD (DOCexamDT varchar2(100))

INSERT INTO doc_exam(docregDt) 

SELECT CONCAT(CONCAT(DOCREGSTARTDT , ' ~ '), DOCREGendDt) FROM DOC_EXAM de  ;
-- 필기시험 원서접수 시작일자 ~ 필기시험 원서접수 종료일자

ALTER TABLE DOC_EXAM  ADD (DOCREGDT varchar2(100))  

INSERT INTO EXAM_SCHEDULE (DESCRIPTION,DOCREGSTARTDT,DOCREGENDDT,DOCEXAMSTARTDT,DOCPASSDT) FROM EXAM_SCHEDULE es 

INSERT INTO EXAM_SCHEDULE (DESCRIPTION,DOCREGSTARTDT,DOCREGENDDT,DOCEXAMSTARTDT,DOCPASSDT) FROM EXAM_SCHEDULE es 

INSERT INTO DOC_EXAM (docregDt) (SELECT concat(concat(DOCREGSTARTDT,'~'),DOCREGENDDT) FROM DOC_EXAM)   

SELECT * FROM DOC_EXAM ;

DROP TABLE prac_EXAM 

SELECT * FROM 
EXAM_SCHEDULE es ;

delete from DOC_EXAM de  where docregdt is NULL; 

-- description : 설명 (국가기술자격 기능사, 기사 등등) 
-- docRegStartdt : 필기시험 원서접수 시작일자 
-- docRegEndDt : 필기시험 원서접수 종료일자
-- docExamStartDt : 필기시험 시작일자
-- docExamEndDt : 필기시험 종료일자.
-- docPassDt : 필기시험 합격 발표

--pracRegStartDt : 실기/먼접 시험 원서접수 시작일자.
--pracRegEndDt : 실기/면접 시험 원서접수 종료일자.
--pracExamStartDt : 실기/면접 시험 시작일자.
--pracExamEndDt : 실기/면접 시험 종료일자.
--pracPassDt : 실기/면접 합격자 발표


ALTER TABLE DOC_EXAM ADD (docregDt varchar2(100));


CREATE TABLE doc_exam AS SELECT description,DOCREGSTARTDT, DOCREGENDDT ,docExamStartDt, DOCEXAMENDDT, docPassDt FROM EXAM_SCHEDULE es  
-- EXAM_SCHEDULE 테이블에서 description, docregStartdt, docRegEndDt,docExamStartDt, docPassDt 컬럼들을 복사해 doc_exam으로 테이블을 만들겠다. 
-- doc_exam 필기

SELECT * from doc_exam;

SELECT * FROM doc_EXAM pe WHERE DESCRIPTION LIKE '기능사%'

CREATE TABLE prac_Exam AS SELECT DESCRIPTION, PRACREGSTARTDT , PRACREGENDDT , PRACEXAMSTARTDT ,PRACEXAMENDDT , pracPassDt FROM EXAM_SCHEDULE es 
--EXAM_SCHEDULE 테이블에서  DESCRIPTION, PRACREGSTARTDT , PRACREGENDDT , PRACEXAMSTARTDT ,PRACEXAMENDDT  , pracPassDt 컬럼들을 복사해 prac_Exam 테이블을 만들겠다.
-- prac_Exam 실기.

SELECT * FROM prac_exam;


UPDATE DOC_EXAM 
   SET DOCREGDT = concat(concat(DOCREGSTARTDT,'~'),DOCREGENDDT)
   WHERE DESCRIPTION  ='국가기술자격 기사 (2022년도 제11회)';
-- 필기 원서접수 시작날짜랑 끝나는 날짜 합쳐서 docregdt라는 컬럼에 넣기.
  
  UPDATE DOC_EXAM 
   SET DOCexamDT = concat(concat(DOCexamSTARTDT,'~'),DOCexamENDDT)
   WHERE DESCRIPTION  ='국가기술자격 기사 (2022년도 제11회)';
  
SELECT * from doc_exam;
--pracregdt : 필기 원서접수 기간
-- pracexamdt : 필기 시험 기간 
-- pracpassdt : 필기 합격자 발표




COMMIT


ALTER TABLE PRAC_EXAM  DROP COLUMN pracregstartdt;

ALTER TABLE PRAC_EXAM  DROP COLUMN pracregenddt;

ALTER TABLE PRAC_EXAM  DROP COLUMN pracexamstartdt;

ALTER TABLE PRAC_EXAM DROP COLUMN pracexamenddt



ALTER TABLE doc_EXAM  DROP COLUMN docregstartdt;

ALTER TABLE doc_EXAM  DROP COLUMN docregenddt;

ALTER TABLE doc_EXAM  DROP COLUMN docexamstartdt;

ALTER TABLE doc_EXAM DROP COLUMN docexamenddt

SELECT * from doc_EXAM ;

ALTER TABLE PRAC_EXAM ADD (pracregDt varchar2(100));
ALTER TABLE PRAC_EXAM ADD (pracexamgDt varchar2(100));




UPDATE PRAC_EXAM
   SET PRACREGDT = concat(concat(pracREGSTARTDT,'~'),pracREGENDDT)
   WHERE DESCRIPTION  ='국가기술자격 기술사 (2022년도 제128회)';
-- 필기 원서접수 시작날짜랑 끝나는 날짜 합쳐서 docregdt라는 컬럼에 넣기.
  
 UPDATE PRAC_EXAM
   SET pracexamgDt = concat(concat(pracexamSTARTDT,'~'),pracexamENDDT)
   WHERE DESCRIPTION  ='국가기술자격 기술사 (2022년도 제128회)';
  
SELECT * from prac_exam;
--pracregdt : 실기 원서접수 기간
-- pracexamdt : 실기 시험 기간 
-- pracpassdt : 합격자 발표



ALTER TABLE PRAC_EXAM  DROP COLUMN pracexamenddt;



SELECT * FROM doc_EXAM pe WHERE DESCRIPTION LIKE '기능장%' ;

SELECT * FROM PRAC_EXAM  pe WHERE DESCRIPTION LIKE '산업기사%' ;

SELECT * FROM doc_EXAM WHERE DESCRIPTION LIKE '산업기사%' ;

SELECT * FROM doc_EXAM WHERE DESCRIPTION LIKE '기능사%' ;


CREATE TABLE 

ALTER TABLE PRAC_EXAM RENAME COLUMN pracexamgdt TO pracexamDT

SELECT * FROM PRAC_EXAM WHERE DESCRIPTION LIKE '기능장%';

SELECT * FROM PRAC_EXAM WHERE DESCRIPTION LIKE '기술사%';

SELECT * FROM PRAC_EXAM WHERE DESCRIPTION LIKE '기사%';

INSERT INTO PRAC_EXAM (DESCRIPTION ,pracpassdt,PRACregdt,pracexamdt) values('산업기사 (2022년도 제1회)','20220603','20220405~20220408','20220507~20220525');

INSERT INTO PRAC_EXAM (DESCRIPTION ,pracpassdt,PRACregdt,pracexamdt) values('산업기사 (2022년도 제2회)','20220819','20220621~20220624','20220724~20220807');

INSERT INTO doc_EXAM (DESCRIPTION ,docpassdt,docregdt,docexamdt) values('산업기사 (2022년도 제1회)','20220323','20220125~20220128','20220302~20220317');

INSERT INTO doc_EXAM (DESCRIPTION ,docpassdt,docregdt,docexamdt) values('산업기사 (2022년도 제2회)','20220518','20220329~20220401','20220417~20220430');

