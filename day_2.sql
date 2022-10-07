"""
Using the employee's table as provided on the first day.

Write a query to extract information of employees 
where job__id like CLERK and salary above 
or equal average employee salary in their department.

Sample Input
emp_id, job_id, salary, dept_id
1, ST_CLERK, 3000, 30
2, ST_CLERK, 4000, 30
3, ADMIN, 5000, 10
4, ST_CLERK, 2000, 30
5, PU_CLERK, 10000, 20

Sample Output
emp_id, job_id, salary, dept_id
1, ST_CLERK, 3000, 30
2, ST_CLERK, 4000, 30
5, PU_CLERK, 10000, 20

"""

SELECT employee_id, job_id, salary, department_id
FROM (SELECT emp.employee_id, emp.job_id, emp.salary,emp.department_id,
AVG(emp.salary) OVER(PARTITION BY department_id)::int AS average_salary
FROM employees emp) AS derivedTable  
WHERE salary>=average_salary
AND job_id LIKE '%CLERK'
;
