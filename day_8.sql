"""

The business wants to know how long it took a customer 
to perform his/her first transaction from the time the 
customer was registered on the platform.

Customers (id INT, join_date datetime, Full_name Varchar(200));

Sales (order_id INT, customer_id INT, order_date datetime,
Amount INT, order_status VARCHAR(50));

NB: Join date is the date the customer registered on 
the platform

"""

SELECT id, join_date, Full_name, first_order_date, first_order_date-join_date AS days_before_transaction
FROM Customers JOIN
(SELECT customer_id, MIN(order_date) AS first_order_date FROM Sales
GROUP BY customer_id
) AS derivedTable
ON Customers.id = Sales.customer_id
ORDER BY join_date
