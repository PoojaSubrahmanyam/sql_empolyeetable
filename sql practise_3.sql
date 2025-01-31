/*Write a query to find the names of employees whose salary is greater than the average salary of all employees.*/
select e.ename from emp e where e.sal > (select avg(e.sal) from emp e);
/*Write a query to find all employees whose salary is greater than the salary of the employee with empno = 7839.*/
select e.ename from emp e where e.sal > (select e.sal from emp e where e.empno=7839);
/*Write a query to find all employees who are managers, i.e., those who are present in the mgr column of other employee rows.*/
SELECT DISTINCT e.ename
FROM emp e
WHERE e.empno IN (SELECT e.mgr FROM emp e);
/*Write a query to find the first three characters of each employee's name from the emp table.*/
select substr(ename,1,3) from emp e;
/*Write a query to list all departments and the total salary of employees in each department. Include departments with no employees.*/
SELECT 
    d.dname, SUM(e.sal)
FROM
    emp e
        right JOIN
    dept d ON e.deptno = d.deptno
GROUP BY d.dname;

 





