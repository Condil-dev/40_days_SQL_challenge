"""

A bank has a table called 
transaction_table(transaction_id, customer_id, account_id, amount, transaction_type, narration, resp_code, transaction_date) 
that stores information about customer's financial transactions.
The bank wants to know the monthly volume and value of successful credit 
and debit transactions of each customer.

The final table should look like this;
CUSTOMER_ID, TRANX_YEAR, TRANX_MONTH, CREDIT_VOLUME, 
CREDIT_VALUE, DEBIT_VOLUME, DEBIT_VALUE

NB:
1. transaction_date is a timestamp
2. transaction_type is: C for Credit & D for Debit
3. resp_code is the response code for transactions. '00' for successful transactions.

"""

SELECT customer_id AS CUSTOMER_ID,
year AS TRANX_YEAR,
month AS TRANX_MONTH,
COUNT(CASE WHEN transaction_type ='C' AND resp_code = '00' THEN 1 END) AS CREDIT_VOLUME,
SUM(CASE WHEN transaction_type ='C' AND resp_code = '00' THEN amount END) AS CREDIT_VALUE,
COUNT(CASE WHEN transaction_type ='D' AND resp_code = '00' THEN 1 END) AS DEBIT_VOLUME,
SUM(CASE WHEN transaction_type ='D' AND resp_code = '00' THEN amount END) AS DEBIT_VALUE
FROM
(SELECT *, 
EXTRACT(YEAR FROM transaction_date) AS year,
TO_CHAR(transaction_date, 'month') AS month
FROM transaction_date) AS derivedTable
GROUP BY customer_id,year,month