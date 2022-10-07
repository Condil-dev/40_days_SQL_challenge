"""
1. Given an employee table, write a query to generate the 
last name of employees that start with R and end with e.

2. Given a football stat table, where the time is stored 
as varchar, write a query to add a new column to store the
result as integer.

The sample rows of the time column is given below:

'30', '44', '90+3', '89', '105+1', '120+2', '67'

The result column should be:
30, 44, 93, 89, 106, 122, 67

"""


1.
SELECT * FROM employees
WHERE last_name LIKE 'R%e'

2.
CREATE VIEW FOOTBALL_STAT_VIEW AS
SELECT *,first_num+second_num AS time_int FROM(
SELECT *, CAST(split_part(time_char,'+',1) AS INT) AS first_num ,
COALESCE(CAST(NULLIF(split_part(time_char,'+',2),'')AS INT),0) AS second_num
FROM football_stat
)AS derivedTable


