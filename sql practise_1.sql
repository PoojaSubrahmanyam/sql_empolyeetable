/* catagerioze the count of each depatment job wise*/
SELECT 
    COUNT(e.empno) AS emp_count, e.job, e.deptno
FROM
    emp e
GROUP BY e.job , e.deptno
ORDER BY e.deptno ASC;
/*List all employees in ascending order of their salaries*/
SELECT 
    ename, sal
FROM
    emp
ORDER BY sal ASC;

/*give details of employees whose has no manager*/
SELECT 
    e.ename, e.empno, e.deptno
FROM
    emp e
WHERE
    e.mgr IS NULL;
/*Write a query to fetch all employees working in the "Sales" department.*/
SELECT 
    e.ename, d.dname
FROM
    emp e
        JOIN
    dept d ON e.deptno = d.deptno
WHERE
    dname = 'sales';
/*Find the ename and job of employees whose hiredate is after 1995.*/
SELECT 
    ename, job, hiredate
FROM
    emp
WHERE
    YEAR(hiredate) > 1995;

/*Retrieve details of all departments located in "New York."*/
SELECT 
    deptno, dname
FROM
    dept
WHERE
    location = 'new york';

/*How would you fetch the names of all employees who earn a commission (comm) greater than 500?*/
SELECT 
    ename, comm
FROM
    emp
WHERE
    comm > 500;
/*Write a query to find the total number of employees in each department.*/
SELECT 
    COUNT(empno), deptno
FROM
    emp
GROUP BY deptno;
/*Calculate the average salary of employees in the "Research" department.*/
SELECT 
    AVG(e.sal), d.deptno, d.dname
FROM
    emp e
        JOIN
    dept d ON e.deptno = d.deptno
GROUP BY d.dname
HAVING dname = 'Research';
/*Write a query to find employees whose salary is higher than the average salary of their department.*/
SELECT 
    e.ename, e.deptno
FROM
    emp e
WHERE
    e.sal > (SELECT 
            AVG(sub.sal)
        FROM
            emp sub
        WHERE
            e.deptno = sub.deptno);
/*Identify employees who work in the same department as "SMITH."*/
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
 /*Calculate the highest and lowest salaries in each department.*/
SELECT 
    e.ename, e.sal, e.deptno
FROM
    emp e
WHERE
    e.sal = (SELECT 
            MAX(sub.sal)
        FROM
            emp sub
        WHERE
            e.deptno = sub.deptno);
/*lowest salary*/
select e.ename,e.sal,e.deptno from emp e
where e.sal=(select min(sub.sal) from emp sub
where e.deptno=sub.deptno)



 

    



