"""
So an E-commerce company has some customers 
they intend to track their performance for the month. 
Here is the business question:

We want to track the days at which customers 
buy more compared to the preceding days in the month.

Illustration:

If customer ABC got 50 items on the last day of the month, 
does 50 items for that day exceed other days in that month that
precedes it? This will be done till the 2nd day of the month.

Table schema looks like this;

transaction_table(order_id, product_id, quantity, unit_price,
order_date, customer_id)

NB: order_date is a datetime field

"""


SELECT *, CASE WHEN quantity > previous_quantity 
THEN order_date END AS days_with_more_quantity
FROM (SELECT quantity, order_date,
LAG(quantity, -1) OVER (PARTITION BY customer_id )(ORDER BY customer_id, order_date DESC) AS previous_quantity
FROM transaction_table
where order_date<=DATE_TRUNC('month', NOW()) - '1 day'::interval
AND order_date>=DATE_TRUNC('month', NOW()) - '1 month'::interval)
AS derivedTable
