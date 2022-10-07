"""
Given the table below, write a query to return employees 
that have spent at least 25 years in the company.

Table: https://lnkd.in/daTBPMrw
"""


SELECT *
FROM (
SELECT *,(NOW()::date-hire_date::date)/365 AS Year_Difference
FROM employees 
) AS derivedTable
WHERE Year_Difference >= 25
ORDER BY Year_Difference

