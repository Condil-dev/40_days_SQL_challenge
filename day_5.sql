"""
There are two tables:

scores (student_id, course_id, full_name, mark)
grades (grade, lower_limit, upper_limit)

Write a query to categorize the marks in the scores 
table into grades given that the marks fall 
between the lower and upper limit inclusive.
"""

SELECT student_id, course_id, full_name, mark, grade
FROM scores, grades
where lower_limit<=mark<=upper_limit

