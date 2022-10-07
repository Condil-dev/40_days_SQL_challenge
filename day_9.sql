"""
The business requires the highest performing employee 
per department each month. The tables required to solve 
this problem is as highlighted below:

department (id, name, location);
employee (id, first_name, last_name, manager_id, dept_id);
sales_table (order_id, customer_id, employee_id, amount,
order_date, order_status);

NB: order_status: {'delivered', 'cancelled'}
"""

SELECT dept.name FROM department dept JOIN 
(SELECT DISTINCT month_of_the_year, emp.dept_id 
CONCAT(emp.first_name,'/',emp.last_name) AS employee_name, 
MAX(monthly_order_sold) OVER (PARTITION BY month_of_the_year, emp.dept_id)
(ORDER BY monthly_order_sold DESC) AS highest_monthly_order_sold
FROM employees emp JOIN
(SELECT TO_CHAR(sales.order_date, 'YYYY-Mon') AS month_of_the_year,
sales.employee_id, COUNT(sales.order_id) AS monthly_order_sold
FROM sales_table sales
WHERE sales.order_status = 'delivered'
GROUP BY 1,2
ORDER BY 1,2) AS derivedTable
ON emp.id = sales.employee_id) AS derivedTable2
ON dept.id = emp.dept_id