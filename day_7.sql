"""

The sales of an E-commerce store are recorded in the table 
called sales_fact (order_id varchar(200), order_date datetime, 
amount float, customer_id varchar(100), order_status varchar(200)). 
The business wants to find the 7 days moving average of delivered
orders recorded from January 2022 till date.

NB:
order_status has values ('Delivered', 'Cancelled', 'In progress')

Write an SQL query that solves the business problem.

"""

SELECT order_date, amount,
AVG(amount) OVER(ORDER BY order_date 
ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
) AS 7days_moving_average
FROM sales_fact
WHERE order_date<=CAST(NOW() AS DATE)
AND order_date>=CAST(DATE_TRUNC('month',NOW()) - '7 month'::interval AS DATE)
AND order_status='Delivered'
