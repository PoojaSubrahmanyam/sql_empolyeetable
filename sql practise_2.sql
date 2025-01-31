/*INTERMEDIATE QUESTIONS
Write a query to display the department name, location, and the total number of employees
in each department

/*Retrieve the names of employees along with their department names.*/
SELECT 
    e.ename, d.dname
FROM
    emp e
        JOIN
    dept d ON e.deptno = d.deptno;
 
 /*Find all employees who are working under a manager (mgr) whose name is "KING."*/
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
            
 /*How would you format the hiredate to display only the month and year?*/
SELECT 
    DATE_FORMAT(hiredate, '%b %Y') AS formatted_hiredate
FROM
    emp;
/*Display the employee name, job, salary, and grade from the emp and salgrade tables.*/
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
/*Retrieve employees who were hired in the year 1998.*/
SELECT 
    e.ename
FROM
    emp e
WHERE
    YEAR(e.hiredate) = 1998;
/*Write a query to find employees whose job is "SALESMAN" and have a commission greater than their salary.*/
SELECT 
    e.ename
FROM
    emp e
WHERE
    e.job = 'SALESMAN'
        AND COALESCE(e.comm, 0) > e.sal;
/*Find employees who belong to a department with a location other than "Boston."*/
SELECT 
    e.ename, e.deptno, d.location
FROM
    emp e
        JOIN
    dept d ON e.deptno = d.deptno
WHERE
    d.location <> 'Boston';
/*Write a query to find employees who have the same job as their manager.*/
SELECT e.empno, e.ename, e.job, e.mgr, m.ename AS manager_name
FROM emp e
JOIN emp m ON e.mgr = m.empno
where e.job=m.job;
/* get the empno,name and job of all the managers*/
select distinct e.empno,e.ename,e.job,m.mgr 
from emp e 
join emp m on e.empno=m.mgr;
































 
 
 
 
 
 