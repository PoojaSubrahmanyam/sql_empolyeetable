# **SQL Querying for Real-World Database Management**

## 📌 **Project Overview**
This project demonstrates a comprehensive set of SQL queries designed to analyze and manage a relational database that simulates a company's employee and department structure. It showcases various SQL techniques, ranging from basic selection and joins to advanced analytics using window functions.

## 🏛️ **Database Schema**
The project utilizes three main tables:
- **`emp`**: Contains employee records (ID, name, job title, salary, commission, manager ID, hire date).
- **`dept`**: Stores department details (department number, name, location).
- **`salgrade`**: Maintains salary grading information with salary ranges.

## ⚡ **SQL Techniques Applied**
- **Aggregation**: `COUNT`, `SUM`, `AVG`
- **JOINs**: `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
- **Subqueries**: Simple and correlated subqueries
- **Grouping & Sorting**: `GROUP BY`, `ORDER BY`
- **Window Functions**: `RANK()`, `PARTITION BY`, `SUM() OVER`
- **Date Functions**: Formatting and manipulation
- **Conditional Logic**: `CASE WHEN`

## 🔍 **Key Queries and Objectives**

-- Categorize the count of each department job-wise
```sql
SELECT deptno, job, COUNT(*) AS job_count
FROM emp
GROUP BY deptno, job
ORDER BY deptno;
```

-- List all employees in ascending order of their salaries
```sql
SELECT ename, job, sal
FROM emp
ORDER BY sal ASC;
```

-- Give details of employees who have no manager
```sql
SELECT * FROM emp WHERE mgr IS NULL;
```

-- Fetch all employees working in the "Sales" department
```sql
SELECT e.* FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE d.dname = 'Sales';
```

-- Find the name and job of employees whose hire date is after 1995
```sql
SELECT ename, job, hiredate
FROM emp
WHERE hiredate > '1995-01-01';
```

-- Retrieve details of all departments located in "New York"
```sql
SELECT * FROM dept WHERE loc = 'New York';
```

-- Fetch the names of all employees who earn a commission greater than 500
```sql
SELECT ename, comm FROM emp WHERE comm > 500;
```

-- Find the total number of employees in each department
```sql
SELECT deptno, COUNT(*) AS total_employees
FROM emp
GROUP BY deptno;
```

-- Calculate the average salary of employees in the "Research" department
```sql
SELECT AVG(sal) AS avg_salary
FROM emp
JOIN dept ON emp.deptno = dept.deptno
WHERE dept.dname = 'Research';
```

-- Find employees whose salary is higher than the average salary of their department
```sql
SELECT e.ename, e.sal, e.deptno
FROM emp e
WHERE e.sal > (
    SELECT AVG(sal) FROM emp WHERE deptno = e.deptno
);
```

-- Identify employees who work in the same department as "SMITH"
```sql
SELECT e.ename, e.job FROM emp e
WHERE e.deptno = (
    SELECT deptno FROM emp WHERE ename = 'SMITH'
);
```

-- Calculate the highest and lowest salaries in each department
```sql
SELECT deptno, MAX(sal) AS highest_salary, MIN(sal) AS lowest_salary
FROM emp
GROUP BY deptno;
```

-- Display department name, location, and the total number of employees in each department
```sql
SELECT d.dname, d.loc, COUNT(e.empno) AS total_employees
FROM dept d
LEFT JOIN emp e ON d.deptno = e.deptno
GROUP BY d.dname, d.loc;
```

-- Retrieve the names of employees along with their department names
```sql
SELECT e.ename, d.dname FROM emp e
JOIN dept d ON e.deptno = d.deptno;
```

-- Find all employees working under a manager whose name is "KING"
```sql
SELECT e.ename, e.job FROM emp e
WHERE e.mgr = (SELECT empno FROM emp WHERE ename = 'KING');
```

-- Format the hire date to display only the month and year
```sql
SELECT ename, TO_CHAR(hiredate, 'Month YYYY') AS formatted_hiredate FROM emp;
```

-- Display employee name, job, salary, and grade from the emp and salgrade tables
```sql
SELECT e.ename, e.job, e.sal, s.grade
FROM emp e
JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;
```

-- Retrieve employees who were hired in the year 1998
```sql
SELECT * FROM emp WHERE EXTRACT(YEAR FROM hiredate) = 1998;
```

-- Find employees whose job is "SALESMAN" and have a commission greater than their salary
```sql
SELECT ename, job, sal, comm FROM emp WHERE job = 'SALESMAN' AND comm > sal;
```

-- Find employees who belong to a department with a location other than "Boston"
```sql
SELECT e.* FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE d.loc <> 'Boston';
```

-- Find employees who have the same job as their manager
```sql
SELECT e.ename, e.job FROM emp e
JOIN emp m ON e.mgr = m.empno
WHERE e.job = m.job;
```

-- Get the empno, name, and job of all the managers
```sql
SELECT empno, ename, job FROM emp WHERE empno IN (SELECT DISTINCT mgr FROM emp);
```

-- Find the names of employees whose salary is greater than the average salary of all employees
```sql
SELECT ename, sal FROM emp WHERE sal > (SELECT AVG(sal) FROM emp);
```

-- Find all employees whose salary is greater than the salary of the employee with empno = 7839
```sql
SELECT ename, sal FROM emp WHERE sal > (SELECT sal FROM emp WHERE empno = 7839);
```

-- Find all employees who are managers
```sql
SELECT DISTINCT e.ename FROM emp e WHERE e.empno IN (SELECT DISTINCT mgr FROM emp);
```

-- Find the first three characters of each employee's name from the emp table
```sql
SELECT SUBSTRING(ename FROM 1 FOR 3) AS short_name FROM emp;
```

-- List all departments and the total salary of employees in each department (include departments with no employees)
```sql
SELECT d.dname, COALESCE(SUM(e.sal), 0) AS total_salary
FROM dept d
LEFT JOIN emp e ON d.deptno = e.deptno
GROUP BY d.dname;
```

-- Find the employee(s) who have been working the longest
```sql
SELECT ename, hiredate FROM emp ORDER BY hiredate ASC LIMIT 1;
```

-- Assign a rank to employees based on their salaries within their departments
```sql
SELECT ename, deptno, sal,
       RANK() OVER (PARTITION BY deptno ORDER BY sal DESC) AS salary_rank
FROM emp;
```

-- Calculate the cumulative salary of employees department-wise
```sql
SELECT ename, deptno, sal,
       SUM(sal) OVER (PARTITION BY deptno ORDER BY sal) AS cumulative_salary
FROM emp;
```

-- Identify employees who have been working in the company for more than 10 years
```sql
SELECT ename, hiredate FROM emp WHERE hiredate <= CURRENT_DATE - INTERVAL '10 years';
  

