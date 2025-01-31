/*Find the employee(s) who have been working the longest*/
SELECT 
    e.ename, e.deptno, e.hiredate
FROM
    emp e
WHERE
    hiredate = (SELECT 
            MIN(m.hiredate)
        FROM
            emp m);

/*2.Assign a rank to employees based on their salaries within their departments.*/
select e.empno,e.ename,e.job,e.sal,e.deptno,
     rank() over(partition by e.deptno order by e.sal desc)
from emp e;

/*1.Calculate the cumulative salary of employees department-wise.*/
select e.empno,e.ename,e.job,e.sal,e.deptno,
sum(e.sal) over(partition by e.deptno order by e.sal desc) as Cumulative_salary
from emp e;
/*2.Identify employees who have been working in the company for more than 10 years.*/
select e.empno,e.ename,e.hiredate from emp e
WHERE DATEDIFF(NOW(), e.hiredate) > 3650;