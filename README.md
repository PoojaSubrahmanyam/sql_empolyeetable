     SQL PROJECT FROM BEGINNER TO ADVANCED(WITH THE SOURCE CODE FOR DATASET)
'''sql
SOURCE CODE

DROP TABLE IF EXISTS dept;
DROP TABLE IF EXISTS salgrade;
DROP TABLE IF EXISTS emp;

CREATE TABLE salgrade(
grade int(4) not null primary key,
losal decimal(10,2),
hisal decimal(10,2));

CREATE TABLE dept(
deptno int(2) not null primary key,
dname varchar(50) not null,
location varchar(50) not null);

CREATE TABLE emp(
empno int(4) not null primary key,
ename varchar(50) not null,
job varchar(50) not null,
mgr int(4),
hiredate date,
sal decimal(10,2),
comm decimal(10,2),
deptno int(2) not null);

insert into dept values (10,'Accounting','New York');

insert into dept values (20,'Research','Dallas');

insert into dept values (30,'Sales','Chicago');

insert into dept values (40,'Operations','Boston');



insert into emp values (7369,'SMITH','CLERK',7902,'93/6/13',800,0.00,20);

insert into emp values (7499,'ALLEN','SALESMAN',7698,'98/8/15',1600,300,30);

insert into emp values (7521,'WARD','SALESMAN',7698,'96/3/26',1250,500,30);

insert into emp values (7566,'JONES','MANAGER',7839,'95/10/31',2975,null,20);

insert into emp values (7698,'BLAKE','MANAGER',7839,'92/6/11',2850,null,30);

insert into emp values (7782,'CLARK','MANAGER',7839,'93/5/14',2450,null,10);

insert into emp values (7788,'SCOTT','ANALYST',7566,'96/3/5',3000,null,20);

insert into emp values (7839,'KING','PRESIDENT',null,'90/6/9',5000,0,10);

insert into emp values (7844,'TURNER','SALESMAN',7698,'95/6/4',1500,0,30);

insert into emp values (7876,'ADAMS','CLERK',7788,'99/6/4',1100,null,20);

insert into emp values (7900,'JAMES','CLERK',7698,'00/6/23',950,null,30);

insert into emp values (7934,'MILLER','CLERK',7782,'00/1/21',1300,null,10);

insert into emp values (7902,'FORD','ANALYST',7566,'97/12/5',3000,null,20);

insert into emp values (7654,'MARTIN','SALESMAN',7698,'98/12/5',1250,1400,30);


insert into salgrade values (1,700,1200);

insert into salgrade values (2,1201,1400);

insert into salgrade values (3,1401,2000);

insert into salgrade values (4,2001,3000);

insert into salgrade values (5,3001,99999);
'''sql

catagerioze the count of each depatment job wise
'''sql
SELECT 
    COUNT(e.empno) AS emp_count, e.job, e.deptno
FROM
    emp e
GROUP BY e.job , e.deptno
ORDER BY e.deptno ASC;
'''sql

2.List all employees in ascending order of their salaries
SELECT 
    ename, sal
FROM
    emp
ORDER BY sal ASC;
3.give details of employees whose has no manager
SELECT 
    e.ename, e.empno, e.deptno
FROM
    emp e
WHERE
    e.mgr IS NULL;
4.Write a query to fetch all employees working in the "Sales" department.
SELECT 
    e.ename, d.dname
FROM
    emp e
        JOIN
    dept d ON e.deptno = d.deptno
WHERE
    dname = 'sales';
5.Find the ename and job of employees whose hiredate is after 1995.
SELECT 
    ename, job, hiredate
FROM
    emp
WHERE
    YEAR(hiredate) > 1995;

6.Retrieve details of all departments located in "New York."
SELECT 
    deptno, dname
FROM
    dept
WHERE
    location = 'new york';

7.How would you fetch the names of all employees who earn a commission (comm) greater than 500?
SELECT 
    ename, comm
FROM
    emp
WHERE
    comm > 500;
8.Write a query to find the total number of employees in each department.
SELECT 
    COUNT(empno), deptno
FROM
    emp
GROUP BY deptno;
9.Calculate the average salary of employees in the "Research" department.
SELECT 
    AVG(e.sal), d.deptno, d.dname
FROM
    emp e
        JOIN
    dept d ON e.deptno = d.deptno
GROUP BY d.dname
HAVING dname = 'Research';
10.Write a query to find employees whose salary is higher than the average salary of their department.
SELECT 
    e.ename,e.deptno
FROM
    emp e
WHERE
    e.sal > (SELECT 
            AVG(sub.sal) 
        FROM
            emp sub
        where e.deptno = sub.deptno);
11.Identify employees who work in the same department as "SMITH."
SELECT 
    e.ename, e.deptno
FROM
    emp e
WHERE
    e.deptno = (SELECT 
            e.deptno
        FROM
            emp e
        WHERE
            ename = 'SMITH');     
 12.Calculate the highest and lowest salaries in each department.
 SELECT e.ename, e.sal, e.deptno
FROM emp e
WHERE e.sal = (
    SELECT MAX(sub.sal) 
    FROM emp sub 
    WHERE e.deptno = sub.deptno
);
lowest salary
select e.ename,e.sal,e.deptno from emp e
where e.sal=(select min(sub.sal) from emp sub
where e.deptno=sub.deptno)

13.Write a query to display the department name, location, and the total number of employees in each department.
SELECT 
    DNAME, D.LOCATION, COUNT(e.ename)
FROM
    dept D
        JOIN
    emp E ON d.deptno = e.deptno
GROUP BY D.DNAME , D.location;
14.Retrieve the names of employees along with their department names.
SELECT 
    e.ename, d.dname
FROM
    emp e
        JOIN
    dept d ON e.deptno = d.deptno;
 
 15.Find all employees who are working under a manager (mgr) whose name is "KING."
SELECT 
    e.ename
FROM
    emp e
WHERE
    mgr = (SELECT 
            e.empno
        FROM
            emp e
        WHERE
            e.ename = 'king');
            
 16.How would you format the hiredate to display only the month and year?
SELECT 
    DATE_FORMAT(hiredate, '%b %Y') AS formatted_hiredate
FROM
    emp;
17.Display the employee name, job, salary, and grade from the emp and salgrade tables.
SELECT 
    e.ename,
    e.job,
    e.sal,
    CASE
        WHEN e.sal BETWEEN 700 AND 1200 THEN 1
        WHEN e.sal BETWEEN 1201 AND 1400 THEN 2
        WHEN e.sal BETWEEN 1401 AND 2000 THEN 3
        WHEN e.sal BETWEEN 2001 AND 3000 THEN 4
        WHEN e.sal BETWEEN 3001 AND 99999 THEN 5
    END AS salgrade
FROM
    emp e;
18.Retrieve employees who were hired in the year 1998.
SELECT 
    e.ename
FROM
    emp e
WHERE
    YEAR(e.hiredate) = 1998;
19.Write a query to find employees whose job is "SALESMAN" and have a commission greater than their salary.
SELECT 
    e.ename
FROM
    emp e
WHERE
    e.job = 'SALESMAN'
        AND COALESCE(e.comm, 0) > e.sal;
20.Find employees who belong to a department with a location other than "Boston.
SELECT 
    e.ename, e.deptno, d.location
FROM
    emp e
        JOIN
    dept d ON e.deptno = d.deptno
WHERE
    d.location <> 'Boston';
21.Write a query to find employees who have the same job as their manager.
SELECT e.empno, e.ename, e.job, e.mgr, m.ename AS manager_name
FROM emp e
JOIN emp m ON e.mgr = m.empno
where e.job=m.job;
22. get the empno,name and job of all the managers
select distinct e.empno,e.ename,e.job,m.mgr 
from emp e 
join emp m on e.empno=m.mgr;
23.Write a query to find the names of employees whose salary is greater than the average salary of all employees.
select e.ename from emp e where e.sal > (select avg(e.sal) from emp e);
24.Write a query to find all employees whose salary is greater than the salary of the employee with empno = 7839.*/
select e.ename from emp e where e.sal > (select e.sal from emp e where e.empno=7839);
25.Write a query to find all employees who are managers, i.e., those who are present in the mgr column of other employee rows.
SELECT DISTINCT e.ename
FROM emp e
WHERE e.empno IN (SELECT e.mgr FROM emp e);
26.Write a query to find the first three characters of each employee's name from the emp table.
select substr(ename,1,3) from emp e;
27.Write a query to list all departments and the total salary of employees in each department. Include departments with no employees.
SELECT 
    d.dname, SUM(e.sal)
FROM
    emp e
        right JOIN
    dept d ON e.deptno = d.deptno
GROUP BY d.dname;

28.Find the employee(s) who have been working the longest
SELECT 
    e.ename, e.deptno, e.hiredate
FROM
    emp e
WHERE
    hiredate = (SELECT 
            MIN(m.hiredate)
        FROM
            emp m);

29.Assign a rank to employees based on their salaries within their departments.
select e.empno,e.ename,e.job,e.sal,e.deptno,
     rank() over(partition by e.deptno order by e.sal desc)
from emp e;

30..Calculate the cumulative salary of employees department-wise.
select e.empno,e.ename,e.job,e.sal,e.deptno,
sum(e.sal) over(partition by e.deptno order by e.sal desc) as Cumulative_salary
from emp e;
31..Identify employees who have been working in the company for more than 10 years.
select e.empno,e.ename,e.hiredate from emp e
WHERE DATEDIFF(NOW(), e.hiredate) > 3650;



